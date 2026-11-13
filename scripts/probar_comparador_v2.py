#!/usr/bin/env python3
"""Comprobar sintaxis y contrato v2 de comparador sin modificar fuentes."""
import json
import re
import shutil
import subprocess
from pathlib import Path

root=Path(__file__).resolve().parents[1]
html=(root/"comparador-v2.html").read_text(encoding="utf-8")
js=re.findall(r"<script>([\s\S]*?)</script>",html)
assert len(js)==1,"Se esperaba exactamente un script de interfaz"
assert shutil.which("node"),"Se necesita Node.js para validar sintaxis"
result=subprocess.run(["node","--check","-"],input=js[0],capture_output=True,text=True)
assert result.returncode==0,result.stderr
for n in range(1,5):
    assert f"data/lotes/lote_0{n}.json" in html
assert "data/exportacion_v2.json" in html
for concept in ("requisitos","criterios_evaluacion","participantes","puntajes","estimulo_economico","dependencia_convocante"):
    assert concept in html
for text in ("TABLA ORIGINAL","Lista ORIGINAL","SINTÉTICO","Pendiente de extracción"):
    assert text in html, text
sets=[json.loads((root/"data"/"lotes"/f"lote_0{n}.json").read_text(encoding="utf-8")) for n in range(1,5)]
cases=[c for lote in sets for c in lote["casos"]]
assert len(cases)==43 and len({c["codigo"] for c in cases})==42
assert sum(len(c["celdas"]) for c in cases)==470
print(json.dumps({"resultado":"ok","script_js":"sintaxis_valida",
"convocatorias_distintas_en_fuente":42,"filas_de_excel":43,"celdas_excel":470,
"modelo_de_tablas_originales":"incluido","modelo_sinteticos_separados":"incluido"},ensure_ascii=False))
