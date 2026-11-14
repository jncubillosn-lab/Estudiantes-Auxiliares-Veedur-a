#!/usr/bin/env python3
"""La carga de IA es íntegra como CAPTURA, aún no validada A-E."""
import hashlib, json, sqlite3, sys, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'scripts'))
from construir_base_v3 import crear_base, leer_payload, PAYLOAD, SHA256_ORIGINAL
raw,original=leer_payload(PAYLOAD)
assert hashlib.sha256(raw).hexdigest()==SHA256_ORIGINAL
with tempfile.TemporaryDirectory() as t:
    path=Path(t)/'base.sqlite';s=crear_base(path)
    assert tuple(s[k] for k in ('convocatorias','filas_excel','celdas_excel','pdf_convocatoria','pdf_resultados','paginas_pdf','convocatorias_validadas'))==(96,97,1031,97,24,397,0),s
    db=sqlite3.connect(path)
    for tab,expected in [('v3_convocatoria',96),('v3_excel_fila',97),('v3_excel_celda',1031),('v3_pdf_pagina',397),('v3_acta_validacion',0),('v3_entrega_ia',96),('v3_captura_lote',1)]:
        assert db.execute('SELECT COUNT(*) FROM '+tab).fetchone()[0]==expected,(tab,expected)
    assert db.execute("SELECT COUNT(*) FROM v3_excel_fila WHERE numero='2026-C2324'").fetchone()[0]==2
    assert db.execute('SELECT COUNT(*) FROM v3_pdf_pagina WHERE cotejo_visual="completo"').fetchone()[0]==0
    assert db.execute('SELECT COUNT(*) FROM v3_fuente WHERE binario_original IS NOT NULL').fetchone()[0]==121
    assert db.execute('SELECT COUNT(*) FROM v3_indicador_sintetico').fetchone()[0]==3155
    assert db.execute('SELECT COUNT(*) FROM v3_indicador_insumo').fetchone()[0]>=3155
    assert db.execute("SELECT COUNT(*) FROM v3_indicador_sintetico WHERE numero='2026-C2297' AND nombre='perfil.avance_plan_estudios'").fetchone()[0]==1
    assert db.execute("SELECT COUNT(DISTINCT numero) FROM v3_indicador_sintetico WHERE version_formula='IA-normalizacion-2.0'").fetchone()[0]==96
    assert db.execute("SELECT COUNT(*) FROM v3_indicador_sintetico WHERE nombre LIKE 'oferta.estimulo_mensual%'").fetchone()[0]==96
    assert db.execute("SELECT COUNT(*) FROM v3_indicador_sintetico WHERE nombre LIKE 'evaluacion.criterio_1%'").fetchone()[0]>=90
    assert db.execute("SELECT COUNT(*) FROM v3_indicador_sintetico WHERE nombre='cotejo.variacion_fecha_cierre_entre_fuentes'").fetchone()[0]==3
    assert db.execute("SELECT COUNT(*) FROM v3_indicador_sintetico WHERE nombre='resultados.estructura_tabla_documental'").fetchone()[0]==24
    assert db.execute("SELECT COUNT(*) FROM v3_indicador_sintetico WHERE version_formula='IA-normalizacion-1.0'").fetchone()[0]==0
    assert db.execute("SELECT COUNT(*) FROM v3_indicador_sintetico WHERE json_extract(valor_json,'$.valor_normalizado.operador')='no_explicito'").fetchone()[0]==11
    assert db.execute('SELECT COUNT(*) FROM v3_acta_validacion').fetchone()[0]==0
    assert db.execute('SELECT COUNT(*) FROM v3_incidencia').fetchone()[0]>=40
    assert db.execute('SELECT COUNT(*) FROM v3_pdf_tabla').fetchone()[0]==0
    assert db.execute('SELECT COUNT(*) FROM v3_resultado_fila').fetchone()[0]==0
    assert db.execute('SELECT COUNT(*) FROM v3_entrega_ia WHERE estado_importacion="pendiente_cotejo"').fetchone()[0]==96
    b=db.execute('SELECT contenido_literal_json FROM v3_captura_lote').fetchone()[0].encode()
    assert b==raw
    assert s['facetas_semanticas']==3155 and s['expedientes_normalizados']==96
    assert s['facetas_ambiguas']==11 and s['pendientes_semanticos']==64
    assert set(json.loads(b)['datos_originales'][i]['expediente']['numero'] for i in range(96)) == set(x[0] for x in db.execute('SELECT numero FROM v3_convocatoria'))
    assert db.execute('PRAGMA foreign_key_check').fetchall()==[]
    assert db.execute('PRAGMA integrity_check').fetchone()[0]=='ok'
    db.close()
    try: crear_base(path)
    except FileExistsError: pass
    else: raise AssertionError('Se permitió sobrescribir la base')
print(json.dumps({'resultado':'ok','lote':'IA-2026-11-13-96','metricas':s,'cotejo_visual_completo':0,'actas_A_E':0},ensure_ascii=False))
