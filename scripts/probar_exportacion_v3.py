#!/usr/bin/env python3
"""Contrato de lectura de v3: originales, estados A-E y sintéticos SEPARADOS."""
import json
import sys
import tempfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/"scripts"))
from construir_base_v3 import DEFAULT_FILES, crear_base
from exportar_base_v3 import exportar

with tempfile.TemporaryDirectory() as d:
    db=Path(d)/"base.sqlite"
    crear_base(db,DEFAULT_FILES)
    data=exportar(db)
    cases=data["convocatorias"]
    assert data["version_contrato"]=="3.0"
    assert len(cases)==42
    assert data["metricas"]["convocatorias_validadas"]==0
    assert sum(len(c["fuentes_originales"]) for c in cases)==20
    assert sum(len(f["filas_excel"]) for c in cases for f in c["fuentes_originales"])==43
    assert sum(len(r["celdas"]) for c in cases for f in c["fuentes_originales"] for r in f["filas_excel"])==470
    assert sum(f["pdf_lectura_previa"] is not None for c in cases for f in c["fuentes_originales"])==16
    assert all(not c["validada"] for c in cases)
    assert all(not c["indicadores_sinteticos"] for c in cases)
    assert all(not c["control_validacion"]["actas"] for c in cases)
    for c in cases:
        for f in c["fuentes_originales"]:
            assert f["url_original"].startswith(("https://","http://"))
            if f["tipo"].endswith("_pdf"):
                assert f["pdf_lectura_previa"]["estado"]=="texto_sin_cotejo"
                assert f["paginas_pdf_estructuradas"]==[]
                assert f["paginas_cotejadas"]==0
    d=json.loads(json.dumps(data,ensure_ascii=False))
    assert d==data
print(json.dumps({"resultado":"ok","contrato":"3.0",
    "convocatorias_agrupadas":len(cases),
    "filas":43,"celdas":470,"enlaces_pdf":16,
    "validaciones_confirmadas":0,"originales_vs_sinteticos":"capas_separadas"},
    ensure_ascii=False))
