#!/usr/bin/env python3
"""Prueba de coherencia del visor portátil, sin dependencia de navegador.

Comprueba que TODO el contenido de los cuatro lotes siga dentro del HTML,
que no se confundan filas con convocatorias y que el script sea sintácticamente válido.
No reemplaza una prueba manual visual y funcional del navegador.
"""
from pathlib import Path
import json
import re
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
html = (ROOT / "visor.html").read_text(encoding="utf-8")
match = re.search(r'<script id="payload" type="application/json">([\s\S]*?)</script>', html)
assert match, "No se encontró el conjunto embebido"
payload = json.loads(match.group(1))
filas = payload["filas"]
assert len(filas) == 43, f"Se esperaban 43 filas, hay {len(filas)}"
assert len({r["codigo"] for r in filas}) == 42, "No coincide la cantidad de convocatorias distintas"
assert sum(len(r["documentos"]) for r in filas) == 16, "Se han perdido o añadido documentos"
assert sum(len(r["celdas"]) for r in filas) == 470
original = []
for lote in range(1,5):
    file = ROOT / "data" / "lotes" / f"lote_0{lote}.json"
    data = json.loads(file.read_text(encoding="utf-8"))
    original.extend([{**caso,"lote":lote} for caso in data["casos"]])
assert filas == original, "El visor no contiene exactamente el contenido de los 4 lotes"

ids = ["q","career","faculty","issuer","status","resultFilter","coverage",
       "reviewFilter","sort","searchPdf","cases","detail",
       "exportBtn","importBtn","importFile","themeBtn"]
for i in ids:
    assert f'id="{i}"' in html, f"Falta control {i}"

scripts = re.findall(r'<script>([\s\S]*?)</script>', html)
assert len(scripts)==1, "Debe haber exactamente un script de interfaz"
node = shutil.which("node")
if not node:
    print("No se encontró Node.js; no se ha validado la sintaxis JS.")
    sys.exit(2)
p = subprocess.run([node,"--check","-"],input=scripts[0],text=True,capture_output=True)
if p.returncode:
    print(p.stderr)
    raise AssertionError("JavaScript inválido")
print(json.dumps({"resultado":"ok","filas_excel":len(filas),
                  "convocatorias_distintas":42,"pdf_con_texto":16,
                  "celdas":470,"sintaxis_js":"válida",
                  "cotejo_visual":"pendiente"},ensure_ascii=False,indent=2))
