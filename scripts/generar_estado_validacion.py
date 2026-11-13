#!/usr/bin/env python3
"""Publica SOLO la métrica certificada por actas SQL de la Norma 04.

Sin acta de validación: 0 validadas, aunque el número de códigos sea grande.
--db permite usar una base v2 ya alimentada con validaciones reales.
--comprobar usa la base de corte de los cuatro lotes históricos (sin actas).
"""
from __future__ import annotations
import argparse
import json
import sqlite3
import sys
import tempfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/"scripts"))
from importar_excel_v2 import importar

def exportar(dbpath:Path):
    with sqlite3.connect(f"file:{dbpath.resolve()}?mode=ro",uri=True) as db:
        ids=[x[0] for x in db.execute("SELECT numero FROM v2_convocatorias_validadas ORDER BY numero")]
        n=db.execute("SELECT convocatorias_validadas,convocatorias_identificadas FROM v2_conteo_convocatorias_validadas").fetchone()
        assert n[0]==len(ids)
        return {
            "version":"1.0",
            "norma":"docs/NORMA-04-validacion-convocatorias.md",
            "fuente_de_verdad":"v2_conteo_convocatorias_validadas / v2_acta_validacion_convocatoria",
            "convocatorias_validadas":n[0],
            "convocatorias_identificadas":n[1],
            "codigos_validados":ids,
            "advertencia":"Un código, fila Excel o PDF con solo texto leído no es una convocatoria validada."
        }

def exportar_historico():
    with tempfile.TemporaryDirectory() as temp:
        dbpath=Path(temp)/"corte.sqlite"
        lotes=[ROOT/"data"/"lotes"/f"lote_0{i}.json" for i in range(1,5)]
        importar(lotes,dbpath)
        return exportar(dbpath)

if __name__=="__main__":
    p=argparse.ArgumentParser()
    p.add_argument("--db",type=Path,default=None,help="Base v2 verificada con actas reales; opcional")
    p.add_argument("--comprobar",action="store_true")
    p.add_argument("--actualizar",action="store_true")
    p.add_argument("--salida",type=Path,default=ROOT/"data"/"estado_validacion.json")
    a=p.parse_args()
    if a.comprobar==a.actualizar:p.error("Elegir exactamente --comprobar o --actualizar")
    data=exportar(a.db) if a.db else exportar_historico()
    if a.comprobar:
        old=json.loads(a.salida.read_text(encoding="utf-8"))
        if old!=data:raise SystemExit("ERROR: el estado publicado no coincide con las actas verificadas en SQLite")
    else:
        a.salida.parent.mkdir(parents=True,exist_ok=True)
        a.salida.write_text(json.dumps(data,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print(json.dumps({"resultado":"ok","validadas":data["convocatorias_validadas"],
                      "identificadas":data["convocatorias_identificadas"],
                      "modo":"comprobar" if a.comprobar else "actualizar"},ensure_ascii=False))
