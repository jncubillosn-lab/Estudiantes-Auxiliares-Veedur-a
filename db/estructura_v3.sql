-- ESQUEMA V3 DESDE CERO. No ejecutarlo encima de los originales v1/v2 como migración automática.
-- NORMA 00: ningún código cuenta como validado sin evidencia A+B+C+(D si hay PDF)+E.
PRAGMA foreign_keys=ON;

CREATE TABLE v3_convocatoria(
 numero TEXT PRIMARY KEY NOT NULL CHECK(length(trim(numero))>0),
 identificada_en TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE TABLE v3_fuente(
 fuente_id INTEGER PRIMARY KEY,
 tipo TEXT NOT NULL CHECK(tipo IN ('excel','convocatoria_pdf','resultados_pdf','adenda_pdf','anexo_pdf','otro_pdf')),
 url_original TEXT NOT NULL CHECK(url_original LIKE 'https://%' OR url_original LIKE 'http://%'),
 nombre_literal TEXT,
 codigo_interno_literal TEXT,
 version_literal TEXT NOT NULL,
 fecha_captura TEXT NOT NULL,
 fecha_ultimo_acceso TEXT,
 resultado_acceso TEXT NOT NULL CHECK(resultado_acceso IN ('accesible','fallo','sin_comprobar')),
 paginas_originales INTEGER CHECK(paginas_originales IS NULL OR paginas_originales>0),
 sha256 TEXT,
 binario_original BLOB,
 texto_respaldo_literal TEXT,
 metadatos_json TEXT,
 CHECK(binario_original IS NULL OR (sha256 IS NOT NULL AND length(sha256)=64)),
 UNIQUE(tipo,url_original,version_literal)
);
CREATE TABLE v3_convocatoria_fuente(
 numero TEXT NOT NULL REFERENCES v3_convocatoria(numero),
 fuente_id INTEGER NOT NULL REFERENCES v3_fuente(fuente_id),
 PRIMARY KEY(numero,fuente_id)
);
CREATE TABLE v3_excel_fila(
 fila_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v3_convocatoria(numero),
 fuente_id INTEGER NOT NULL REFERENCES v3_fuente(fuente_id),
 pestana_literal TEXT NOT NULL,
 fila_original INTEGER NOT NULL CHECK(fila_original>0),
 total_columnas_original INTEGER NOT NULL CHECK(total_columnas_original>0),
 UNIQUE(fuente_id,pestana_literal,fila_original)
);
CREATE TABLE v3_excel_celda(
 celda_id INTEGER PRIMARY KEY,
 fila_id INTEGER NOT NULL REFERENCES v3_excel_fila(fila_id),
 columna_original TEXT NOT NULL,
 encabezado_literal TEXT,
 valor_visible_literal TEXT,
 valor_entrada_literal TEXT,
 formula_literal TEXT,
 hipervinculo_literal TEXT,
 nota_literal TEXT,
 formato_json TEXT,
 UNIQUE(fila_id,columna_original)
);
CREATE TABLE v3_pdf_pagina(
 pagina_id INTEGER PRIMARY KEY,
 fuente_id INTEGER NOT NULL REFERENCES v3_fuente(fuente_id),
 numero_pagina INTEGER NOT NULL CHECK(numero_pagina>0),
 ancho_pt REAL,alto_pt REAL,
 imagen_ruta TEXT,imagen_sha256 TEXT,
 cotejo_visual TEXT NOT NULL CHECK(cotejo_visual IN ('pendiente','parcial','completo')),
 notas TEXT,
 UNIQUE(fuente_id,numero_pagina)
);
CREATE TABLE v3_pdf_elemento(
 elemento_id INTEGER PRIMARY KEY,
 pagina_id INTEGER NOT NULL REFERENCES v3_pdf_pagina(pagina_id),
 tipo TEXT NOT NULL,
 ordinal INTEGER NOT NULL,
 literal TEXT,
 x0 REAL,y0 REAL,x1 REAL,y1 REAL,
 atributos_json TEXT,
 CHECK(x0 IS NULL OR x1 IS NULL OR x0<=x1),
 CHECK(y0 IS NULL OR y1 IS NULL OR y0<=y1),
 UNIQUE(pagina_id,ordinal)
);
CREATE TABLE v3_pdf_tabla(
 tabla_id INTEGER PRIMARY KEY,
 pagina_id INTEGER NOT NULL REFERENCES v3_pdf_pagina(pagina_id),
 ordinal INTEGER NOT NULL,
 filas INTEGER CHECK(filas>=0),
 columnas INTEGER CHECK(columnas>=0),
 geometria_json TEXT,
 UNIQUE(pagina_id,ordinal)
);
CREATE TABLE v3_pdf_celda(
 celda_id INTEGER PRIMARY KEY,
 tabla_id INTEGER NOT NULL REFERENCES v3_pdf_tabla(tabla_id),
 fila INTEGER NOT NULL CHECK(fila>=0),
 columna INTEGER NOT NULL CHECK(columna>=0),
 rowspan INTEGER CHECK(rowspan IS NULL OR rowspan>=1),
 colspan INTEGER CHECK(colspan IS NULL OR colspan>=1),
 literal TEXT,
 geometria_json TEXT,
 estado TEXT NOT NULL CHECK(estado IN ('extraida','vacia_original','ilegible','pendiente')),
 UNIQUE(tabla_id,fila,columna)
);
-- Interpretación semántica ADICIONAL: cada requisito es un dato, no un conteo.
CREATE TABLE v3_dato_original(
 dato_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v3_convocatoria(numero),
 fuente_id INTEGER NOT NULL REFERENCES v3_fuente(fuente_id),
 codigo_concepto TEXT,
 rotulo_literal TEXT,
 literal_completo TEXT,
 orden_en_fuente INTEGER,
 pagina_id INTEGER REFERENCES v3_pdf_pagina(pagina_id),
 celda_pdf_id INTEGER REFERENCES v3_pdf_celda(celda_id),
 celda_excel_id INTEGER REFERENCES v3_excel_celda(celda_id),
 grupo_lista TEXT,
 nota_lectura TEXT
);
CREATE TABLE v3_indicador_sintetico(
 indicador_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v3_convocatoria(numero),
 nombre TEXT NOT NULL, valor_json TEXT NOT NULL,
 formula TEXT NOT NULL, version_formula TEXT NOT NULL,
 fecha_calculo TEXT NOT NULL,
 UNIQUE(numero,nombre,version_formula,fecha_calculo)
);
CREATE TABLE v3_indicador_insumo(
 indicador_id INTEGER NOT NULL REFERENCES v3_indicador_sintetico(indicador_id),
 dato_id INTEGER NOT NULL REFERENCES v3_dato_original(dato_id),
 PRIMARY KEY(indicador_id,dato_id)
);
-- Verificar existencia de resultados, incluso si no se encuentra un PDF.
CREATE TABLE v3_consulta_resultados(
 consulta_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v3_convocatoria(numero),
 estado TEXT NOT NULL CHECK(estado IN ('pdf_encontrado','sin_pdf_verificado_al_corte','indeterminado')),
 url_sitio_consultado TEXT NOT NULL CHECK(url_sitio_consultado LIKE 'https://%' OR url_sitio_consultado LIKE 'http://%'),
 fecha_consulta TEXT NOT NULL,
 alcance_y_metodo TEXT NOT NULL CHECK(length(trim(alcance_y_metodo))>=16),
 justificacion_literal TEXT NOT NULL,
 fuente_pdf_id INTEGER REFERENCES v3_fuente(fuente_id),
 CHECK((estado='pdf_encontrado' AND fuente_pdf_id IS NOT NULL)
    OR (estado!='pdf_encontrado' AND fuente_pdf_id IS NULL))
);
-- Cada documento tiene su propia revisión y cobertura, incluidas adendas/anexos.
CREATE TABLE v3_revision_fuente(
 revision_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v3_convocatoria(numero),
 fuente_id INTEGER NOT NULL REFERENCES v3_fuente(fuente_id),
 estado TEXT NOT NULL CHECK(estado IN ('pendiente','incompleta','cotejada')),
 unidades_esperadas INTEGER NOT NULL CHECK(unidades_esperadas>=1),
 unidades_cotejadas INTEGER NOT NULL CHECK(unidades_cotejadas>=0),
 url_de_verificacion TEXT NOT NULL CHECK(url_de_verificacion LIKE 'https://%' OR url_de_verificacion LIKE 'http://%'),
 alcance TEXT NOT NULL CHECK(length(trim(alcance))>=12),
 metodo_cotejo TEXT NOT NULL,
 fecha_cotejo TEXT NOT NULL,
 observacion TEXT,
 CHECK(unidades_cotejadas<=unidades_esperadas),
 CHECK(estado!='cotejada' OR unidades_cotejadas=unidades_esperadas)
);
-- Cada categoría de contenido debe tener su PROPIO cotejo, no solo un total PDF.
CREATE TABLE v3_metrica_requerida(
 tipo_fuente TEXT NOT NULL,
 metrica TEXT NOT NULL,
 descripcion TEXT NOT NULL,
 PRIMARY KEY(tipo_fuente,metrica)
);
INSERT INTO v3_metrica_requerida VALUES
 ('excel','filas','Filas Excel verificadas'),
 ('excel','celdas','Celdas Excel verificadas'),
 ('excel','hipervinculos','Hipervinculos y formulas presentes verificados'),
 ('convocatoria_pdf','paginas','Paginas cotejadas'),
 ('convocatoria_pdf','tablas','Tablas y estructuras cotejadas'),
 ('convocatoria_pdf','celdas','Celdas de tablas cotejadas'),
 ('convocatoria_pdf','requisitos','Requisitos completos individualizados'),
 ('convocatoria_pdf','criterios','Criterios y condiciones completos'),
 ('convocatoria_pdf','otros_elementos','Notas, marcas, firmas y contenido extraordinario'),
 ('resultados_pdf','paginas','Paginas cotejadas'),
 ('resultados_pdf','tablas','Tablas de resultados completas'),
 ('resultados_pdf','celdas','Celdas de resultados completas'),
 ('resultados_pdf','participantes','Filas de todas las personas participantes'),
 ('resultados_pdf','puntajes','Criterios y puntajes por participante'),
 ('resultados_pdf','otros_elementos','Decisiones, notas y marcas adicionales'),
 ('adenda_pdf','paginas','Paginas de adenda cotejadas'),
 ('adenda_pdf','tablas','Tablas de adenda cotejadas'),
 ('adenda_pdf','celdas','Celdas de adenda cotejadas'),
 ('adenda_pdf','otros_elementos','Texto previo, cambios y notas de adenda'),
 ('anexo_pdf','paginas','Paginas de anexo cotejadas'),
 ('anexo_pdf','tablas','Tablas de anexo cotejadas'),
 ('anexo_pdf','celdas','Celdas de anexo cotejadas'),
 ('anexo_pdf','otros_elementos','Elementos de anexo cotejados'),
 ('otro_pdf','paginas','Paginas de documento cotejadas'),
 ('otro_pdf','tablas','Tablas de documento cotejadas'),
 ('otro_pdf','celdas','Celdas de documento cotejadas'),
 ('otro_pdf','otros_elementos','Elementos de documento cotejados');
CREATE TABLE v3_revision_metrica(
 revision_id INTEGER NOT NULL REFERENCES v3_revision_fuente(revision_id),
 metrica TEXT NOT NULL,
 total_observado INTEGER NOT NULL CHECK(total_observado>=0),
 total_cotejado INTEGER NOT NULL CHECK(total_cotejado>=0 AND total_cotejado<=total_observado),
 estado TEXT NOT NULL CHECK(estado IN ('pendiente','incompleta','cotejada')),
 evidencia_url TEXT NOT NULL CHECK(evidencia_url LIKE 'https://%' OR evidencia_url LIKE 'http://%'),
 nota_cotejo TEXT NOT NULL CHECK(length(trim(nota_cotejo))>=12),
 CHECK(estado!='cotejada' OR total_observado=total_cotejado),
 PRIMARY KEY(revision_id,metrica)
);

-- Cada puerta y cada criterio tiene ESPACIO PROPIO para evidencias de cumplimiento.
CREATE TABLE v3_puerta(
 puerta_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v3_convocatoria(numero),
 etapa TEXT NOT NULL CHECK(etapa IN ('A','B','C','D','E')),
 estado TEXT NOT NULL CHECK(estado IN ('pendiente','no_cumple','cumple')),
 responsable_cotejo TEXT NOT NULL,
 fecha_revision TEXT NOT NULL,
 alcance TEXT NOT NULL,
 evidencia_url TEXT NOT NULL CHECK(evidencia_url LIKE 'https://%' OR evidencia_url LIKE 'http://%'),
 nota TEXT NOT NULL CHECK(length(trim(nota))>=12)
);
CREATE TABLE v3_criterio(
 codigo TEXT PRIMARY KEY,
 etapa TEXT NOT NULL CHECK(etapa IN ('A','B','C','D','E')),
 descripcion TEXT NOT NULL
);
INSERT INTO v3_criterio(codigo,etapa,descripcion) VALUES
 ('A_FILAS','A','Se identificaron y conservaron todas las filas Excel del codigo'),
 ('A_CELDAS','A','Cada celda de cada fila Excel fue cotejada y preservada'),
 ('A_ENLACES','A','Hipervinculos, cabeceras y metadatos originales de Excel disponibles'),
 ('B_URL','B','URL original real de cada PDF de convocatoria disponible en la base'),
 ('B_PAGINAS','B','Todas las paginas del PDF de convocatoria y sus versiones cotejadas'),
 ('B_CONTENIDO','B','Tablas, celdas, requisitos, listas y notas completos en datos originales'),
 ('C_BUSQUEDA','C','Comprobacion expresa de PDF de resultados con URL, fecha y alcance'),
 ('D_URL','D','URL real del PDF de resultados en la base cuando existe'),
 ('D_PAGINAS','D','Todas las paginas y tablas de resultados cotejadas cuando existe'),
 ('D_CONTENIDO','D','Participantes, identificaciones, puntajes, criterios y decisiones integros'),
 ('E_PERSISTENCIA','E','Se verifico lectura de datos persistidos, sin perdida de originales'),
 ('E_INTERFAZ','E','Todos los datos y enlaces comprobables desde interfaz'),
 ('E_INCIDENCIAS','E','Fallos visibles, sin incidencias criticas abiertas ni omisiones');
CREATE TABLE v3_cumplimiento(
 puerta_id INTEGER NOT NULL REFERENCES v3_puerta(puerta_id),
 criterio TEXT NOT NULL REFERENCES v3_criterio(codigo),
 estado TEXT NOT NULL CHECK(estado IN ('pendiente','no_cumple','cumple')),
 evidencia_url TEXT NOT NULL CHECK(evidencia_url LIKE 'https://%' OR evidencia_url LIKE 'http://%'),
 detalle TEXT NOT NULL CHECK(length(trim(detalle))>=12),
 fuente_id INTEGER REFERENCES v3_fuente(fuente_id),
 elementos_esperados INTEGER CHECK(elementos_esperados IS NULL OR elementos_esperados>=0),
 elementos_cotejados INTEGER CHECK(elementos_cotejados IS NULL OR elementos_cotejados>=0),
 CHECK(elementos_esperados IS NULL OR elementos_cotejados IS NULL OR elementos_cotejados<=elementos_esperados),
 CHECK(estado!='cumple' OR elementos_esperados IS NULL OR elementos_esperados=elementos_cotejados),
 PRIMARY KEY(puerta_id,criterio)
);
CREATE TABLE v3_incidencia(
 incidencia_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v3_convocatoria(numero),
 fuente_id INTEGER REFERENCES v3_fuente(fuente_id),
 criticidad TEXT NOT NULL CHECK(criticidad IN ('critica','documental')),
 detalle TEXT NOT NULL,
 evidencia_url TEXT,
 registrada_en TEXT NOT NULL
);
CREATE TABLE v3_resolucion_incidencia(
 incidencia_id INTEGER PRIMARY KEY REFERENCES v3_incidencia(incidencia_id),
 resolucion TEXT NOT NULL CHECK(length(trim(resolucion))>=12),
 evidencia_url TEXT NOT NULL CHECK(evidencia_url LIKE 'https://%' OR evidencia_url LIKE 'http://%'),
 fecha TEXT NOT NULL
);
-- Acta formal: SOLO existe tras las puertas y el cotejo integral.
CREATE TABLE v3_acta_validacion(
 acta_id INTEGER PRIMARY KEY,
 numero TEXT NOT NULL REFERENCES v3_convocatoria(numero),
 puerta_a INTEGER NOT NULL REFERENCES v3_puerta(puerta_id),
 puerta_b INTEGER NOT NULL REFERENCES v3_puerta(puerta_id),
 puerta_c INTEGER NOT NULL REFERENCES v3_puerta(puerta_id),
 puerta_d INTEGER REFERENCES v3_puerta(puerta_id),
 puerta_e INTEGER NOT NULL REFERENCES v3_puerta(puerta_id),
 consulta_resultados_id INTEGER NOT NULL REFERENCES v3_consulta_resultados(consulta_id),
 version_persistida TEXT NOT NULL CHECK(length(trim(version_persistida))>=8),
 url_expediente_interfaz TEXT NOT NULL CHECK(url_expediente_interfaz LIKE 'https://%' OR url_expediente_interfaz LIKE 'http://%'),
 fecha_cierre TEXT NOT NULL,
 responsable TEXT NOT NULL,
 nota_final TEXT NOT NULL CHECK(length(trim(nota_final))>=12)
);
CREATE TABLE v3_acta_fuente(
 acta_id INTEGER NOT NULL REFERENCES v3_acta_validacion(acta_id),
 fuente_id INTEGER NOT NULL REFERENCES v3_fuente(fuente_id),
 PRIMARY KEY(acta_id,fuente_id)
);

-- Ningún ORIGINAL ni evidencia de cotejo se actualiza/destruye: añadir versión
-- o nueva revisión; las resoluciones se enlazan, no modifican la incidencia.
CREATE TRIGGER v3_v3_fuente_no_update BEFORE UPDATE ON v3_fuente BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_fuente_no_delete BEFORE DELETE ON v3_fuente BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_convocatoria_fuente_no_update BEFORE UPDATE ON v3_convocatoria_fuente BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_convocatoria_fuente_no_delete BEFORE DELETE ON v3_convocatoria_fuente BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_excel_fila_no_update BEFORE UPDATE ON v3_excel_fila BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_excel_fila_no_delete BEFORE DELETE ON v3_excel_fila BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_excel_celda_no_update BEFORE UPDATE ON v3_excel_celda BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_excel_celda_no_delete BEFORE DELETE ON v3_excel_celda BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_pdf_pagina_no_update BEFORE UPDATE ON v3_pdf_pagina BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_pdf_pagina_no_delete BEFORE DELETE ON v3_pdf_pagina BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_pdf_elemento_no_update BEFORE UPDATE ON v3_pdf_elemento BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_pdf_elemento_no_delete BEFORE DELETE ON v3_pdf_elemento BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_pdf_tabla_no_update BEFORE UPDATE ON v3_pdf_tabla BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_pdf_tabla_no_delete BEFORE DELETE ON v3_pdf_tabla BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_pdf_celda_no_update BEFORE UPDATE ON v3_pdf_celda BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_pdf_celda_no_delete BEFORE DELETE ON v3_pdf_celda BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_dato_original_no_update BEFORE UPDATE ON v3_dato_original BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_dato_original_no_delete BEFORE DELETE ON v3_dato_original BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_consulta_resultados_no_update BEFORE UPDATE ON v3_consulta_resultados BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_consulta_resultados_no_delete BEFORE DELETE ON v3_consulta_resultados BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_revision_fuente_no_update BEFORE UPDATE ON v3_revision_fuente BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_revision_fuente_no_delete BEFORE DELETE ON v3_revision_fuente BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_puerta_no_update BEFORE UPDATE ON v3_puerta BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_puerta_no_delete BEFORE DELETE ON v3_puerta BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_cumplimiento_no_update BEFORE UPDATE ON v3_cumplimiento BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_cumplimiento_no_delete BEFORE DELETE ON v3_cumplimiento BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_incidencia_no_update BEFORE UPDATE ON v3_incidencia BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_incidencia_no_delete BEFORE DELETE ON v3_incidencia BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_resolucion_incidencia_no_update BEFORE UPDATE ON v3_resolucion_incidencia BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_resolucion_incidencia_no_delete BEFORE DELETE ON v3_resolucion_incidencia BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_acta_validacion_no_update BEFORE UPDATE ON v3_acta_validacion BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_acta_validacion_no_delete BEFORE DELETE ON v3_acta_validacion BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_metrica_requerida_no_update BEFORE UPDATE ON v3_metrica_requerida BEGIN SELECT RAISE(ABORT,'Norma 00 inmutable'); END;
CREATE TRIGGER v3_metrica_requerida_no_delete BEFORE DELETE ON v3_metrica_requerida BEGIN SELECT RAISE(ABORT,'Norma 00 inmutable'); END;
CREATE TRIGGER v3_criterio_no_update BEFORE UPDATE ON v3_criterio BEGIN SELECT RAISE(ABORT,'Norma 00 inmutable'); END;
CREATE TRIGGER v3_criterio_no_delete BEFORE DELETE ON v3_criterio BEGIN SELECT RAISE(ABORT,'Norma 00 inmutable'); END;
CREATE TRIGGER v3_revision_metrica_no_update BEFORE UPDATE ON v3_revision_metrica BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_revision_metrica_no_delete BEFORE DELETE ON v3_revision_metrica BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_acta_fuente_no_update BEFORE UPDATE ON v3_acta_fuente BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;
CREATE TRIGGER v3_v3_acta_fuente_no_delete BEFORE DELETE ON v3_acta_fuente BEGIN SELECT RAISE(ABORT,'Evidencia inmutable'); END;

-- Comprobaciones de puertas con insumos y evidencias sin sustitución.
CREATE TRIGGER v3_acta_check BEFORE INSERT ON v3_acta_validacion BEGIN
 SELECT CASE WHEN NOT (
   EXISTS(SELECT 1 FROM v3_puerta p WHERE p.puerta_id=NEW.puerta_a AND p.numero=NEW.numero AND p.etapa='A' AND p.estado='cumple')
   AND EXISTS(SELECT 1 FROM v3_puerta p WHERE p.puerta_id=NEW.puerta_b AND p.numero=NEW.numero AND p.etapa='B' AND p.estado='cumple')
   AND EXISTS(SELECT 1 FROM v3_puerta p WHERE p.puerta_id=NEW.puerta_c AND p.numero=NEW.numero AND p.etapa='C' AND p.estado='cumple')
   AND EXISTS(SELECT 1 FROM v3_puerta p WHERE p.puerta_id=NEW.puerta_e AND p.numero=NEW.numero AND p.etapa='E' AND p.estado='cumple')
 ) THEN RAISE(ABORT,'NORMA 00: faltan puertas A, B, C o E') END;

 -- Todos los criterios exigibles tienen evidencia individual de «cumple».
 SELECT CASE WHEN EXISTS (
   SELECT 1 FROM v3_criterio k WHERE
    (k.etapa='A' AND NOT EXISTS(SELECT 1 FROM v3_cumplimiento c WHERE c.puerta_id=NEW.puerta_a AND c.criterio=k.codigo AND c.estado='cumple'))
    OR (k.etapa='B' AND NOT EXISTS(SELECT 1 FROM v3_cumplimiento c WHERE c.puerta_id=NEW.puerta_b AND c.criterio=k.codigo AND c.estado='cumple'))
    OR (k.etapa='C' AND NOT EXISTS(SELECT 1 FROM v3_cumplimiento c WHERE c.puerta_id=NEW.puerta_c AND c.criterio=k.codigo AND c.estado='cumple'))
    OR (k.etapa='E' AND NOT EXISTS(SELECT 1 FROM v3_cumplimiento c WHERE c.puerta_id=NEW.puerta_e AND c.criterio=k.codigo AND c.estado='cumple'))
    OR (k.etapa='D' AND NEW.puerta_d IS NOT NULL AND NOT EXISTS(SELECT 1 FROM v3_cumplimiento c WHERE c.puerta_id=NEW.puerta_d AND c.criterio=k.codigo AND c.estado='cumple'))
 ) THEN RAISE(ABORT,'NORMA 00: falta criterio individual documentado') END;

 -- Revisión explícita y actual de resultados.
 SELECT CASE WHEN NEW.consulta_resultados_id != (
   SELECT max(c.consulta_id) FROM v3_consulta_resultados c WHERE c.numero=NEW.numero
 ) THEN RAISE(ABORT,'NORMA 00: consulta de resultados no es la última documentada') END;
 SELECT CASE WHEN NOT EXISTS (
   SELECT 1 FROM v3_consulta_resultados c
   WHERE c.consulta_id=NEW.consulta_resultados_id AND c.numero=NEW.numero
     AND c.estado IN ('pdf_encontrado','sin_pdf_verificado_al_corte')
 ) THEN RAISE(ABORT,'NORMA 00: resultados sin disponibilidad comprobada') END;
 SELECT CASE WHEN EXISTS(
   SELECT 1 FROM v3_consulta_resultados c WHERE c.consulta_id=NEW.consulta_resultados_id
    AND (
       (c.estado='pdf_encontrado'
         AND (NEW.puerta_d IS NULL OR NOT EXISTS(
           SELECT 1 FROM v3_puerta p WHERE p.puerta_id=NEW.puerta_d AND p.numero=NEW.numero AND p.etapa='D' AND p.estado='cumple')))
       OR
       (c.estado='sin_pdf_verificado_al_corte'
         AND (NEW.puerta_d IS NOT NULL OR EXISTS(
          SELECT 1 FROM v3_convocatoria_fuente v JOIN v3_fuente f ON f.fuente_id=v.fuente_id
          WHERE v.numero=NEW.numero AND f.tipo='resultados_pdf')))
    )
 ) THEN RAISE(ABORT,'NORMA 00: el PDF de resultados o su ausencia está sin verificar') END;

 -- No se aceptan incidencias críticas ocultas.
 SELECT CASE WHEN EXISTS(
   SELECT 1 FROM v3_incidencia i LEFT JOIN v3_resolucion_incidencia r ON r.incidencia_id=i.incidencia_id
   WHERE i.numero=NEW.numero AND i.criticidad='critica' AND r.incidencia_id IS NULL
 ) THEN RAISE(ABORT,'NORMA 00: hay incidencias críticas abiertas') END;

 -- Cada fuente disponible tiene su URL y una revisión individual, con conteos
 -- cotejados contra la estructura REAL almacenada. Incluye adendas/anexos.
 SELECT CASE WHEN EXISTS(
   SELECT 1 FROM v3_convocatoria_fuente v
   JOIN v3_fuente f ON f.fuente_id=v.fuente_id
   WHERE v.numero=NEW.numero AND NOT EXISTS (
     SELECT 1 FROM v3_revision_fuente x
     WHERE x.fuente_id=f.fuente_id AND x.numero=NEW.numero AND x.estado='cotejada'
       AND x.url_de_verificacion=f.url_original
       AND x.unidades_cotejadas=x.unidades_esperadas
       AND x.unidades_esperadas=(
         CASE WHEN f.tipo='excel' THEN
           (SELECT count(*) FROM v3_excel_celda c
              JOIN v3_excel_fila r ON r.fila_id=c.fila_id
              WHERE r.numero=NEW.numero AND r.fuente_id=f.fuente_id)
         ELSE (SELECT count(*) FROM v3_pdf_pagina p WHERE p.fuente_id=f.fuente_id)
         END
       )
       AND (f.tipo='excel' OR (
         f.paginas_originales=x.unidades_esperadas
         AND NOT EXISTS(SELECT 1 FROM v3_pdf_pagina p
           WHERE p.fuente_id=f.fuente_id AND p.cotejo_visual!='completo')))
       AND NOT EXISTS(
         SELECT 1 FROM v3_metrica_requerida m WHERE m.tipo_fuente=f.tipo
           AND NOT EXISTS (
             SELECT 1 FROM v3_revision_metrica z
             WHERE z.revision_id=x.revision_id AND z.metrica=m.metrica
               AND z.estado='cotejada' AND z.total_observado=z.total_cotejado
           )
       )
   )
 ) THEN RAISE(ABORT,'NORMA 00: falta fuente íntegra, URL o revisión de páginas/celdas') END;

 -- Debe existir Excel íntegro y al menos un PDF de convocatoria completo.
 SELECT CASE WHEN NOT EXISTS (
   SELECT 1 FROM v3_convocatoria_fuente v JOIN v3_fuente f ON f.fuente_id=v.fuente_id
   WHERE v.numero=NEW.numero AND f.tipo='excel'
 ) OR NOT EXISTS (
   SELECT 1 FROM v3_convocatoria_fuente v JOIN v3_fuente f ON f.fuente_id=v.fuente_id
   WHERE v.numero=NEW.numero AND f.tipo='convocatoria_pdf'
 ) THEN RAISE(ABORT,'NORMA 00: faltan Excel o PDF de convocatoria reales') END;
 SELECT CASE WHEN EXISTS(
   SELECT 1 FROM v3_consulta_resultados c
   WHERE c.consulta_id=NEW.consulta_resultados_id AND c.estado='pdf_encontrado'
    AND NOT EXISTS(
     SELECT 1 FROM v3_convocatoria_fuente v JOIN v3_fuente f ON f.fuente_id=v.fuente_id
     WHERE v.numero=NEW.numero AND v.fuente_id=c.fuente_pdf_id AND f.tipo='resultados_pdf')
 ) THEN RAISE(ABORT,'NORMA 00: PDF resultados no vinculado a su fuente y URL') END;

 -- Evitar un control con declaración de Excel vacío o fila sin todas sus celdas.
 SELECT CASE WHEN EXISTS(
   SELECT 1 FROM v3_excel_fila r
   WHERE r.numero=NEW.numero AND r.total_columnas_original!=(
     SELECT count(*) FROM v3_excel_celda c WHERE c.fila_id=r.fila_id)
 ) THEN RAISE(ABORT,'NORMA 00: fila Excel incompleta') END;
 SELECT CASE WHEN NOT EXISTS(SELECT 1 FROM v3_excel_fila WHERE numero=NEW.numero)
   THEN RAISE(ABORT,'NORMA 00: sin filas Excel') END;

 -- Las evidencias de cada fuente deben corresponder a URLs reales de la base,
 -- y las pruebas C/E permiten URL de publicación y expediente.
 SELECT CASE WHEN EXISTS(
   SELECT 1 FROM v3_cumplimiento c JOIN v3_puerta p ON p.puerta_id=c.puerta_id
   WHERE p.puerta_id IN (NEW.puerta_a,NEW.puerta_b,NEW.puerta_c,NEW.puerta_d,NEW.puerta_e)
   AND c.fuente_id IS NOT NULL
   AND NOT EXISTS(SELECT 1 FROM v3_convocatoria_fuente v
                 WHERE v.numero=NEW.numero AND v.fuente_id=c.fuente_id)
 ) THEN RAISE(ABORT,'NORMA 00: evidencia de una fuente ajena') END;
END;
CREATE TRIGGER v3_acta_snapshot AFTER INSERT ON v3_acta_validacion BEGIN
 INSERT INTO v3_acta_fuente(acta_id,fuente_id)
 SELECT NEW.acta_id,fuente_id FROM v3_convocatoria_fuente WHERE numero=NEW.numero;
END;

-- Acta HISTÓRICA inmutable; estado ACTUAL se recalcula. Nueva fuente, nueva
-- celda Excel o consulta de resultados ⇒ deja de contar hasta un nuevo cierre.
CREATE VIEW v3_convocatorias_validadas AS
 SELECT DISTINCT a.numero
 FROM v3_acta_validacion a
 WHERE a.consulta_resultados_id=(
   SELECT max(c.consulta_id) FROM v3_consulta_resultados c WHERE c.numero=a.numero)
 AND NOT EXISTS(
   SELECT 1 FROM v3_convocatoria_fuente v WHERE v.numero=a.numero
     AND NOT EXISTS(SELECT 1 FROM v3_acta_fuente s
       WHERE s.acta_id=a.acta_id AND s.fuente_id=v.fuente_id)
 )
 AND NOT EXISTS(
   SELECT 1 FROM v3_incidencia i LEFT JOIN v3_resolucion_incidencia r ON r.incidencia_id=i.incidencia_id
   WHERE i.numero=a.numero AND i.criticidad='critica' AND r.incidencia_id IS NULL
 )
 AND NOT EXISTS(
   SELECT 1 FROM v3_excel_fila r WHERE r.numero=a.numero AND r.total_columnas_original!=
      (SELECT count(*) FROM v3_excel_celda c WHERE c.fila_id=r.fila_id)
 )
 AND NOT EXISTS(
   SELECT 1 FROM v3_convocatoria_fuente v
   JOIN v3_fuente f ON f.fuente_id=v.fuente_id
   WHERE v.numero=a.numero AND NOT EXISTS(
     SELECT 1 FROM v3_revision_fuente x WHERE x.numero=a.numero AND x.fuente_id=f.fuente_id
       AND x.estado='cotejada' AND x.url_de_verificacion=f.url_original
       AND x.unidades_cotejadas=x.unidades_esperadas
       AND x.unidades_esperadas=(
         CASE WHEN f.tipo='excel' THEN
           (SELECT count(*) FROM v3_excel_celda c JOIN v3_excel_fila r ON r.fila_id=c.fila_id
            WHERE r.numero=a.numero AND r.fuente_id=f.fuente_id)
         ELSE (SELECT count(*) FROM v3_pdf_pagina p WHERE p.fuente_id=f.fuente_id) END)
       AND (f.tipo='excel' OR (f.paginas_originales=x.unidades_esperadas
             AND NOT EXISTS(SELECT 1 FROM v3_pdf_pagina p WHERE p.fuente_id=f.fuente_id AND p.cotejo_visual!='completo')))
       AND NOT EXISTS(
          SELECT 1 FROM v3_metrica_requerida m WHERE m.tipo_fuente=f.tipo
           AND NOT EXISTS(
             SELECT 1 FROM v3_revision_metrica z WHERE z.revision_id=x.revision_id
               AND z.metrica=m.metrica AND z.estado='cotejada'
               AND z.total_observado=z.total_cotejado
           )
       )
   )
 );
CREATE VIEW v3_metrica_principal AS
 SELECT (SELECT count(*) FROM v3_convocatorias_validadas) AS convocatorias_validadas,
        (SELECT count(*) FROM v3_convocatoria) AS convocatorias_identificadas;
CREATE VIEW v3_estado_por_convocatoria AS
 SELECT c.numero,CASE WHEN v.numero IS NOT NULL THEN 'validada'
   WHEN EXISTS(SELECT 1 FROM v3_incidencia i LEFT JOIN v3_resolucion_incidencia r ON r.incidencia_id=i.incidencia_id
       WHERE i.numero=c.numero AND i.criticidad='critica' AND r.incidencia_id IS NULL) THEN 'bloqueada'
   WHEN EXISTS(SELECT 1 FROM v3_convocatoria_fuente f WHERE f.numero=c.numero) THEN 'en_curso'
   ELSE 'no_iniciada' END AS estado
 FROM v3_convocatoria c LEFT JOIN v3_convocatorias_validadas v ON v.numero=c.numero;
