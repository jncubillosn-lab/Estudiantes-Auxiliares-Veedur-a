#!/usr/bin/env python3
"""Exporta el CONTRATO V3 para visualización, sin procesar ni juzgar PDFs.

Separa 3 conjuntos: originales íntegros, verificación/estado y sintéticos.
No modifica la base ni las fuentes; jamás presenta un PDF textual como
una tabla estructurada o una convocatoria identificada como validada.
"""
from __future__ import annotations

import argparse
import json
import sqlite3
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]

def query(db,sql,args=()):
    return [dict(r) for r in db.execute(sql,args)]

def one(db,sql,args=()):
    row=db.execute(sql,args).fetchone()
    return dict(row) if row is not None else None

def exportar(path):
    db=sqlite3.connect(f"file:{path.resolve()}?mode=ro",uri=True)
    db.row_factory=sqlite3.Row
    try:
        metricas=one(db,"SELECT * FROM v3_metrica_principal")
        answer={
            "version_contrato":"3.0",
            "tipo":"expedientes_integrados_sin_sintesis_sustitutiva",
            "norma_principal":"docs/NORMA-00-validacion-integral.md",
            "metricas":metricas,
            "advertencias":{
                "expediente_identificado_no_equivale_validado":True,
                "texto_pdf_historico_no_es_estructura_cotejada":True,
                "sin_resultados_requiere_consulta_documentada":True,
                "estado_validez_tomado_de_v3_convocatorias_validadas":True,
                "datos_sinteticos_son_adicionales":True,
            },
            "capturas_originales":[
                {k:v for k,v in row.items() if k!="contenido_literal_json"}
                for row in query(db,"SELECT * FROM v3_captura_lote ORDER BY captura_id")
            ],
            "convocatorias":[],
        }
        for source in query(db,"SELECT * FROM v3_estado_por_convocatoria ORDER BY numero DESC"):
            num=source["numero"]
            expediente={
                "numero":num,
                "estado_validacion":source["estado"],
                "validada":source["estado"]=="validada",
                "fuentes_originales":[],
                "datos_originales":query(db,
                    "SELECT * FROM v3_dato_original WHERE numero=? ORDER BY fuente_id,orden_en_fuente,dato_id",(num,)),
                "listas_originales":[],
                "resultados_estructurados":[],
                "indicadores_sinteticos":[],
                "control_validacion":{
                    "puertas":[], "comprobaciones_resultados":[],
                    "incidencias":[], "actas":[],
                },
            }
            for f in query(db,"SELECT * FROM v3_fuentes_de_expediente WHERE numero=? ORDER BY fuente_id",(num,)):
                fid=f["fuente_id"]
                info=one(db,"SELECT sha256,metadatos_json FROM v3_fuente WHERE fuente_id=?",(fid,))
                f.update({"sha256_pdf_nativo":info["sha256"],
                          "metadatos_fuente":json.loads(info["metadatos_json"]) if info["metadatos_json"] else None,
                          "filas_excel":[],"pdf_lectura_previa":None,
                          "paginas_pdf_estructuradas":[],
                          "revision_de_cobertura":[]})
                for row in query(db,"SELECT * FROM v3_excel_fila WHERE numero=? AND fuente_id=? ORDER BY fila_original",(num,fid)):
                    row["celdas"]=query(db,
                        "SELECT * FROM v3_excel_celda WHERE fila_id=? ORDER BY celda_id",(row["fila_id"],))
                    for c in row["celdas"]:
                        if c["formato_json"] is not None:
                            c["formato_json"]=json.loads(c["formato_json"])
                    f["filas_excel"].append(row)
                prev=one(db,"SELECT estado,registro_original_json FROM v3_lectura_pdf_previa WHERE fuente_id=?",(fid,))
                if prev:
                    f["pdf_lectura_previa"]={
                        "estado":prev["estado"],
                        "datos_textuales_originales":json.loads(prev["registro_original_json"]),
                        "nota":"La estructura tabular y visual de este PDF aún no fue cotejada",
                    }
                for page in query(db,"SELECT pagina_id,numero_pagina,ancho_pt,alto_pt,imagen_ruta,imagen_sha256,cotejo_visual,notas FROM v3_pdf_pagina WHERE fuente_id=? ORDER BY numero_pagina",(fid,)):
                    page["elementos_originales"]=query(db,"SELECT * FROM v3_pdf_elemento WHERE pagina_id=? ORDER BY ordinal",(page["pagina_id"],))
                    page["tablas_originales"]=query(db,"SELECT * FROM v3_pdf_tabla WHERE pagina_id=? ORDER BY ordinal",(page["pagina_id"],))
                    for tab in page["tablas_originales"]:
                        tab["celdas"]=query(db,"SELECT * FROM v3_pdf_celda WHERE tabla_id=? ORDER BY fila,columna",(tab["tabla_id"],))
                    f["paginas_pdf_estructuradas"].append(page)
                for revision in query(db,"SELECT * FROM v3_revision_fuente WHERE fuente_id=? AND numero=? ORDER BY revision_id",(fid,num)):
                    revision["metricas"]=query(db,"SELECT * FROM v3_revision_metrica WHERE revision_id=? ORDER BY metrica",(revision["revision_id"],))
                    f["revision_de_cobertura"].append(revision)
                expediente["fuentes_originales"].append(f)
            for item in query(db,"SELECT * FROM v3_lista_original WHERE numero=? ORDER BY fuente_id,orden_en_fuente,lista_id",(num,)):
                item["items"]=query(db,"SELECT * FROM v3_item_original WHERE lista_id=? ORDER BY orden",(item["lista_id"],))
                expediente["listas_originales"].append(item)
            for row in query(db,"SELECT * FROM v3_resultado_fila WHERE numero=? ORDER BY fuente_id,tabla_id,fila_original",(num,)):
                row["valores"]=query(db,"SELECT * FROM v3_resultado_valor WHERE resultado_fila_id=? ORDER BY celda_pdf_id",(row["resultado_fila_id"],))
                expediente["resultados_estructurados"].append(row)
            for indice in query(db,"SELECT * FROM v3_indicador_sintetico WHERE numero=? ORDER BY indicador_id",(num,)):
                indice["valor"]=json.loads(indice["valor_json"])
                indice.pop("valor_json")
                indice["insumos_datos_originales"]=query(db,
                    "SELECT dato_id FROM v3_indicador_insumo WHERE indicador_id=? ORDER BY dato_id",(indice["indicador_id"],))
                expediente["indicadores_sinteticos"].append(indice)
            for gate in query(db,"SELECT * FROM v3_puerta WHERE numero=? ORDER BY puerta_id",(num,)):
                gate["criterios"]=query(db,"SELECT * FROM v3_cumplimiento WHERE puerta_id=? ORDER BY criterio",(gate["puerta_id"],))
                expediente["control_validacion"]["puertas"].append(gate)
            expediente["control_validacion"]["comprobaciones_resultados"]=query(db,
                    "SELECT * FROM v3_consulta_resultados WHERE numero=? ORDER BY consulta_id",(num,))
            for inc in query(db,"SELECT * FROM v3_incidencia WHERE numero=? ORDER BY incidencia_id",(num,)):
                inc["resolucion"]=one(db,"SELECT * FROM v3_resolucion_incidencia WHERE incidencia_id=?",(inc["incidencia_id"],))
                expediente["control_validacion"]["incidencias"].append(inc)
            expediente["control_validacion"]["actas"]=query(db,
                    "SELECT * FROM v3_acta_validacion WHERE numero=? ORDER BY acta_id",(num,))
            answer["convocatorias"].append(expediente)
        assert len(answer["convocatorias"])==metricas["convocatorias_identificadas"]
        assert sum(x["validada"] for x in answer["convocatorias"])==metricas["convocatorias_validadas"]
        return answer
    finally:
        db.close()

if __name__=="__main__":
    p=argparse.ArgumentParser()
    p.add_argument("--db",type=Path,required=True)
    p.add_argument("--salida",type=Path,required=True)
    args=p.parse_args()
    if args.salida.exists():p.error("El archivo de exportación ya existe; no se sobrescribe")
    data=exportar(args.db)
    args.salida.parent.mkdir(parents=True,exist_ok=True)
    args.salida.write_text(json.dumps(data,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print(json.dumps({"convocatorias":len(data["convocatorias"]),
        "validadas":data["metricas"]["convocatorias_validadas"],
        "fuentes":sum(len(x["fuentes_originales"]) for x in data["convocatorias"]),
        "salida":str(args.salida)},ensure_ascii=False,indent=2))
