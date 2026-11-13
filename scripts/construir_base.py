#!/usr/bin/env python3
"""Construye una base SQLite privada y consultable sin alterar las fuentes JSON/SQL."""
from __future__ import annotations
import argparse
import json
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

def construir(destino: Path):
    if destino.exists():
        raise SystemExit(f"Archivo existente, no sobrescrito: {destino}")
    destino.parent.mkdir(parents=True, exist_ok=True)
    db = sqlite3.connect(destino)
    try:
        db.execute("PRAGMA foreign_keys = ON")
        scripts = [ROOT/"db"/"schema.sql"]
        scripts += [ROOT/"db"/f"seed_lote_0{n}.sql" for n in range(1,5)]
        scripts += [ROOT/"db"/"hallazgos_iniciales.sql",ROOT/"db"/"views.sql"]
        for archivo in scripts:
            db.executescript(archivo.read_text(encoding="utf-8"))
        assert db.execute("PRAGMA integrity_check").fetchone()[0] == "ok"
        resumen = {
            "expedientes": db.execute("SELECT COUNT(*) FROM caso_convocatoria").fetchone()[0],
            "documentos": db.execute("SELECT COUNT(*) FROM documento").fetchone()[0],
            "celdas": db.execute("SELECT COUNT(*) FROM celda_hoja").fetchone()[0],
            "renglones_pdf": db.execute("SELECT COUNT(*) FROM fragmento_pdf").fetchone()[0],
            "postulaciones_provisionales": db.execute("SELECT COUNT(*) FROM postulacion").fetchone()[0],
            "hallazgos_pendientes": db.execute("SELECT COUNT(*) FROM hallazgo").fetchone()[0],
            "ruta": str(destino),
        }
        assert (resumen["expedientes"], resumen["documentos"], resumen["celdas"], resumen["renglones_pdf"]) == (43,16,470,2340)
        return resumen
    except Exception:
        db.close()
        destino.unlink(missing_ok=True)
        raise
    finally:
        db.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--salida",type=Path,default=ROOT/"salidas"/"veeduria.sqlite")
    args=parser.parse_args()
    print(json.dumps(construir(args.salida),ensure_ascii=False,indent=2))
