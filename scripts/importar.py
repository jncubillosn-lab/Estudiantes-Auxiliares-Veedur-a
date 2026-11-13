#!/usr/bin/env python3
"""Importación reproducible de lotes de veeduría a SQLite (stdlib, sin dependencias).

Norma 01: conservar el texto original y representar todos los renglones. Esta etapa
NO implica revisión visual de PDF ni completa la estructuración semántica de tablas.
El proceso produce una base NUEVA; jamás modifica los lotes JSON originales.
"""
from __future__ import annotations
import argparse
import json
import re
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
COLUMNS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

def importar(ruta_db: Path, archivos: list[Path]) -> dict:
    if ruta_db.exists():
        raise SystemExit(f"La base ya existe: {ruta_db}. Use otra ruta para no sobrescribir.")
    ruta_db.parent.mkdir(parents=True, exist_ok=True)
    con = sqlite3.connect(ruta_db)
    con.execute("PRAGMA foreign_keys=ON")
    con.executescript((ROOT / "db" / "schema.sql").read_text(encoding="utf-8"))
    estadisticas = {"lotes": 0, "expedientes": 0, "documentos": 0, "renglones_pdf": 0, "ausencias_documentales": 0}
    try:
        for archivo in archivos:
            lote = json.loads(archivo.read_text(encoding="utf-8"))
            fuente = lote["fuente"]
            cur = con.execute(
                "INSERT INTO captura_hoja (url_origen,titulo_original,capturada_en,parametros_json,notas) VALUES(?,?,?,?,?)",
                (fuente["url"], fuente["titulo"], lote["fecha_extraccion"],
                 json.dumps({"archivo": str(archivo.relative_to(ROOT)), "lote": lote["lote"]},ensure_ascii=False),
                 "Instantánea de celdas registrada en archivo de lote; ver tipo y estado de extracción."))
            captura_id = cur.lastrowid
            for caso in lote["casos"]:
                cod = str(caso.get("codigo") or "")
                cur = con.execute("INSERT INTO caso_convocatoria(codigo_referencia,estado_conciliacion,notas) VALUES(?,?,?)",
                                  (cod, "sin_verificar", f"Lote {lote['lote']}; no se presume corrección de códigos de PDF."))
                caso_id = cur.lastrowid
                cur = con.execute(
                    "INSERT INTO fila_hoja (captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES(?,?,?,?)",
                    (captura_id,caso["pestana"],caso["numero_fila"],"celda_a_celda"))
                fila_id = cur.lastrowid
                headers = caso["encabezados"]
                for j, celda in enumerate(caso["celdas"]):
                    letra = COLUMNS[j]
                    con.execute("""INSERT INTO celda_hoja
                    (fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura)
                    VALUES(?,?,?,?,?,?,?,?,?,?)""",
                    (fila_id,letra, headers[j] if j<len(headers) else None,
                     celda.get("valor_visible"),json.dumps(celda.get("valor_original"),ensure_ascii=False) if celda.get("valor_original") is not None else None,
                     celda.get("formula"),celda.get("hipervinculo"),celda.get("nota"),
                     json.dumps(celda.get("formato"),ensure_ascii=False) if celda.get("formato") else None,
                     "leido"))
                con.execute("INSERT INTO vinculo_caso(caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES(?,?,?,?,?)",
                            (caso_id,fila_id,"hoja_calculo",cod,"leido"))
                for falta in caso.get("ausencias",[]):
                    estadisticas["ausencias_documentales"] += 1
                    con.execute("""INSERT INTO evento_revision(objeto_tipo,objeto_id,accion,descripcion)
                                   VALUES(?,?,?,?)""",
                                ("caso_convocatoria",caso_id,"documento_pendiente",
                                 json.dumps(falta, ensure_ascii=False)))
                for doc in caso.get("documentos",[]):
                    txt = doc.get("texto_extraido") or ""
                    cur=con.execute("""INSERT INTO documento
                        (tipo_sugerido,url_origen,drive_id,titulo_archivo,mime_type,capturado_en,
                         estado_acceso,estado_extraccion,notas)
                         VALUES(?,?,?,?,?,?,?,?,?)""",
                        (doc["rol"],doc["url"],doc.get("drive_id"),doc.get("titulo"),
                         doc.get("mime"),lote["fecha_extraccion"],
                         "leido" if doc.get("lectura_exitosa") else "fallo",
                         "texto_extraido_pendiente_revision_visual",
                         "Fuente original accesible por URL. Copia binaria/hash y elementos gráficos por verificar."))
                    doc_id = cur.lastrowid
                    con.execute("""INSERT INTO vinculo_caso(caso_id,documento_id,rol_en_caso,evidencia_literal,estado_verificacion)
                                   VALUES(?,?,?,?,?)""",
                                (caso_id,doc_id,doc["rol"],doc.get("titulo"),"texto_leido_visual_pendiente"))
                    cur=con.execute("""INSERT INTO campo_documento
                        (documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,estado_revision)
                        VALUES(?,?,?,?,?,?)""",
                        (doc_id,"texto_extraido_integro",1,"Transcripción literal obtenida del PDF",txt,"texto_sin_cotejo_visual"))
                    for page_index,pagina in enumerate(doc.get("paginas",[]),start=1):
                        cur=con.execute("""INSERT INTO pagina_pdf
                            (documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas)
                            VALUES(?,?,?,?,?,?)""",
                            (doc_id,page_index,pagina["texto"],"segmentacion_heuristica_del_texto",
                             "pendiente", "No se asume exactitud de límites de página sin PDF binario."))
                        page_id=cur.lastrowid
                        for k,linea in enumerate(pagina.get("renglones",[]),start=1):
                            con.execute("""INSERT INTO fragmento_pdf
                                (pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion,notas)
                                VALUES(?,?,?,?,?,?)""",
                                (page_id,k,"renglon_extraido",linea,"pendiente_de_clasificacion",
                                 "No se descartó ningún renglón, incluidos los vacíos."))
                            estadisticas["renglones_pdf"] += 1
                    for field in doc.get("campos_detectados",[]):
                        con.execute("""INSERT INTO campo_documento
                            (documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,
                            valor_normalizado_json,estado_revision,notas)
                            VALUES(?,?,?,?,?,?,?,?)""",
                            (doc_id,field["nombre"],field.get("ocurrencia",1),
                             field.get("rotulo_literal"),field.get("texto_literal"),
                             json.dumps(field.get("valor_auxiliar"),ensure_ascii=False) if field.get("valor_auxiliar") is not None else None,
                             "pendiente_de_cotejo","Detectado por patrones; conservar original completo."))
                    if doc["rol"]=="resultados":
                        con.execute("""INSERT INTO publicacion_resultados
                            (documento_id,codigo_convocatoria_literal,nombre_literal,estado_revision)
                            VALUES(?,?,?,?)""",
                            (doc_id,doc.get("codigo_interno_literal"),doc.get("titulo"),
                             "pendiente_de_cotejo_visual"))
                    estadisticas["documentos"] += 1
                estadisticas["expedientes"] += 1
            estadisticas["lotes"] += 1
            con.commit()
    except Exception:
        con.rollback()
        con.close()
        ruta_db.unlink(missing_ok=True)
        raise
    issues=con.execute("PRAGMA integrity_check").fetchone()[0]
    estadisticas["integridad_sqlite"] = issues
    con.close()
    return estadisticas

if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--db",type=Path,default=ROOT/"salidas"/"veeduria.sqlite")
    parser.add_argument("lotes",nargs="*",type=Path,help="Archivos JSON; por defecto data/lotes/lote_*.json")
    args=parser.parse_args()
    lotes=sorted(args.lotes or (ROOT/"data"/"lotes").glob("lote_*.json"))
    if not lotes: parser.error("No se encontraron lotes para importar.")
    resumen=importar(args.db,lotes)
    print(json.dumps(resumen,ensure_ascii=False,indent=2))
