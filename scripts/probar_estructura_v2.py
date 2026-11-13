#!/usr/bin/env python3
"""Contrato v2: pruebas con casos SIMULADOS, sin alterar los datos del repositorio."""
import json
import sqlite3
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
db=sqlite3.connect(":memory:")
db.execute("PRAGMA foreign_keys=ON")
db.executescript((ROOT/"db"/"estructura_v2.sql").read_text(encoding="utf-8"))
assert db.execute("PRAGMA foreign_key_check").fetchall()==[]
db.execute("INSERT INTO v2_convocatoria(numero) VALUES ('PRUEBA-C0001')")
for ident,tipo,code in [(1,"excel","PRUEBA-C0001"),(2,"convocatoria_pdf","PRUEBA-C0001"),(3,"resultados_pdf","PRUEBA-C0001")]:
    db.execute("INSERT INTO v2_fuente_original(fuente_id,clase,uri_original,nombre_literal,estado_binario) VALUES (?,?,?,?,?)",
               (ident,tipo,"https://example.invalid/"+str(ident),"solo-prueba-"+str(ident),"pendiente"))
    db.execute("INSERT INTO v2_vinculo_convocatoria_fuente(numero,fuente_id,rol_literal,codigo_observado_literal) VALUES(?,?,?,?)",
               ("PRUEBA-C0001",ident,tipo,code))
db.execute("""INSERT INTO v2_excel_celda_original
(fuente_id,pestana_literal,numero_fila,letra_columna,encabezado_literal,valor_visible_literal)
VALUES (1,'Abiertas',2,'A','Número convocatoria','PRUEBA-C0001')""")
db.execute("INSERT INTO v2_campo_original(campo_id,fuente_id,codigo_semantico,rotulo_literal,valor_literal) VALUES(1,2,'requisitos','Requisitos','Lista original completa')")
db.execute("INSERT INTO v2_lista_original(lista_id,campo_id,nombre_literal,texto_original_integral) VALUES(1,1,'Requisitos','Los siete requisitos completos')")
for i in range(1,8):
    db.execute("INSERT INTO v2_item_lista_original(lista_id,orden,literal_completo) VALUES (1,?,?)",
               (i,"Requisito literal "+str(i)+" con su condición"))
assert db.execute("SELECT count(*) FROM v2_item_lista_original WHERE lista_id=1").fetchone()[0]==7
db.execute("""INSERT INTO v2_indicador_sintetico(indicador_id,numero,nombre,tipo_valor,valor_json,regla,version_regla)
VALUES (1,'PRUEBA-C0001','cantidad_requisitos','entero','7','COUNT(item_lista_original WHERE lista_id=1)','0.1')""")
for i in range(1,8):
    db.execute("INSERT INTO v2_indicador_insumo(indicador_id,item_original_id) VALUES (1,?)",(i,))
assert db.execute("SELECT count(*) FROM v2_indicador_insumo WHERE indicador_id=1").fetchone()[0]==7
assert db.execute("SELECT count(*) FROM v2_cobertura_documental WHERE fuentes_excel=1 AND pdf_convocatoria=1 AND pdf_resultados=1").fetchone()[0]==1

for table,where in [
 ("v2_fuente_original","fuente_id=2"),
 ("v2_excel_celda_original","fuente_id=1"),
 ("v2_campo_original","campo_id=1"),
 ("v2_lista_original","lista_id=1"),
 ("v2_item_lista_original","lista_id=1 AND orden=2")
]:
    try:
        db.execute(f"DELETE FROM {table} WHERE {where}")
        raise AssertionError("Borrado permitido inesperadamente: "+table)
    except sqlite3.IntegrityError: pass
for table,where,sets in [
 ("v2_fuente_original","fuente_id=2","nombre_literal='OTRO'"),
 ("v2_excel_celda_original","fuente_id=1","valor_visible_literal='CAMBIADO'"),
 ("v2_item_lista_original","lista_id=1 AND orden=2","literal_completo='SUSTITUIDO'")
]:
    try:
        db.execute(f"UPDATE {table} SET {sets} WHERE {where}")
        raise AssertionError("Sobrescritura permitida inesperadamente: "+table)
    except sqlite3.IntegrityError: pass
db.execute("DELETE FROM v2_indicador_insumo WHERE indicador_id=1")
db.execute("DELETE FROM v2_indicador_sintetico WHERE indicador_id=1")
assert db.execute("SELECT count(*) FROM v2_item_lista_original WHERE lista_id=1").fetchone()[0]==7
assert db.execute("PRAGMA integrity_check").fetchone()[0]=="ok"
print(json.dumps({"resultado":"ok","tablas_v2":db.execute("SELECT count(*) FROM sqlite_master WHERE type='table' AND name LIKE 'v2_%'").fetchone()[0],
"fuentes_de_prueba":3,"requisitos_originales_conservados":7,"originales_inmutables":True,"sinteticos_eliminables_sin_perder_originales":True},ensure_ascii=False))
