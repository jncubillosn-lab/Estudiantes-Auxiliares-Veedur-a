#!/usr/bin/env python3
"""Incorpora cada celda de la captura Excel sin cambiar ni omitir su contenido.

Fuente original en esta etapa: JSON literal de los lotes actuales; no sustituye
la captura binaria nativa de Google Sheets. No altera archivos de entrada.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import sqlite3
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
CODES={
  "Convocatorias Abiertas": [
    "tipo_convocatoria","facultad","programa","referencia_convocatoria","estado",
    "titulo","correo_responsable","fecha_publicacion","fecha_cierre","numero_convocatoria"],
  "Convocatorias Cerradas": [
    "tipo_convocatoria","facultad","programa","referencia_convocatoria","estado",
    "referencia_resultados","titulo","correo_responsable","fecha_publicacion","fecha_cierre","numero_convocatoria"]
}

def importar(lotes: list[Path], db_path: Path) -> dict:
    db_path.parent.mkdir(parents=True,exist_ok=True)
    db=sqlite3.connect(db_path)
    db.execute("PRAGMA foreign_keys=ON")
    db.executescript((ROOT/"db"/"estructura_v2.sql").read_text(encoding="utf-8"))
    totals={"lotes":0,"filas":0,"celdas":0,"convocatorias":set()}
    try:
        db.execute("BEGIN")
        for path in lotes:
            original=path.read_bytes()
            checksum=hashlib.sha256(original).hexdigest()
            if db.execute("SELECT 1 FROM v2_fuente_original WHERE hash_sha256=?", (checksum,)).fetchone():
                raise ValueError("El lote ya fue importado: "+str(path))
            batch=json.loads(original.decode("utf-8"))
            cur=db.execute("""INSERT INTO v2_fuente_original
            (clase,uri_original,nombre_literal,mime_literal,hash_sha256,bytes_originales,
             contenido_binario,estado_binario,metadatos_originales_json)
            VALUES('excel',?,?,?,?,?,?,'binario_capturado',?)""",
            (batch["fuente"]["url"],path.name,"application/json",checksum,len(original),original,
             json.dumps({"corte":batch.get("fecha_extraccion"),"observacion":"Captura JSON de celdas, no binario de Sheets"},ensure_ascii=False)))
            fid=cur.lastrowid
            linked=set()
            for row in batch["casos"]:
                number=row.get("codigo")
                if not number:
                    raise ValueError("Fila sin código; detener sin inventar ID: "+repr(row.get("numero_fila")))
                db.execute("INSERT OR IGNORE INTO v2_convocatoria(numero) VALUES(?)",(number,))
                if number not in linked:
                    db.execute("""INSERT INTO v2_vinculo_convocatoria_fuente
                    (numero,fuente_id,rol_literal,codigo_observado_literal,correspondencia)
                    VALUES(?,?, 'excel', ?, 'sin_cotejo')""",(number,fid,number))
                    linked.add(number)
                concepts=CODES[row["pestana"]]
                if len(row["celdas"])!=len(concepts):
                    raise ValueError("Cambio de longitud de fila Excel, abortar sin omitir: "+number)
                for i,cell in enumerate(row["celdas"]):
                    letter=chr(65+i)
                    cur=db.execute("""INSERT INTO v2_excel_celda_original
                    (fuente_id,numero,pestana_literal,numero_fila,letra_columna,encabezado_literal,
                    valor_visible_literal,valor_entrada_literal,formula_literal,hipervinculo_literal,
                    nota_literal,formato_original_json,capturada_en)
                    VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)""",
                    (fid,number,row["pestana"],row["numero_fila"],letter,row["encabezados"][i],
                     cell.get("valor_visible"),
                     json.dumps(cell.get("valor_original"),ensure_ascii=False) if cell.get("valor_original") is not None else None,
                     cell.get("formula"),cell.get("hipervinculo"),cell.get("nota"),
                     json.dumps({"formato":cell.get("formato"),"texto_formato_tramos":cell.get("texto_formato_tramos")},ensure_ascii=False),
                     batch.get("fecha_extraccion")))
                    db.execute("""INSERT INTO v2_campo_original
                    (fuente_id,numero,celda_excel_id,codigo_semantico,rotulo_literal,valor_literal,orden_en_fuente,
                     ocurrencia,estado_lectura)
                    VALUES(?,?,?,?,?,?,?,1,'extraido')""",
                    (fid,number,cur.lastrowid,concepts[i],row["encabezados"][i],cell.get("valor_visible"),i+1))
                    totals["celdas"]+=1
                totals["convocatorias"].add(number)
                totals["filas"]+=1
            totals["lotes"]+=1
        db.commit()
        assert db.execute("PRAGMA integrity_check").fetchone()[0]=="ok"
        assert db.execute("PRAGMA foreign_key_check").fetchall()==[]
        return {**totals,"convocatorias":len(totals["convocatorias"]),"db":str(db_path)}
    except Exception:
        db.rollback()
        raise
    finally:
        db.close()

if __name__=="__main__":
    p=argparse.ArgumentParser()
    p.add_argument("--db",type=Path,default=ROOT/"salidas"/"estructura_v2.sqlite")
    p.add_argument("lotes",nargs="*",type=Path)
    args=p.parse_args()
    files=args.lotes or sorted((ROOT/"data"/"lotes").glob("lote_*.json"))
    if not files:
        p.error("No se encontraron lotes.")
    print(json.dumps(importar(files,args.db),ensure_ascii=False,indent=2))
