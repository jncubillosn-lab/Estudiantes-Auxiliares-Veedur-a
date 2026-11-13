#!/usr/bin/env python3
"""Construye SQLite v3 desde las CAPTURAS HISTÓRICAS LITERALES.

NO extrae PDF, no ejecuta OCR, no marca expedientes validados. Guarda la
captura completa de cada lote, cada celda Excel y cada transcripción/PDF URL.
Cualquier contenido que no se puede interpretar permanece en el JSON íntegro.
El fichero SQLite se crea de manera atómica y NO se sobrescribe.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import sqlite3
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCHEMA = ROOT / "db" / "estructura_v3.sql"
DEFAULT_FILES = [ROOT / "data" / "lotes" / f"lote_0{i}.json" for i in range(1, 5)]

CONCEPTOS = {
    "Convocatorias Abiertas": (
        "tipo_convocatoria", "facultad", "programa", "referencia_convocatoria",
        "estado", "titulo", "correo_responsable", "fecha_publicacion",
        "fecha_cierre", "numero_convocatoria",
    ),
    "Convocatorias Cerradas": (
        "tipo_convocatoria", "facultad", "programa", "referencia_convocatoria",
        "estado", "referencia_resultados", "titulo", "correo_responsable",
        "fecha_publicacion", "fecha_cierre", "numero_convocatoria",
    ),
}
TIPOS_PDF = {
    "convocatoria": "convocatoria_pdf",
    "resultados": "resultados_pdf",
    "adenda": "adenda_pdf",
    "anexo": "anexo_pdf",
}


def sha256(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def literal(value):
    if value is None or isinstance(value, str):
        return value
    if isinstance(value, (int, float, bool)):
        return json.dumps(value, ensure_ascii=False)
    return json.dumps(value, ensure_ascii=False, separators=(",", ":"))


def col_excel(index: int) -> str:
    chars = []
    while index:
        index, rem = divmod(index - 1, 26)
        chars.append(chr(65 + rem))
    return "".join(reversed(chars))


def insert_fuente(db, tipo, url, nombre, version, fecha, texto=None, codigo=None, metadata=None):
    if not isinstance(url, str) or not url.startswith(("https://", "http://")):
        raise ValueError(f"Fuente {tipo} sin URL real; no se inventa: {url!r}")
    return db.execute(
        """INSERT INTO v3_fuente
        (tipo,url_original,nombre_literal,codigo_interno_literal,version_literal,
         fecha_captura,resultado_acceso,texto_respaldo_literal,metadatos_json)
        VALUES(?,?,?,?,? ,?,'sin_comprobar',?,?)""",
        (tipo, url, nombre, codigo, version, fecha, texto,
         json.dumps(metadata, ensure_ascii=False, separators=(",", ":")) if metadata else None),
    ).lastrowid


def construir(db, lotes):
    db.executescript(SCHEMA.read_text(encoding="utf-8"))
    metricas = {
        "lotes_literales": 0, "filas_excel": 0, "celdas_excel": 0,
        "pdf_textuales": 0, "pdf_convocatoria": 0, "pdf_resultados": 0,
        "convocatorias": 0, "convocatorias_validadas": 0,
    }
    for path in lotes:
        raw = path.read_bytes()
        raw_text = raw.decode("utf-8")
        batch = json.loads(raw_text)
        lote = batch["lote"]
        corte = str(batch["fecha_extraccion"])
        fuente_excel = batch["fuente"]
        fuente_url = fuente_excel["url"]
        path_label = str(path.relative_to(ROOT)) if path.is_relative_to(ROOT) else str(path)
        captura = db.execute(
            """INSERT INTO v3_captura_lote
            (ruta_original,sha256_bytes,bytes_origen,contenido_literal_json,
             fuente_url,corte_literal,numero_lote,registrado_en)
            VALUES(?,?,?,?,?,?,?,?)""",
            (path_label, sha256(raw), len(raw), raw_text, fuente_url,
             corte, str(lote), corte),
        ).lastrowid
        excel = insert_fuente(
            db, "excel", fuente_url, fuente_excel.get("titulo"),
            f"captura:lote_{lote:02d}:{corte}", corte,
            metadata={"tipo_original": "captura_JSON_de_Excel", "captura_id": captura,
                      "no_es_archivo_nativo_de_Sheets": True},
        )
        vinculados_excel = set()
        for row in batch["casos"]:
            numero = row["codigo"]
            db.execute("INSERT OR IGNORE INTO v3_convocatoria(numero) VALUES(?)", (numero,))
            if numero not in vinculados_excel:
                db.execute(
                    "INSERT INTO v3_convocatoria_fuente(numero,fuente_id) VALUES(?,?)",
                    (numero, excel),
                )
                vinculados_excel.add(numero)
            cells = row["celdas"]
            headers = row["encabezados"]
            tab = row["pestana"]
            if len(cells) != len(headers) or len(cells) != len(CONCEPTOS.get(tab, ())):
                raise ValueError(f"{numero}: Excel incompleto, columnas desconocidas o encabezados ausentes")
            fid = db.execute(
                """INSERT INTO v3_excel_fila
                (numero,fuente_id,pestana_literal,fila_original,total_columnas_original)
                VALUES(?,?,?,?,?)""",
                (numero, excel, tab, row["numero_fila"], len(cells)),
            ).lastrowid
            for k, cell in enumerate(cells):
                visible = literal(cell.get("valor_visible"))
                cid = db.execute(
                    """INSERT INTO v3_excel_celda
                    (fila_id,columna_original,encabezado_literal,valor_visible_literal,
                    valor_entrada_literal,formula_literal,hipervinculo_literal,
                    nota_literal,formato_json) VALUES(?,?,?,?,?,?,?,?,?)""",
                    (fid, col_excel(k + 1), headers[k], visible,
                     json.dumps(cell.get("valor_original"), ensure_ascii=False),
                     literal(cell.get("formula")), literal(cell.get("hipervinculo")),
                     literal(cell.get("nota")),
                     json.dumps({"formato": cell.get("formato"),
                                 "texto_formato_tramos": cell.get("texto_formato_tramos")},
                                ensure_ascii=False)),
                ).lastrowid
                db.execute(
                    """INSERT INTO v3_dato_original
                    (numero,fuente_id,codigo_concepto,rotulo_literal,literal_completo,
                     orden_en_fuente,celda_excel_id)
                    VALUES(?,?,?,?,?,?,?)""",
                    (numero, excel, CONCEPTOS[tab][k], headers[k], visible, k+1, cid),
                )
                metricas["celdas_excel"] += 1
            metricas["filas_excel"] += 1

            # Los documentos históricos son solamente LECTURAS TEXTUALES.
            # Conservar su objeto JSON completo (páginas, campos, URL, códigos).
            # NO crear tablas/páginas PDF con estado de cotejo inventado.
            for position, doc in enumerate(row.get("documentos", []), 1):
                role = doc["rol"]
                tipo = TIPOS_PDF.get(role)
                if tipo is None:
                    raise ValueError(f"{numero}: tipo PDF desconocido {role!r}; revisar, no descartar")
                url = doc["url"]
                version = f"captura:lote_{lote:02d}:{tab}:{row['numero_fila']}:pdf_{position}"
                texto = doc.get("texto_extraido")
                source_id = insert_fuente(
                    db, tipo, url, doc.get("titulo"), version, corte,
                    texto=texto, codigo=doc.get("codigo_interno_literal"),
                    metadata={
                        "captura_id": captura, "rol_literal": role,
                        "drive_id_literal": doc.get("drive_id"),
                        "mime_literal": doc.get("mime"),
                        "lectura_exitosa_declarada": doc.get("lectura_exitosa"),
                        "paginas_de_texto_recuperadas": len(doc.get("paginas") or []),
                        "estado": "texto_sin_estructura_pdf_cotejada",
                    },
                )
                db.execute(
                    "INSERT INTO v3_convocatoria_fuente(numero,fuente_id) VALUES(?,?)",
                    (numero, source_id),
                )
                db.execute(
                    """INSERT INTO v3_lectura_pdf_previa
                    (fuente_id,captura_id,numero,registro_original_json,estado,nota_integridad)
                    VALUES(?,?,?,?,'texto_sin_cotejo',?)""",
                    (source_id, captura, numero,
                     json.dumps(doc, ensure_ascii=False, separators=(",", ":")),
                     "Fuente textual anterior, sin comprobación de tablas, celdas ni integridad visual"),
                )
                metricas["pdf_textuales"] += 1
                metricas["pdf_convocatoria"] += tipo == "convocatoria_pdf"
                metricas["pdf_resultados"] += tipo == "resultados_pdf"
        metricas["lotes_literales"] += 1

    for numero, in db.execute("SELECT numero FROM v3_convocatoria"):
        for expected, found in db.execute(
            """SELECT f.total_columnas_original,COUNT(c.celda_id)
            FROM v3_excel_fila f LEFT JOIN v3_excel_celda c ON c.fila_id=f.fila_id
            WHERE f.numero=? GROUP BY f.fila_id""", (numero,),
        ):
            if found != expected:
                raise ValueError(f"{numero}: fila incompleta en SQLite")
    metricas["convocatorias"] = db.execute("SELECT count(*) FROM v3_convocatoria").fetchone()[0]
    metricas["convocatorias_validadas"] = db.execute(
        "SELECT convocatorias_validadas FROM v3_metrica_principal").fetchone()[0]
    if db.execute("PRAGMA foreign_key_check").fetchall():
        raise ValueError("Existen claves foráneas huérfanas")
    if db.execute("PRAGMA integrity_check").fetchone()[0] != "ok":
        raise ValueError("Falló integrity_check")
    # Estos son invariantes del corte inicial, no límites universales del sistema.
    if len(lotes) == 4 and tuple(metricas[k] for k in
        ("convocatorias", "filas_excel", "celdas_excel",
         "pdf_textuales", "pdf_convocatoria", "pdf_resultados",
         "convocatorias_validadas")) != (42, 43, 470, 16, 7, 9, 0):
        raise ValueError("El corte histórico no coincide: revisar en vez de descartar fuentes")
    return metricas


def crear_base(salida: Path, lotes):
    if salida.exists():
        raise FileExistsError(f"Base existente: no se sobrescribe {salida}")
    salida.parent.mkdir(parents=True, exist_ok=True)
    fd, temporal = tempfile.mkstemp(prefix=".v3-", suffix=".sqlite", dir=salida.parent)
    os.close(fd)
    try:
        con = sqlite3.connect(temporal)
        try:
            con.execute("PRAGMA foreign_keys=ON")
            summary = construir(con, lotes)
            con.commit()
        except Exception:
            con.rollback()
            raise
        finally:
            con.close()
        os.replace(temporal, salida)
        return {"archivo": str(salida), **summary}
    finally:
        if os.path.exists(temporal):
            os.unlink(temporal)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Crear base V3 íntegra sin interpretar PDFs")
    parser.add_argument("--salida", type=Path, default=ROOT/"salidas"/"convocatorias_v3.sqlite")
    parser.add_argument("lotes", type=Path, nargs="*", help="JSON de captura en orden")
    args = parser.parse_args()
    print(json.dumps(crear_base(args.salida, args.lotes or DEFAULT_FILES),
                     ensure_ascii=False, indent=2))
