#!/usr/bin/env python3
"""Pruebas de control de IA. Todos los datos son inventados."""
import copy
import json
import sys
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/"scripts"))
from validar_entrega_ia_v3 import revisar,EntregaInvalida

conf=json.loads((ROOT/"config"/"contrato_ia_v3.json").read_text(encoding="utf-8"))
sample=json.loads((ROOT/"tests"/"fixtures"/"entrega_ia_v3_ejemplo.json").read_text(encoding="utf-8"))
assert revisar(sample,conf)["convocatorias_en_solicitud"]==1

def fails(value,previous=None):
    try:revisar(value,conf,previous)
    except EntregaInvalida:return
    raise AssertionError("Manifiesto inválido aceptado")

# Un mismo TEXTO en dos CELDAS es original distinto; no se deduplica.
assert sample["convocatorias"][0]["lecturas"][0]["literal"] == sample["convocatorias"][0]["lecturas"][1]["literal"]
assert sample["convocatorias"][0]["lecturas"][0]["ubicacion"] != sample["convocatorias"][0]["lecturas"][1]["ubicacion"]

duplicated=copy.deepcopy(sample)
duplicated["convocatorias"][0]["lecturas"].append(copy.deepcopy(duplicated["convocatorias"][0]["lecturas"][0]))
fails(duplicated)
fails(sample,[sample])  # no extraer de nuevo la misma región en otra interacción
too_many=copy.deepcopy(sample)
too_many["convocatorias"]=[]
for n in range(51):
    x=copy.deepcopy(sample["convocatorias"][0])
    x["numero"]=f"FICTICIA-{n:04d}"
    x["orden"]=n+1
    too_many["convocatorias"].append(x)
fails(too_many)
wrong_order=copy.deepcopy(sample)
wrong_order["convocatorias"][0]["orden"]=2
fails(wrong_order)
self_certified=copy.deepcopy(sample)
self_certified["convocatorias"][0]["estado_cierre"]="validada"
fails(self_certified)
no_excel=copy.deepcopy(sample)
no_excel["convocatorias"][0]["fuentes"]=[no_excel["convocatorias"][0]["fuentes"][1]]
fails(no_excel)
no_verified_results=copy.deepcopy(sample)
no_verified_results["convocatorias"][0]["consulta_resultados"]["estado"]="sin_pdf_verificado_al_corte"
fails(no_verified_results)
with_results=copy.deepcopy(sample)
with_results["convocatorias"][0]["consulta_resultados"]={
 "estado":"pdf_encontrado","url_sitio_consultado":"https://example.org/resultados",
 "fecha_consulta":"2026-11-13","alcance_y_metodo":"Búsqueda visual completa en publicación"}
fails(with_results)  # no hay URL de PDF resultados, solo sitio de publicación
with_results["convocatorias"][0]["fuentes"].append({
 "tipo":"resultados_pdf","url_original":"https://example.org/resultados.pdf",
 "version_fuente":"v1","estado":"pendiente"})
assert revisar(with_results,conf)["NO_equivale_a_validacion_documental"] is True
print(json.dumps({"resultado":"ok","maximo_convocatorias":50,
 "bloqueo_de_lectura_repetida":True,
 "preserva_texto_repetido_en_ubicaciones_distintas":True,
 "sin_certificacion_desde_manifiesto":True,
 "comprobacion_resultados_documentada":True},ensure_ascii=False))
