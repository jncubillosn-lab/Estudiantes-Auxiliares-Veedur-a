#!/usr/bin/env python3
"""La proyección de lectura conserva originales y no certifica expedientes."""
import json,sys,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'scripts'))
from construir_base_v3 import crear_base
from exportar_base_v3 import exportar
with tempfile.TemporaryDirectory() as t:
    path=Path(t)/'base.sqlite'
    crear_base(path)
    doc=exportar(path)
    assert doc['version_contrato']=='3.0'
    cases=doc['convocatorias']
    assert len(cases)==96
    assert doc['metricas']['convocatorias_validadas']==0
    assert len({c['numero'] for c in cases})==96
    assert sum(len(f['filas_excel']) for c in cases for f in c['fuentes_originales'])==97
    assert sum(len(r['celdas']) for c in cases for f in c['fuentes_originales'] for r in f['filas_excel'])==1031
    assert sum(f['tipo']=='convocatoria_pdf' for c in cases for f in c['fuentes_originales'])==97
    assert sum(f['tipo']=='resultados_pdf' for c in cases for f in c['fuentes_originales'])==24
    assert sum(len(f['paginas_pdf_estructuradas']) for c in cases for f in c['fuentes_originales'])==397
    assert all(not c['validada'] and not c['control_validacion']['actas'] for c in cases)
    assert all(not page['tablas_originales'] and page['cotejo_visual']=='pendiente' for c in cases for f in c['fuentes_originales'] for page in f['paginas_pdf_estructuradas'])
    assert json.loads(json.dumps(doc,ensure_ascii=False))==doc
print(json.dumps({'resultado':'ok','convocatorias':96,'paginas_pdf':397,'actas':0},ensure_ascii=False))
