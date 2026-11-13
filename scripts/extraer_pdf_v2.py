#!/usr/bin/env python3
"""Extrae estructura PDF conservando original, imágenes de página, texto y geometría.

NO valida automáticamente ninguna tabla, requisito o evaluación.
Requiere: pip install pymupdf pdfplumber.
Uso: python scripts/extraer_pdf_v2.py archivo.pdf --numero 2026-C2381
     --tipo convocatoria_pdf --url https://drive.google.com/... --salida salidas/extracciones
"""
from __future__ import annotations
import argparse
import hashlib
import json
import shutil
import tempfile
from pathlib import Path
from datetime import datetime, timezone

try:
    import fitz
    import pdfplumber
except ImportError as exc:
    raise SystemExit("Faltan dependencias: pip install pymupdf pdfplumber") from exc


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def safe(obj):
    """Convertir solo metadatos de PyMuPDF; bytes de imagen se resumen mediante hash."""
    if isinstance(obj, bytes):
        return {"sha256": sha(obj), "bytes": len(obj)}
    if isinstance(obj, (str, int, float, bool)) or obj is None:
        return obj
    if isinstance(obj, dict):
        return {str(k): safe(v) for k, v in obj.items()}
    if isinstance(obj, (tuple, list, set)):
        return [safe(v) for v in obj]
    if hasattr(obj, "x0") and hasattr(obj, "y0") and hasattr(obj, "x1") and hasattr(obj, "y1"):
        return [float(obj.x0), float(obj.y0), float(obj.x1), float(obj.y1)]
    return str(obj)


def extract_tables(page):
    """Tabla provisional; conservar todas las posiciones, incluso celdas vacías/no detectadas."""
    table_list=[]
    try:
        tables=page.find_tables()
    except Exception as err:
        return [], [{"tipo": "fallo_deteccion_tablas", "detalle": str(err)}]
    for i, tab in enumerate(tables, 1):
        values=tab.extract()
        cells=[]
        for ri, row in enumerate(tab.rows):
            for ci, coords in enumerate(row.cells):
                content=values[ri][ci] if ri<len(values) and ci<len(values[ri]) else None
                cells.append({
                    "fila":ri,"columna":ci,
                    "bbox":safe(coords) if coords is not None else None,
                    "texto_literal":content,
                    "estado":"extraida_sin_cotejo" if coords is not None else "posicion_no_resuelta",
                    "combina_filas":None,"combina_columnas":None
                })
        table_list.append({
            "tabla_orden":i,"bbox":safe(tab.bbox),
            "filas_detectadas":len(tab.rows),
            "columnas_detectadas":max((len(row.cells) for row in tab.rows),default=0),
            "celdas":cells,"metodo":"pdfplumber.find_tables",
            "estado":"pendiente_cotejo_visual"
        })
    return table_list, []


