#!/usr/bin/env python3
"""Una entrega ficticia no altera la cifra de actas del lote real."""
import json,sqlite3,sys,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'scripts'))
from construir_base_v3 import crear_base
from registrar_entrega_ia_v3 import registrar
manifest=json.loads((ROOT/'tests/fixtures/entrega_ia_v3_ejemplo.json').read_text(encoding='utf-8'))
with tempfile.TemporaryDirectory() as t:
 path=Path(t)/'base.sqlite';crear_base(path)
 con=sqlite3.connect(path)
 before={table:con.execute('SELECT count(*) FROM '+table).fetchone()[0] for table in ('v3_convocatoria','v3_fuente','v3_pdf_pagina','v3_entrega_ia')};con.close()
 report=registrar(path,manifest)
 assert report['convocatorias_recibidas']==1 and report['lecturas_registradas']==2
 con=sqlite3.connect(path)
 assert con.execute('SELECT count(*) FROM v3_convocatoria').fetchone()[0]==before['v3_convocatoria']+1
 assert con.execute('SELECT count(*) FROM v3_pdf_pagina').fetchone()[0]==before['v3_pdf_pagina']
 assert con.execute('SELECT convocatorias_validadas FROM v3_metrica_principal').fetchone()[0]==0
 assert con.execute('PRAGMA foreign_key_check').fetchall()==[]
 con.close()
 try: registrar(path,manifest)
 except ValueError: pass
 else: raise AssertionError('Se aceptó dos veces el manifiesto idéntico')
print(json.dumps({'resultado':'ok','actas_generadas':0,'validaciones':0},ensure_ascii=False))
