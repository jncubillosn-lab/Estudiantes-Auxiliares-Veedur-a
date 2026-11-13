#!/usr/bin/env python3
"""Valida el MANIFIESTO de extracción que realiza la IA, no interpreta PDF.

Comprueba límites, orden, repetición de trabajo, cobertura DECLARADA y persistencia.
Una validación satisfactoria NO certifica equivalencia visual con el PDF.
"""
from __future__ import annotations
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CONFIG = ROOT / "config" / "operacion_ia.json"


class ControlDeLoteError(ValueError):
    pass


def exigir(condicion: bool, descripcion: str):
    if not condicion:
        raise ControlDeLoteError(descripcion)


def leer_json(ruta: Path) -> dict:
    dato = json.loads(ruta.read_text(encoding="utf-8"))
    exigir(isinstance(dato, dict), f"{ruta}: se esperaba un objeto JSON")
    return dato


def huellas_lectura(lote: dict) -> set[tuple[str, str, str]]:
    """La identidad es fuente + versión + posición, nunca solo texto."""
    halladas = set()
    for c in lote.get("convocatorias", []):
        for lectura in c.get("lecturas", []):
            if lectura.get("accion") == "extraer":
                halladas.add((lectura["fuente_id"], lectura["version"], lectura["ubicacion"]))
    return halladas


