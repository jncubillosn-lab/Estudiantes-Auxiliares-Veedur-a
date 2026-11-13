#!/usr/bin/env python3
"""Pruebas de aceptación de NORMA 04; datos FICTICIOS, no validaciones UNAL.

Garantiza que el conteo no sube con un código, Excel solo, texto PDF o
resultados sin verificar; admite ausencia de PDF SOLO con acta comprobable.
"""
from __future__ import annotations
import json
import sqlite3
import tempfile
import sys
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/"scripts"))
from importar_excel_v2 import importar

SCHEMA=(ROOT/"db"/"estructura_v2.sql").read_text(encoding="utf-8")
db=sqlite3.connect(":memory:")
db.execute("PRAGMA foreign_keys=ON")
db.executescript(SCHEMA)

def create_case(code: str, *, results: bool):
    db.execute("INSERT INTO v2_convocatoria(numero) VALUES (?)",(code,))
    for i,role,url in [(1,"excel","https://example.org/hoja-de-prueba"),
                       (2,"convocatoria_pdf",f"https://example.org/{code}-convocatoria.pdf")]+(
                       [(3,"resultados_pdf",f"https://example.org/{code}-resultados.pdf")] if results else []):
        cur=db.execute("""INSERT INTO v2_fuente_original(clase,uri_original,nombre_literal,estado_binario)
                          VALUES(?,?,?,'pendiente')""",(role,url,"FICTICIO "+role))
        source_id=cur.lastrowid
        db.execute("""INSERT INTO v2_vinculo_convocatoria_fuente
                     (numero,fuente_id,rol_literal,codigo_observado_literal)
                     VALUES(?,?,?,?)""",(code,source_id,role,code))
        if role=="excel":
            for cell in ("A","B","C"):
                db.execute("""INSERT INTO v2_excel_celda_original
                        (fuente_id,numero,pestana_literal,numero_fila,letra_columna,valor_visible_literal)
                        VALUES(?,?,'Prueba',2,?,?)""",(source_id,code,cell,cell))
        else:
            run=db.execute("""INSERT INTO v2_corrida_extraccion(fuente_id,herramienta,estado)
                        VALUES(?,'IA externa, caso ficticio','elementos_extraidos')""",(source_id,)).lastrowid
            for page in (1,2):
                db.execute("""INSERT INTO v2_pagina_original
                    (corrida_id,pagina_numero,ancho_pt,alto_pt,estado_cobertura)
                    VALUES(?,?,612,792,'cotejado')""",(run,page))
        if i==1: excel=source_id
        if i==2: convocatoria=source_id
        if i==3: resultado=source_id
    return excel,convocatoria,resultado if results else None

def control(code,role,source,*,status="cotejada",url=None,total_items=None,items=None,total_pages=None,pages=None,pending=0,consulta=None):
    file_url=db.execute("SELECT uri_original FROM v2_fuente_original WHERE fuente_id=?",(source,)).fetchone()[0] if source is not None else None
    if url is None and source is not None and role!="excel":url=file_url
    if consulta is None:consulta=file_url if role=="excel" else f"https://example.org/publicacion/{code}"
    return db.execute("""INSERT INTO v2_control_validacion_fuente
        (numero,rol,fuente_id,estado,url_documento,url_verificacion,fecha_consulta,
         alcance_consulta,total_elementos,elementos_cotejados,total_paginas,paginas_cotejadas,
         pendientes_criticos,nota_cotejo,referencia_persistencia)
        VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)""",
        (code,role,source,status,url,consulta,"2026-11-13",
         "Cotejo de publicación y páginas; ejemplo FICTICIO",
         total_items,items,total_pages,pages,pending,
         "Inspección integral ficticia para prueba de reglas",f"base.sqlite::{code}")).lastrowid

def acta(code,a,b,c):
    return db.execute("""INSERT INTO v2_acta_validacion_convocatoria
    (numero,control_excel_id,control_convocatoria_id,control_resultados_id,
     referencia_cotejo_interfaz,referencia_commit_persistido,nota_cierre)
    VALUES(?,?,?,?,?,?,?)""",
    (code,a,b,c,f"https://example.org/comparador/{code}","commit-prueba-20261113",
     "Cierre ficticio de fuentes completas para verificar umbrales SQL")).lastrowid

def reject(fn,name):
    before=db.execute("SELECT count(*) FROM v2_acta_validacion_convocatoria").fetchone()[0]
    try:fn()
    except sqlite3.IntegrityError:
        after=db.execute("SELECT count(*) FROM v2_acta_validacion_convocatoria").fetchone()[0]
        assert before==after, name
        return
    raise AssertionError("El esquema permitió una falsa validación: "+name)

