#!/usr/bin/env python3
"""La recepción de IA no crea validaciones ni transforma PDF en tablas."""
import json
import sqlite3
import sys
import tempfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/"scripts"))
from construir_base_v3 import crear_base,DEFAULT_FILES
from registrar_entrega_ia_v3 import registrar

manifest=json.loads((ROOT/"tests/fixtures/entrega_ia_v3_ejemplo.json").read_text(encoding="utf-8"))
with tempfile.TemporaryDirectory() as d:
    path=Path(d)/"base.sqlite"
    crear_base(path,DEFAULT_FILES)
    report=registrar(path,manifest)
    assert report["convocatorias_recibidas"]==1
    assert report["fuentes_vinculadas"]==2
    assert report["lecturas_registradas"]==2
    db=sqlite3.connect(path)
    assert db.execute("SELECT count(*) FROM v3_entrega_ia").fetchone()[0]==1
    assert db.execute("SELECT count(*) FROM v3_control_lectura").fetchone()[0]==2
    assert db.execute("SELECT count(*) FROM v3_convocatoria").fetchone()[0]==43
    assert db.execute("SELECT count(*) FROM v3_fuente").fetchone()[0]==22
    assert db.execute("SELECT count(*) FROM v3_acta_validacion").fetchone()[0]==0
    assert db.execute("SELECT count(*) FROM v3_pdf_pagina").fetchone()[0]==0
    assert db.execute("SELECT convocatorias_validadas FROM v3_metrica_principal").fetchone()[0]==0
    assert db.execute("PRAGMA foreign_key_check").fetchall()==[]
    db.close()
    try:
        registrar(path,manifest)
    except ValueError:pass
    else:raise AssertionError("Se admitió manifiesto idéntico dos veces")
    db=sqlite3.connect(path)
    assert db.execute("SELECT count(*) FROM v3_entrega_ia").fetchone()[0]==1
    assert db.execute("SELECT count(*) FROM v3_control_lectura").fetchone()[0]==2
    db.close()
print(json.dumps({"resultado":"ok","entrega_ia_recibida":1,
 "lecturas_sin_repetir":2,"pdfs_extraidos_por_programa":0,
 "actas_auto_generadas":0,"convocatorias_validadas":0},ensure_ascii=False))