def validar_lote(lote: dict, config: dict, previos: list[dict] | None = None) -> dict:
    previos = previos or []
    maximo = config["limite_convocatorias_por_interaccion"]
    orden = config["orden_por_convocatoria"]
    exigir(lote.get("version") == "1.0", "Versión de manifiesto no admitida")
    exigir(lote.get("modo") == config["modo"], "Modo de trabajo distinto de extracción externa por IA")
    exigir(isinstance(lote.get("lote_id"), str) and bool(lote["lote_id"].strip()), "Falta lote_id")
    casos = lote.get("convocatorias")
    exigir(isinstance(casos, list) and 0 < len(casos) <= maximo,
           f"El lote debe tener entre 1 y {maximo} convocatorias distintas")
    numeros = [c.get("numero") for c in casos]
    exigir(all(isinstance(n, str) and n.strip() for n in numeros), "Hay convocatoria sin código")
    exigir(len(set(numeros)) == len(numeros), "Número de convocatoria duplicado dentro del lote")
    prev_identidades = set()
    for viejo in previos:
        prev_identidades.update(huellas_lectura(viejo))
    repetidas = 0
    lecturas_registradas = 0
    pendientes = 0
    for i, caso in enumerate(casos, start=1):
        numero = caso["numero"]
        exigir(caso.get("orden") == i, f"{numero}: orden de convocatoria incorrecto (se esperaba {i})")
        etapas = caso.get("etapas_completadas", [])
        exigir(isinstance(etapas, list) and etapas == orden[:len(etapas)],
               f"{numero}: etapas fuera del orden obligatorio o etapa omitida")
        fuentes = caso.get("fuentes", [])
        exigir(isinstance(fuentes, list) and fuentes, f"{numero}: falta inventario de fuentes")
        refs = [f.get("fuente_id") for f in fuentes]
        exigir(len(refs) == len(set(refs)) and all(refs),
               f"{numero}: inventario de fuentes con identificadores repetidos/vacíos")
        exigir(all(f.get("tipo") in ("excel", "convocatoria_pdf", "resultados_pdf", "adenda_pdf", "anexo_pdf", "otra")
                   and f.get("estado") in config["estados_fuente"]
                   and f.get("version") for f in fuentes),
               f"{numero}: fuente sin tipo, estado válido o versión")
        exigir(any(f["tipo"] == "excel" for f in fuentes), f"{numero}: falta referencia al registro Excel")
        hechas = set()
        for lectura in caso.get("lecturas", []):
            lecturas_registradas += 1
            accion = lectura.get("accion")
            exigir(accion in ("extraer", "cotejar", "reextraer_justificado"),
                   f"{numero}: acción de lectura no admitida")
            f_id = lectura.get("fuente_id")
            exigir(f_id in refs, f"{numero}: lectura sin fuente inventariada")
            version = lectura.get("version")
            ubicacion = lectura.get("ubicacion")
            exigir(isinstance(version, str) and version.strip() and
                   isinstance(ubicacion, str) and ubicacion.strip(),
                   f"{numero}: lectura sin versión o ubicación verificable")
            exigir(next(f["version"] for f in fuentes if f["fuente_id"] == f_id) == version,
                   f"{numero}: versión de lectura distinta de la fuente")
            identidad = (f_id, version, ubicacion)
            if accion == "extraer":
                exigir(identidad not in hechas and identidad not in prev_identidades,
                       f"{numero}: lectura de extracción repetida de {identidad}")
                hechas.add(identidad)
            elif accion == "reextraer_justificado":
                exigir(isinstance(lectura.get("motivo"), str) and lectura["motivo"].strip()
                       and isinstance(lectura.get("nueva_version_extraccion"), str)
                       and lectura["nueva_version_extraccion"].strip(),
                       f"{numero}: nueva extracción debe incluir motivo y versión")
                repetidas += 1
            # Una lectura de cotejo puede revisar la misma evidencia; no genera otro dato original.
        for control in caso.get("cobertura", []):
            exigir(control.get("fuente_id") in refs, f"{numero}: cobertura sin fuente inventariada")
            esperado = control.get("esperado")
            registrado = control.get("registrado")
            exigir((esperado is None or isinstance(esperado, int) and esperado >= 0) and
                   (registrado is None or isinstance(registrado, int) and registrado >= 0),
                   f"{numero}: cobertura con conteos negativos o inválidos")
            exigir(esperado is None or registrado is None or registrado <= esperado,
                   f"{numero}: hay más registros que elementos declarados ({control.get('metrica')})")
            exigir(control.get("metrica") in ("paginas", "tablas", "celdas", "listas", "items", "campos", "filas", "columnas"),
                   f"{numero}: métrica de cobertura desconocida")
        exigir(caso.get("cotejo") in config["estados_cotejo"],
               f"{numero}: estado de cotejo inválido")
        faltas = caso.get("pendientes")
        exigir(isinstance(faltas, list), f"{numero}: se requiere lista explícita de pendientes, aunque esté vacía")
        pendientes += len(faltas)
        pers = caso.get("persistencia", {})
        exigir(pers.get("estado") in config["estados_persistencia"],
               f"{numero}: estado de persistencia inválido")
        if "persistir" in etapas:
            exigir(pers.get("estado") == "confirmada" and
                   isinstance(pers.get("referencia"), str) and pers["referencia"].strip(),
                   f"{numero}: se marcó persistir sin confirmar referencia a los datos")
        if caso["cotejo"] == "cotejada":
            # IMPORTANTE: 'cotejada' en el manifiesto es declaración de lectura,
            # NO incrementa la métrica; SOLO un acta SQL v2 cuenta como validada.
            exigir("persistir" in etapas and pers.get("estado") == "confirmada",
                   f"{numero}: no cerrar sin integrar, verificar y persistir")
            exigir(not faltas, f"{numero}: expediente cotejado con pendientes")
            exigir(all(c.get("esperado") is not None and c.get("registrado") == c["esperado"]
                       for c in caso.get("cobertura", [])),
                   f"{numero}: expediente cotejado sin cobertura completa")
            exigir(bool(caso.get("cobertura")), f"{numero}: cotejo sin cobertura declarada")
            excel = [f for f in fuentes if f["tipo"] == "excel"]
            pdfconv = [f for f in fuentes if f["tipo"] == "convocatoria_pdf"]
            pdfres = [f for f in fuentes if f["tipo"] == "resultados_pdf"]
            exigir(bool(excel) and all(f["estado"] == "cotejada" for f in excel),
                   f"{numero}: Excel original no cotejado integralmente")
            exigir(bool(pdfconv) and all(f["estado"] == "cotejada" for f in pdfconv),
                   f"{numero}: PDF de convocatoria no cotejado integralmente")
            for pdf in pdfconv:
                url = pdf.get("url") or pdf.get("url_documento")
                exigir(isinstance(url, str) and url.startswith(("http://", "https://")),
                       f"{numero}: PDF convocatoria sin URL verificable guardada")
            for fuente in excel + pdfconv:
                tipos = {c["metrica"] for c in caso["cobertura"] if c["fuente_id"] == fuente["fuente_id"]}
                requerida = "celdas" if fuente["tipo"] == "excel" else "paginas"
                exigir(requerida in tipos, f"{numero}: falta cobertura {requerida} de {fuente['fuente_id']}")
            consulta = caso.get("verificacion_resultados")
            exigir(isinstance(consulta, dict), f"{numero}: falta verificación documentada de resultados")
            estado = consulta.get("estado")
            exigir(estado in ("pdf_disponible", "sin_pdf_verificado"),
                   f"{numero}: no se comprobó disponibilidad de PDF de resultados")
            exigir(isinstance(consulta.get("url_consulta"), str)
                   and consulta["url_consulta"].startswith(("http://", "https://"))
                   and len(str(consulta.get("fecha_consulta") or "")) >= 10
                   and len(str(consulta.get("alcance_consulta") or "")) >= 12,
                   f"{numero}: falta URL, fecha o alcance real de consulta de resultados")
            if estado == "pdf_disponible":
                exigir(bool(pdfres) and all(f["estado"] == "cotejada" for f in pdfres),
                       f"{numero}: PDF de resultados disponible pero no cotejado")
                for pdf in pdfres:
                    url = pdf.get("url") or pdf.get("url_documento")
                    exigir(isinstance(url, str) and url.startswith(("http://", "https://")),
                           f"{numero}: PDF resultados sin enlace verificable")
                    exigir(any(c["fuente_id"] == pdf["fuente_id"] and c["metrica"] == "paginas"
                               for c in caso["cobertura"]),
                           f"{numero}: sin cobertura total de páginas de resultados")
            else:
                exigir(not any(f["estado"] in ("localizada", "leida", "estructura_capturada", "cotejada")
                               for f in pdfres),
                       f"{numero}: no declarar ausencia si hay PDF resultados identificado")
            exigir(all(f["estado"] == "cotejada" for f in fuentes if f["tipo"] not in ("resultados_pdf",)),
                   f"{numero}: hay anexos o fuentes adicionales no cotejados")
    return {
        "estado_control": "consistente_con_manifesto",
        "aviso": "No certifica calidad visual ni totalidad del PDF sin cotejo independiente",
        "lote_id": lote["lote_id"],
        "convocatorias": len(casos),
        "lecturas_registradas": lecturas_registradas,
        "reextracciones_justificadas": repetidas,
        "pendientes_declarados": pendientes,
        "maximo_permitido": maximo,
        "convocatorias_validadas": "NO SE CALCULA POR MANIFIESTO; consultar v2_conteo_convocatorias_validadas en SQLite"
    }


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("manifiesto", type=Path)
    ap.add_argument("--anteriores", nargs="*", type=Path, default=[])
    args = ap.parse_args()
    try:
        resultado = validar_lote(leer_json(args.manifiesto), leer_json(CONFIG),
                                 [leer_json(p) for p in args.anteriores])
    except (ControlDeLoteError, ValueError, KeyError) as exc:
        ap.exit(1, "CONTROL DE LOTE NO SUPERADO: " + str(exc) + "\n")
    print(json.dumps(resultado, ensure_ascii=False, indent=2))