assert db.execute("SELECT convocatorias_validadas FROM v2_conteo_convocatorias_validadas").fetchone()[0]==0
# 1: Excel + convocatoria completa + comprobación de NO disponibilidad de resultados:
e,p,_=create_case("TEST-NO-RESULTADOS",results=False)
a=control("TEST-NO-RESULTADOS","excel",e,total_items=3,items=3)
b=control("TEST-NO-RESULTADOS","convocatoria_pdf",p,total_pages=2,pages=2)
c=control("TEST-NO-RESULTADOS","resultados_pdf",None,status="sin_pdf_verificado")
reject(lambda:acta("TEST-NO-RESULTADOS",a,a,c),"no se puede reemplazar PDF con Excel")
reject(lambda:acta("TEST-NO-RESULTADOS",a,b,a),"no se puede omitir comprobacion resultados")
acta("TEST-NO-RESULTADOS",a,b,c)
assert db.execute("SELECT count(*) FROM v2_convocatorias_validadas").fetchone()[0]==1
# 2: Resultados SI publicados: el texto no basta, PDF con páginas cotejadas.
e2,p2,r2=create_case("TEST-CON-RESULTADOS",results=True)
a2=control("TEST-CON-RESULTADOS","excel",e2,total_items=3,items=3)
b2=control("TEST-CON-RESULTADOS","convocatoria_pdf",p2,total_pages=2,pages=2)
c2=control("TEST-CON-RESULTADOS","resultados_pdf",r2,total_pages=2,pages=2)
acta("TEST-CON-RESULTADOS",a2,b2,c2)
assert db.execute("SELECT count(*) FROM v2_convocatorias_validadas").fetchone()[0]==2
# 3: Un PDF de resultados YA enlazado prohíbe declarar «sin PDF».
e3,p3,r3=create_case("TEST-RESULTADO-CONOCIDO",results=True)
a3=control("TEST-RESULTADO-CONOCIDO","excel",e3,total_items=3,items=3)
b3=control("TEST-RESULTADO-CONOCIDO","convocatoria_pdf",p3,total_pages=2,pages=2)
c3=control("TEST-RESULTADO-CONOCIDO","resultados_pdf",None,status="sin_pdf_verificado")
reject(lambda:acta("TEST-RESULTADO-CONOCIDO",a3,b3,c3),"la ausencia contradice un PDF de resultados vinculado")
# 4: Excel incompleto no se valida.
a4=control("TEST-RESULTADO-CONOCIDO","excel",e3,total_items=2,items=2)
reject(lambda:acta("TEST-RESULTADO-CONOCIDO",a4,b3,c3),"omision de celdas Excel")
# 5: Enlace PDF discrepante no puede certificar otra fuente.
b4=control("TEST-RESULTADO-CONOCIDO","convocatoria_pdf",p3,
           url="https://example.org/otro.pdf",total_pages=2,pages=2)
reject(lambda:acta("TEST-RESULTADO-CONOCIDO",a3,b4,c3),"URL convocatoria no coincide con fuente")
# 6: Página sin cotejo: ni siquiera 2/2 declaradas permiten afirmar éxito.
db.execute("""INSERT INTO v2_corrida_extraccion(fuente_id,herramienta,estado)
              VALUES(?,'IA prueba extra','parcial')""",(p3,))
reject(lambda:acta("TEST-RESULTADO-CONOCIDO",a3,b3,c3),"no cierre con evidencia resultados");
# 7: Una revisión con pendientes críticos ni siquiera se puede insertar como acta.
reject(lambda:control("TEST-NO-RESULTADOS","convocatoria_pdf",p,total_pages=2,pages=2,pending=1),
       "pendientes críticos")
# 8: No se puede borrar ni modificar un control o acta de validación.
reject(lambda:db.execute("DELETE FROM v2_control_validacion_fuente WHERE control_id=?",(a,)),"borrado de control")
reject(lambda:db.execute("UPDATE v2_acta_validacion_convocatoria SET nota_cierre='x' WHERE acta_id=1"),
       "modificacion de acta")
assert db.execute("SELECT convocatorias_validadas,convocatorias_identificadas FROM v2_conteo_convocatorias_validadas").fetchone()==(2,3)
assert db.execute("PRAGMA foreign_key_check").fetchall()==[]
assert db.execute("PRAGMA integrity_check").fetchone()[0]=="ok"
db.close()

# 9: Los cuatro lotes históricos importados NO son cero datos, pero sí 0 validaciones.
with tempfile.TemporaryDirectory() as temp:
    dbpath=Path(temp)/"datos.sqlite"
    lots=[ROOT/"data"/"lotes"/f"lote_0{i}.json" for i in range(1,5)]
    result=importar(lots,dbpath)
    assert result["convocatorias"]==42 and result["celdas"]==470
    con=sqlite3.connect(dbpath)
    n=con.execute("SELECT convocatorias_validadas,convocatorias_identificadas FROM v2_conteo_convocatorias_validadas").fetchone()
    assert n==(0,42),n
    con.close()

print(json.dumps({
 "resultado":"ok",
 "ejemplos_ficticios":3,
 "cierre_con_resultados":True,
 "cierre_sin_resultados_tras_comprobacion":True,
 "bloqueo_por_enlace_pdf_no_coincidente":True,
 "bloqueo_por_excel_incompleto":True,
 "bloqueo_de_ausencia_si_pdf_resultados_ya_vinculado":True,
 "actas_inmutables":True,
 "convocatorias_historicas_identificadas":42,
 "convocatorias_historicas_validadas":0
},ensure_ascii=False,indent=2))
