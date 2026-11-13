#!/usr/bin/env python3
"""Integridad del comparador Pages contra sus 4 lotes originales.

Comprueba que la proyección publicada contiene todas las celdas, textos PDF,
encabezados y metadatos exactamente, sin pretender que los PDF ya están cotejados.
"""
from pathlib import Path
import json
import re
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
html = (ROOT/"comparador-v2.html").read_text(encoding="utf-8")
scripts = re.findall(r"<script>([\s\S]*?)</script>", html)
assert len(scripts)==1, "Se esperaba un único script principal"
node=shutil.which("node")
assert node, "Se requiere Node.js para validar la sintaxis JavaScript"
p=subprocess.run([node,"--check","-"],input=scripts[0],capture_output=True,text=True)
assert p.returncode==0,p.stderr
assert 'data/exportacion_v2.json' in html
for keyword in ("documentos_lectura_previa","tablas_originales","listas_originales","SINTÉTICO",
                "no se inventan requisitos","fuentes","original","Excel"):
    assert keyword in html, keyword

publication=json.loads((ROOT/"data"/"exportacion_v2.json").read_text(encoding="utf-8"))
srcs=[json.loads((ROOT/"data"/"lotes"/f"lote_0{n}.json").read_text(encoding="utf-8")) for n in range(1,5)]
originals=[(batch["lote"],case) for batch in srcs for case in batch["casos"]]
groups={x["numero"]:x for x in publication["convocatorias"]}
assert len(groups)==42 and len(originals)==43
assert sum(len(x["filas_excel"]) for x in groups.values())==43
assert sum(len(x["campos_originales"]) for x in groups.values())==470
assert sum(len(x["documentos_lectura_previa"]) for x in groups.values())==16
for batch_no,original in originals:
    enriched={**original,"lote":batch_no,"corte":"2026-11-13"}
    group=groups[original["codigo"]]
    assert enriched in group["filas_excel"], original["codigo"]
    for j,cell in enumerate(original["celdas"]):
        v=next((x for x in group["campos_originales"]
                if x["pestana"]==original["pestana"]
                and x["fila_excel"]==original["numero_fila"]
                and x["columna_excel"]==chr(65+j)
                and x["fuente_id"]==f"excel:lote_{batch_no:02d}"),None)
        assert v, (original["codigo"],j)
        assert v["valor_literal"]==cell["valor_visible"], (original["codigo"],j)
        assert v["rotulo_literal"]==original["encabezados"][j], (original["codigo"],j)
    for doc in original["documentos"]:
        matching=[d for d in group["documentos_lectura_previa"]
                  if d["drive_id"]==doc["drive_id"] and d["rol"]==doc["rol"]]
        assert len(matching)==1, (original["codigo"],doc.get("drive_id"))
        for key in ("texto_extraido","url","titulo","mime","paginas","campos_detectados","codigo_interno_literal"):
            assert matching[0].get(key)==doc.get(key), (original["codigo"],key)
        assert matching[0]["es_pdf_estructurado"] is False
assert sum(len(g["tablas_originales"]) for g in groups.values())==0,"No se ha cotejado ninguna tabla PDF"
print(json.dumps({"resultado":"ok","codigo_convocatorias":len(groups),
    "filas_originales":len(originals),"celdas_literales":470,"pdf_textos_sin_cotejo":16,
    "javascript":"sintaxis_valida","tablas_pdf_verificadas":0},ensure_ascii=False))
