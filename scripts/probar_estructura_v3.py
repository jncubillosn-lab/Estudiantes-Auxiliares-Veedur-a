#!/usr/bin/env python3
"""Pruebas del nuevo modelo v3 (datos INVENTADOS, no hay convocatorias reales validadas)."""
from __future__ import annotations
import json
import sqlite3
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
db=sqlite3.connect(":memory:")
db.execute("PRAGMA foreign_keys=ON")
db.executescript((ROOT/"db"/"estructura_v3.sql").read_text(encoding="utf-8"))

def count():
    return db.execute("SELECT convocatorias_validadas FROM v3_metrica_principal").fetchone()[0]

def rejected(call,why):
    before=count()
    try:call()
    except sqlite3.IntegrityError:
        assert count()==before,why
    else:
        raise AssertionError("Admitió expediente no validado: "+why)

def add_source(code,typ,tag,pages=None):
    url=f"https://example.org/{code}/{typ}/{tag}"
    fid=db.execute("""INSERT INTO v3_fuente
       (tipo,url_original,nombre_literal,version_literal,fecha_captura,resultado_acceso,paginas_originales)
       VALUES (?,?,?,?,?,'accesible',?)""",
       (typ,url,tag,tag,"2026-11-13",pages)).lastrowid
    db.execute("INSERT INTO v3_convocatoria_fuente(numero,fuente_id) VALUES(?,?)",(code,fid))
    if typ=="excel":
        row=db.execute("""INSERT INTO v3_excel_fila(numero,fuente_id,pestana_literal,fila_original,total_columnas_original)
                           VALUES(?,?,'Abiertas',2,3)""",(code,fid)).lastrowid
        for letter in ("A","B","C"):
            cell=db.execute("""INSERT INTO v3_excel_celda(fila_id,columna_original,encabezado_literal,valor_visible_literal)
                               VALUES (?,?,?,?)""",(row,letter,letter,letter)).lastrowid
            db.execute("""INSERT INTO v3_dato_original(numero,fuente_id,codigo_concepto,rotulo_literal,
                        literal_completo,celda_excel_id) VALUES(?,?,?,?,?,?)""",
                       (code,fid,"prueba",letter,letter,cell))
        units=3
    else:
        for page in range(1,pages+1):
            pg=db.execute("""INSERT INTO v3_pdf_pagina
                (fuente_id,numero_pagina,ancho_pt,alto_pt,cotejo_visual)
                VALUES (?,?,612,792,'completo')""",(fid,page)).lastrowid
            if page==1:
                tbl=db.execute("INSERT INTO v3_pdf_tabla(pagina_id,ordinal,filas,columnas) VALUES(?,1,1,1)",(pg,)).lastrowid
                cell=db.execute("""INSERT INTO v3_pdf_celda(tabla_id,fila,columna,literal,estado)
                                   VALUES(?,0,0,'Requisito literal A','extraida')""",(tbl,)).lastrowid
                db.execute("""INSERT INTO v3_dato_original(numero,fuente_id,codigo_concepto,rotulo_literal,
                            literal_completo,pagina_id,celda_pdf_id,grupo_lista)
                            VALUES(?,?,?,?,?,?,?,'requisitos')""",
                           (code,fid,"requisito","Requisito","Requisito literal A",pg,cell))
        units=pages
    db.execute("""INSERT INTO v3_revision_fuente
       (numero,fuente_id,estado,unidades_esperadas,unidades_cotejadas,url_de_verificacion,
        alcance,metodo_cotejo,fecha_cotejo)
       VALUES (?,?,'cotejada',?,?,?,?,?,'2026-11-13')""",
       (code,fid,units,units,url,"Revisión integral ficticia del documento","Cotejo visual inventado"))
    return fid,url

def make_controls(code,found,consult,excel,conv,res=None):
    ids={}
    for gate in ("A","B","C","D","E"):
        if gate=="D" and not found:continue
        ids[gate]=db.execute("""INSERT INTO v3_puerta
           (numero,etapa,estado,responsable_cotejo,fecha_revision,alcance,evidencia_url,nota)
           VALUES (?,?,'cumple','Prueba ficticia','2026-11-13',
                   'Todas las páginas y elementos cotejados',
                   'https://example.org/evidencia','Cotejo completo ficticio')""",(code,gate)).lastrowid
        for item, in db.execute("SELECT codigo FROM v3_criterio WHERE etapa=?",(gate,)).fetchall():
            fid={"A":excel,"B":conv,"C":None,"D":res,"E":None}[gate]
            db.execute("""INSERT INTO v3_cumplimiento
               (puerta_id,criterio,estado,evidencia_url,detalle,fuente_id,elementos_esperados,elementos_cotejados)
               VALUES(?,?,'cumple','https://example.org/soporte','Soporte ficticio documentado',?,3,3)""",
               (ids[gate],item,fid))
    return ids

def add_acta(code,ids,consulta,with_results):
    return db.execute("""INSERT INTO v3_acta_validacion
      (numero,puerta_a,puerta_b,puerta_c,puerta_d,puerta_e,consulta_resultados_id,
       version_persistida,url_expediente_interfaz,fecha_cierre,responsable,nota_final)
       VALUES(?,?,?,?,?,?,?,?,?,'2026-11-13','IA de prueba','Integridad comprobada en prueba ficticia')""",
       (code,ids["A"],ids["B"],ids["C"],ids.get("D") if with_results else None,
        ids["E"],consulta,"commit-test-v3","https://example.org/expediente")).lastrowid

