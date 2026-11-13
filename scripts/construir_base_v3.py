#!/usr/bin/env python3
"""Reconstruye desde cero SQLite v3 con la entrega de IA del 13-11-2026.

La IA (no este script) realizó la extracción de texto. Este código se limita a
persistir fielmente sus originales, sus páginas y estados de cotejo declarados.
El payload comprimido/armored es evidencia original: se verifica SHA-256.
No acepta sobrescritura; no genera certificaciones ni tablas reconstruidas falsas.
"""
from __future__ import annotations
import argparse
import base64
import hashlib
import json
import os
import sqlite3
import tempfile
import zlib
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCHEMA = ROOT / 'db' / 'estructura_v3.sql'
PAYLOAD = ROOT / 'data' / 'ia_v3' / 'integrado_96_2026-11-13.json.zlib.b64'
PDF_MANIFEST = ROOT / 'data' / 'ia_v3' / 'pdf_originales' / 'manifest.json'
SHA256_ORIGINAL = 'c62afceaff7b4560025ea9f053136a157e4c669ce7a5fda72a54d25844c9ea2b'
FUENTE_URL = 'https://docs.google.com/spreadsheets/d/1f3qQNRiNwdFMtLrcBsP-JEgZwLBWmMVcq7QXCLo_Sps/edit?usp=sharing'
FECHA = '2026-11-13'

# La tabla fuente enumera los tipos; el contenido de cada fuente lo entrega IA.

def literal(x):
    return x if x is None or isinstance(x, str) else json.dumps(x, ensure_ascii=False, separators=(',', ':'))


def compact(x):
    return json.dumps(x, ensure_ascii=False, separators=(',', ':'))


def leer_payload(path:Path):
    b64=''.join(path.read_text(encoding='ascii').split())
    original=zlib.decompress(base64.b64decode(b64, validate=True))
    actual=hashlib.sha256(original).hexdigest()
    if actual != SHA256_ORIGINAL:
        raise ValueError('NORMA 00: SHA256 del JSON de IA distinto del esperado')
    data=json.loads(original)
    if data.get('version_contrato')!='3.0' or len(data.get('datos_originales',[]))!=96:
        raise ValueError('NORMA 00: contrato o inventario de IA inesperados')
    return original,data


def cargar_pdf_binarios(manifesto:Path=PDF_MANIFEST):
    """Coteja los bytes BINARIOS de todos los PDF contra sus huellas."""
    inventario=json.loads(manifesto.read_text(encoding='utf-8'))
    if inventario.get('version')!='3.0' or len(inventario.get('archivos',[]))!=121:
        raise ValueError('Manifest PDF incompleto')
    partes={p['ruta'].split('/')[-1]:p for p in inventario['partes']}
    archivos={}
    for name,meta in partes.items():
        p=manifesto.parent/name
        raw=p.read_bytes()
        if hashlib.sha256(raw).hexdigest()!=meta['sha256'] or len(raw)!=meta['bytes']:
            raise ValueError('SHA PDF-ARCHIVE incorrecto: '+name)
        with zipfile.ZipFile(p) as z:
            for doc in (d for d in inventario['archivos'] if d['parte']==name):
                datos=z.read(doc['ruta_zip'])
                sha=hashlib.sha256(datos).hexdigest()
                if sha!=doc['sha256'] or len(datos)!=doc['bytes'] or sha in archivos:
                    raise ValueError('PDF original inconsistente: '+doc['ruta_zip'])
                archivos[sha]=datos
    if len(archivos)!=121: raise ValueError('No se conservaron los 121 PDF')
    return archivos


