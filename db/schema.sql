-- Veeduría UNAL · esquema preliminar v0.1
-- SQLite. Base documental fiel: no anonimizar ni sustituir los datos literales.
-- Acceso a datos personales: controlar permisos del repositorio/almacenamiento, no reducir campos.
-- Este esquema es el cimiento de un piloto, no la taxonomía definitiva.
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS captura_hoja (
  captura_id INTEGER PRIMARY KEY,
  url_origen TEXT NOT NULL,
  titulo_original TEXT NOT NULL,
  capturada_en TEXT NOT NULL,
  parametros_json TEXT,
  notas TEXT
);
CREATE TABLE IF NOT EXISTS caso_convocatoria (
  caso_id INTEGER PRIMARY KEY,
  codigo_referencia TEXT,
  creado_en TEXT NOT NULL DEFAULT (datetime('now')),
  estado_conciliacion TEXT NOT NULL DEFAULT 'sin_verificar',
  notas TEXT
);
CREATE TABLE IF NOT EXISTS fila_hoja (
  fila_id INTEGER PRIMARY KEY,
  captura_id INTEGER NOT NULL REFERENCES captura_hoja(captura_id),
  pestaña_literal TEXT NOT NULL,
  indice_fila INTEGER NOT NULL CHECK(indice_fila >= 1),
  es_encabezado INTEGER NOT NULL DEFAULT 0 CHECK(es_encabezado IN (0,1)),
  estado_extraccion TEXT NOT NULL DEFAULT 'importado',
  UNIQUE(captura_id, pestaña_literal, indice_fila)
);
CREATE TABLE IF NOT EXISTS celda_hoja (
  celda_id INTEGER PRIMARY KEY,
  fila_id INTEGER NOT NULL REFERENCES fila_hoja(fila_id),
  columna_letra TEXT NOT NULL,
  encabezado_literal TEXT,
  valor_visible TEXT,
  valor_origen_json TEXT,
  formula TEXT,
  hipervinculo TEXT,
  nota TEXT,
  metadatos_formato_json TEXT,
  estado_lectura TEXT NOT NULL DEFAULT 'leido',
  UNIQUE(fila_id, columna_letra)
);
CREATE TABLE IF NOT EXISTS documento (
  documento_id INTEGER PRIMARY KEY,
  tipo_sugerido TEXT NOT NULL,
  url_origen TEXT NOT NULL,
  drive_id TEXT,
  titulo_archivo TEXT,
  mime_type TEXT,
  capturado_en TEXT,
  modificado_en_origen TEXT,
  tamano_bytes INTEGER,
  sha256_original TEXT,
  ruta_privada TEXT,
  paginas_declaradas INTEGER,
  estado_acceso TEXT NOT NULL DEFAULT 'no_verificado',
  estado_extraccion TEXT NOT NULL DEFAULT 'no_procesado',
  notas TEXT
);
CREATE TABLE IF NOT EXISTS pagina_pdf (
  pagina_id INTEGER PRIMARY KEY,
  documento_id INTEGER NOT NULL REFERENCES documento(documento_id),
  numero_pagina INTEGER NOT NULL CHECK(numero_pagina >= 1),
  texto_extraido_literal TEXT,
  metodo_extraccion TEXT,
  estado_revision_visual TEXT NOT NULL DEFAULT 'pendiente',
  notas TEXT,
  UNIQUE(documento_id, numero_pagina)
);
CREATE TABLE IF NOT EXISTS fragmento_pdf (
  fragmento_id INTEGER PRIMARY KEY,
  pagina_id INTEGER NOT NULL REFERENCES pagina_pdf(pagina_id),
  orden_lectura INTEGER NOT NULL,
  tipo_fragmento TEXT NOT NULL,
  texto_literal TEXT,
  bbox_json TEXT,
  dato_visual_json TEXT,
  fragmento_padre_id INTEGER REFERENCES fragmento_pdf(fragmento_id),
  estado_clasificacion TEXT NOT NULL DEFAULT 'pendiente',
  certeza_extraccion TEXT,
  notas TEXT
);
CREATE TABLE IF NOT EXISTS campo_documento (
  campo_id INTEGER PRIMARY KEY,
  documento_id INTEGER NOT NULL REFERENCES documento(documento_id),
  ruta_campo TEXT NOT NULL,
  ocurrencia INTEGER NOT NULL DEFAULT 1,
  rotulo_original TEXT,
  texto_original TEXT,
  valor_normalizado_json TEXT,
  regla_normalizacion TEXT,
  tipo_valor TEXT,
  estado_presencia TEXT NOT NULL DEFAULT 'valor_presente',
  estado_revision TEXT NOT NULL DEFAULT 'pendiente',
  notas TEXT,
  UNIQUE(documento_id, ruta_campo, ocurrencia)
);
CREATE TABLE IF NOT EXISTS campo_fragmento (
  campo_id INTEGER NOT NULL REFERENCES campo_documento(campo_id),
  fragmento_id INTEGER NOT NULL REFERENCES fragmento_pdf(fragmento_id),
  PRIMARY KEY(campo_id, fragmento_id)
);
CREATE TABLE IF NOT EXISTS vinculo_caso (
  vinculo_id INTEGER PRIMARY KEY,
  caso_id INTEGER NOT NULL REFERENCES caso_convocatoria(caso_id),
  fila_id INTEGER REFERENCES fila_hoja(fila_id),
  documento_id INTEGER REFERENCES documento(documento_id),
  rol_en_caso TEXT NOT NULL,
  evidencia_literal TEXT,
  evidencia_referencia TEXT,
  estado_verificacion TEXT NOT NULL DEFAULT 'pendiente',
  notas TEXT,
  CHECK ((fila_id IS NOT NULL AND documento_id IS NULL)
      OR (fila_id IS NULL AND documento_id IS NOT NULL))
);
CREATE TABLE IF NOT EXISTS adenda (
  adenda_id INTEGER PRIMARY KEY,
  caso_id INTEGER REFERENCES caso_convocatoria(caso_id),
  documento_id INTEGER NOT NULL REFERENCES documento(documento_id),
  campo_origen_id INTEGER REFERENCES campo_documento(campo_id),
  fragmento_origen_id INTEGER REFERENCES fragmento_pdf(fragmento_id),
  codigo_literal TEXT,
  fecha_literal TEXT,
  fecha_normalizada TEXT,
  texto_integro TEXT NOT NULL,
  clase TEXT,
  estado_verificacion TEXT NOT NULL DEFAULT 'pendiente'
);
CREATE TABLE IF NOT EXISTS cambio_adenda (
  cambio_id INTEGER PRIMARY KEY,
  adenda_id INTEGER NOT NULL REFERENCES adenda(adenda_id),
  ruta_campo_afectada TEXT,
  antes_literal TEXT,
  despues_literal TEXT,
  fecha_efecto_literal TEXT,
  alcance_literal TEXT,
  estado_inferencia TEXT NOT NULL DEFAULT 'explicito_o_pendiente',
  notas TEXT
);
CREATE TABLE IF NOT EXISTS requisito (
  requisito_id INTEGER PRIMARY KEY,
  documento_id INTEGER NOT NULL REFERENCES documento(documento_id),
  campo_origen_id INTEGER REFERENCES campo_documento(campo_id),
  orden INTEGER NOT NULL,
  categoria TEXT,
  literal_integro TEXT NOT NULL,
  condicion_parseada_json TEXT,
  notas TEXT
);
CREATE TABLE IF NOT EXISTS actividad (
  actividad_id INTEGER PRIMARY KEY,
  documento_id INTEGER NOT NULL REFERENCES documento(documento_id),
  campo_origen_id INTEGER REFERENCES campo_documento(campo_id),
  orden INTEGER NOT NULL,
  literal_integro TEXT NOT NULL,
  notas TEXT
);
CREATE TABLE IF NOT EXISTS documento_exigido (
  exigido_id INTEGER PRIMARY KEY,
  documento_id INTEGER NOT NULL REFERENCES documento(documento_id),
  campo_origen_id INTEGER REFERENCES campo_documento(campo_id),
  orden INTEGER NOT NULL,
  categoria TEXT,
  literal_integro TEXT NOT NULL,
  url_auxiliar TEXT,
  notas TEXT
);
CREATE TABLE IF NOT EXISTS criterio_evaluacion (
  criterio_id INTEGER PRIMARY KEY,
  documento_id INTEGER NOT NULL REFERENCES documento(documento_id),
  campo_origen_id INTEGER REFERENCES campo_documento(campo_id),
  criterio_padre_id INTEGER REFERENCES criterio_evaluacion(criterio_id),
  orden INTEGER NOT NULL,
  nombre_literal TEXT NOT NULL,
  descripcion_literal TEXT,
  peso_literal TEXT,
  peso_porcentaje REAL,
  formula_literal TEXT,
  escala_literal TEXT,
  eliminatorio_literal TEXT,
  notas TEXT
);
CREATE TABLE IF NOT EXISTS publicacion_resultados (
  publicacion_id INTEGER PRIMARY KEY,
  documento_id INTEGER NOT NULL REFERENCES documento(documento_id),
  codigo_convocatoria_literal TEXT,
  nombre_literal TEXT,
  fecha_publicacion_literal TEXT,
  vacantes_literal TEXT,
  observaciones_literal TEXT,
  estado_revision TEXT NOT NULL DEFAULT 'pendiente'
);
CREATE TABLE IF NOT EXISTS postulacion (
  postulacion_id INTEGER PRIMARY KEY,
  publicacion_id INTEGER NOT NULL REFERENCES publicacion_resultados(publicacion_id),
  orden_en_tabla INTEGER NOT NULL,
  identificacion_literal TEXT,
  nombre_literal TEXT,
  papa_literal TEXT,
  pbm_literal TEXT,
  total_literal TEXT,
  decision_literal TEXT,
  observacion_literal TEXT,
  fragmento_origen_id INTEGER REFERENCES fragmento_pdf(fragmento_id),
  estado_revision TEXT NOT NULL DEFAULT 'pendiente',
  UNIQUE(publicacion_id, orden_en_tabla)
);
-- Los atributos adicionales de cada postulante permanecen visibles y separados
-- en filas etiquetadas; no deben perderse por no existir una columna prediseñada.
CREATE TABLE IF NOT EXISTS dato_postulacion (
  dato_id INTEGER PRIMARY KEY,
  postulacion_id INTEGER NOT NULL REFERENCES postulacion(postulacion_id),
  orden_en_fuente INTEGER NOT NULL,
  etiqueta_original TEXT,
  columna_original TEXT,
  valor_literal TEXT,
  valor_normalizado TEXT,
  fragmento_origen_id INTEGER REFERENCES fragmento_pdf(fragmento_id),
  estado_revision TEXT NOT NULL DEFAULT 'pendiente'
);
CREATE INDEX IF NOT EXISTS idx_dato_postulacion ON dato_postulacion(postulacion_id, orden_en_fuente);
CREATE TABLE IF NOT EXISTS calificacion (
  calificacion_id INTEGER PRIMARY KEY,
  postulacion_id INTEGER NOT NULL REFERENCES postulacion(postulacion_id),
  criterio_id INTEGER REFERENCES criterio_evaluacion(criterio_id),
  columna_literal TEXT,
  concepto_literal TEXT,
  puntuacion_literal TEXT,
  puntuacion_numerica REAL,
  fragmento_origen_id INTEGER REFERENCES fragmento_pdf(fragmento_id),
  notas TEXT
);
CREATE TABLE IF NOT EXISTS hallazgo (
  hallazgo_id INTEGER PRIMARY KEY,
  caso_id INTEGER REFERENCES caso_convocatoria(caso_id),
  tipo TEXT NOT NULL,
  regla_analisis TEXT,
  version_regla TEXT,
  evidencia_a_json TEXT NOT NULL,
  evidencia_b_json TEXT,
  descripcion TEXT NOT NULL,
  estado TEXT NOT NULL DEFAULT 'pendiente',
  prioridad_revision TEXT,
  detectado_en TEXT NOT NULL DEFAULT (datetime('now')),
  notas_revisor TEXT
);
CREATE TABLE IF NOT EXISTS evento_revision (
  revision_id INTEGER PRIMARY KEY,
  objeto_tipo TEXT NOT NULL,
  objeto_id INTEGER NOT NULL,
  accion TEXT NOT NULL,
  descripcion TEXT,
  responsable TEXT,
  fecha_hora TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE TABLE IF NOT EXISTS ejecucion_extraccion (
  ejecucion_id INTEGER PRIMARY KEY,
  metodo TEXT NOT NULL,
  version_herramienta TEXT,
  ejecutado_en TEXT NOT NULL DEFAULT (datetime('now')),
  captura_id INTEGER REFERENCES captura_hoja(captura_id),
  documento_id INTEGER REFERENCES documento(documento_id),
  resultado TEXT NOT NULL,
  registro_json TEXT
);
CREATE INDEX IF NOT EXISTS idx_fila_captura ON fila_hoja(captura_id, pestaña_literal);
CREATE INDEX IF NOT EXISTS idx_campo_documento ON campo_documento(documento_id, ruta_campo);
CREATE INDEX IF NOT EXISTS idx_fragmento_pagina ON fragmento_pdf(pagina_id, orden_lectura);
CREATE INDEX IF NOT EXISTS idx_vinculo_caso ON vinculo_caso(caso_id, rol_en_caso);
CREATE INDEX IF NOT EXISTS idx_criterio_documento ON criterio_evaluacion(documento_id, orden);
CREATE INDEX IF NOT EXISTS idx_postulacion_resultado ON postulacion(publicacion_id, orden_en_tabla);
CREATE INDEX IF NOT EXISTS idx_hallazgo_caso ON hallazgo(caso_id, estado);
