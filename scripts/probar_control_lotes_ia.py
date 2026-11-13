#!/usr/bin/env python3
"""Pruebas del protocolo: repeticiones de texto válidas y lecturas redundantes inválidas."""
import copy
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from validar_lote_ia import validar_lote, ControlDeLoteError

config = json.loads((ROOT / "config" / "operacion_ia.json").read_text(encoding="utf-8"))
lote = json.loads((ROOT / "tests" / "fixtures" / "lote_ia_ejemplo.json").read_text(encoding="utf-8"))
assert validar_lote(lote, config)["convocatorias"] == 2

def rechaza(m, previos=None):
    try:
        validar_lote(m, config, previos)
    except ControlDeLoteError:
        return True
    raise AssertionError("Un lote inválido superó el control")

# 51 códigos distintos excede el límite; las filas duplicadas de un código
# deben aparecer bajo la misma convocatoria, no como expedientes repetidos.
mas = copy.deepcopy(lote)
mas["convocatorias"] = []
for n in range(51):
    case = copy.deepcopy(lote["convocatorias"][1])
    case["numero"] = f"TEST-{n:03d}"
    case["orden"] = n + 1
    # Solo necesitamos verificar el control de límite (antes del contenido).
    mas["convocatorias"].append(case)
rechaza(mas)

duplicado = copy.deepcopy(lote)
duplicado["convocatorias"][1]["numero"] = duplicado["convocatorias"][0]["numero"]
rechaza(duplicado)

desorden = copy.deepcopy(lote)
desorden["convocatorias"][0]["etapas_completadas"] = ["identificar_fuentes", "leer_resultados"]
rechaza(desorden)

# Dos ubicaciones que contienen el MISMO TEXTO son legítimas y se conservan.
assert lote["convocatorias"][0]["lecturas"][1]["texto_literal"] == lote["convocatorias"][0]["lecturas"][2]["texto_literal"]
assert lote["convocatorias"][0]["lecturas"][1]["ubicacion"] != lote["convocatorias"][0]["lecturas"][2]["ubicacion"]
assert validar_lote(lote, config)["estado_control"] == "consistente_con_manifesto"

# La misma evidencia no debe someterse dos veces a extracción.
releida = copy.deepcopy(lote)
releida["convocatorias"][0]["lecturas"].append(copy.deepcopy(releida["convocatorias"][0]["lecturas"][1]))
rechaza(releida)

# Tampoco repetir lecturas de una interacción previa.
anterior = {"convocatorias": [copy.deepcopy(lote["convocatorias"][0])]}
previo = copy.deepcopy(lote)
rechaza(previo, [anterior])

# El cotejo o la reextracción documentada son excepciones explícitas.
justificada = copy.deepcopy(lote)
nueva = copy.deepcopy(justificada["convocatorias"][0]["lecturas"][1])
nueva.update({"accion":"reextraer_justificado","motivo":"Alineación incorrecta de celda",
              "nueva_version_extraccion":"revision-2"})
justificada["convocatorias"][0]["lecturas"].append(nueva)
assert validar_lote(justificada, config)["reextracciones_justificadas"] == 1

sin_persistir = copy.deepcopy(lote)
sin_persistir["convocatorias"][0]["persistencia"]={"estado":"parcial"}
rechaza(sin_persistir)

sin_cobertura = copy.deepcopy(lote)
sin_cobertura["convocatorias"][0]["cobertura"][2]["registrado"] = 1
# Exigir igualdad solamente cuando se declara cotejo completo.
rechaza(sin_cobertura)

# Una convocatoria no se cierra si no se verificó la publicación de resultados.
sin_verificar = copy.deepcopy(lote)
sin_verificar["convocatorias"][0].pop("verificacion_resultados")
rechaza(sin_verificar)

# Un PDF de convocatoria sin URL original verificable bloquea el cierre.
sin_enlace_pdf = copy.deepcopy(lote)
for f in sin_enlace_pdf["convocatorias"][0]["fuentes"]:
    if f["tipo"] == "convocatoria_pdf":
        f.pop("url",None)
rechaza(sin_enlace_pdf)

# Si el PDF de resultados existe debe estar extraído/cotejado íntegramente.
resultados_parciales = copy.deepcopy(lote)
for f in resultados_parciales["convocatorias"][0]["fuentes"]:
    if f["tipo"] == "resultados_pdf":
        f["estado"] = "leida"
rechaza(resultados_parciales)

# Si la consulta realmente confirma que no hay PDF de resultados, puede
# cerrarse el cotejo sin inventar PDF ni URL, con evidencia de consulta.
ausencia_comprobada = copy.deepcopy(lote)
for f in ausencia_comprobada["convocatorias"][0]["fuentes"]:
    if f["tipo"] == "resultados_pdf":
        f["estado"] = "sin_enlace"
        f.pop("url",None)
ausencia_comprobada["convocatorias"][0]["verificacion_resultados"]["estado"] = "sin_pdf_verificado"
assert validar_lote(ausencia_comprobada, config)["estado_control"] == "consistente_con_manifesto"

# Una celda sin hipervínculo no basta: se requieren URL y alcance de
# la fuente consultada incluso cuando no se encontró un PDF.
ausencia_sin_evidencia = copy.deepcopy(ausencia_comprobada)
ausencia_sin_evidencia["convocatorias"][0]["verificacion_resultados"]["url_consulta"] = ""
rechaza(ausencia_sin_evidencia)

print(json.dumps({
    "resultado":"ok",
    "limite_convocatorias":config["limite_convocatorias_por_interaccion"],
    "repeticiones_originales_conservadas":True,
    "lecturas_duplicadas_bloqueadas":True,
    "orden_controlado":True,
    "persistencia_controlada":True,
    "ejemplo":"solo_datos_ficticios"
},ensure_ascii=False,indent=2))
