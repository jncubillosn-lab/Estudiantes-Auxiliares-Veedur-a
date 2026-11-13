#!/usr/bin/env python3
"""Verificación de todos los documentos PDF sin interpretación de su contenido."""
import json,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'scripts'))
from construir_base_v3 import cargar_pdf_binarios,leer_payload,PAYLOAD
files=cargar_pdf_binarios()
assert len(files)==121
raw,doc=leer_payload(PAYLOAD)
observados=set()
for case in doc['datos_originales']:
 x=case['expediente'];pub=x['publicacion_pdf']
 ds=pub.get('documentos') or [pub['fuente']]
 res=x['resultados'];ds+=res.get('pdf_resultados') or ([res['pdf_resultados_contenido']['fuente']] if isinstance(res.get('pdf_resultados_contenido'),dict) else [])
 for d in ds:
  sha=d['sha256_binario']
  assert sha in files and len(files[sha])==d['tamano_bytes']
  observados.add(sha)
assert len(observados)==121 and observados==set(files)
print(json.dumps({'resultado':'ok','pdf_nativos_sha256_comprobados':121,'integridad_visual_certificada':False}))
