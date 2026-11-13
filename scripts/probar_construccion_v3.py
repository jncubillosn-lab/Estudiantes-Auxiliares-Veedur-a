#!/usr/bin/env python3
"""Prueba real de importación V3: comprobar TODO contra las cuatro capturas.

No declara ninguno de los 16 PDF íntegramente verificado. La prueba de
fidelidad contrasta la base contra cada celda y objeto JSON originales,
incluidos los documentos y todas sus páginas de TEXTO disponibles.
"""
from __future__ import annotations
import hashlib
import json
import sqlite3
import sys
import tempfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/"scripts"))
from construir_base_v3 import crear_base, DEFAULT_FILES, literal

with tempfile.TemporaryDirectory() as dir:
    outfile=Path(dir)/"convocatorias_v3.sqlite"
    stats=crear_base(outfile,DEFAULT_FILES)
    assert (stats["convocatorias"],stats["filas_excel"],stats["celdas_excel"],
        stats["pdf_textuales"],stats["pdf_convocatoria"],stats["pdf_resultados"],
        stats["convocatorias_validadas"])==(42,43,470,16,7,9,0),stats
    db=sqlite3.connect(outfile)
    db.execute("PRAGMA foreign_keys=ON")
    checked_cells=checked_docs=checked_lotes=0
    duplicate_count=0
    for path in DEFAULT_FILES:
        raw=path.read_bytes()
        row=db.execute(
            """SELECT sha256_bytes,bytes_origen,contenido_literal_json,fuente_url,numero_lote
               FROM v3_captura_lote WHERE ruta_original=?""",
            (str(path.relative_to(ROOT)),)).fetchone()
        assert row, path
        assert row[0]==hashlib.sha256(raw).hexdigest()
        assert row[1]==len(raw) and row[2].encode("utf-8")==raw
        origin=json.loads(raw)
        assert row[3]==origin["fuente"]["url"] and row[4]==str(origin["lote"])
        checked_lotes+=1
        for case in origin["casos"]:
            num=case["codigo"]
            file=db.execute("""SELECT f.fila_id FROM v3_excel_fila f
                  JOIN v3_fuente s ON s.fuente_id=f.fuente_id
                  WHERE f.numero=? AND f.pestana_literal=? AND f.fila_original=?
                    AND s.version_literal=?""",
                 (num,case["pestana"],case["numero_fila"],
                  f"captura:lote_{origin['lote']:02d}:{origin['fecha_extraccion']}")).fetchone()
            assert file, (num,case["numero_fila"])
            cells=db.execute("""SELECT encabezado_literal,valor_visible_literal,
                         valor_entrada_literal,formula_literal,hipervinculo_literal,
                         nota_literal,formato_json FROM v3_excel_celda
                         WHERE fila_id=? ORDER BY columna_original""",(file[0],)).fetchall()
            assert len(cells)==len(case["celdas"])
            for i,c in enumerate(case["celdas"]):
                x=cells[i]
                assert x[0]==case["encabezados"][i]
                assert x[1]==literal(c.get("valor_visible"))
                assert json.loads(x[2])==c.get("valor_original")
                assert x[3]==literal(c.get("formula"))
                assert x[4]==literal(c.get("hipervinculo"))
                assert x[5]==literal(c.get("nota"))
                fmt=json.loads(x[6])
                assert fmt=={"formato":c.get("formato"),
                             "texto_formato_tramos":c.get("texto_formato_tramos")}
                checked_cells+=1
            for doc in case["documentos"]:
                found=db.execute("""SELECT f.url_original,f.codigo_interno_literal,
                    f.texto_respaldo_literal,h.registro_original_json,h.estado
                    FROM v3_lectura_pdf_previa h
                    JOIN v3_fuente f ON f.fuente_id=h.fuente_id
                    WHERE h.numero=? AND f.url_original=?""",
                    (num,doc["url"])).fetchall()
                assert any((d[0]==doc["url"] and d[1]==doc.get("codigo_interno_literal")
                            and d[2]==doc.get("texto_extraido")
                            and json.loads(d[3])==doc
                            and d[4]=="texto_sin_cotejo") for d in found)
                checked_docs+=1
    assert (checked_lotes,checked_cells,checked_docs)==(4,470,16)
    assert db.execute("SELECT count(*) FROM v3_excel_fila WHERE numero='2026-C2324'").fetchone()[0]==2
    assert db.execute("SELECT count(*) FROM v3_pdf_pagina").fetchone()[0]==0
    assert db.execute("SELECT count(*) FROM v3_acta_validacion").fetchone()[0]==0
    assert db.execute("SELECT count(*) FROM v3_revision_fuente").fetchone()[0]==0
    assert db.execute("SELECT count(*) FROM v3_consulta_resultados").fetchone()[0]==0
    assert db.execute("SELECT convocatorias_validadas FROM v3_metrica_principal").fetchone()[0]==0
    assert db.execute("PRAGMA foreign_key_check").fetchall()==[]
    assert db.execute("PRAGMA integrity_check").fetchone()[0]=="ok"
    for t in ("v3_captura_lote","v3_excel_celda","v3_fuente","v3_lectura_pdf_previa"):
        pk={"v3_captura_lote":"captura_id","v3_excel_celda":"celda_id",
            "v3_fuente":"fuente_id","v3_lectura_pdf_previa":"lectura_id"}[t]
        try:
            db.execute(f"DELETE FROM {t} WHERE {pk}=1")
        except sqlite3.IntegrityError:
            pass
        else:
            raise AssertionError("Se permitió borrar datos originales en "+t)
    db.close()
    try:
        crear_base(outfile,DEFAULT_FILES)
    except FileExistsError:pass
    else:raise AssertionError("Sobrescritura de base permitida")
print(json.dumps({"resultado":"ok","lotes_originales_comparados":checked_lotes,
    "celdas_originales_verificadas":checked_cells,
    "pdf_textuales_y_enlaces_verificados":checked_docs,
    "duplicado_C2324_conservado":True,
    "pdf_estructurados_visualmente":0,"convocatorias_validadas":0,
    "inmutabilidad_comprobada":True},ensure_ascii=False,indent=2))
