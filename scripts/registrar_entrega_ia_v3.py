#!/usr/bin/env python3
"""Recibe un MANIFIESTO de IA en SQLite V3; NO interpreta documentos.

Conserva la entrega, enlaces/versiones e incidencias de fuente no localizada,
registra posiciones trabajadas y NO crea actas, páginas, requisitos, tablas,
resultados ni cotejos que la IA no haya aportado. Transacción atómica.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import sqlite3
import sys
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/"scripts"))
from validar_entrega_ia_v3 import revisar,cargar,CONF

def registrar(db_path:Path,manifiesto:dict,anteriores=None):
    if not db_path.is_file():
        raise FileNotFoundError(f"La base SQLite V3 no existe: {db_path}")
    informe=revisar(manifiesto,cargar(CONF),anteriores)
    db=sqlite3.connect(db_path)
    db.execute("PRAGMA foreign_keys=ON")
    stats={"convocatorias_recibidas":0,"fuentes_vinculadas":0,
           "lecturas_registradas":0,"pendientes_sin_url":0,
           "actas_generadas":0,"convocatorias_validadas_creadas":0}
    try:
        db.execute("BEGIN IMMEDIATE")
        for case in manifiesto["convocatorias"]:
            num=case["numero"]
            db.execute("INSERT OR IGNORE INTO v3_convocatoria(numero) VALUES(?)",(num,))
            body=json.dumps(case,ensure_ascii=False,separators=(",",":"))
            digest=hashlib.sha256(body.encode("utf-8")).hexdigest()
            exists=db.execute("""SELECT entrega_id FROM v3_entrega_ia
                WHERE lote_id=? AND numero=? AND sha256_contenido=?""",
                (manifiesto["lote_id"],num,digest)).fetchone()
            if exists:
                raise ValueError(f"Entrega ya registrada: {manifiesto['lote_id']}, {num}")
            db.execute("""INSERT INTO v3_entrega_ia
                (lote_id,version_contrato,numero,contenido_literal_json,sha256_contenido,
                fecha_entrega,estado_importacion,nota)
                VALUES(?,?,?,?,?,?,'recibida',?)""",
                (manifiesto["lote_id"],manifiesto["version_contrato"],num,body,
                 digest,manifiesto["fecha_corte"],
                 "Solo recepción: los cotejos y originales estructurados se registran después")),
            by_source={}
            for source in case["fuentes"]:
                url=source.get("url_original")
                tipo=source["tipo"]
                version=source["version_fuente"]
                if not isinstance(url,str) or not url.startswith(("https://","http://")):
                    db.execute("""INSERT INTO v3_incidencia
                        (numero,criticidad,detalle,registrada_en)
                        VALUES(?,?,?,?)""",
                        (num,"critica" if tipo=="convocatoria_pdf" else "documental",
                         f"{tipo}: {source.get('incidencia','URL no localizada')}",
                         manifiesto["fecha_corte"]))
                    stats["pendientes_sin_url"]+=1
                    continue
                old=db.execute("""SELECT fuente_id FROM v3_fuente
                      WHERE tipo=? AND url_original=? AND version_literal=?""",
                      (tipo,url,version)).fetchone()
                if old:
                    fid=old[0]
                else:
                    fid=db.execute("""INSERT INTO v3_fuente
                        (tipo,url_original,nombre_literal,codigo_interno_literal,
                         version_literal,fecha_captura,resultado_acceso,metadatos_json)
                        VALUES(?,?,?,?,?,?,?,?)""",
                        (tipo,url,source.get("nombre_literal"),
                         source.get("codigo_interno_literal"),version,
                         manifiesto["fecha_corte"],
                         "fallo" if source["estado"]=="fallo_acceso" else "sin_comprobar",
                         json.dumps({"entrega_ia":source,"estado_no_cotejado":True},
                                    ensure_ascii=False))).lastrowid
                db.execute("""INSERT OR IGNORE INTO v3_convocatoria_fuente(numero,fuente_id)
                              VALUES(?,?)""",(num,fid))
                by_source[(tipo,url,version)]=fid
                stats["fuentes_vinculadas"]+=1
            for read in case.get("lecturas",[]):
                matches=[(u,v,fid) for (t,u,v),fid in by_source.items()
                         if t==read.get("fuente_tipo")
                            and v==read.get("version_fuente")
                            and (not read.get("fuente_url") or read["fuente_url"]==u)]
                if len(matches)!=1:
                    raise ValueError(f"{num}: lectura sin fuente inequívoca")
                url,version,fid=matches[0]
                db.execute("""INSERT INTO v3_control_lectura
                    (lote_id,numero,fuente_id,version_fuente,ubicacion,accion,
                     motivo,version_lectura,fecha)
                    VALUES(?,?,?,?,?,?,?,?,?)""",
                    (manifiesto["lote_id"],num,fid,version,read["ubicacion"],
                     read["accion"],read.get("motivo"),
                     read.get("nueva_version_lectura"),manifiesto["fecha_corte"]))
                stats["lecturas_registradas"]+=1
            stats["convocatorias_recibidas"]+=1
        # Un manifiesto NO puede aumentar validadas. SQL sólo cuenta actas.
        stats["convocatorias_validadas_actuales"]=db.execute(
            "SELECT convocatorias_validadas FROM v3_metrica_principal").fetchone()[0]
        db.commit()
        return {**informe,**stats}
    except Exception:
        db.rollback()
        raise
    finally:
        db.close()

if __name__=="__main__":
    p=argparse.ArgumentParser(description="Registrar metadatos de entrega IA en SQLite V3")
    p.add_argument("manifiesto",type=Path)
    p.add_argument("--db",required=True,type=Path)
    p.add_argument("--anteriores",nargs="*",type=Path,default=[])
    a=p.parse_args()
    print(json.dumps(registrar(a.db,cargar(a.manifiesto),
                     [cargar(x) for x in a.anteriores]),ensure_ascii=False,indent=2))
