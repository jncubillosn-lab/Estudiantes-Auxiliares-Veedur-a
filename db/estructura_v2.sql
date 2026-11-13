-- Arquitectura v2: ADITIVA. No altera tablas, PDFs, lotes ni visor v1.
-- Las tablas *original* son append-only: las correcciones se registran como nuevas versiones.
PRAGMA foreign_keys=ON;

CREATE TABLE IF NOT EXISTS v2_convocatoria (
 numero TEXT PRIMARY KEY NOT NULL,
 creado_en TEXT NOT NULL DEFAULT (datetime('now')),
 nota_integracion TEXT
);
CREATE TABLE IF NOT EXISTS v2_fuente_original (
 fuente_id INTEGER PRIMARY KEY,
 clase TEXT NOT NULL CHECK(clase IN ('excel','convocatoria_pdf','resultados_pdf','adenda_pdf','anexo_pdf','otra')),
 uri_original TEXT,
 nombre_literal TEXT,
 mime_literal TEXT,
 hash_sha256 TEXT,
 bytes_originales INTEGER,
 contenido_binario BLOB,
 contenido_textual_original TEXT,
 capturada_en TEXT NOT NULL DEFAULT (datetime('now')),
 estado_binario TEXT NOT NULL DEFAULT 'pendiente'
 CHECK(estado_binario IN ('pendiente','binario_capturado','acceso_fallido','no_aplica')),
 metadatos_originales_json TEXT,
 CHECK(contenido_binario IS NULL OR (hash_sha256 IS NOT NULL AND bytes_originales = length(contenido_binario)))
);
CREATE TABLE IF NOT EXISTS v2_vinculo_convocatoria_fuente (
 vinculo_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v2_convocatoria(numero),
 fuente_id INTEGER NOT NULL REFERENCES v2_fuente_original(fuente_id),
 rol_literal TEXT NOT NULL,
 codigo_observado_literal TEXT,
 fuente_del_codigo_literal TEXT,
 correspondencia TEXT NOT NULL DEFAULT 'sin_cotejo'
 CHECK(correspondencia IN ('sin_cotejo','confirmada','discrepante','pendiente')),
 observacion TEXT,
 UNIQUE(numero,fuente_id,rol_literal)
);
CREATE TABLE IF NOT EXISTS v2_excel_celda_original (
 celda_id INTEGER PRIMARY KEY,
 fuente_id INTEGER NOT NULL REFERENCES v2_fuente_original(fuente_id),
 numero TEXT NOT NULL REFERENCES v2_convocatoria(numero),
 pestana_literal TEXT NOT NULL,
 numero_fila INTEGER NOT NULL,
 letra_columna TEXT NOT NULL,
 encabezado_literal TEXT,
 valor_visible_literal TEXT,
 valor_entrada_literal TEXT,
 formula_literal TEXT,
 hipervinculo_literal TEXT,
 nota_literal TEXT,
 formato_original_json TEXT,
 capturada_en TEXT,
 UNIQUE(fuente_id,pestana_literal,numero_fila,letra_columna)
);
CREATE TABLE IF NOT EXISTS v2_corrida_extraccion (
 corrida_id INTEGER PRIMARY KEY,
 fuente_id INTEGER NOT NULL REFERENCES v2_fuente_original(fuente_id),
 herramienta TEXT NOT NULL,
 version_herramienta TEXT,
 iniciado_en TEXT NOT NULL DEFAULT (datetime('now')),
 estado TEXT NOT NULL DEFAULT 'en_proceso',
 reporte_json TEXT,
 CHECK(estado IN ('en_proceso','elementos_extraidos','parcial','fallo'))
);
CREATE TABLE IF NOT EXISTS v2_pagina_original (
 pagina_id INTEGER PRIMARY KEY,
 corrida_id INTEGER NOT NULL REFERENCES v2_corrida_extraccion(corrida_id),
 pagina_numero INTEGER NOT NULL CHECK(pagina_numero >= 1),
 ancho_pt REAL NOT NULL CHECK(ancho_pt > 0),
 alto_pt REAL NOT NULL CHECK(alto_pt > 0),
 rotacion_grados INTEGER NOT NULL DEFAULT 0,
 texto_plano_respaldo TEXT,
 imagen_png BLOB,
 imagen_sha256 TEXT,
 estado_cobertura TEXT NOT NULL DEFAULT 'pendiente',
 CHECK(estado_cobertura IN ('pendiente','extraccion_parcial','elementos_extraidos','cotejado')),
 UNIQUE(corrida_id,pagina_numero)
);
CREATE TABLE IF NOT EXISTS v2_elemento_original (
 elemento_id INTEGER PRIMARY KEY,
 pagina_id INTEGER NOT NULL REFERENCES v2_pagina_original(pagina_id),
 orden_lectura INTEGER,
 tipo TEXT NOT NULL CHECK(tipo IN ('texto','imagen','trazo','vector','anotacion','casilla','firma','marca','desconocido','otro')),
 texto_literal TEXT,
 x0 REAL, y0 REAL, x1 REAL, y1 REAL,
 atributos_originales_json TEXT,
 estado_lectura TEXT NOT NULL DEFAULT 'observado',
 CHECK(estado_lectura IN ('observado','indescifrable','pendiente','extraido')),
 CHECK(x0 IS NULL OR x1 IS NULL OR x0 <= x1),
 CHECK(y0 IS NULL OR y1 IS NULL OR y0 <= y1)
);
CREATE TABLE IF NOT EXISTS v2_tabla_original (
 tabla_id INTEGER PRIMARY KEY,
 pagina_id INTEGER NOT NULL REFERENCES v2_pagina_original(pagina_id),
 orden_tabla INTEGER NOT NULL,
 x0 REAL,y0 REAL,x1 REAL,y1 REAL,
 filas_detectadas INTEGER CHECK(filas_detectadas >= 0),
 columnas_detectadas INTEGER CHECK(columnas_detectadas >= 0),
 metodo_deteccion TEXT NOT NULL,
 estado_revision TEXT NOT NULL DEFAULT 'pendiente',
 nota TEXT,
 UNIQUE(pagina_id,orden_tabla)
);
CREATE TABLE IF NOT EXISTS v2_celda_tabla_original (
 celda_id INTEGER PRIMARY KEY,
 tabla_id INTEGER NOT NULL REFERENCES v2_tabla_original(tabla_id),
 fila INTEGER NOT NULL CHECK(fila >= 0),
 columna INTEGER NOT NULL CHECK(columna >= 0),
 combina_filas INTEGER CHECK(combina_filas IS NULL OR combina_filas >= 1),
 combina_columnas INTEGER CHECK(combina_columnas IS NULL OR combina_columnas >= 1),
 x0 REAL,y0 REAL,x1 REAL,y1 REAL,
 texto_literal TEXT,
 estado_lectura TEXT NOT NULL DEFAULT 'pendiente',
 atributos_originales_json TEXT,
 CHECK(estado_lectura IN ('pendiente','extraida','vacia_original','ilegible','sin_deteccion')), 
 UNIQUE(tabla_id,fila,columna)
);
CREATE TABLE IF NOT EXISTS v2_celda_elemento (
 celda_id INTEGER NOT NULL REFERENCES v2_celda_tabla_original(celda_id),
 elemento_id INTEGER NOT NULL REFERENCES v2_elemento_original(elemento_id),
 PRIMARY KEY(celda_id,elemento_id)
);
CREATE TABLE IF NOT EXISTS v2_campo_original (
 campo_id INTEGER PRIMARY KEY,
 fuente_id INTEGER NOT NULL REFERENCES v2_fuente_original(fuente_id),
 numero TEXT NOT NULL REFERENCES v2_convocatoria(numero),
 pagina_id INTEGER REFERENCES v2_pagina_original(pagina_id),
 celda_pdf_id INTEGER REFERENCES v2_celda_tabla_original(celda_id),
 celda_excel_id INTEGER REFERENCES v2_excel_celda_original(celda_id),
 codigo_semantico TEXT,
 rotulo_literal TEXT,
 valor_literal TEXT,
 orden_en_fuente INTEGER,
 ocurrencia INTEGER NOT NULL DEFAULT 1,
 estado_lectura TEXT NOT NULL DEFAULT 'pendiente',
 NOTA TEXT,
 CHECK(estado_lectura IN ('pendiente','extraido','ambiguo','ilegible','cotejado'))
);
CREATE TABLE IF NOT EXISTS v2_lista_original (
 lista_id INTEGER PRIMARY KEY,
 campo_id INTEGER NOT NULL REFERENCES v2_campo_original(campo_id),
 nombre_literal TEXT,
 clase_propuesta TEXT,
 texto_original_integral TEXT,
 estado_lectura TEXT NOT NULL DEFAULT 'pendiente'
);
CREATE TABLE IF NOT EXISTS v2_item_lista_original (
 item_id INTEGER PRIMARY KEY,
 lista_id INTEGER NOT NULL REFERENCES v2_lista_original(lista_id),
 orden INTEGER NOT NULL,
 literal_completo TEXT NOT NULL,
 pagina_id INTEGER REFERENCES v2_pagina_original(pagina_id),
 celda_pdf_id INTEGER REFERENCES v2_celda_tabla_original(celda_id),
 padre_item_id INTEGER REFERENCES v2_item_lista_original(item_id),
 comentario_literal TEXT,
 UNIQUE(lista_id,orden)
);
CREATE TABLE IF NOT EXISTS v2_resultado_fila_original (
 resultado_fila_id INTEGER PRIMARY KEY,
 tabla_id INTEGER NOT NULL REFERENCES v2_tabla_original(tabla_id),
 fila_indice INTEGER NOT NULL,
 identificacion_literal TEXT,
 nombre_literal TEXT,
 estado_literal TEXT,
 notas_literal TEXT,
 estado_asociacion TEXT NOT NULL DEFAULT 'sin_cotejo',
 UNIQUE(tabla_id,fila_indice)
);
CREATE TABLE IF NOT EXISTS v2_resultado_columna_original (
 resultado_celda_id INTEGER PRIMARY KEY,
 resultado_fila_id INTEGER NOT NULL REFERENCES v2_resultado_fila_original(resultado_fila_id),
 celda_pdf_id INTEGER NOT NULL REFERENCES v2_celda_tabla_original(celda_id),
 rotulo_columna_literal TEXT,
 valor_literal TEXT,
 nota_literal TEXT,
 UNIQUE(resultado_fila_id,celda_pdf_id)
);
CREATE TABLE IF NOT EXISTS v2_revision (
 revision_id INTEGER PRIMARY KEY,
 fuente_id INTEGER NOT NULL REFERENCES v2_fuente_original(fuente_id),
 corrida_id INTEGER REFERENCES v2_corrida_extraccion(corrida_id),
 pagina_id INTEGER REFERENCES v2_pagina_original(pagina_id),
 tabla_id INTEGER REFERENCES v2_tabla_original(tabla_id),
 estado TEXT NOT NULL CHECK(estado IN ('pendiente','cotejo_parcial','cotejado','no_resuelto')),
 observacion TEXT,
 evidencia_literal TEXT,
 responsable TEXT,
 fecha TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE TABLE IF NOT EXISTS v2_indicador_sintetico (
 indicador_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v2_convocatoria(numero),
 nombre TEXT NOT NULL,
 tipo_valor TEXT NOT NULL,
 valor_json TEXT NOT NULL,
 regla TEXT NOT NULL,
 version_regla TEXT NOT NULL,
 calculado_en TEXT NOT NULL DEFAULT (datetime('now')),
 estado TEXT NOT NULL DEFAULT 'provisional',
 CHECK(estado IN ('provisional','recalculado','cotejado','obsoleto'))
);
CREATE TABLE IF NOT EXISTS v2_indicador_insumo (
 indicador_id INTEGER NOT NULL REFERENCES v2_indicador_sintetico(indicador_id),
 campo_original_id INTEGER REFERENCES v2_campo_original(campo_id),
 item_original_id INTEGER REFERENCES v2_item_lista_original(item_id),
 celda_pdf_original_id INTEGER REFERENCES v2_celda_tabla_original(celda_id),
 celda_excel_original_id INTEGER REFERENCES v2_excel_celda_original(celda_id),
 PRIMARY KEY(indicador_id,campo_original_id,item_original_id,celda_pdf_original_id,celda_excel_original_id),
 CHECK(campo_original_id IS NOT NULL OR item_original_id IS NOT NULL OR celda_pdf_original_id IS NOT NULL OR celda_excel_original_id IS NOT NULL)
);
CREATE TABLE IF NOT EXISTS v2_nota_veeduria (
 nota_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v2_convocatoria(numero),
 fuente_id INTEGER REFERENCES v2_fuente_original(fuente_id),
 campo_id INTEGER REFERENCES v2_campo_original(campo_id),
 elemento_id INTEGER REFERENCES v2_elemento_original(elemento_id),
 texto TEXT NOT NULL,
 autor TEXT,
 creada_en TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_v2_fuentes_convocatoria ON v2_vinculo_convocatoria_fuente(numero,rol_literal);
CREATE INDEX IF NOT EXISTS idx_v2_excel_celdas ON v2_excel_celda_original(fuente_id,pestana_literal,numero_fila);
CREATE INDEX IF NOT EXISTS idx_v2_elementos_pagina ON v2_elemento_original(pagina_id,orden_lectura);
CREATE INDEX IF NOT EXISTS idx_v2_tablas_pagina ON v2_tabla_original(pagina_id,orden_tabla);
CREATE INDEX IF NOT EXISTS idx_v2_celdas_tabla ON v2_celda_tabla_original(tabla_id,fila,columna);
CREATE INDEX IF NOT EXISTS idx_v2_campos ON v2_campo_original(numero,fuente_id,codigo_semantico);
CREATE INDEX IF NOT EXISTS idx_v2_listas ON v2_item_lista_original(lista_id,orden);
CREATE INDEX IF NOT EXISTS idx_v2_resultados ON v2_resultado_fila_original(tabla_id,fila_indice);
CREATE INDEX IF NOT EXISTS idx_v2_indicadores ON v2_indicador_sintetico(numero,nombre);

CREATE VIEW IF NOT EXISTS v2_matriz_campos_originales AS
 SELECT v.numero, f.clase AS tipo_fuente, f.fuente_id,
        x.codigo_semantico, x.rotulo_literal,x.valor_literal,
        x.campo_id,x.pagina_id,x.celda_pdf_id,x.celda_excel_id,
        x.estado_lectura
 FROM v2_vinculo_convocatoria_fuente v
 JOIN v2_fuente_original f ON f.fuente_id=v.fuente_id
 JOIN v2_campo_original x ON x.fuente_id=f.fuente_id AND x.numero=v.numero;
CREATE VIEW IF NOT EXISTS v2_cobertura_documental AS
 SELECT c.numero,
  (SELECT COUNT(*) FROM v2_vinculo_convocatoria_fuente v WHERE v.numero=c.numero AND v.rol_literal='excel') AS fuentes_excel,
  (SELECT COUNT(*) FROM v2_vinculo_convocatoria_fuente v WHERE v.numero=c.numero AND v.rol_literal='convocatoria_pdf') AS pdf_convocatoria,
  (SELECT COUNT(*) FROM v2_vinculo_convocatoria_fuente v WHERE v.numero=c.numero AND v.rol_literal='resultados_pdf') AS pdf_resultados
 FROM v2_convocatoria c;

-- Bloquear alteraciones posteriores de la evidencia original, no de los derivados.
-- Las correcciones se incorporan como nueva fuente/corrida/versión.
CREATE TRIGGER IF NOT EXISTS trg_v2_fuente_no_update BEFORE UPDATE ON v2_fuente_original BEGIN SELECT RAISE(ABORT,'Fuente original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_fuente_no_delete BEFORE DELETE ON v2_fuente_original BEGIN SELECT RAISE(ABORT,'Fuente original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_excel_no_update BEFORE UPDATE ON v2_excel_celda_original BEGIN SELECT RAISE(ABORT,'Celda Excel original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_excel_no_delete BEFORE DELETE ON v2_excel_celda_original BEGIN SELECT RAISE(ABORT,'Celda Excel original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_pagina_no_update BEFORE UPDATE ON v2_pagina_original BEGIN SELECT RAISE(ABORT,'Página original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_pagina_no_delete BEFORE DELETE ON v2_pagina_original BEGIN SELECT RAISE(ABORT,'Página original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_elemento_no_update BEFORE UPDATE ON v2_elemento_original BEGIN SELECT RAISE(ABORT,'Elemento original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_elemento_no_delete BEFORE DELETE ON v2_elemento_original BEGIN SELECT RAISE(ABORT,'Elemento original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_tabla_no_update BEFORE UPDATE ON v2_tabla_original BEGIN SELECT RAISE(ABORT,'Tabla original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_tabla_no_delete BEFORE DELETE ON v2_tabla_original BEGIN SELECT RAISE(ABORT,'Tabla original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_celda_no_update BEFORE UPDATE ON v2_celda_tabla_original BEGIN SELECT RAISE(ABORT,'Celda PDF original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_celda_no_delete BEFORE DELETE ON v2_celda_tabla_original BEGIN SELECT RAISE(ABORT,'Celda PDF original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_campo_no_update BEFORE UPDATE ON v2_campo_original BEGIN SELECT RAISE(ABORT,'Campo original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_campo_no_delete BEFORE DELETE ON v2_campo_original BEGIN SELECT RAISE(ABORT,'Campo original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_lista_no_update BEFORE UPDATE ON v2_lista_original BEGIN SELECT RAISE(ABORT,'Lista original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_lista_no_delete BEFORE DELETE ON v2_lista_original BEGIN SELECT RAISE(ABORT,'Lista original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_item_no_update BEFORE UPDATE ON v2_item_lista_original BEGIN SELECT RAISE(ABORT,'Ítem original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_item_no_delete BEFORE DELETE ON v2_item_lista_original BEGIN SELECT RAISE(ABORT,'Ítem original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_resultado_no_update BEFORE UPDATE ON v2_resultado_fila_original BEGIN SELECT RAISE(ABORT,'Fila de resultados original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_resultado_no_delete BEFORE DELETE ON v2_resultado_fila_original BEGIN SELECT RAISE(ABORT,'Fila de resultados original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_puntaje_no_update BEFORE UPDATE ON v2_resultado_columna_original BEGIN SELECT RAISE(ABORT,'Columna de resultados original inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_puntaje_no_delete BEFORE DELETE ON v2_resultado_columna_original BEGIN SELECT RAISE(ABORT,'Columna de resultados original inmutable'); END;


-- NORMA 04: CONTROL FINAL. Estas tablas son actas de verificación, nunca fuentes.
-- Si no existen las tres comprobaciones, NO existe una convocatoria validada.
-- La existencia de código, texto PDF, URL o inventario no crea un acta.
CREATE TABLE IF NOT EXISTS v2_control_validacion_fuente (
 control_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v2_convocatoria(numero),
 rol TEXT NOT NULL CHECK(rol IN ('excel','convocatoria_pdf','resultados_pdf')),
 fuente_id INTEGER REFERENCES v2_fuente_original(fuente_id),
 estado TEXT NOT NULL CHECK(estado IN ('cotejada','sin_pdf_verificado')),
 url_documento TEXT,
 url_verificacion TEXT NOT NULL CHECK(length(trim(url_verificacion)) > 10 AND (url_verificacion LIKE 'https://%' OR url_verificacion LIKE 'http://%')),
 fecha_consulta TEXT NOT NULL CHECK(length(trim(fecha_consulta)) >= 10),
 alcance_consulta TEXT NOT NULL CHECK(length(trim(alcance_consulta)) >= 12),
 total_elementos INTEGER,
 elementos_cotejados INTEGER,
 total_paginas INTEGER,
 paginas_cotejadas INTEGER,
 pendientes_criticos INTEGER NOT NULL CHECK(pendientes_criticos >= 0),
 nota_cotejo TEXT NOT NULL CHECK(length(trim(nota_cotejo)) >= 12),
 referencia_persistencia TEXT NOT NULL CHECK(length(trim(referencia_persistencia)) >= 6),
 creado_en TEXT NOT NULL DEFAULT (datetime('now')),
 CHECK(
   (rol='resultados_pdf' AND estado='sin_pdf_verificado'
    AND fuente_id IS NULL AND url_documento IS NULL
    AND total_paginas IS NULL AND paginas_cotejadas IS NULL
    AND total_elementos IS NULL AND elementos_cotejados IS NULL)
   OR
   (estado='cotejada' AND fuente_id IS NOT NULL
    AND (rol='excel' OR (url_documento IS NOT NULL AND length(trim(url_documento)) > 10
      AND (url_documento LIKE 'https://%' OR url_documento LIKE 'http://%'))))
 ),
 CHECK(pendientes_criticos = 0),
 CHECK(total_elementos IS NULL OR total_elementos >= 0),
 CHECK(elementos_cotejados IS NULL OR elementos_cotejados >= 0),
 CHECK(total_paginas IS NULL OR total_paginas >= 0),
 CHECK(paginas_cotejadas IS NULL OR paginas_cotejadas >= 0)
);

CREATE TABLE IF NOT EXISTS v2_acta_validacion_convocatoria (
 acta_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v2_convocatoria(numero),
 control_excel_id INTEGER NOT NULL REFERENCES v2_control_validacion_fuente(control_id),
 control_convocatoria_id INTEGER NOT NULL REFERENCES v2_control_validacion_fuente(control_id),
 control_resultados_id INTEGER NOT NULL REFERENCES v2_control_validacion_fuente(control_id),
 referencia_cotejo_interfaz TEXT NOT NULL CHECK(length(trim(referencia_cotejo_interfaz)) >= 8),
 referencia_commit_persistido TEXT NOT NULL CHECK(length(trim(referencia_commit_persistido)) >= 8),
 nota_cierre TEXT NOT NULL CHECK(length(trim(nota_cierre)) >= 12),
 fecha_cierre TEXT NOT NULL DEFAULT (datetime('now')),
 CHECK(control_excel_id != control_convocatoria_id
       AND control_excel_id != control_resultados_id
       AND control_convocatoria_id != control_resultados_id)
);

-- Este disparador evita promover inventarios, fuentes parciales o «PDF no enlazado»
-- a un expediente VALIDADO. Las declaraciones de cotejo visual siguen siendo
-- responsabilidad documental de la IA y del responsable, no se generan por CI.
CREATE TRIGGER IF NOT EXISTS trg_v2_acta_validacion_puertas
BEFORE INSERT ON v2_acta_validacion_convocatoria
BEGIN
 SELECT CASE WHEN NOT EXISTS (
   SELECT 1 FROM v2_control_validacion_fuente c
   JOIN v2_fuente_original f ON f.fuente_id=c.fuente_id
   JOIN v2_vinculo_convocatoria_fuente v ON v.numero=c.numero AND v.fuente_id=c.fuente_id
   WHERE c.control_id=NEW.control_excel_id
     AND c.numero=NEW.numero
     AND c.rol='excel' AND c.estado='cotejada' AND f.clase='excel'
     AND (f.uri_original IS NOT NULL AND f.uri_original=c.url_verificacion)
     AND c.total_elementos>=1 AND c.elementos_cotejados=c.total_elementos
     AND c.total_elementos=(
       SELECT count(*) FROM v2_excel_celda_original e WHERE e.numero=NEW.numero
     )
     AND (SELECT count(*) FROM v2_excel_celda_original e WHERE e.numero=NEW.numero)>0
     AND c.pendientes_criticos=0
 ) THEN RAISE(ABORT,'A: Excel no cotejado por completo con sus celdas y URL de origen') END;

 SELECT CASE WHEN NOT EXISTS (
   SELECT 1 FROM v2_control_validacion_fuente c
   JOIN v2_fuente_original f ON f.fuente_id=c.fuente_id
   JOIN v2_vinculo_convocatoria_fuente v ON v.numero=c.numero AND v.fuente_id=c.fuente_id
   WHERE c.control_id=NEW.control_convocatoria_id AND c.numero=NEW.numero
     AND c.rol='convocatoria_pdf' AND c.estado='cotejada'
     AND f.clase='convocatoria_pdf' AND f.uri_original=c.url_documento
     AND c.total_paginas>=1 AND c.paginas_cotejadas=c.total_paginas
     AND c.total_paginas=(
       SELECT count(*) FROM v2_pagina_original p
       JOIN v2_corrida_extraccion r ON r.corrida_id=p.corrida_id
       WHERE r.fuente_id=c.fuente_id AND p.estado_cobertura='cotejado'
     )
     AND c.pendientes_criticos=0
 ) THEN RAISE(ABORT,'B: PDF de convocatoria, enlace o paginas no cotejados') END;

 SELECT CASE WHEN NOT (
   EXISTS (
     SELECT 1 FROM v2_control_validacion_fuente c
     WHERE c.control_id=NEW.control_resultados_id AND c.numero=NEW.numero
       AND c.rol='resultados_pdf' AND c.estado='sin_pdf_verificado'
       AND c.fuente_id IS NULL AND c.url_documento IS NULL
       AND c.pendientes_criticos=0
   )
   OR EXISTS (
     SELECT 1 FROM v2_control_validacion_fuente c
     JOIN v2_fuente_original f ON f.fuente_id=c.fuente_id
     JOIN v2_vinculo_convocatoria_fuente v ON v.numero=c.numero AND v.fuente_id=c.fuente_id
     WHERE c.control_id=NEW.control_resultados_id AND c.numero=NEW.numero
       AND c.rol='resultados_pdf' AND c.estado='cotejada'
       AND f.clase='resultados_pdf' AND f.uri_original=c.url_documento
       AND c.total_paginas>=1 AND c.paginas_cotejadas=c.total_paginas
       AND c.total_paginas=(
         SELECT count(*) FROM v2_pagina_original p
         JOIN v2_corrida_extraccion r ON r.corrida_id=p.corrida_id
         WHERE r.fuente_id=c.fuente_id AND p.estado_cobertura='cotejado'
       )
       AND c.pendientes_criticos=0
   )
 ) THEN RAISE(ABORT,'C/D: disponibilidad de resultados no comprobada o PDF resultados incompleto') END;
END;

-- Los controles/actas son históricos. Una corrección produce un nuevo control
-- y una nueva acta, sin borrar evidencia ni alterarla retroactivamente.
CREATE TRIGGER IF NOT EXISTS trg_v2_control_no_update BEFORE UPDATE ON v2_control_validacion_fuente BEGIN SELECT RAISE(ABORT,'Control de cotejo inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_control_no_delete BEFORE DELETE ON v2_control_validacion_fuente BEGIN SELECT RAISE(ABORT,'Control de cotejo inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_acta_no_update BEFORE UPDATE ON v2_acta_validacion_convocatoria BEGIN SELECT RAISE(ABORT,'Acta de validacion inmutable'); END;
CREATE TRIGGER IF NOT EXISTS trg_v2_acta_no_delete BEFORE DELETE ON v2_acta_validacion_convocatoria BEGIN SELECT RAISE(ABORT,'Acta de validacion inmutable'); END;

CREATE INDEX IF NOT EXISTS idx_v2_control_numero ON v2_control_validacion_fuente(numero,rol,control_id);
CREATE INDEX IF NOT EXISTS idx_v2_acta_numero ON v2_acta_validacion_convocatoria(numero,acta_id);

-- «Validadas» se obtiene SOLO de actas finales que pasaron las tres puertas;
-- contar códigos de fuente o PDF descargados daría resultados falsos.
CREATE VIEW IF NOT EXISTS v2_convocatorias_validadas AS
 SELECT DISTINCT numero FROM v2_acta_validacion_convocatoria;

CREATE VIEW IF NOT EXISTS v2_conteo_convocatorias_validadas AS
 SELECT (SELECT count(*) FROM v2_convocatorias_validadas) AS convocatorias_validadas,
        (SELECT count(*) FROM v2_convocatoria) AS convocatorias_identificadas;