def extraer(ruta: Path, numero: str, tipo: str, url: str | None, destino: Path, dpi: int=130) -> dict:
    source = ruta.read_bytes()
    digest=sha(source)
    objetivo=destino/digest
    if objetivo.exists():
        raise FileExistsError("No se sobrescriben extracciones anteriores: "+str(objetivo))
    destino.mkdir(parents=True,exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="veeduria-v2-",dir=destino) as temp:
        base=Path(temp)
        (base/"original.pdf").write_bytes(source)
        paginas=[]
        pdf=fitz.open(stream=source,filetype="pdf")
        try:
            with pdfplumber.open(str(base/"original.pdf")) as table_pdf:
                if len(pdf)!=len(table_pdf.pages):
                    raise RuntimeError("Diferencia de páginas entre extractores")
                for ix,page in enumerate(pdf):
                    n=ix+1
                    preview=page.get_pixmap(dpi=dpi,alpha=False)
                    img=preview.tobytes("png")
                    img_file=f"pagina_{n:04d}.png"
                    (base/img_file).write_bytes(img)
                    raw=page.get_text("rawdict",sort=False)
                    words=page.get_text("words",sort=False)
                    drawings=page.get_drawings()
                    annotations=[]
                    try:
                        for ann in (page.annots() or []):
                            annotations.append({
                                "tipo":safe(ann.type),"rect":safe(ann.rect),
                                "info":safe(ann.info),"flags":ann.flags,
                                "contenido":safe(ann.get_text("text"))
                            })
                    except Exception as err:
                        annotations.append({"error_de_lectura":str(err)})
                    widgets=[]
                    try:
                        for w in (page.widgets() or []):
                            widgets.append({
                                "nombre_literal":w.field_name,"valor_literal":w.field_value,
                                "tipo":w.field_type_string,"rect":safe(w.rect)
                            })
                    except Exception as err:
                        widgets.append({"error_de_lectura":str(err)})
                    imgs=[]
                    for image in page.get_images(full=True):
                        xref=image[0]
                        imgs.append({"xref":xref,"objeto":safe(image),"rectangulos":safe(page.get_image_rects(xref))})
                    tables,errors=extract_tables(table_pdf.pages[ix])
                    paginas.append({
                        "numero":n,"ancho_pt":float(page.rect.width),
                        "alto_pt":float(page.rect.height),
                        "rotacion":int(page.rotation),
                        "imagen":img_file,"imagen_sha256":sha(img),
                        "texto_respaldo":page.get_text("text",sort=False),
                        "bloques_y_caracteres":safe(raw),
                        "palabras_con_posicion":safe(words),
                        "vectores_y_trazos":safe(drawings),
                        "imagenes_incrustadas":imgs,
                        "anotaciones":annotations,
                        "campos_formulario":widgets,
                        "enlaces":safe(page.get_links()),
                        "tablas_candidatas":tables,
                        "incidencias":errors,
                        "estado":"extraido_pendiente_revision_visual"
                    })
        finally:
            pdf.close()
        manifest={
            "version":"2.0","numero_convocatoria_de_integracion":numero,
            "tipo_fuente":tipo,"url_fuente":url,
            "archivo_original":"original.pdf",
            "nombre_archivo_fuente_literal":ruta.name,
            "sha256_pdf_original":digest,"bytes_pdf_original":len(source),
            "fecha_captura":datetime.now(timezone.utc).isoformat(),
            "paginas":paginas,
            "estado_validacion":"pendiente_cotejo_visual",
            "nota_integridad":"Original binario y cada página rasterizada permanecen disponibles. Las tablas son candidatas: no se certifica su exactitud visual.",
            "comprobaciones":{"paginas_extraidas":len(paginas),
                              "paginas_con_raster":sum(bool(p["imagen"]) for p in paginas),
                              "tablas_candidatas":sum(len(p["tablas_candidatas"]) for p in paginas),
                              "celdas_candidatas":sum(len(t["celdas"]) for p in paginas for t in p["tablas_candidatas"]),
                              "incidencias":sum(len(p["incidencias"]) for p in paginas)}
        }
        (base/"manifest.json").write_text(json.dumps(manifest,ensure_ascii=False,indent=2),encoding="utf-8")
        # Verificar cada artefacto antes de la publicación atómica.
        assert sha((base/"original.pdf").read_bytes())==digest
        assert all(sha((base/p["imagen"]).read_bytes())==p["imagen_sha256"] for p in paginas)
        shutil.move(str(base),str(objetivo))
        return {"ruta":str(objetivo),"sha256":digest,"paginas":len(paginas),
                "tablas_candidatas":manifest["comprobaciones"]["tablas_candidatas"],
                "celdas_candidatas":manifest["comprobaciones"]["celdas_candidatas"],
                "validacion":"pendiente_cotejo_visual"}


if __name__=="__main__":
    p=argparse.ArgumentParser(description="Extraer estructura PDF sin modificar original")
    p.add_argument("pdf",type=Path)
    p.add_argument("--numero",required=True)
    p.add_argument("--tipo",choices=["convocatoria_pdf","resultados_pdf","adenda_pdf","anexo_pdf","otra"],required=True)
    p.add_argument("--url",default=None)
    p.add_argument("--salida",type=Path,default=Path("salidas/extracciones_v2"))
    p.add_argument("--dpi",type=int,default=130)
    args=p.parse_args()
    print(json.dumps(extraer(args.pdf,args.numero,args.tipo,args.url,args.salida,args.dpi),ensure_ascii=False,indent=2))