assert count()==0
# Un inventario Excel sin PDF NO es validación.
db.execute("INSERT INTO v3_convocatoria(numero) VALUES('TEST-PARCIAL')")
x,_=add_source("TEST-PARCIAL","excel","corte1")
assert count()==0

# Una convocatoria sin PDF de resultados: condición válida SOLO si se comprobó.
db.execute("INSERT INTO v3_convocatoria(numero) VALUES('TEST-SIN-RESULTADOS')")
e,eurl=add_source("TEST-SIN-RESULTADOS","excel","corte2")
p,purl=add_source("TEST-SIN-RESULTADOS","convocatoria_pdf","pdf1",pages=2)
q=db.execute("""INSERT INTO v3_consulta_resultados(numero,estado,url_sitio_consultado,
      fecha_consulta,alcance_y_metodo,justificacion_literal)
    VALUES('TEST-SIN-RESULTADOS','sin_pdf_verificado_al_corte',
           'https://example.org/resultados/consulta','2026-11-13',
           'Consulta visual de publicación ficticia','No hay PDF localizado en el corte de prueba')""").lastrowid
g=make_controls("TEST-SIN-RESULTADOS",False,q,e,p)
# Eliminar/reemplazar una evidencia no es posible: se intenta cierre con
# otra puerta de A vacía, no con la original.
bad=db.execute("""INSERT INTO v3_puerta
  (numero,etapa,estado,responsable_cotejo,fecha_revision,alcance,evidencia_url,nota)
  VALUES ('TEST-SIN-RESULTADOS','A','cumple','Prueba','2026-11-13','No examiné Excel',
   'https://example.org/prueba','Esto debería fallar por criterios incompletos')""").lastrowid
rejected(lambda:add_acta("TEST-SIN-RESULTADOS",{**g,"A":bad},q,False),"puerta A sin evidencias individuales")
add_acta("TEST-SIN-RESULTADOS",g,q,False)
assert count()==1

# PDF de resultados encontrado exige puerta D y sus evidencias completas.
db.execute("INSERT INTO v3_convocatoria(numero) VALUES('TEST-CON-RESULTADOS')")
e2,_=add_source("TEST-CON-RESULTADOS","excel","corte3")
p2,_=add_source("TEST-CON-RESULTADOS","convocatoria_pdf","conv",pages=2)
r2,_=add_source("TEST-CON-RESULTADOS","resultados_pdf","res",pages=2)
q2=db.execute("""INSERT INTO v3_consulta_resultados(numero,estado,url_sitio_consultado,fecha_consulta,
    alcance_y_metodo,justificacion_literal,fuente_pdf_id)
    VALUES('TEST-CON-RESULTADOS','pdf_encontrado','https://example.org/listado-resultados',
    '2026-11-13','Consulta visual de resultados y su enlace',
    'Se encontró documento en la publicación de prueba',?)""",(r2,)).lastrowid
h=make_controls("TEST-CON-RESULTADOS",True,q2,e2,p2,r2)
rejected(lambda:add_acta("TEST-CON-RESULTADOS",h,q2,False),"resultados encontrados pero puerta D omitida")
add_acta("TEST-CON-RESULTADOS",h,q2,True)
assert count()==2

# Nueva adenda debe quitar el estado actual hasta un nuevo cierre formal.
add_source("TEST-CON-RESULTADOS","adenda_pdf","posterior",pages=1)
assert count()==1,"Acta histórica no debe absorber nueva fuente"
add_acta("TEST-CON-RESULTADOS",h,q2,True)
assert count()==2

# Una nueva publicación de resultados invalida un cierre anterior por ausencia.
db.execute("""INSERT INTO v3_consulta_resultados(numero,estado,url_sitio_consultado,fecha_consulta,
            alcance_y_metodo,justificacion_literal)
            VALUES ('TEST-SIN-RESULTADOS','indeterminado','https://example.org/listado/actualizado',
            '2026-11-14','Revisión de nueva publicación sin conclusión',
            'Debe volver a verificarse')""")
assert count()==1
# Incidencia crítica abierta también retira la validación actual.
i=db.execute("""INSERT INTO v3_incidencia
 (numero,criticidad,detalle,evidencia_url,registrada_en)
 VALUES('TEST-CON-RESULTADOS','critica','Nueva información incompleta',
  'https://example.org/fallo','2026-11-14')""").lastrowid
assert count()==0
db.execute("""INSERT INTO v3_resolucion_incidencia(incidencia_id,resolucion,evidencia_url,fecha)
 VALUES(?,'La evidencia se cotejó, sin borrar la incidencia','https://example.org/cierre',
        '2026-11-14')""",(i,))
assert count()==1

assert db.execute("PRAGMA foreign_key_check").fetchall()==[]
assert db.execute("PRAGMA integrity_check").fetchone()[0]=="ok"
print(json.dumps({"estado":"ok","version":"3.0","esquema":"nuevo","datos_prueba":"FICTICIOS",
 "puertas":"A+B+C+(D si aplica)+E","con_resultados":"acepta solo cierre completo",
 "sin_pdf_resultados":"acepta solo ausencia verificada","controles_individuales":13,
 "revalidacion_fuentes_nuevas":True,"revalidacion_consultas_nuevas":True,
 "incidencias_criticas":True,"convocatorias_reales_validadas":0},ensure_ascii=False))
