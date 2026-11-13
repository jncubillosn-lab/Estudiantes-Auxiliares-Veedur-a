#!/usr/bin/env python3
"""Exportación de originales v2 y sintéticos como capas separadas para comparador-v2.

No se modifica ni el SQLite ni el JSON anterior. Una exportación nueva requiere
una ruta nueva: jamás sobrescribe una versión de evidencia.
"""
from __future__ import annotations
import argparse
import json
import sqlite3
from datetime import datetime,timezone
from pathlib import Path


def rows(db,sql,params=()):
    db.row_factory=sqlite3.Row
    return [dict(x) for x in db.execute(sql,params)]


def obtener(db_path:Path):
    db=sqlite3.connect(f"file:{db_path.resolve()}?mode=ro",uri=True)
    db.execute("PRAGMA foreign_keys=ON")
    try:
        result={"version":"2.0","generado_en":datetime.now(timezone.utc).isoformat(),
                "origen":"db/estructura_v2.sql","convocatorias":[]}
        for item in rows(db,"SELECT numero FROM v2_convocatoria ORDER BY numero DESC"):
            number=item["numero"]
            fuentes=rows(db,"""SELECT f.fuente_id,v.rol_literal AS tipo,f.uri_original AS url,f.nombre_literal,
                              f.hash_sha256,f.bytes_originales,f.estado_binario,
                              v.codigo_observado_literal,v.correspondencia
                         FROM v2_vinculo_convocatoria_fuente v
                         JOIN v2_fuente_original f ON f.fuente_id=v.fuente_id
                         WHERE v.numero=? ORDER BY f.fuente_id""",(number,))
            campos=rows(db,"""SELECT c.campo_id,c.codigo_semantico AS concepto,c.rotulo_literal,
                     c.valor_literal,c.fuente_id,c.celda_pdf_id AS celda_id,
                     c.celda_excel_id,c.estado_lectura AS estado,p.pagina_numero AS pagina
                     FROM v2_campo_original c
                     JOIN v2_fuente_original f ON f.fuente_id=c.fuente_id
                     LEFT JOIN v2_pagina_original p ON p.pagina_id=c.pagina_id
                     WHERE c.numero=? AND f.clase!='excel'
                     ORDER BY c.fuente_id,c.orden_en_fuente,c.campo_id""",(number,))
            lists=rows(db,"""SELECT l.lista_id,l.nombre_literal,l.clase_propuesta AS concepto,
                            l.texto_original_integral,l.estado_lectura,l.campo_id,
                            c.fuente_id
                        FROM v2_lista_original l JOIN v2_campo_original c ON c.campo_id=l.campo_id
                        WHERE c.numero=? ORDER BY l.lista_id""",(number,))
            for itemlist in lists:
                items=rows(db,"""SELECT i.item_id,i.orden,i.literal_completo,i.comentario_literal,
                              i.celda_pdf_id AS celda_id,p.pagina_numero AS pagina,i.padre_item_id
                              FROM v2_item_lista_original i
                              LEFT JOIN v2_pagina_original p ON p.pagina_id=i.pagina_id
                              WHERE i.lista_id=? ORDER BY i.orden""",(itemlist["lista_id"],))
                itemlist["items"]=items
            tables=rows(db,"""SELECT t.tabla_id,t.orden_tabla,t.filas_detectadas,t.columnas_detectadas,
                              t.estado_revision,t.metodo_deteccion,p.pagina_numero AS pagina,
                              p.ancho_pt,p.alto_pt,r.fuente_id
                              FROM v2_tabla_original t JOIN v2_pagina_original p ON p.pagina_id=t.pagina_id
                              JOIN v2_corrida_extraccion r ON r.corrida_id=p.corrida_id
                              JOIN v2_vinculo_convocatoria_fuente v ON v.fuente_id=r.fuente_id
                              WHERE v.numero=? ORDER BY r.fuente_id,p.pagina_numero,t.orden_tabla""",(number,))
            for table in tables:
                table["celdas"]=rows(db,"""SELECT celda_id,fila,columna,combina_filas,combina_columnas,
                           x0,y0,x1,y1,texto_literal,estado_lectura
                           FROM v2_celda_tabla_original WHERE tabla_id=?
                           ORDER BY fila,columna""",(table["tabla_id"],))
            synth=rows(db,"""SELECT indicador_id,nombre,tipo_valor,valor_json,regla,version_regla,estado
                          FROM v2_indicador_sintetico WHERE numero=?
                          ORDER BY nombre,indicador_id""",(number,))
            for ind in synth:
                try: ind["valor"]=json.loads(ind.pop("valor_json"))
                except ValueError: ind["valor"]=ind.pop("valor_json")
                ind["insumos"]=rows(db,"""SELECT campo_original_id,item_original_id,celda_pdf_original_id,celda_excel_original_id
                                           FROM v2_indicador_insumo WHERE indicador_id=?""",(ind["indicador_id"],))
            result["convocatorias"].append({
                "numero":number,"fuentes":fuentes,
                "campos_originales":campos,
                "listas_originales":lists,
                "tablas_originales":tables,
                "sinteticos":synth})
        return result
    finally: db.close()


if __name__=="__main__":
    p=argparse.ArgumentParser()
    p.add_argument("--db",type=Path,required=True)
    p.add_argument("--salida",type=Path,required=True)
    args=p.parse_args()
    if args.salida.exists():
        raise SystemExit("No se sobrescribe una exportación anterior: "+str(args.salida))
    data=obtener(args.db)
    args.salida.parent.mkdir(parents=True,exist_ok=True)
    args.salida.write_text(json.dumps(data,ensure_ascii=False,indent=2),encoding="utf-8")
    print(json.dumps({"convocatorias":len(data["convocatorias"]),
                      "campos_pdf":sum(len(x["campos_originales"]) for x in data["convocatorias"]),
                      "listas_pdf":sum(len(x["listas_originales"]) for x in data["convocatorias"]),
                      "tablas_pdf":sum(len(x["tablas_originales"]) for x in data["convocatorias"]),
                      "salida":str(args.salida)},ensure_ascii=False,indent=2))
