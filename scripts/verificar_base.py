#!/usr/bin/env python3
"""Verifica sin modificar archivos: esquema, cuatro semillas y cobertura del texto literal."""
import json
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
db = sqlite3.connect(":memory:")
db.execute("PRAGMA foreign_keys=ON")
db.executescript((ROOT / "db" / "schema.sql").read_text(encoding="utf-8"))
lotes = []
for n in range(1, 5):
    seed = ROOT / "db" / f"seed_lote_0{n}.sql"
    source = ROOT / "data" / "lotes" / f"lote_0{n}.json"
    assert seed.exists() and source.exists(), (seed, source)
    db.executescript(seed.read_text(encoding="utf-8"))
    lotes.append(json.loads(source.read_text(encoding="utf-8")))

def count(table):
    return db.execute(f"SELECT count(*) FROM {table}").fetchone()[0]

totals = {
    "casos": sum(len(x["casos"]) for x in lotes),
    "documentos": sum(len(c["documentos"]) for x in lotes for c in x["casos"]),
    "celdas": sum(len(c["celdas"]) for x in lotes for c in x["casos"]),
    "renglones": sum(len(pg["renglones"]) for x in lotes for c in x["casos"] for d in c["documentos"] for pg in d["paginas"]),
}
assert count("caso_convocatoria") == totals["casos"], (count("caso_convocatoria"), totals["casos"])
assert count("fila_hoja") == totals["casos"]
assert count("documento") == totals["documentos"], (count("documento"), totals["documentos"])
assert count("celda_hoja") == totals["celdas"], (count("celda_hoja"), totals["celdas"])
assert count("fragmento_pdf") == totals["renglones"], (count("fragmento_pdf"), totals["renglones"])
for lote in lotes:
    for caso in lote["casos"]:
        row = db.execute("""
            SELECT fila_id FROM fila_hoja WHERE pestaña_literal=? AND indice_fila=?
        """, (caso["pestana"], caso["numero_fila"])).fetchone()
        assert row is not None, (caso["codigo"], caso["numero_fila"])
        for i, src in enumerate(caso["celdas"]):
            cell = db.execute("SELECT valor_visible FROM celda_hoja WHERE fila_id=? AND columna_letra=?",
                              (row[0], "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[i])).fetchone()
            if cell is None or cell[0] != src["valor_visible"]:
                actual = cell[0] if cell else None
                expected = src["valor_visible"]
                a = actual or ""
                b = expected or ""
                first = next((j for j in range(min(len(a),len(b))) if a[j]!=b[j]), min(len(a),len(b)))
                raise AssertionError({"tipo":"celda", "codigo":caso["codigo"],"col":i,"longitud_actual":len(a),
                   "longitud_esperada":len(b), "posicion":first,
                   "puntos_actuales":[ord(ch) for ch in a[first:first+8]],
                   "puntos_esperados":[ord(ch) for ch in b[first:first+8]]})
        for doc in caso["documentos"]:
            rr = db.execute("""
                SELECT d.documento_id, c.texto_original FROM documento d
                JOIN campo_documento c ON c.documento_id = d.documento_id
                WHERE d.drive_id=? AND c.ruta_campo='texto_extraido_integro'
            """, (doc["drive_id"],)).fetchall()
            assert rr, doc["drive_id"]
            if not any(x[1] == doc["texto_extraido"] for x in rr):
                a=rr[0][1] or ""
                b=doc["texto_extraido"]
                first=next((j for j in range(min(len(a),len(b))) if a[j]!=b[j]),min(len(a),len(b)))
                raise AssertionError({"tipo":"pdf","id":doc["drive_id"],"longitud_actual":len(a),
                  "longitud_esperada":len(b),"posicion":first,
                  "puntos_actuales":[ord(ch) for ch in a[first:first+8]],
                  "puntos_esperados":[ord(ch) for ch in b[first:first+8]]})
            did = rr[0][0]
            pages = db.execute("SELECT texto_extraido_literal FROM pagina_pdf WHERE documento_id=? ORDER BY numero_pagina",
                               (did,)).fetchall()
            assert "".join(p[0] for p in pages) == doc["texto_extraido"], doc["drive_id"]
assert db.execute("PRAGMA integrity_check").fetchone()[0] == "ok"
print(json.dumps({"verificacion":"ok","totales":totals,
                  "postulaciones_provisionales":count("postulacion"),
                  "paginas_segmentadas_por_heuristica":count("pagina_pdf"),
                  "observacion":"NO es verificacion visual ni cotejo semantico definitivo."},
                 indent=2,ensure_ascii=False))
