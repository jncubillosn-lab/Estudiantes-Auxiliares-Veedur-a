#!/usr/bin/env python3
"""Pruebas del modelo de vista: proyección sin pérdida de datos comparables."""
from __future__ import annotations
import copy
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from proyectar_visor_v3 import projection

source = {
    "version_contrato": "3.0",
    "norma_principal": "docs/NORMA-00-validacion-integral.md",
    "metricas": {"convocatorias_identificadas": 1, "convocatorias_validadas": 0},
    "advertencias": {"texto_pdf_historico_no_es_estructura_cotejada": True},
    "capturas_originales": [{"id": 1}],
    "convocatorias": [{
        "numero": "2026-C0000",
        "estado_validacion": "en_curso",
        "validada": False,
        "datos_originales": [{"rotulo_literal": "Perfil requerido", "literal_completo": "Texto de prueba", "fuente_id": 1}],
        "listas_originales": [{"titulo_literal": "Criterios", "items": [{"literal_completo": "Criterio A 40 %"}]}],
        "resultados_estructurados": [{"fila_original": 1, "valores": [{"encabezado_literal": "Puntaje", "valor_literal": "5"}]}],
        "indicadores_sinteticos": [{
            "nombre": "oferta.estimulo_mensual", "version_formula": "IA-normalizacion-1.0",
            "valor": {"valor_normalizado": {"tipo": "numero", "valor": 1500000}, "evidencias": [{"numero_pagina": 2, "cotejo_visual_integral": False}]},
        }],
        "control_validacion": {"puertas": [], "actas": [], "incidencias": [], "comprobaciones_resultados": []},
        "fuentes_originales": [{
            "fuente_id": 1, "tipo": "convocatoria_pdf",
            "url_original": "https://example.org/documento.pdf",
            "nombre_literal": "documento.pdf", "sha256_pdf_nativo": "hash",
            "paginas_cotejadas": 0,
            "filas_excel": [{"fila_original": 1, "celdas": [{"literal": "Ejemplo"}]}],
            "paginas_pdf_estructuradas": [{"numero_pagina": 1, "elementos_originales": [{"x0": 123.4}]}],
            "pdf_lectura_previa": {
                "estado": "texto_sin_cotejo",
                "datos_textuales_originales": {"paginas": [
                    {"numero_pagina": 1, "texto_original_orden_lectura_aproximado": "Documento de prueba", "lineas_con_posicion": [{"bbox": [1, 2, 3, 4]}]}
                ]},
            }
        }],
    }],
}
preserved = copy.deepcopy(source)
view = projection(source)
assert source == preserved, "La proyección mutó su fuente"
assert view["version_contrato"] == source["version_contrato"]
assert view["origen_integral"] == "data/expedientes_v3.json"
case = view["convocatorias"][0]
original = source["convocatorias"][0]
for name in ["numero", "estado_validacion", "validada", "datos_originales", "listas_originales", "resultados_estructurados", "indicadores_sinteticos", "control_validacion"]:
    assert case[name] == original[name], name
assert case["fuentes_originales"][0]["pdf_lectura_previa"]["datos_textuales_originales"]["paginas"][0]["texto_original_orden_lectura_aproximado"] == "Documento de prueba"
assert "paginas_pdf_estructuradas" not in case["fuentes_originales"][0]
assert "filas_excel" not in case["fuentes_originales"][0]
# La vista puede tener envoltorios más extensos en ejemplos pequeños.
# La reducción de peso se verifica sobre los 96 expedientes reales en el flujo de publicación.
assert all("elementos_originales" not in str(f) for f in case["fuentes_originales"])
try:
    projection({"version_contrato": "2.0", "convocatorias": []})
except ValueError:
    pass
else:
    raise AssertionError("Se aceptó un contrato incompatible")
print(json.dumps({"resultado": "ok", "proyeccion": "compatible V3", "originales": "preservados"}, ensure_ascii=False))
