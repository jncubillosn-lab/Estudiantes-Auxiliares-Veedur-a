#!/usr/bin/env python3
"""Proyecta una vista ligera del contrato V3 sin transformar hechos ni validar PDFs.

La exportación oficial expedientes_v3.json se conserva íntegra e independiente.
Este archivo subordinado solo elimina pesos de transporte que la interfaz no
utiliza (coordenadas, filas Excel duplicadas y árboles completos de páginas).
Nunca cambia valores originales, listas, resultados, evidencias ni métricas.
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path


def projection(doc: dict) -> dict:
    if doc.get("version_contrato") != "3.0" or not isinstance(doc.get("convocatorias"), list):
        raise ValueError("La entrada no es una exportación V3")
    view = {
        "version_contrato": doc["version_contrato"],
        "tipo": "vista_de_consulta_derivada_de_expedientes_v3",
        "norma_principal": doc.get("norma_principal"),
        "metricas": doc["metricas"],
        "advertencias": doc.get("advertencias", {}),
        "capturas_originales": doc.get("capturas_originales", []),
        "origen_integral": "data/expedientes_v3.json",
        "convocatorias": [],
    }
    for c in doc["convocatorias"]:
        case = {
            key: c[key]
            for key in (
                "numero", "estado_validacion", "validada", "datos_originales",
                "listas_originales", "resultados_estructurados",
                "indicadores_sinteticos", "control_validacion",
            )
        }
        case["fuentes_originales"] = []
        for source in c["fuentes_originales"]:
            f = {
                key: source.get(key)
                for key in (
                    "fuente_id", "tipo", "url_original", "nombre_literal",
                    "version_literal", "codigo_interno_literal", "resultado_acceso",
                    "sha256_pdf_nativo", "paginas_originales", "paginas_cotejadas",
                    "revisiones_cotejadas",
                )
            }
            # Las páginas preliminares permanecen legibles, sin falsas tablas.
            previous = source.get("pdf_lectura_previa")
            f["pdf_lectura_previa"] = None
            if isinstance(previous, dict):
                pages = previous.get("datos_textuales_originales", {}).get("paginas", [])
                f["pdf_lectura_previa"] = {
                    "estado": previous.get("estado"),
                    "nota": previous.get("nota"),
                    "datos_textuales_originales": {
                        "paginas": [
                            {
                                "numero_pagina": page.get("numero_pagina"),
                                "texto_original_orden_lectura_aproximado":
                                    page.get("texto_original_orden_lectura_aproximado")
                                    or page.get("texto_original_orden_pdf")
                                    or "",
                            }
                            for page in pages
                        ]
                    },
                }
            # No duplicar celdas ni geometría: siguen en expediente integral.
            case["fuentes_originales"].append(f)
        view["convocatorias"].append(case)

    if len(view["convocatorias"]) != doc["metricas"]["convocatorias_identificadas"]:
        raise ValueError("Discrepancia entre expedientes y métrica V3")
    if sum(c["validada"] for c in view["convocatorias"]) != doc["metricas"]["convocatorias_validadas"]:
        raise ValueError("Discrepancia en las validaciones V3")
    return view


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--entrada", type=Path, required=True)
    parser.add_argument("--salida", type=Path, required=True)
    args = parser.parse_args()
    if args.salida.exists():
        parser.error("La vista ya existe; no se sobrescribe")
    original = json.loads(args.entrada.read_text(encoding="utf-8"))
    result = projection(original)
    args.salida.parent.mkdir(parents=True, exist_ok=True)
    args.salida.write_text(json.dumps(result, ensure_ascii=False, separators=(",", ":")) + "\n", encoding="utf-8")
    print(json.dumps({
        "expedientes": len(result["convocatorias"]),
        "original_bytes": args.entrada.stat().st_size,
        "vista_bytes": args.salida.stat().st_size,
        "origen_integral": result["origen_integral"],
    }, ensure_ascii=False))


if __name__ == "__main__":
    main()