def crear_base(salida:Path, payload:Path=PAYLOAD):
    if salida.exists():
        raise FileExistsError(f'No se sobrescribe la base existente: {salida}')
    original,documento=leer_payload(payload)
    pdf_binarios=cargar_pdf_binarios()
    data=documento['datos_originales']
    codes=[record['expediente']['numero'] for record in data]
    if len(codes)!=len(set(codes)):
        raise ValueError('Duplicación de códigos que deben tener un único expediente')
    salida.parent.mkdir(parents=True,exist_ok=True)
    fd,temporal=tempfile.mkstemp(prefix='.v3-ia-',suffix='.sqlite',dir=salida.parent)
    os.close(fd)
    db=sqlite3.connect(temporal)
    db.execute('PRAGMA foreign_keys=ON')
    stats={'convocatorias':0,'filas_excel':0,'celdas_excel':0,
           'pdf_convocatoria':0,'pdf_resultados':0,'paginas_pdf':0,
           'lineas_pdf':0,'capturas_literales':1,'convocatorias_validadas':0}
    fuentes={}
    try:
        db.executescript(SCHEMA.read_text(encoding='utf-8'))
        captura=db.execute('''INSERT INTO v3_captura_lote
            (ruta_original,sha256_bytes,bytes_origen,contenido_literal_json,
             fuente_url,corte_literal,numero_lote,registrado_en)
            VALUES(?,?,?,?,?,?,?,?)''',
            (str(payload.relative_to(ROOT)) if payload.is_relative_to(ROOT) else str(payload),
             SHA256_ORIGINAL,len(original),original.decode('utf-8'),
             FUENTE_URL,FECHA,'IA-2026-11-13-96',FECHA)).lastrowid
        
        def insertar_fuente(tipo,url,nombre,version,metadatos=None,pgs=None,sha=None,texto=None,codigo=None,binario=None):
            if not isinstance(url,str) or not url.startswith(('http://','https://')):
                raise ValueError('Fuente sin URL real; no inventar enlaces')
            key=(tipo,url,version)
            if key not in fuentes:
                fid=db.execute('''INSERT INTO v3_fuente
                    (tipo,url_original,nombre_literal,codigo_interno_literal,version_literal,
                     fecha_captura,resultado_acceso,paginas_originales,sha256,
                     texto_respaldo_literal,metadatos_json,binario_original)
                     VALUES(?,?,?,?,?,?,'accesible',?,?,?,?,?)''',
                    (tipo,url,nombre,codigo,version,FECHA,pgs,sha,texto,
                     compact(metadatos) if metadatos else None,binario)).lastrowid
                fuentes[key]=fid
            return fuentes[key]
        
        for record in data:
            x=record['expediente'];num=x['numero']
            if x.get('estado_validacion') not in ('NO_VALIDADA','no_validada','pendiente'):
                raise ValueError(f'{num}: caso no marcado como preliminar')
            db.execute('INSERT INTO v3_convocatoria(numero) VALUES(?)',(num,))
            source_rows = x['excel'].get('filas_originales') or [x['excel']]
            for row in source_rows:
                sheet=row['hoja'];url=row.get('fuente_url') or x['excel']['fuente_url']
                # Una fuente Excel por hoja de una misma captura, preserva filas duplicadas.
                fid=insertar_fuente('excel',url,'Google Sheets — '+sheet,
                    'IA:2026-11-13:gid:'+str(row.get('gid',x['excel'].get('gid'))),
                    {'captura_id':captura,'hoja':sheet,'gid':row.get('gid',x['excel'].get('gid')),
                     'no_es_acta_de_cotejo':True})
                db.execute('INSERT OR IGNORE INTO v3_convocatoria_fuente(numero,fuente_id) VALUES(?,?)',(num,fid))
                cells=row['celdas_originales']; headers=row['encabezados_originales'];
                if len(cells)!=len(headers) or len(cells) not in (10,11):
                    raise ValueError(f'{num}: conteo de columnas incongruente')
                n=row['fila']
                rid=db.execute('''INSERT INTO v3_excel_fila(numero,fuente_id,pestana_literal,fila_original,total_columnas_original)
                       VALUES(?,?,?,?,?)''',(num,fid,sheet,n,len(cells))).lastrowid
                for idx,cell in enumerate(cells):
                    col=cell.get('columna') or chr(65+idx)
                    value=literal(cell.get('valor_original'))
                    entry=cell.get('valor_xml')
                    meta={k:v for k,v in cell.items() if k not in ('valor_original','hipervinculo','formula','nota')}
                    cid=db.execute('''INSERT INTO v3_excel_celda
                    (fila_id,columna_original,encabezado_literal,valor_visible_literal,
                     valor_entrada_literal,formula_literal,hipervinculo_literal,nota_literal,formato_json)
                    VALUES(?,?,?,?,?,?,?,?,?)''',
                    (rid,col,headers[idx],value,literal(entry),literal(cell.get('formula')),
                     literal(cell.get('hipervinculo')),literal(cell.get('nota')),compact(meta))).lastrowid
                    db.execute('''INSERT INTO v3_dato_original
                     (numero,fuente_id,codigo_concepto,rotulo_literal,literal_completo,orden_en_fuente,celda_excel_id)
                     VALUES(?,?,?,?,?,?,?)''',(num,fid,'excel_'+col,headers[idx],value,idx+1,cid))
                    stats['celdas_excel']+=1
                stats['filas_excel']+=1

            pub=x['publicacion_pdf']
            pdfs=[]
            if 'documentos' in pub:
                pdfs+=pub['documentos']
            else:
                pdfs.append({'tipo':'convocatoria_pdf','paginas':pub['paginas'],
                             **pub['fuente']})
            res=x.get('resultados',{})
            if isinstance(res.get('pdf_resultados'),list):
                pdfs+=res['pdf_resultados']
            elif isinstance(res.get('pdf_resultados_contenido'),dict):
                content=res['pdf_resultados_contenido']
                if 'fuente' in content:
                    pdfs.append({'tipo':'resultados_pdf',**content['fuente'],
                                 'paginas':content.get('paginas',[])})
                elif 'paginas' in content:
                    pdfs.append({'tipo':'resultados_pdf',**content})
            
            linked_results=[]
            for doc in pdfs:
                tipo=doc.get('tipo') or 'convocatoria_pdf'
                if tipo not in ('convocatoria_pdf','resultados_pdf','adenda_pdf','anexo_pdf','otro_pdf'):
                    raise ValueError(f'{num}: tipo de documento no reconocido {tipo}')
                url=doc.get('url_original')
                pages=doc.get('paginas') or []
                version=doc.get('version_fuente') or 'sha256:'+str(doc.get('sha256_binario'))
                if len(pages)!=doc.get('numero_paginas_observadas',len(pages)):
                    raise ValueError(f'{num}: se declararon páginas sin registrar')
                sha=doc.get('sha256_binario')
                if sha not in pdf_binarios:
                    raise ValueError(f'{num}: falta el PDF binario o su hash no coincide')
                fid=insertar_fuente(tipo,url,doc.get('nombre_archivo') or doc.get('nombre_original'),
                    version,{k:v for k,v in doc.items() if k!='paginas'},
                    pgs=len(pages),sha=sha,binario=pdf_binarios[sha],
                    texto='\n\f\n'.join(p.get('texto_original_orden_pdf','') for p in pages),
                    codigo=doc.get('codigo_interno_literal'))
                db.execute('INSERT OR IGNORE INTO v3_convocatoria_fuente(numero,fuente_id) VALUES(?,?)',(num,fid))
                db.execute('''INSERT INTO v3_lectura_pdf_previa
                   (fuente_id,captura_id,numero,registro_original_json,estado,nota_integridad)
                   VALUES(?,?,?,?,'texto_sin_cotejo',?)''',
                   (fid,captura,num,compact(doc),
                    'Original leído por IA. Páginas registradas, sin reconstrucción tabular ni cotejo visual íntegro.'))
                for page in pages:
                    pageid=db.execute('''INSERT INTO v3_pdf_pagina
                      (fuente_id,numero_pagina,ancho_pt,alto_pt,cotejo_visual,notas)
                      VALUES(?,?,?,?,'pendiente',?)''',
                      (fid,page['numero_pagina'],page.get('ancho_pt'),page.get('alto_pt'),
                       'Texto/posiciones recuperados; pendiente cotejo de tablas, marcas y elementos visuales')).lastrowid
                    for i,line in enumerate(page.get('lineas_con_posicion') or [],1):
                        b=line.get('bbox_puntos')
                        if not b or len(b)!=4 or b[0]>b[2] or b[1]>b[3]: b=[None]*4
                        db.execute('''INSERT INTO v3_pdf_elemento
                        (pagina_id,tipo,ordinal,literal,x0,y0,x1,y1,atributos_json)
                        VALUES(?,'linea_textual_preliminar',?,?,?,?,?,?,?)''',
                        (pageid,i,line.get('texto'),*b,compact(line)))
                        stats['lineas_pdf']+=1
                    stats['paginas_pdf']+=1
                stats['pdf_convocatoria' if tipo=='convocatoria_pdf' else 'pdf_resultados']+=1
                if tipo=='resultados_pdf': linked_results.append(fid)
            if not any(d.get('tipo')=='convocatoria_pdf' for d in pdfs):
                raise ValueError(f'{num}: fuente de publicación ausente')
            # Un vínculo no implica resultado cotejado. Si hay documento, registrar
            # su hallazgo literal, no certificar participantes ni fechas por inferencia.
            rstate=res.get('estado')
            consulta=('pdf_encontrado' if linked_results and rstate and
                      ('coincidencia' in rstate or rstate=='pdf_encontrado') else 'indeterminado')
            sit_url=res.get('url_sitio_consultado') or res.get('fuente_consulta_inicial') or FUENTE_URL
            if not sit_url.startswith(('https://','http://')): sit_url=FUENTE_URL
            metodo=res.get('metodo') or res.get('comprobacion') or 'Pendiente de verificación documental independiente del Excel'
            db.execute('''INSERT INTO v3_consulta_resultados
                  (numero,estado,url_sitio_consultado,fecha_consulta,alcance_y_metodo,
                   justificacion_literal,fuente_pdf_id)
                  VALUES(?,?,?,?,?,?,?)''',
                  (num,consulta,sit_url,res.get('fecha_consulta') or FECHA,
                   metodo[:4000],compact(res)[:9000],
                   linked_results[0] if consulta=='pdf_encontrado' else None))
            # Evidencia explícita de avance: no se persisten puertas "cumple".
            # El JSON original por convocatoria conserva íntegramente versiones,
            # estados e incidencias declarados por la IA.
            body=compact(record)
            db.execute('''INSERT INTO v3_entrega_ia
                  (lote_id,version_contrato,numero,contenido_literal_json,sha256_contenido,
                   fecha_entrega,estado_importacion,nota)
                  VALUES(?,?,?,?,?,?,'pendiente_cotejo',?)''',
                  (record['lote_origen'],'3.0',num,body,
                   hashlib.sha256(body.encode('utf-8')).hexdigest(),FECHA,
                   'Todos los datos originales se guardan. No existe acta ni validación A-E.'))
            stats['convocatorias']+=1
        # Persistir cada incidencia literal vinculable a un expediente.
        # Las incidencias sin código permanecen intactas en v3_captura_lote.
        for incidencias_lote in documento.get('incidencias',{}).values():
            for inc in incidencias_lote:
                num=inc.get('codigo')
                if num not in set(codes): continue
                gravedad=inc.get('gravedad','')
                criticidad=('critica' if gravedad in ('bloqueante','bloqueante_validacion','critica','requiere_verificacion')
                             else 'documental')
                fuente=inc.get('url_enlace')
                if not fuente and isinstance(inc.get('fuentes'),list):
                    fuente=inc['fuentes'][0] if inc['fuentes'] else None
                db.execute('''INSERT INTO v3_incidencia
                  (numero,criticidad,detalle,evidencia_url,registrada_en) VALUES(?,?,?,?,?)''',
                  (num,criticidad,compact(inc),fuente,FECHA))
        if db.execute('SELECT count(*) FROM v3_fuente WHERE binario_original IS NOT NULL').fetchone()[0]!=121:
            raise ValueError('No se guardaron los 121 documentos originales como bytes BLOB')
        if (stats['convocatorias'],stats['filas_excel'],stats['celdas_excel'],
            stats['pdf_convocatoria'],stats['pdf_resultados'],stats['paginas_pdf'])!=(96,97,1031,97,24,397):
            raise ValueError('NORMA 00: conteo de originales difiere del manifiesto: '+repr(stats))
        actual=db.execute('SELECT convocatorias_validadas FROM v3_metrica_principal').fetchone()[0]
        stats['convocatorias_validadas']=actual
        if actual!=0 or db.execute('PRAGMA integrity_check').fetchone()[0]!='ok' or db.execute('PRAGMA foreign_key_check').fetchall():
            raise ValueError('NORMA 00: controles de integridad no aprobados')
        db.commit()
        db.close()
        os.replace(temporal,salida)
        return {'archivo':str(salida),**stats,'sha256_captura':SHA256_ORIGINAL}
    except Exception:
        db.close()
        raise
    finally:
        if os.path.exists(temporal):os.unlink(temporal)

if __name__=='__main__':
    p=argparse.ArgumentParser(description='Reconstrucción atómica de base v3 desde entrega IA preliminar')
    p.add_argument('--salida',type=Path,default=ROOT/'salidas'/'convocatorias_v3.sqlite')
    p.add_argument('--payload',type=Path,default=PAYLOAD)
    args=p.parse_args()
    print(json.dumps(crear_base(args.salida,args.payload),ensure_ascii=False,indent=2))
