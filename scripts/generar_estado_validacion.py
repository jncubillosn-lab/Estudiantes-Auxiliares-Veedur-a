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
        # No publicar una validación que el auditor no pueda verificar en Pages.
        publicado=json.loads((ROOT/"data"/"exportacion_v2.json").read_text(encoding="utf-8"))
        por_codigo={c["numero"]:c for c in publicado["convocatorias"]}
        codigos_db={c[0] for c in db.execute("SELECT numero FROM v2_convocatoria")}
        if set(por_codigo)!=codigos_db:
            raise ValueError("La proyección de Pages no tiene exactamente los códigos de la base con actas")
        for code in ids:
            caso=por_codigo[code]
            filas=db.execute("""
                SELECT c.rol,c.estado,c.url_documento,c.url_verificacion,c.fecha_consulta,c.alcance_consulta
                FROM v2_acta_validacion_convocatoria a
                JOIN v2_control_validacion_fuente c
                  ON c.control_id IN (a.control_convocatoria_id,a.control_resultados_id)
                WHERE a.numero=?
                ORDER BY a.acta_id DESC
            """,(code,)).fetchall()
            fuentes=caso.get("fuentes",[])
            for rol,estado,url_doc,url_consulta,fecha,alcance in filas:
                if rol=="convocatoria_pdf" or (rol=="resultados_pdf" and estado=="cotejada"):
                    if not any(f.get("url")==url_doc and f.get("tipo")==rol for f in fuentes):
                        raise ValueError(f"{code}: acta valida sin URL del PDF {rol} consultable en Pages")
                elif rol=="resultados_pdf" and estado=="sin_pdf_verificado":
                    evidencia=caso.get("verificacion_resultados",{})
                    if not (evidencia.get("estado")==estado
                            and evidencia.get("url_consulta")==url_consulta
                            and evidencia.get("fecha_consulta")==fecha
                            and evidencia.get("alcance_consulta")==alcance):
                        raise ValueError(f"{code}: ausencia de resultados no verificable desde la ficha")
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
    if a.actualizar and a.db is None:p.error("--actualizar exige --db con las actas reales; no recrear a cero desde lotes históricos")
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
