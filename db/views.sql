-- Vistas de consulta privadas. Ejecutar después de schema + semillas.
CREATE VIEW IF NOT EXISTS v_expedientes AS
SELECT c.caso_id,c.codigo_referencia,f.pestaña_literal,f.indice_fila,
 (SELECT COUNT(*) FROM vinculo_caso v WHERE v.caso_id=c.caso_id AND v.rol_en_caso='convocatoria') AS pdf_convocatorias_leidos,
 (SELECT COUNT(*) FROM vinculo_caso v WHERE v.caso_id=c.caso_id AND v.rol_en_caso='resultados') AS pdf_resultados_leidos,
 (SELECT COUNT(*) FROM evento_revision ev WHERE ev.objeto_tipo='caso_convocatoria' AND ev.objeto_id=c.caso_id AND ev.accion='documento_pendiente') AS referencias_pendientes,
 c.estado_conciliacion
FROM caso_convocatoria c
JOIN vinculo_caso vhoja ON vhoja.caso_id=c.caso_id AND vhoja.rol_en_caso='hoja_calculo'
JOIN fila_hoja f ON f.fila_id=vhoja.fila_id;

CREATE VIEW IF NOT EXISTS v_celdas_con_origen AS
SELECT c.codigo_referencia,f.pestaña_literal,f.indice_fila,
 x.columna_letra,x.encabezado_literal,x.valor_visible,x.valor_origen_json,x.hipervinculo,x.formula,x.nota
FROM caso_convocatoria c
JOIN vinculo_caso v ON v.caso_id=c.caso_id AND v.fila_id IS NOT NULL
JOIN fila_hoja f ON f.fila_id=v.fila_id
JOIN celda_hoja x ON x.fila_id=f.fila_id;

CREATE VIEW IF NOT EXISTS v_documentos_textuales AS
SELECT c.caso_id,c.codigo_referencia,v.rol_en_caso,d.documento_id,
 d.drive_id,d.url_origen,d.titulo_archivo,d.estado_extraccion,
 length(t.texto_original) AS caracteres_texto,
 (SELECT count(*) FROM pagina_pdf p WHERE p.documento_id=d.documento_id) AS paginas_estimadas
FROM documento d
JOIN vinculo_caso v ON v.documento_id=d.documento_id
JOIN caso_convocatoria c ON c.caso_id=v.caso_id
JOIN campo_documento t ON t.documento_id=d.documento_id AND t.ruta_campo='texto_extraido_integro';

CREATE VIEW IF NOT EXISTS v_postulaciones_provisionales AS
SELECT c.codigo_referencia,d.titulo_archivo,p.orden_en_tabla,p.identificacion_literal,
 p.observacion_literal,p.estado_revision
FROM postulacion p
JOIN publicacion_resultados r ON r.publicacion_id=p.publicacion_id
JOIN documento d ON d.documento_id=r.documento_id
JOIN vinculo_caso v ON v.documento_id=d.documento_id
JOIN caso_convocatoria c ON c.caso_id=v.caso_id;

CREATE VIEW IF NOT EXISTS v_hallazgos_pendientes AS
SELECT h.hallazgo_id,c.codigo_referencia,h.tipo,h.descripcion,h.evidencia_a_json,
 h.evidencia_b_json,h.estado,h.prioridad_revision
FROM hallazgo h LEFT JOIN caso_convocatoria c ON c.caso_id=h.caso_id
WHERE h.estado NOT IN ('cerrado','resuelto');
