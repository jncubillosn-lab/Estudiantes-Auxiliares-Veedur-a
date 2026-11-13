#!/usr/bin/env python3
"""Publicación estática v2 desde las 4 fuentes originales y SQLite verificado.

NO transforma los PDF en tablas imaginarias. Conserva cada fila/celda y el
respaldo textual de los 16 PDF existentes, marcados sin cotejo estructural.
La estructura del proyecto permite enriquecer a futuro desde una base v2 con
tablas PDF reales, sin reemplazar este respaldo.
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

MAP={
"Convocatorias Abiertas":[
 "tipo_convocatoria","facultad","programa","referencia_convocatoria","estado",
 "titulo","correo_responsable","fecha_publicacion","fecha_cierre","numero_convocatoria"],
"Convocatorias Cerradas":[
 "tipo_convocatoria","facultad","programa","referencia_convocatoria","estado",
 "referencia_resultados","titulo","correo_responsable","fecha_publicacion",
 "fecha_cierre","numero_convocatoria"],
}
FILES=[ROOT/"data"/"lotes"/f"lote_0{n}.json" for n in range(1,5)]
PATH="data/exportacion_v2.json"

def obtener() -> dict:
    with tempfile.TemporaryDirectory(prefix="verificar-publicacion-") as tmp:
        base=Path(tmp)/"base.sqlite"
        control=importar(FILES,base)
        if (control["filas"],control["celdas"],control["convocatorias"])!=(43,470,42):
            raise ValueError("La cantidad de fuentes cambió. Revisar la proyección sin descartar filas.")
        db=sqlite3.connect(base)
        db.row_factory=sqlite3.Row
        grouped={}
        n_docs=0
        for ruta in FILES:
            batch=json.loads(ruta.read_text(encoding="utf-8"))
            source=db.execute("SELECT fuente_id FROM v2_fuente_original WHERE nombre_literal=?",(ruta.name,)).fetchone()
            assert source, f"Falta en SQLite el lote: {ruta.name}"
            fid=source["fuente_id"]
            src=f"excel:lote_{batch['lote']:02d}"
            for original in batch["casos"]:
                code=original["codigo"]
                row={**original,"lote":batch["lote"],"corte":batch["fecha_extraccion"]}
                mapping=MAP[row["pestana"]]
                sqlrows=db.execute("""SELECT letra_columna,encabezado_literal,valor_visible_literal,
                       valor_entrada_literal,formula_literal,hipervinculo_literal,
                       nota_literal,formato_original_json
                       FROM v2_excel_celda_original
                       WHERE fuente_id=? AND numero=? AND pestana_literal=? AND numero_fila=?
                       ORDER BY letra_columna""",
                       (fid,code,row["pestana"],row["numero_fila"])).fetchall()
                if len(sqlrows)!=len(row["celdas"]) or len(row["celdas"])!=len(mapping):
                    raise ValueError(f"{code}: perdió celdas o columnas")
                for i,(actual,celda) in enumerate(zip(sqlrows,row["celdas"])):
                    valid={
                      "letra_columna":chr(65+i),
                      "encabezado_literal":row["encabezados"][i],
                      "valor_visible_literal":celda["valor_visible"],
                      "valor_entrada_literal":json.dumps(celda["valor_original"],ensure_ascii=False) if celda.get("valor_original") is not None else None,
                      "formula_literal":celda.get("formula"),
                      "hipervinculo_literal":celda.get("hipervinculo"),
                      "nota_literal":celda.get("nota")
                    }
                    for k,v in valid.items():
                        if actual[k]!=v:
                            raise ValueError(f"{code} {row['pestana']} {row['numero_fila']} {k}: SQLite no reproduce fuente")
                    formato=json.loads(actual["formato_original_json"])
                    if formato.get("formato")!=celda.get("formato") or formato.get("texto_formato_tramos")!=celda.get("texto_formato_tramos"):
                        raise ValueError(f"{code}: metadatos Excel alterados")
                if code not in grouped:
                    grouped[code]={
                      "numero":code,"filas_excel":[],"campos_originales":[],"fuentes":[],
                      "listas_originales":[],"tablas_originales":[],"sinteticos":[],
                      "documentos_lectura_previa":[],
                      "estado_integracion":"excel_estructurado_pdf_pendiente"
                    }
                g=grouped[code]
                g["filas_excel"].append(row)
                if not any(s["fuente_id"]==src for s in g["fuentes"]):
                    g["fuentes"].append({"fuente_id":src,"tipo":"excel","url":batch["fuente"]["url"],
                      "nombre_literal":batch["fuente"]["titulo"],
                      "estado":"captura_de_celdas","corte":batch["fecha_extraccion"]})
                for j,celda in enumerate(row["celdas"]):
                    g["campos_originales"].append({
                      "campo_id":f"{src}:{row['pestana']}:{row['numero_fila']}:{j}",
                      "fuente_id":src,"concepto":mapping[j],
                      "rotulo_literal":row["encabezados"][j],
                      "valor_literal":celda["valor_visible"],"numero":code,
                      "pestana":row["pestana"],"fila_excel":row["numero_fila"],
                      "columna_excel":chr(65+j),"estado":"capturado_de_excel","es_dato_original":True
                    })
                for document in row["documentos"]:
                    n_docs+=1
                    dkey="pdf:"+(document.get("drive_id") or document["url"])
                    if not any(s["fuente_id"]==dkey for s in g["fuentes"]):
                        g["fuentes"].append({
                          "fuente_id":dkey,"tipo":document["rol"]+"_pdf",
                          "url":document["url"],"nombre_literal":document.get("titulo"),
                          "estado":"texto_extraido_sin_tablas_cotejadas",
                          "identificacion_literal_en_pdf":document.get("codigo_interno_literal")
                        })
                    if not any(x.get("drive_id")==document.get("drive_id") and x.get("rol")==document.get("rol") for x in g["documentos_lectura_previa"]):
                        g["documentos_lectura_previa"].append({
                            **document,"fuente_id":dkey,
                            "estado":"texto_extraido_sin_tablas_cotejadas",
                            "es_pdf_estructurado":False
                        })
        db.close()
        output={
          "version":"2.1-static-bridge",
          "tipo":"proyeccion_de_datos_para_pages",
          "corte":"2026-11-13",
          "advertencia":"Los PDF de estos lotes solo conservan texto extraído, sin tablas/celdas visualmente cotejadas. Los campos Excel sí conservan todas sus celdas literales. No confundir lectura con validación.",
          "fuentes_originales":[str(x.relative_to(ROOT)) for x in FILES],
          "convocatorias":sorted(grouped.values(),key=lambda x:x["numero"],reverse=True)
        }
        if len(grouped)!=42 or n_docs!=16:
            raise ValueError("Se perdieron expedientes o documentos PDF")
        return output

def validar_igualdad(actual: dict, reconstruido: dict) -> None:
    a={x["numero"]:x for x in actual["convocatorias"]}
    b={x["numero"]:x for x in reconstruido["convocatorias"]}
    if a!=b:
        raise ValueError("La publicación en Pages no coincide con fuentes y base SQLite")
    if any(actual.get(k)!=reconstruido.get(k) for k in ("version","tipo","corte","advertencia","fuentes_originales")):
        raise ValueError("Metadatos de publicación distintos de los verificados")

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument("--comprobar",action="store_true",help="Comparar publicación ya guardada")
    parser.add_argument("--actualizar",action="store_true",help="Escribir publicación nueva o reemplazar proyección derivada")
    parser.add_argument("--salida",type=Path,default=ROOT/PATH)
    args=parser.parse_args()
    if args.comprobar and args.actualizar:
        parser.error("Elegir --comprobar o --actualizar")
    generated=obtener()
    if args.comprobar:
        stored=json.loads(args.salida.read_text(encoding="utf-8"))
        validar_igualdad(stored,generated)
    elif args.actualizar:
        args.salida.parent.mkdir(parents=True,exist_ok=True)
        args.salida.write_text(json.dumps(generated,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    else:
        parser.error("Se requiere --comprobar o --actualizar")
    print(json.dumps({
      "resultado":"ok","modo":"comprobar" if args.comprobar else "actualizar",
      "convocatorias":len(generated["convocatorias"]),
      "registros_excel":sum(len(g["filas_excel"]) for g in generated["convocatorias"]),
      "celdas_excel":sum(len(g["campos_originales"]) for g in generated["convocatorias"]),
      "textos_pdf":sum(len(g["documentos_lectura_previa"]) for g in generated["convocatorias"]),
      "pdf_tablas_cotejadas":0
    },ensure_ascii=False,indent=2))

if __name__=="__main__":
    main()
