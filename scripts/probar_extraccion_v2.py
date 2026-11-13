#!/usr/bin/env python3
"""Ensayo de extremo a extremo sobre PDF SINTÉTICO y lotes originales ya existentes.

No escribe ni modifica fuentes del repositorio. Valida geometría, guardado binario,
integración relacional, consulta y separación de datos derivados.
"""
from __future__ import annotations
import hashlib
import json
import sqlite3
import sys
import tempfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/"scripts"))
import fitz
from extraer_pdf_v2 import extraer
from importar_pdf_v2 import importar as importar_pdf
from importar_excel_v2 import importar as importar_excel
from exportar_comparador_v2 import obtener


def make_pdf(path:Path):
    doc=fitz.open()
    page=doc.new_page(width=612,height=792)
    page.insert_text((60,66),"CONVOCATORIA DE PRUEBA TEST-C0002",fontsize=12)
    page.insert_text((65,98),"Requisitos",fontsize=10)
    top=120
    for i in range(4):
        page.draw_line((55,top+30*i),(555,top+30*i),color=(0,0,0),width=.7)
    for x in [55,240,555]:
        page.draw_line((x,top),(x,top+90),color=(0,0,0),width=.7)
    labels=[("Nombre","Valor"),("PAPA","3.5"),("Horas","20")]
    for r,row in enumerate(labels):
        page.insert_text((65,top+19+r*30),row[0],fontsize=10)
        page.insert_text((250,top+19+r*30),row[1],fontsize=10)
    doc.save(path)
    doc.close()


with tempfile.TemporaryDirectory() as d:
    root=Path(d)
    dest=root/"lotes_estructura"
    pdf=root/"original-de-prueba.pdf"
    make_pdf(pdf)
    original=pdf.read_bytes()
    run=extraer(pdf,"TEST-C0002","convocatoria_pdf","https://example.invalid/prueba.pdf",dest)
    path=Path(run["ruta"])
    manifest=json.loads((path/"manifest.json").read_text(encoding="utf-8"))
    assert hashlib.sha256((path/"original.pdf").read_bytes()).hexdigest()==manifest["sha256_pdf_original"]
    assert manifest["comprobaciones"]["paginas_extraidas"]==1
    assert (path/manifest["paginas"][0]["imagen"]).exists()
    assert manifest["paginas"][0]["palabras_con_posicion"]
    assert manifest["paginas"][0]["bloques_y_caracteres"]["blocks"]
    assert manifest["paginas"][0]["vectores_y_trazos"],"Se esperaba retícula del PDF de prueba"
    assert manifest["estado_validacion"]=="pendiente_cotejo_visual"
    # Comprobar no sobrescritura de extracción original.
    try:
        extraer(pdf,"TEST-C0002","convocatoria_pdf",None,dest)
        raise AssertionError("La extracción anterior se sobrescribió")
    except FileExistsError:
        pass
    db_path=root/"base_v2.sqlite"
    lotes=[ROOT/"data"/"lotes"/f"lote_0{n}.json" for n in range(1,5)]
    baseline=importar_excel(lotes,db_path)
    assert (baseline["filas"],baseline["celdas"],baseline["convocatorias"])==(43,470,42),baseline
    imported=importar_pdf(path/"manifest.json",db_path)
    assert imported["paginas"]==1
    db=sqlite3.connect(db_path)
    assert db.execute("SELECT COUNT(*) FROM v2_excel_celda_original").fetchone()[0]==470
    assert db.execute("SELECT COUNT(*) FROM v2_vinculo_convocatoria_fuente WHERE numero='TEST-C0002'").fetchone()[0]==1
    binary=db.execute("""SELECT contenido_binario FROM v2_fuente_original WHERE fuente_id=?""",(imported["fuente_id"],)).fetchone()[0]
    assert binary==original
    assert db.execute("SELECT COUNT(*) FROM v2_elemento_original").fetchone()[0]>50
    assert db.execute("SELECT COUNT(*) FROM v2_tabla_original").fetchone()[0]>=1,"No se identificó la retícula de prueba"
    assert db.execute("SELECT COUNT(*) FROM v2_celda_tabla_original").fetchone()[0]>=6
    assert db.execute("SELECT estado_cobertura FROM v2_pagina_original").fetchone()[0][0]=="elementos_extraidos"
    # La interpretación semántica se crea explícitamente, separada del respaldo.
    cur=db.execute("""INSERT INTO v2_campo_original
       (fuente_id,numero,codigo_semantico,rotulo_literal,valor_literal,estado_lectura)
       VALUES(?,'TEST-C0002','requisitos','Requisitos','Lista íntegra de prueba','pendiente')""",(imported["fuente_id"],))
    fid=cur.lastrowid
    cur=db.execute("""INSERT INTO v2_lista_original
       (campo_id,nombre_literal,clase_propuesta,texto_original_integral)
       VALUES(?,'Requisitos de prueba','requisitos','Lista íntegra de prueba')""",(fid,))
    list_id=cur.lastrowid
    for i in range(1,8):
        db.execute("INSERT INTO v2_item_lista_original(lista_id,orden,literal_completo) VALUES(?,?,?)",
                   (list_id,i,"Requisito literal "+str(i)))
    db.execute("""INSERT INTO v2_indicador_sintetico
        (numero,nombre,tipo_valor,valor_json,regla,version_regla)
        VALUES('TEST-C0002','cantidad_requisitos','entero','7','COUNT(lista original)','test')""")
    db.commit()
    assert db.execute("PRAGMA integrity_check").fetchone()[0]=="ok"
    db.close()
    exported=obtener(db_path)
    item=next(x for x in exported["convocatorias"] if x["numero"]=="TEST-C0002")
    assert len(item["listas_originales"])==1
    assert [r["literal_completo"] for r in item["listas_originales"][0]["items"]]==[
        "Requisito literal "+str(i) for i in range(1,8)]
    assert item["sinteticos"][0]["valor"]==7
    assert len(item["tablas_originales"])>=1
    assert len(exported["convocatorias"])==43
    print(json.dumps({
        "resultado":"ok",
        "filas_excel_integras":baseline["filas"],
        "celdas_excel_integras":baseline["celdas"],
        "convocatorias_originales":baseline["convocatorias"],
        "pdf_prueba_sha256_comprobado":True,
        "tablas_detectadas_prueba":len(item["tablas_originales"]),
        "lista_original_completa":len(item["listas_originales"][0]["items"]),
        "indicador_sintetico_independiente":item["sinteticos"][0]["valor"],
        "validacion_visual":"pendiente"
    },ensure_ascii=False,indent=2))
