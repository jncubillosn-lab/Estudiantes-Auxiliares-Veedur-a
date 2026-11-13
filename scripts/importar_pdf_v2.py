#!/usr/bin/env python3
"""Importar manifiesto PDF v2 a una base SQLite NUEVA o existente (solo tablas v2).

Conserva PDF original en BLOB y cada página como PNG.
Elementos gráficos/celdas extraídos quedan pendientes; no realiza validación semántica.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import sqlite3
from pathlib import Path


def digest(data):
    return hashlib.sha256(data).hexdigest()


def importar(manifest_path: Path, db_path: Path):
    root=manifest_path.parent
    manifest=json.loads(manifest_path.read_text(encoding="utf-8"))
    pdf=(root/manifest["archivo_original"]).read_bytes()
    assert digest(pdf)==manifest["sha256_pdf_original"]
    assert len(pdf)==manifest["bytes_pdf_original"]
    db_path.parent.mkdir(parents=True,exist_ok=True)
    db=sqlite3.connect(db_path)
    db.execute("PRAGMA foreign_keys=ON")
    db.executescript((Path(__file__).resolve().parents[1]/"db"/"estructura_v2.sql").read_text(encoding="utf-8"))
    number=manifest["numero_convocatoria_de_integracion"]
    try:
        db.execute("BEGIN")
        exists=db.execute("SELECT fuente_id FROM v2_fuente_original WHERE hash_sha256=? AND clase=?",
                           (manifest["sha256_pdf_original"],manifest["tipo_fuente"])).fetchone()
        if exists:
            raise ValueError("La fuente ya existe. No se duplica ni sobrescribe: "+str(exists[0]))
        db.execute("INSERT OR IGNORE INTO v2_convocatoria(numero) VALUES(?)",(number,))
        cur=db.execute("""INSERT INTO v2_fuente_original
        (clase,uri_original,nombre_literal,mime_literal,hash_sha256,bytes_originales,contenido_binario,estado_binario,metadatos_originales_json)
        VALUES(?,?,?,?,?,?,?,'binario_capturado',?)""",
        (manifest["tipo_fuente"],manifest.get("url_fuente"),manifest.get("nombre_archivo_fuente_literal",manifest["archivo_original"]),"application/pdf",
         manifest["sha256_pdf_original"],len(pdf),pdf,
         json.dumps({"fecha":manifest["fecha_captura"],"version":manifest["version"]},ensure_ascii=False)))
        fid=cur.lastrowid
        db.execute("""INSERT INTO v2_vinculo_convocatoria_fuente
        (numero,fuente_id,rol_literal,codigo_observado_literal,correspondencia)
        VALUES(?,?,?,?,'sin_cotejo')""",(number,fid,manifest["tipo_fuente"],None))
        cur=db.execute("""INSERT INTO v2_corrida_extraccion(fuente_id,herramienta,version_herramienta,estado,reporte_json)
        VALUES(?,'extraer_pdf_v2.py','0.1','elementos_extraidos',?)""",
        (fid,json.dumps(manifest.get("comprobaciones",{}),ensure_ascii=False)))
        run_id=cur.lastrowid
        n_elementos=0;n_tablas=0;n_celdas=0
        for p in manifest["paginas"]:
            img=(root/p["imagen"]).read_bytes()
            assert digest(img)==p["imagen_sha256"]
            cur=db.execute("""INSERT INTO v2_pagina_original
            (corrida_id,pagina_numero,ancho_pt,alto_pt,rotacion_grados,texto_plano_respaldo,imagen_png,imagen_sha256,estado_cobertura)
            VALUES(?,?,?,?,?,?,?,?,'elementos_extraidos')""",
            (run_id,p["numero"],p["ancho_pt"],p["alto_pt"],p["rotacion"],p["texto_respaldo"],img,p["imagen_sha256"]))
            pid=cur.lastrowid
            order=0
            def push(kind,text,bbox,attributes):
                nonlocal order,n_elementos
                order+=1;n_elementos+=1
                bbox=bbox or [None,None,None,None]
                db.execute("""INSERT INTO v2_elemento_original
                (pagina_id,orden_lectura,tipo,texto_literal,x0,y0,x1,y1,atributos_originales_json,estado_lectura)
                VALUES(?,?,?,?,?,?,?,?,?,'extraido')""",
                (pid,order,kind,text,*bbox,json.dumps(attributes,ensure_ascii=False)))
            # Conserva cada carácter junto a su caja/estilo y ubicación.
            for block in p["bloques_y_caracteres"].get("blocks",[]):
                if block.get("type")!=0:
                    push("imagen" if block.get("type")==1 else "desconocido",None,block.get("bbox"),block)
                    continue
                for line in block.get("lines",[]):
                    for span in line.get("spans",[]):
                        style={k:v for k,v in span.items() if k not in ("chars",)}
                        for char in span.get("chars",[]):
                            push("texto",char.get("c"),char.get("bbox"),
                                {"char":char,"estilo":style,"linea":{k:v for k,v in line.items() if k!="spans"}})
            for item in p["vectores_y_trazos"]:
                push("trazo",None,item.get("rect"),item)
            for item in p["imagenes_incrustadas"]:
                for bbox in item.get("rectangulos",[]) or [None]:
                    push("imagen",None,bbox,item)
            for item in p["anotaciones"]:
                push("anotacion",item.get("contenido"),item.get("rect"),item)
            for item in p["campos_formulario"]:
                push("casilla",str(item.get("valor_literal") or ""),item.get("rect"),item)
            for item in p["enlaces"]:
                push("anotacion",str(item.get("uri") or ""),item.get("from"),item)
            # Tabla y TODAS las celdas detectadas, incluidas vacías/no detectadas.
            for table in p["tablas_candidatas"]:
                n_tablas+=1
                rect=table.get("bbox") or [None]*4
                cur=db.execute("""INSERT INTO v2_tabla_original
                (pagina_id,orden_tabla,x0,y0,x1,y1,filas_detectadas,columnas_detectadas,metodo_deteccion,estado_revision)
                VALUES(?,?,?,?,?,?,?,?,?,'pendiente')""",
                (pid,table["tabla_orden"],*rect,table["filas_detectadas"],table["columnas_detectadas"],table["metodo"]))
                tid=cur.lastrowid
                for cell in table["celdas"]:
                    n_celdas+=1
                    bbox=cell.get("bbox") or [None]*4
                    db.execute("""INSERT INTO v2_celda_tabla_original
                    (tabla_id,fila,columna,combina_filas,combina_columnas,x0,y0,x1,y1,texto_literal,estado_lectura,atributos_originales_json)
                    VALUES(?,?,?,?,?,?,?,?,?,?,?,?)""",
                    (tid,cell["fila"],cell["columna"],cell.get("combina_filas"),cell.get("combina_columnas"),
                     *bbox,cell.get("texto_literal"),
                     "extraida" if cell.get("bbox") is not None else "sin_deteccion",
                     json.dumps(cell,ensure_ascii=False)))
        db.commit()
        assert db.execute("PRAGMA foreign_key_check").fetchall()==[]
        assert db.execute("PRAGMA integrity_check").fetchone()[0]=="ok"
        return {"fuente_id":fid,"numero":number,"paginas":len(manifest["paginas"]),
                "elementos":n_elementos,"tablas_candidatas":n_tablas,"celdas_candidatas":n_celdas,
                "estado":"pendiente_cotejo_visual"}
    except Exception:
        db.rollback()
        raise
    finally:
        db.close()


if __name__=="__main__":
    ap=argparse.ArgumentParser()
    ap.add_argument("manifest",type=Path,help="Carpeta de la extracción o manifest.json")
    ap.add_argument("--db",type=Path,default=Path("salidas/estructura_v2.sqlite"))
    args=ap.parse_args()
    path=args.manifest/"manifest.json" if args.manifest.is_dir() else args.manifest
    print(json.dumps(importar(path,args.db),ensure_ascii=False,indent=2))
