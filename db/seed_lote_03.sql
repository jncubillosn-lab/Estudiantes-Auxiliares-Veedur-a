-- Veeduría UNAL / lote 3: transcripción literal y datos observados
-- Ejecutar sobre db/schema.sql. Cotejo visual de PDF pendiente.
BEGIN TRANSACTION;
INSERT INTO captura_hoja (captura_id,url_origen,titulo_original,capturada_en,parametros_json,notas) VALUES (3,'https://docs.google.com/spreadsheets/d/1f3qQNRiNwdFMtLrcBsP-JEgZwLBWmMVcq7QXCLo_Sps/edit','Copia de Convocatorias Estudiantes Auxiliares - Sede Bogotá','2026-11-13','{"lote":3,"archivo":"data/lotes/lote_03.json","version":"0.1.1"}','Transcripción completa como texto y renglones; campos heurísticos, casillas y posición de tablas sin cotejo visual. Se conservan identificadores literales.');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (301,'2026-C2362','sin_verificar','Lote 3, fuente Convocatorias Cerradas fila 4');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (301,3,'Convocatorias Cerradas',4,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3011,301,301,'hoja_calculo','2026-C2362','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6021,301,'A','Programa','Pregrado','{"stringValue":"Pregrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6022,301,'B','Facultad','Facultad de Ingeniería','{"stringValue":"Facultad de Ingeniería"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6023,301,'C','Programa curricular','Estudiante de Pregrado de Ingeniería de Sistemas y Computación','{"stringValue":"Estudiante de Pregrado de Ingeniería de Sistemas y Computación"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6024,301,'D','Archivo PDF de la convocatoria','2026-C2362','{"stringValue":"2026-C2362"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6025,301,'E','Estado de la convocatoria','Cerrada','{"stringValue":"Cerrada"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6026,301,'F','Resultados',NULL,NULL,NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":true,"italic":false,"underline":false},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6027,301,'G','Nombre de la convocatoria, proyecto o Proceso','Apoyo 2026 Dirección de Área Curricular de Sistemas e Industrial ','{"stringValue":"Apoyo 2026 Dirección de Área Curricular de Sistemas e Industrial "}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6028,301,'H','Correo del responsable','dacursci_fibog@unal.edu.co','{"stringValue":"dacursci_fibog@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6029,301,'I','Fecha de publicación','9-nov-2026','{"numberValue":46335}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6030,301,'J','Fecha y hora de cierre de la convocatoria','13/11/2026 8:00:00 a. m.','{"numberValue":46339.333333333336}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6031,301,'K','Número de convocatoria','2026-C2362','{"stringValue":"2026-C2362"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3011,'caso_convocatoria',301,'documento_pendiente','{"rol":"convocatoria","referencia_celda":"2026-C2362","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3012,'caso_convocatoria',301,'documento_pendiente','{"rol":"resultados","referencia_celda":"","motivo":"celda_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (302,'2026-C2327','sin_verificar','Lote 3, fuente Convocatorias Cerradas fila 22');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (302,3,'Convocatorias Cerradas',22,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3021,302,302,'hoja_calculo','2026-C2327','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6041,302,'A','Programa','Pregrado','{"stringValue":"Pregrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6042,302,'B','Facultad','Sede Bogotá','{"stringValue":"Sede Bogotá"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6043,302,'C','Programa curricular','Estudiante de pregrado del programa curricular de Medicina Veterinaria de la Universidad Nacional de Colombia, Sede Bogotá, admitido mediante el PEAMA Sumapaz, que se encuentre desarrollando su trabajo de grado en la localidad 20 y acredite un avance académico superior al 88%.','{"stringValue":"Estudiante de pregrado del programa curricular de Medicina Veterinaria de la Universidad Nacional de Colombia, Sede Bogotá, admitido mediante el PEAMA Sumapaz, que se encuentre desarrollando su trabajo de grado en la localidad 20 y acredite un avance académico superior al 88%."}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6044,302,'D','Archivo PDF de la convocatoria','2026-C2327','{"stringValue":"2026-C2327"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6045,302,'E','Estado de la convocatoria','Cerrada','{"stringValue":"Cerrada"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6046,302,'F','Resultados','Resultados 2026-C2327','{"stringValue":"Resultados 2026-C2327"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6047,302,'G','Nombre de la convocatoria, proyecto o Proceso','   	 	  		 Estudiante auxiliar para el apoyo a las actividades agropecuarias y de extensión del PEAMA Sumapaz ','{"stringValue":"   \t \t  \t\t Estudiante auxiliar para el apoyo a las actividades agropecuarias y de extensión del PEAMA Sumapaz "}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6048,302,'H','Correo del responsable','peama_sum_bog@unal.edu.co','{"stringValue":"peama_sum_bog@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6049,302,'I','Fecha de publicación','4-nov-2026','{"numberValue":46330}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6050,302,'J','Fecha y hora de cierre de la convocatoria','11/11/2026 9:00:00 a. m.','{"numberValue":46337.375}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6051,302,'K','Número de convocatoria','2026-C2327','{"stringValue":"2026-C2327"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3021,'caso_convocatoria',302,'documento_pendiente','{"rol":"convocatoria","referencia_celda":"2026-C2327","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3022,'caso_convocatoria',302,'documento_pendiente','{"rol":"resultados","referencia_celda":"Resultados 2026-C2327","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (303,'2026-C2323','sin_verificar','Lote 3, fuente Convocatorias Cerradas fila 27');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (303,3,'Convocatorias Cerradas',27,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3031,303,303,'hoja_calculo','2026-C2323','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6061,303,'A','Programa','Pregrado','{"stringValue":"Pregrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6062,303,'B','Facultad','Facultad de Medicina Veterinaria y Zootécnia','{"stringValue":"Facultad de Medicina Veterinaria y Zootécnia"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6063,303,'C','Programa curricular','Estudiante activo de la Universidad Nacional de Colombia','{"stringValue":"Estudiante activo de la Universidad Nacional de Colombia"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6064,303,'D','Archivo PDF de la convocatoria','2026-C2323','{"stringValue":"2026-C2323"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6065,303,'E','Estado de la convocatoria','Cerrada','{"stringValue":"Cerrada"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6066,303,'F','Resultados','Resultados 2026-C2323','{"stringValue":"Resultados 2026-C2323"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6067,303,'G','Nombre de la convocatoria, proyecto o Proceso','Apoyo a las actividades deportivas de la Dirección de Bienestar de la FMVZ','{"stringValue":"Apoyo a las actividades deportivas de la Dirección de Bienestar de la FMVZ"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6068,303,'H','Correo del responsable','wpinedac@unal.edu.co','{"stringValue":"wpinedac@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6069,303,'I','Fecha de publicación','4-nov-2026','{"numberValue":46330}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6070,303,'J','Fecha y hora de cierre de la convocatoria','11/11/2026 8:00:00 a. m.','{"numberValue":46337.333333333336}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6071,303,'K','Número de convocatoria','2026-C2323','{"stringValue":"2026-C2323"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3031,'caso_convocatoria',303,'documento_pendiente','{"rol":"convocatoria","referencia_celda":"2026-C2323","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3032,'caso_convocatoria',303,'documento_pendiente','{"rol":"resultados","referencia_celda":"Resultados 2026-C2323","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (304,'2026-C2307','sin_verificar','Lote 3, fuente Convocatorias Cerradas fila 41');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (304,3,'Convocatorias Cerradas',41,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3041,304,304,'hoja_calculo','2026-C2307','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6081,304,'A','Programa','Pregrado','{"stringValue":"Pregrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6082,304,'B','Facultad','Sede Tumaco','{"stringValue":"Sede Tumaco"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6083,304,'C','Programa curricular','Ser estudiante activo de alguno de los programas curriculares definidos como pertinentes para la convocatoria de la Sede Tumaco: Administración de Empresas, Administración de Sistemas Informáticos, Antropología, Arquitectura, Construcción, Derecho, Diseño Industrial, Estadística, Gestión Cultural y Comunicativa, Ingeniería Administrativa, Ingeniería Civil, Ingeniería de Control, Ingeniería de Sistemas e Informática, Ingeniería Eléctrica, Ingeniería Industrial y Diseño Industrial','{"stringValue":"Ser estudiante activo de alguno de los programas curriculares definidos como pertinentes para la convocatoria de la Sede Tumaco: Administración de Empresas, Administración de Sistemas Informáticos, Antropología, Arquitectura, Construcción, Derecho, Diseño Industrial, Estadística, Gestión Cultural y Comunicativa, Ingeniería Administrativa, Ingeniería Civil, Ingeniería de Control, Ingeniería de Sistemas e Informática, Ingeniería Eléctrica, Ingeniería Industrial y Diseño Industrial"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6084,304,'D','Archivo PDF de la convocatoria','2026-C2307','{"stringValue":"2026-C2307"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6085,304,'E','Estado de la convocatoria','Cerrada','{"stringValue":"Cerrada"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6086,304,'F','Resultados','Resultados 2026-C2307','{"stringValue":"Resultados 2026-C2307"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6087,304,'G','Nombre de la convocatoria, proyecto o Proceso','VINCULACIÓN DE UN (1) ESTUDIANTE AUXILIAR DE PREGRADO PARA APOYAR DIFERENTES ACTIVIDADES A DESARROLLAR EN EL PROYECTO DE INVERSION: CONSTRUCCION DE LA POLITICA NACIONAL DE ORDENAMIENTO Y DESARROLLO FISICO PARA LA UNIVERSIDAD NACIONAL DE COLOMBIA”, EJECUTADO A TRAVÉS DE LA VICERRECTORIA GENERAL.','{"stringValue":"VINCULACIÓN DE UN (1) ESTUDIANTE AUXILIAR DE PREGRADO PARA APOYAR DIFERENTES ACTIVIDADES A DESARROLLAR EN EL PROYECTO DE INVERSION: CONSTRUCCION DE LA POLITICA NACIONAL DE ORDENAMIENTO Y DESARROLLO FISICO PARA LA UNIVERSIDAD NACIONAL DE COLOMBIA”, EJECUTADO A TRAVÉS DE LA VICERRECTORIA GENERAL."}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6088,304,'H','Correo del responsable','gacastabod@unal.edu.co','{"stringValue":"gacastabod@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6089,304,'I','Fecha de publicación','3-nov-2026','{"numberValue":46329}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6090,304,'J','Fecha y hora de cierre de la convocatoria','9/11/2026 4:00:00 p. m.','{"numberValue":46335.666666666664}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6091,304,'K','Número de convocatoria','2026-C2307','{"stringValue":"2026-C2307"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3041,'caso_convocatoria',304,'documento_pendiente','{"rol":"convocatoria","referencia_celda":"2026-C2307","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3042,'caso_convocatoria',304,'documento_pendiente','{"rol":"resultados","referencia_celda":"Resultados 2026-C2307","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (305,'2026-C2304','sin_verificar','Lote 3, fuente Convocatorias Cerradas fila 44');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (305,3,'Convocatorias Cerradas',44,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3051,305,305,'hoja_calculo','2026-C2304','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6101,305,'A','Programa','Pregrado','{"stringValue":"Pregrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6102,305,'B','Facultad','Facultad de Artes','{"stringValue":"Facultad de Artes"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6103,305,'C','Programa curricular','Estudiante del pregrado en arquitectura ','{"stringValue":"Estudiante del pregrado en arquitectura "}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6104,305,'D','Archivo PDF de la convocatoria','2026-C2304','{"stringValue":"2026-C2304"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6105,305,'E','Estado de la convocatoria','Cerrada','{"stringValue":"Cerrada"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6106,305,'F','Resultados','Resultados 2026-C2304','{"stringValue":"Resultados 2026-C2304"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6107,305,'G','Nombre de la convocatoria, proyecto o Proceso','Eventos Reflexiones sobre el proyecto arquitectónico en los 90 años de la Escuela de Arquitectura','{"stringValue":"Eventos Reflexiones sobre el proyecto arquitectónico en los 90 años de la Escuela de Arquitectura"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6108,305,'H','Correo del responsable',' jcaguilerar@unal.edu.co, maearq_farbog@unal.edu.co','{"stringValue":" jcaguilerar@unal.edu.co, maearq_farbog@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6109,305,'I','Fecha de publicación','3-nov-2026','{"numberValue":46329}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6110,305,'J','Fecha y hora de cierre de la convocatoria','9/11/2026 2:00:00 p. m.','{"numberValue":46335.583333333336}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6111,305,'K','Número de convocatoria','2026-C2304','{"stringValue":"2026-C2304"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3051,'caso_convocatoria',305,'documento_pendiente','{"rol":"convocatoria","referencia_celda":"2026-C2304","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3052,'caso_convocatoria',305,'documento_pendiente','{"rol":"resultados","referencia_celda":"Resultados 2026-C2304","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (306,'2026-C2303','sin_verificar','Lote 3, fuente Convocatorias Cerradas fila 45');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (306,3,'Convocatorias Cerradas',45,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3061,306,306,'hoja_calculo','2026-C2303','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6121,306,'A','Programa','Pregrado','{"stringValue":"Pregrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6122,306,'B','Facultad','Facultad de Ciencias Humanas','{"stringValue":"Facultad de Ciencias Humanas"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6123,306,'C','Programa curricular','Estudiante de Pregrado en Psicología ','{"stringValue":"Estudiante de Pregrado en Psicología "}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6124,306,'D','Archivo PDF de la convocatoria','2026-C2303','{"stringValue":"2026-C2303"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6125,306,'E','Estado de la convocatoria','Cerrada','{"stringValue":"Cerrada"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6126,306,'F','Resultados','Resultados 2026-C2303','{"stringValue":"Resultados 2026-C2303"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6127,306,'G','Nombre de la convocatoria, proyecto o Proceso','Apoyo de actividades académicas sublínea de investigación: "Socialización y Crianza"','{"stringValue":"Apoyo de actividades académicas sublínea de investigación: \"Socialización y Crianza\""}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6128,306,'H','Correo del responsable','crfuentesm@unal.edu.co','{"stringValue":"crfuentesm@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6129,306,'I','Fecha de publicación','3-nov-2026','{"numberValue":46329}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6130,306,'J','Fecha y hora de cierre de la convocatoria','9/11/2026 9:00:00 a. m.','{"numberValue":46335.375}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6131,306,'K','Número de convocatoria','2026-C2303','{"stringValue":"2026-C2303"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3061,'caso_convocatoria',306,'documento_pendiente','{"rol":"convocatoria","referencia_celda":"2026-C2303","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3062,'caso_convocatoria',306,'documento_pendiente','{"rol":"resultados","referencia_celda":"Resultados 2026-C2303","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (307,'2026-C2302','sin_verificar','Lote 3, fuente Convocatorias Cerradas fila 46');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (307,3,'Convocatorias Cerradas',46,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3071,307,307,'hoja_calculo','2026-C2302','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6141,307,'A','Programa','Posgrado','{"stringValue":"Posgrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6142,307,'B','Facultad','Facultad de Ciencias Agrarias','{"stringValue":"Facultad de Ciencias Agrarias"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6143,307,'C','Programa curricular','Ser estudiante activo de la maestría en Geomática','{"stringValue":"Ser estudiante activo de la maestría en Geomática"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6144,307,'D','Archivo PDF de la convocatoria','2026-C2302','{"stringValue":"2026-C2302"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6145,307,'E','Estado de la convocatoria','Cerrada','{"stringValue":"Cerrada"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6146,307,'F','Resultados','https://drive.google.com/file/d/1_o5qd2kfk7wmQROkY_AfJyQk_E0uxLw-/view?usp=drivesdk','{"stringValue":"https://drive.google.com/file/d/1_o5qd2kfk7wmQROkY_AfJyQk_E0uxLw-/view?usp=drivesdk"}',NULL,'https://drive.google.com/file/d/1_o5qd2kfk7wmQROkY_AfJyQk_E0uxLw-/view?usp=drivesdk',NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false,"link":{"uri":"https://drive.google.com/file/d/1_o5qd2kfk7wmQROkY_AfJyQk_E0uxLw-/view?usp=drivesdk"}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6147,307,'G','Nombre de la convocatoria, proyecto o Proceso','Apoyo proyecto de investigación geomática -malezas','{"stringValue":"Apoyo proyecto de investigación geomática -malezas"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6148,307,'H','Correo del responsable','lcastillov@unal.edu.co','{"stringValue":"lcastillov@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6149,307,'I','Fecha de publicación','3-nov-2026','{"numberValue":46329}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6150,307,'J','Fecha y hora de cierre de la convocatoria','9/11/2026 5:00:00 p. m.','{"numberValue":46335.708333333336}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6151,307,'K','Número de convocatoria','2026-C2302','{"stringValue":"2026-C2302"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3071,'caso_convocatoria',307,'documento_pendiente','{"rol":"convocatoria","referencia_celda":"2026-C2302","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO documento (documento_id,tipo_sugerido,url_origen,drive_id,titulo_archivo,mime_type,capturado_en,estado_acceso,estado_extraccion,notas) VALUES (3001,'resultados','https://drive.google.com/file/d/1_o5qd2kfk7wmQROkY_AfJyQk_E0uxLw-/view?usp=drivesdk','1_o5qd2kfk7wmQROkY_AfJyQk_E0uxLw-','Resultados 2026-C2302','application/pdf','2026-11-13','leido','transcrito_sin_cotejo_visual','El PDF binario y su huella SHA256 no se han incorporado; texto extraído literalmente disponible en campo_documento y renglones.');
INSERT INTO vinculo_caso (vinculo_id,caso_id,documento_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3073,307,3001,'resultados','Resultados 2026-C2302','transcrito_pendiente_revision');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,estado_revision) VALUES (3001001,3001,'texto_extraido_integro',1,'Transcripción íntegra devuelta por Drive','Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 3
Nombre de la convocatoria
Estudiante auxiliar apoyo a investigación en 
Geomática 
Número de la convocatoria
2026-C2302 N.º de estudiantes 
a vincular
1
Facultad, dependencia o 
proyecto
Departamento de Agronomía
Fecha de publicación de la 
convocatoria 03 11 2026
Fecha de publicación de 
resultados 13 11 2026
Requisitos Generales
(Art. 2 Acuerdo CSU 024 de 
2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia. 
b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un 
Promedio Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para estudiantes de 
pregrado, e igual o superior a 4.0 para estudiantes de posgrado. 
c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar 
universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético 
Ponderado Acumulado - P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o 
superior a 4.0 para estudiantes de posgrado
d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que 
obtuvieron la beca de posgrado por la distinción de Grado de Honor de la Universidad Nacional 
de Colombia.
e. No tener calidad de funcionario público (administrativo o docente de planta) de la Universidad 
Nacional de Colombia.
f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e 
inscrita al menos la carga mínima exigida por el Estatuto Estudiantil. 
g. No haber tenido sanciones disciplinarias.
PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de 
apoyo a estudiantes en las cuales no se reciba una retribución económica por la realización de 
actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo 
de su actividad académica. 
PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer 
periodo académico de un programade posgrado cumplir una de las siguientes condiciones, de 
acuerdo con el tipo de admisión, así: 
1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.
2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo 
008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones 
académicas.
3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico igual 
o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.
Perfil requerido
Ser estudiante activo de la maestría en Geomática.
Puntualidad en el cumplimiento de compromisos y alto sentido de responsabilidad y
compromiso con las actividades asignadas en el marco del proyecto de investigación.
Disposición para el trabajo en equipo multidisciplinario.
Manejo de herramientas informáticas para la organización y sistematización de datos de campo.
Poseer nociones y conceptos fundamentales en percepción remota proximal aplicada a la 
vegetación y manejo de lenguajes de programación como python o R para la gestión y 
estructuración de bases de datos espectrales
CRITERIOS DE SELECCIÓN Y EVALUACIÓNMacroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 3
Criterios Ponderación 
(Asigne el peso porcentual de cada criterio)
1 P.A.P.A. 25%
2 Entrevista 35%
3 Disponibilidad de tiempo 10%
4 Conocimientos específicos 30%
5
6
7
Sumatoria 
de 
porcentajes
100%
DATOS DE LOS PARTICIPANTES
No. Identificación
Puntaje por Criterio
(De 0 a 5) (PBM de 0 a 100)
*P.A.P.A. 
O puntaje 
de admisión 
(PA) (SI/NO)
P.B.M.
(si 
aplica)
1 2 3 4 5 6 7 Total Seleccionad
o
1 1070984476 4 4 4.4 4.3 4.2 4.23 X
2
3
4
5
6
7
8
9
10
• Se deben relacionar todos los participantes que aplicaron a la convocatoria.
• Si el (la-los) estudiante(s) incumple(n) alguno de los Requisitos mínimos no se debe continuar con la evaluación de la hoja de 
vida.
• En caso de empate en el puntaje total, se dará prelación a los estudiantes cuyos puntajes básicos de matrícula (PBM) sean los 
más bajos. (En caso que aplique)
• Marque una X en la columna "Seleccionado" para identificar el (los) ganador(es) de la convocatoria.
• Marque con la palabra “Elegible” a el (la-los) estudiante(s) que quedará(n) en la lista de elegible(s).
Certifico que el (los) estudiante(s) seleccionado(s) fue(ron) consultado(s) y manifiesta(n) no recibir ningún otro beneficio 
económico de la Universidad Nacional de Colombia y que no está(n) inhabilitado(s) para ser vinculado(s) como Estudiante(s) 
Auxiliar(es), a su vez asumo la responsabilidad de todo el proceso de selección del estudiante.
En caso de que no se haya seleccionado a ningún estudiante como ganador de la convocatoria especifique el motivo:Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 3 de 3
Observaciones:
NOMBRE DEL 
RESPONSABLE DE LA 
EVALUACIÓN
Liliana Carolina Castillo Villamor
CARGO Profesora Auxiliar
EXTENSIÓN 19073
CORREO lcastillov@unal.edu.co
_________________________________
(Original Firmado
Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de 
identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección 
por los canales de divulgación que la Universidad disponga para tal fin.
En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal 
recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección 
de Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual 
puede ser consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que 
garantizan la seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar 
las autorizaciones dadas a lasfinalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail
protecdatos_na@unal.edu.co.','sin_cotejo_visual');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3001002,3001,'número_de_la',1,'Número de la','Número de la convocatoria
2026-C2302 N.º de estudiantes 
a vincular
1
Facultad, dependencia o 
proyecto
Departamento de Agronomía
Fecha de publ','{"desplazamiento":262,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3001003,3001,'fecha_de_publicación_de_la',1,'Fecha de publicación de la','Fecha de publicación de la 
convocatoria 03 11 2026
Fecha de publicación de 
resultados 13 11 2026
Requisitos Generales
(Art. 2 Acuerdo CSU 024 d','{"desplazamiento":399,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3001004,3001,'nombre_de_la',1,'Nombre de la','Nombre de la convocatoria
Estudiante auxiliar apoyo a investigación en 
Geomática 
Número de la convocatoria
2026-C2302 N.º de estudiantes 
a vin','{"desplazamiento":176,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3001005,3001,'perfil_requerido',1,'Perfil requerido','Perfil requerido
Ser estudiante activo de la maestría en Geomática.
Puntualidad en el cumplimiento de compromisos y alto sentido de responsabilidad ','{"desplazamiento":2816,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3001006,3001,'actividades_a_desarrollar',1,'actividades a desarrollar','actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un 
Promedio Aritmético Ponderado Acumulado - P.A.P.A. igual o ','{"desplazamiento":670,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3001007,3001,'actividades_a_desarrollar',2,'actividades a desarrollar','actividades a desarrollar están relacionadas con investigación, extensión, bienestar 
universitario o de gestión administrativa el estudiante deberá ','{"desplazamiento":935,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3001008,3001,'disponibilidad_de_tiempo',1,'Disponibilidad de tiempo','Disponibilidad de tiempo 10%
4 Conocimientos específicos 30%
5
6
7
Sumatoria 
de 
porcentajes
100%
DATOS DE LOS PARTICIPANTES
No. Identifica','{"desplazamiento":3744,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3001009,3001,'responsable_de_la',1,'RESPONSABLE DE LA','RESPONSABLE DE LA 
EVALUACIÓN
Liliana Carolina Castillo Villamor
CARGO Profesora Auxiliar
EXTENSIÓN 19073
CORREO lcastillov@unal.edu.co
________','{"desplazamiento":5386,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3001010,3001,'datos_de_los_participantes',1,'DATOS DE LOS PARTICIPANTES','DATOS DE LOS PARTICIPANTES
No. Identificación
Puntaje por Criterio
(De 0 a 5) (PBM de 0 a 100)
*P.A.P.A. 
O puntaje 
de admisión 
(PA) (SI/NO)','{"desplazamiento":3852,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3001011,3001,'observaciones',1,'Observaciones','Observaciones:
NOMBRE DEL 
RESPONSABLE DE LA 
EVALUACIÓN
Liliana Carolina Castillo Villamor
CARGO Profesora Auxiliar
EXTENSIÓN 19073
CORREO lca','{"desplazamiento":5357,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300101,3001,1,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 3
Nombre de la convocatoria
Estudiante auxiliar apoyo a investigación en 
Geomática 
Número de la convocatoria
2026-C2302 N.º de estudiantes 
a vincular
1
Facultad, dependencia o 
proyecto
Departamento de Agronomía
Fecha de publicación de la 
convocatoria 03 11 2026
Fecha de publicación de 
resultados 13 11 2026
Requisitos Generales
(Art. 2 Acuerdo CSU 024 de 
2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia. 
b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un 
Promedio Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para estudiantes de 
pregrado, e igual o superior a 4.0 para estudiantes de posgrado. 
c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar 
universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético 
Ponderado Acumulado - P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o 
superior a 4.0 para estudiantes de posgrado
d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que 
obtuvieron la beca de posgrado por la distinción de Grado de Honor de la Universidad Nacional 
de Colombia.
e. No tener calidad de funcionario público (administrativo o docente de planta) de la Universidad 
Nacional de Colombia.
f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e 
inscrita al menos la carga mínima exigida por el Estatuto Estudiantil. 
g. No haber tenido sanciones disciplinarias.
PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de 
apoyo a estudiantes en las cuales no se reciba una retribución económica por la realización de 
actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo 
de su actividad académica. 
PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer 
periodo académico de un programade posgrado cumplir una de las siguientes condiciones, de 
acuerdo con el tipo de admisión, así: 
1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.
2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo 
008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones 
académicas.
3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico igual 
o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.
Perfil requerido
Ser estudiante activo de la maestría en Geomática.
Puntualidad en el cumplimiento de compromisos y alto sentido de responsabilidad y
compromiso con las actividades asignadas en el marco del proyecto de investigación.
Disposición para el trabajo en equipo multidisciplinario.
Manejo de herramientas informáticas para la organización y sistematización de datos de campo.
Poseer nociones y conceptos fundamentales en percepción remota proximal aplicada a la 
vegetación y manejo de lenguajes de programación como python o R para la gestión y 
estructuración de bases de datos espectrales
CRITERIOS DE SELECCIÓN Y EVALUACIÓN','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101001,300101,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101002,300101,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101003,300101,3,'renglon_literal','Formato selección estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101004,300101,4,'renglon_literal','Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101005,300101,5,'renglon_literal','Nombre de la convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101006,300101,6,'renglon_literal','Estudiante auxiliar apoyo a investigación en ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101007,300101,7,'renglon_literal','Geomática ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101008,300101,8,'renglon_literal','Número de la convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101009,300101,9,'renglon_literal','2026-C2302 N.º de estudiantes ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101010,300101,10,'renglon_literal','a vincular','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101011,300101,11,'renglon_literal','1','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101012,300101,12,'renglon_literal','Facultad, dependencia o ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101013,300101,13,'renglon_literal','proyecto','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101014,300101,14,'renglon_literal','Departamento de Agronomía','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101015,300101,15,'renglon_literal','Fecha de publicación de la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101016,300101,16,'renglon_literal','convocatoria 03 11 2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101017,300101,17,'renglon_literal','Fecha de publicación de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101018,300101,18,'renglon_literal','resultados 13 11 2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101019,300101,19,'renglon_literal','Requisitos Generales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101020,300101,20,'renglon_literal','(Art. 2 Acuerdo CSU 024 de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101021,300101,21,'renglon_literal','2022)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101022,300101,22,'renglon_literal','a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101023,300101,23,'renglon_literal','b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101024,300101,24,'renglon_literal','Promedio Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para estudiantes de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101025,300101,25,'renglon_literal','pregrado, e igual o superior a 4.0 para estudiantes de posgrado. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101026,300101,26,'renglon_literal','c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101027,300101,27,'renglon_literal','universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101028,300101,28,'renglon_literal','Ponderado Acumulado - P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101029,300101,29,'renglon_literal','superior a 4.0 para estudiantes de posgrado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101030,300101,30,'renglon_literal','d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101031,300101,31,'renglon_literal','obtuvieron la beca de posgrado por la distinción de Grado de Honor de la Universidad Nacional ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101032,300101,32,'renglon_literal','de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101033,300101,33,'renglon_literal','e. No tener calidad de funcionario público (administrativo o docente de planta) de la Universidad ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101034,300101,34,'renglon_literal','Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101035,300101,35,'renglon_literal','f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101036,300101,36,'renglon_literal','inscrita al menos la carga mínima exigida por el Estatuto Estudiantil. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101037,300101,37,'renglon_literal','g. No haber tenido sanciones disciplinarias.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101038,300101,38,'renglon_literal','PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101039,300101,39,'renglon_literal','apoyo a estudiantes en las cuales no se reciba una retribución económica por la realización de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101040,300101,40,'renglon_literal','actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101041,300101,41,'renglon_literal','de su actividad académica. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101042,300101,42,'renglon_literal','PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101043,300101,43,'renglon_literal','periodo académico de un programade posgrado cumplir una de las siguientes condiciones, de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101044,300101,44,'renglon_literal','acuerdo con el tipo de admisión, así: ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101045,300101,45,'renglon_literal','1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101046,300101,46,'renglon_literal','2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101047,300101,47,'renglon_literal','008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101048,300101,48,'renglon_literal','académicas.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101049,300101,49,'renglon_literal','3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico igual ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101050,300101,50,'renglon_literal','o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101051,300101,51,'renglon_literal','Perfil requerido','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101052,300101,52,'renglon_literal','Ser estudiante activo de la maestría en Geomática.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101053,300101,53,'renglon_literal','Puntualidad en el cumplimiento de compromisos y alto sentido de responsabilidad y','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101054,300101,54,'renglon_literal','compromiso con las actividades asignadas en el marco del proyecto de investigación.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101055,300101,55,'renglon_literal','Disposición para el trabajo en equipo multidisciplinario.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101056,300101,56,'renglon_literal','Manejo de herramientas informáticas para la organización y sistematización de datos de campo.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101057,300101,57,'renglon_literal','Poseer nociones y conceptos fundamentales en percepción remota proximal aplicada a la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101058,300101,58,'renglon_literal','vegetación y manejo de lenguajes de programación como python o R para la gestión y ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101059,300101,59,'renglon_literal','estructuración de bases de datos espectrales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300101060,300101,60,'renglon_literal','CRITERIOS DE SELECCIÓN Y EVALUACIÓN','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300102,3001,2,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 3
Criterios Ponderación 
(Asigne el peso porcentual de cada criterio)
1 P.A.P.A. 25%
2 Entrevista 35%
3 Disponibilidad de tiempo 10%
4 Conocimientos específicos 30%
5
6
7
Sumatoria 
de 
porcentajes
100%
DATOS DE LOS PARTICIPANTES
No. Identificación
Puntaje por Criterio
(De 0 a 5) (PBM de 0 a 100)
*P.A.P.A. 
O puntaje 
de admisión 
(PA) (SI/NO)
P.B.M.
(si 
aplica)
1 2 3 4 5 6 7 Total Seleccionad
o
1 1070984476 4 4 4.4 4.3 4.2 4.23 X
2
3
4
5
6
7
8
9
10
• Se deben relacionar todos los participantes que aplicaron a la convocatoria.
• Si el (la-los) estudiante(s) incumple(n) alguno de los Requisitos mínimos no se debe continuar con la evaluación de la hoja de 
vida.
• En caso de empate en el puntaje total, se dará prelación a los estudiantes cuyos puntajes básicos de matrícula (PBM) sean los 
más bajos. (En caso que aplique)
• Marque una X en la columna "Seleccionado" para identificar el (los) ganador(es) de la convocatoria.
• Marque con la palabra “Elegible” a el (la-los) estudiante(s) que quedará(n) en la lista de elegible(s).
Certifico que el (los) estudiante(s) seleccionado(s) fue(ron) consultado(s) y manifiesta(n) no recibir ningún otro beneficio 
económico de la Universidad Nacional de Colombia y que no está(n) inhabilitado(s) para ser vinculado(s) como Estudiante(s) 
Auxiliar(es), a su vez asumo la responsabilidad de todo el proceso de selección del estudiante.
En caso de que no se haya seleccionado a ningún estudiante como ganador de la convocatoria especifique el motivo:','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102001,300102,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102002,300102,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102003,300102,3,'renglon_literal','Formato selección estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102004,300102,4,'renglon_literal','Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102005,300102,5,'renglon_literal','Criterios Ponderación ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102006,300102,6,'renglon_literal','(Asigne el peso porcentual de cada criterio)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102007,300102,7,'renglon_literal','1 P.A.P.A. 25%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102008,300102,8,'renglon_literal','2 Entrevista 35%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102009,300102,9,'renglon_literal','3 Disponibilidad de tiempo 10%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102010,300102,10,'renglon_literal','4 Conocimientos específicos 30%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102011,300102,11,'renglon_literal','5','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102012,300102,12,'renglon_literal','6','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102013,300102,13,'renglon_literal','7','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102014,300102,14,'renglon_literal','Sumatoria ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102015,300102,15,'renglon_literal','de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102016,300102,16,'renglon_literal','porcentajes','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102017,300102,17,'renglon_literal','100%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102018,300102,18,'renglon_literal','DATOS DE LOS PARTICIPANTES','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102019,300102,19,'renglon_literal','No. Identificación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102020,300102,20,'renglon_literal','Puntaje por Criterio','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102021,300102,21,'renglon_literal','(De 0 a 5) (PBM de 0 a 100)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102022,300102,22,'renglon_literal','*P.A.P.A. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102023,300102,23,'renglon_literal','O puntaje ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102024,300102,24,'renglon_literal','de admisión ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102025,300102,25,'renglon_literal','(PA) (SI/NO)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102026,300102,26,'renglon_literal','P.B.M.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102027,300102,27,'renglon_literal','(si ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102028,300102,28,'renglon_literal','aplica)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102029,300102,29,'renglon_literal','1 2 3 4 5 6 7 Total Seleccionad','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102030,300102,30,'renglon_literal','o','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102031,300102,31,'renglon_literal','1 1070984476 4 4 4.4 4.3 4.2 4.23 X','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102032,300102,32,'renglon_literal','2','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102033,300102,33,'renglon_literal','3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102034,300102,34,'renglon_literal','4','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102035,300102,35,'renglon_literal','5','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102036,300102,36,'renglon_literal','6','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102037,300102,37,'renglon_literal','7','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102038,300102,38,'renglon_literal','8','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102039,300102,39,'renglon_literal','9','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102040,300102,40,'renglon_literal','10','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102041,300102,41,'renglon_literal','• Se deben relacionar todos los participantes que aplicaron a la convocatoria.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102042,300102,42,'renglon_literal','• Si el (la-los) estudiante(s) incumple(n) alguno de los Requisitos mínimos no se debe continuar con la evaluación de la hoja de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102043,300102,43,'renglon_literal','vida.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102044,300102,44,'renglon_literal','• En caso de empate en el puntaje total, se dará prelación a los estudiantes cuyos puntajes básicos de matrícula (PBM) sean los ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102045,300102,45,'renglon_literal','más bajos. (En caso que aplique)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102046,300102,46,'renglon_literal','• Marque una X en la columna "Seleccionado" para identificar el (los) ganador(es) de la convocatoria.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102047,300102,47,'renglon_literal','• Marque con la palabra “Elegible” a el (la-los) estudiante(s) que quedará(n) en la lista de elegible(s).','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102048,300102,48,'renglon_literal','Certifico que el (los) estudiante(s) seleccionado(s) fue(ron) consultado(s) y manifiesta(n) no recibir ningún otro beneficio ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102049,300102,49,'renglon_literal','económico de la Universidad Nacional de Colombia y que no está(n) inhabilitado(s) para ser vinculado(s) como Estudiante(s) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102050,300102,50,'renglon_literal','Auxiliar(es), a su vez asumo la responsabilidad de todo el proceso de selección del estudiante.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300102051,300102,51,'renglon_literal','En caso de que no se haya seleccionado a ningún estudiante como ganador de la convocatoria especifique el motivo:','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300103,3001,3,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 3 de 3
Observaciones:
NOMBRE DEL 
RESPONSABLE DE LA 
EVALUACIÓN
Liliana Carolina Castillo Villamor
CARGO Profesora Auxiliar
EXTENSIÓN 19073
CORREO lcastillov@unal.edu.co
_________________________________
(Original Firmado
Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de 
identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección 
por los canales de divulgación que la Universidad disponga para tal fin.
En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal 
recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección 
de Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual 
puede ser consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que 
garantizan la seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar 
las autorizaciones dadas a lasfinalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail
protecdatos_na@unal.edu.co.','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103001,300103,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103002,300103,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103003,300103,3,'renglon_literal','Formato selección estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103004,300103,4,'renglon_literal','Código: U.FT.05.007.014 Versión: 2.0 Página 3 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103005,300103,5,'renglon_literal','Observaciones:','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103006,300103,6,'renglon_literal','NOMBRE DEL ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103007,300103,7,'renglon_literal','RESPONSABLE DE LA ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103008,300103,8,'renglon_literal','EVALUACIÓN','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103009,300103,9,'renglon_literal','Liliana Carolina Castillo Villamor','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103010,300103,10,'renglon_literal','CARGO Profesora Auxiliar','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103011,300103,11,'renglon_literal','EXTENSIÓN 19073','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103012,300103,12,'renglon_literal','CORREO lcastillov@unal.edu.co','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103013,300103,13,'renglon_literal','_________________________________','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103014,300103,14,'renglon_literal','(Original Firmado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103015,300103,15,'renglon_literal','Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103016,300103,16,'renglon_literal','identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103017,300103,17,'renglon_literal','por los canales de divulgación que la Universidad disponga para tal fin.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103018,300103,18,'renglon_literal','En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103019,300103,19,'renglon_literal','recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103020,300103,20,'renglon_literal','de Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103021,300103,21,'renglon_literal','puede ser consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103022,300103,22,'renglon_literal','garantizan la seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103023,300103,23,'renglon_literal','las autorizaciones dadas a lasfinalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300103024,300103,24,'renglon_literal','protecdatos_na@unal.edu.co.','pendiente');
INSERT INTO publicacion_resultados (publicacion_id,documento_id,codigo_convocatoria_literal,nombre_literal,estado_revision) VALUES (3001,3001,'2026-C2302','Resultados 2026-C2302','pendiente_cotejo_visual');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (3001001,3001,1,'1070984476','1 1070984476 4 4 4.4 4.3 4.2 4.23 X','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300100101,3001001,1,'token_de_fila','posición_léxica_1','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300100102,3001001,2,'token_de_fila','posición_léxica_2','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300100103,3001001,3,'token_de_fila','posición_léxica_3','4.4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300100104,3001001,4,'token_de_fila','posición_léxica_4','4.3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300100105,3001001,5,'token_de_fila','posición_léxica_5','4.2','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300100106,3001001,6,'token_de_fila','posición_léxica_6','4.23','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300100107,3001001,7,'token_de_fila','posición_léxica_7','X','sin_correspondencia_validada_con_encabezado');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (308,'2026-C2300','sin_verificar','Lote 3, fuente Convocatorias Cerradas fila 48');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (308,3,'Convocatorias Cerradas',48,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3081,308,308,'hoja_calculo','2026-C2300','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6161,308,'A','Programa','Posgrado','{"stringValue":"Posgrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6162,308,'B','Facultad','Facultad de Ciencias Agrarias','{"stringValue":"Facultad de Ciencias Agrarias"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6163,308,'C','Programa curricular','Estudiante de posgrado en Ciencias Agrarias, énfasis en fitopatología, ','{"stringValue":"Estudiante de posgrado en Ciencias Agrarias, énfasis en fitopatología, "}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6164,308,'D','Archivo PDF de la convocatoria','2026-C2300','{"stringValue":"2026-C2300"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6165,308,'E','Estado de la convocatoria','Cerrada','{"stringValue":"Cerrada"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6166,308,'F','Resultados','https://drive.google.com/file/d/1ZAaMfHDi69TAYP6DD8xYJaaHbpVSLunE/view?usp=drivesdk','{"stringValue":"https://drive.google.com/file/d/1ZAaMfHDi69TAYP6DD8xYJaaHbpVSLunE/view?usp=drivesdk"}',NULL,'https://drive.google.com/file/d/1ZAaMfHDi69TAYP6DD8xYJaaHbpVSLunE/view?usp=drivesdk',NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false,"link":{"uri":"https://drive.google.com/file/d/1ZAaMfHDi69TAYP6DD8xYJaaHbpVSLunE/view?usp=drivesdk"}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6167,308,'G','Nombre de la convocatoria, proyecto o Proceso','Test de diagnóstico molecular y prototipo espectral para la detección temprana de Ceratocystis sp. y Rosellinia spp. en cacao','{"stringValue":"Test de diagnóstico molecular y prototipo espectral para la detección temprana de Ceratocystis sp. y Rosellinia spp. en cacao"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6168,308,'H','Correo del responsable','adgonzalezal@unal.edu.co','{"stringValue":"adgonzalezal@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6169,308,'I','Fecha de publicación','3-nov-2026','{"numberValue":46329}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6170,308,'J','Fecha y hora de cierre de la convocatoria','11/11/2026 8:00:00 a. m.','{"numberValue":46337.333333333336}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6171,308,'K','Número de convocatoria','2026-C2300','{"stringValue":"2026-C2300"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3081,'caso_convocatoria',308,'documento_pendiente','{"rol":"convocatoria","referencia_celda":"2026-C2300","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO documento (documento_id,tipo_sugerido,url_origen,drive_id,titulo_archivo,mime_type,capturado_en,estado_acceso,estado_extraccion,notas) VALUES (3002,'resultados','https://drive.google.com/file/d/1ZAaMfHDi69TAYP6DD8xYJaaHbpVSLunE/view?usp=drivesdk','1ZAaMfHDi69TAYP6DD8xYJaaHbpVSLunE','Resultados 2026-C2300','application/pdf','2026-11-13','leido','transcrito_sin_cotejo_visual','El PDF binario y su huella SHA256 no se han incorporado; texto extraído literalmente disponible en campo_documento y renglones.');
INSERT INTO vinculo_caso (vinculo_id,caso_id,documento_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3083,308,3002,'resultados','Resultados 2026-C2300','transcrito_pendiente_revision');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,estado_revision) VALUES (3002001,3002,'texto_extraido_integro',1,'Transcripción íntegra devuelta por Drive','Macroproceso: Formación 
Proceso: Gestión Administrativa de Apoyo a la Formación 
Formato selección estudiantes auxiliares 
Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 3 
Nombre de la 
convocatoria 
Test de diagnóstico molecular y prototipo espectral para la detección temprana de Ceratocystis sp. y 
Rosellinia spp. en cacao 
Número de la 
convocatoria 
2026-C2300 N.º de estudiantes 
a vincular
1 
Facultad, 
dependencia o 
proyecto 
Facultad de Ciencias Agrarias - Departamento de Agronomía 
Fecha de publicación 
de la convocatoria 03 11 2026 Fecha de publicación de resultados 12 11 2026 
Requisitos Generales
(Art. 2 Acuerdo CSU 
024 de 2022) 
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia. 
b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un Promedio 
Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para estudiantes de pregrado, e igual o 
superior a 4.0 para estudiantes de posgrado. 
c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar universitario 
o de gestión administrativa el estudiante deberá tener un Promedio Aritmético Ponderado Acumulado - 
P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de 
posgrado 
d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que obtuvieron 
la beca de posgrado por la distinción de Grado de Honor de la Universidad Nacional de Colombia. 
e. No tener calidad de funcionario público (administrativo o docente de planta) de la Universidad Nacional 
de Colombia. 
f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e inscrita al 
menos la carga mínima exigida por el Estatuto Estudiantil. 
g. No haber tenido sanciones disciplinarias. 
PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de apoyo a 
estudiantes en las cuales no se reciba una retribución económica por la realización de actividades y que 
el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo de su actividad académica. 
PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer periodo 
académico de un programade posgrado cumplir una de las siguientes condiciones, de acuerdo con el tipo 
de admisión, así: 
1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión. 
2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo 008 de 
2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones académicas. 
3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico igual o 
superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito. 
Perfil requerido 
- Estudiante de posgrado en Ciencias Agrarias, énfasis en fitopatología con avance en el plan de estudios 
igual o superior al 50%. 
- Formación en pregrado en Ingeniería Agronómica. 
- Conocimiento en fisiología vegetal, fitopatología y diagnóstico de las enfermedades con el uso de 
firmas espectrales y manejo fitosanitario 
- Conocimientos en patógenos de cacao 
CRITERIOS DE SELECCIÓN Y EVALUACIÓN
Criterios Ponderación 
(Asigne el peso porcentual de cada criterio) 
1 P.A.P.A. 50% Máximo puntaje (2.5) 
2 Hoja de vida 25% Máximo puntaje (1.25) 
3 conocimientos en fisiología 
Vegetal, Fitopatología y 25% Máximo puntaje (1.25) Macroproceso: Formación 
Proceso: Gestión Administrativa de Apoyo a la Formación 
Formato selección estudiantes auxiliares 
Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 3 
Diagnóstico de enfermedades 
con el uso de firmas espectrales 
y manejo fitosanitario. 
4 
5 
6 
7 
 
Sumatoria de 
porcentajes 100% 
DATOS DE LOS PARTICIPANTES 
No. Identificación 
 Puntaje por Criterio 
(De 0 a 5) (PBM de 0 a 100) 
*P.A.P.A. 
O puntaje de 
admisión (PA) 
(SI/NO) 
P.B.M. 
(si 
aplica) 
1 2 3 4 5 6 7 Total Seleccionado 
1 1014293104 4.3 2.15 1.25 1.25 4.65 X 
2 1003243856 4.5 2.25 1.0 1.0 4.25 
3 
4 
5 
6 
7 
8 
9 
10 
• Se deben relacionar todos los participantes que aplicaron a la convocatoria. 
• Si el (la-los) estudiante(s) incumple(n) alguno de los Requisitos mínimos no se debe continuar con la evaluación de la hoja de 
vida. 
• En caso de empate en el puntaje total, se dará prelación a los estudiantes cuyos puntajes básicos de matrícula (PBM) sean los 
más bajos. (En caso que aplique) 
• Marque una X en la columna "Seleccionado" para identificar el (los) ganador(es) de la convocatoria. 
• Marque con la palabra “Elegible” a el (la-los) estudiante(s) que quedará(n) en la lista de elegible(s). 
Certifico que el (los) estudiante(s) seleccionado(s) fue(ron) consultado(s) y manifiesta(n) no recibir ningún otro beneficio 
económico de la Universidad Nacional de Colombia y que no está(n) inhabilitado(s) para ser vinculado(s) como Estudiante(s) 
Auxiliar(es), a su vez asumo la responsabilidad de todo el proceso de selección del estudiante. 
En caso de que no se haya seleccionado a ningún estudiante como ganador de la convocatoria especifique el motivo: 
Observaciones: 
NOMBRE DEL 
RESPONSABLE DE LA 
Adriana González Almario Macroproceso: Formación 
Proceso: Gestión Administrativa de Apoyo a la Formación 
Formato selección estudiantes auxiliares 
Código: U.FT.05.007.014 Versión: 2.0 Página 3 de 3 
EVALUACIÓN 
CARGO Profesora Asociada 
EXTENSIÓN 19126 
CORREO adgonzalezal@unal.edu.co 
_________________________________ 
(Original Firmado
Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de 
identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección 
por los canales de divulgación que la Universidad disponga para tal fin. 
En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal 
recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección 
de Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual 
puede ser consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que 
garantizan la seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar 
las autorizaciones dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail 
protecdatos_na@unal.edu.co. ','sin_cotejo_visual');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3002002,3002,'número_de_la',1,'Número de la','Número de la 
convocatoria 
2026-C2300 N.º de estudiantes 
a vincular
1 
Facultad, 
dependencia o 
proyecto 
Facultad de Ciencias Agrarias - D','{"desplazamiento":340,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3002003,3002,'nombre_de_la',1,'Nombre de la','Nombre de la 
convocatoria 
Test de diagnóstico molecular y prototipo espectral para la detección temprana de Ceratocystis sp. y 
Rosellinia spp. e','{"desplazamiento":180,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3002004,3002,'perfil_requerido',1,'Perfil requerido','Perfil requerido 
- Estudiante de posgrado en Ciencias Agrarias, énfasis en fitopatología con avance en el plan de estudios 
igual o superior al 50%','{"desplazamiento":2934,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3002005,3002,'actividades_a_desarrollar',1,'actividades a desarrollar','actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un Promedio 
Aritmético Ponderado Acumulado - P.A.P.A. igual o ','{"desplazamiento":787,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3002006,3002,'actividades_a_desarrollar',2,'actividades a desarrollar','actividades a desarrollar están relacionadas con investigación, extensión, bienestar universitario 
o de gestión administrativa el estudiante deberá ','{"desplazamiento":1052,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3002007,3002,'responsable_de_la',1,'RESPONSABLE DE LA','RESPONSABLE DE LA 
Adriana González Almario Macroproceso: Formación 
Proceso: Gestión Administrativa de Apoyo a la Formación 
Formato selección est','{"desplazamiento":5343,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3002008,3002,'datos_de_los_participantes',1,'DATOS DE LOS PARTICIPANTES','DATOS DE LOS PARTICIPANTES 
No. Identificación 
 Puntaje por Criterio 
(De 0 a 5) (PBM de 0 a 100) 
*P.A.P.A. 
O puntaje de 
admisión (PA) 
(SI','{"desplazamiento":3922,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3002009,3002,'observaciones',1,'Observaciones','Observaciones: 
NOMBRE DEL 
RESPONSABLE DE LA 
Adriana González Almario Macroproceso: Formación 
Proceso: Gestión Administrativa de Apoyo a la For','{"desplazamiento":5313,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300201,3002,1,'Macroproceso: Formación 
Proceso: Gestión Administrativa de Apoyo a la Formación 
Formato selección estudiantes auxiliares 
Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 3 
Nombre de la 
convocatoria 
Test de diagnóstico molecular y prototipo espectral para la detección temprana de Ceratocystis sp. y 
Rosellinia spp. en cacao 
Número de la 
convocatoria 
2026-C2300 N.º de estudiantes 
a vincular
1 
Facultad, 
dependencia o 
proyecto 
Facultad de Ciencias Agrarias - Departamento de Agronomía 
Fecha de publicación 
de la convocatoria 03 11 2026 Fecha de publicación de resultados 12 11 2026 
Requisitos Generales
(Art. 2 Acuerdo CSU 
024 de 2022) 
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia. 
b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un Promedio 
Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para estudiantes de pregrado, e igual o 
superior a 4.0 para estudiantes de posgrado. 
c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar universitario 
o de gestión administrativa el estudiante deberá tener un Promedio Aritmético Ponderado Acumulado - 
P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de 
posgrado 
d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que obtuvieron 
la beca de posgrado por la distinción de Grado de Honor de la Universidad Nacional de Colombia. 
e. No tener calidad de funcionario público (administrativo o docente de planta) de la Universidad Nacional 
de Colombia. 
f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e inscrita al 
menos la carga mínima exigida por el Estatuto Estudiantil. 
g. No haber tenido sanciones disciplinarias. 
PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de apoyo a 
estudiantes en las cuales no se reciba una retribución económica por la realización de actividades y que 
el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo de su actividad académica. 
PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer periodo 
académico de un programade posgrado cumplir una de las siguientes condiciones, de acuerdo con el tipo 
de admisión, así: 
1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión. 
2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo 008 de 
2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones académicas. 
3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico igual o 
superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito. 
Perfil requerido 
- Estudiante de posgrado en Ciencias Agrarias, énfasis en fitopatología con avance en el plan de estudios 
igual o superior al 50%. 
- Formación en pregrado en Ingeniería Agronómica. 
- Conocimiento en fisiología vegetal, fitopatología y diagnóstico de las enfermedades con el uso de 
firmas espectrales y manejo fitosanitario 
- Conocimientos en patógenos de cacao 
CRITERIOS DE SELECCIÓN Y EVALUACIÓN
Criterios Ponderación 
(Asigne el peso porcentual de cada criterio) 
1 P.A.P.A. 50% Máximo puntaje (2.5) 
2 Hoja de vida 25% Máximo puntaje (1.25) 
3 conocimientos en fisiología 
Vegetal, Fitopatología y 25% Máximo puntaje (1.25) ','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201001,300201,1,'renglon_literal','Macroproceso: Formación ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201002,300201,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201003,300201,3,'renglon_literal','Formato selección estudiantes auxiliares ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201004,300201,4,'renglon_literal','Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 3 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201005,300201,5,'renglon_literal','Nombre de la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201006,300201,6,'renglon_literal','convocatoria ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201007,300201,7,'renglon_literal','Test de diagnóstico molecular y prototipo espectral para la detección temprana de Ceratocystis sp. y ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201008,300201,8,'renglon_literal','Rosellinia spp. en cacao ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201009,300201,9,'renglon_literal','Número de la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201010,300201,10,'renglon_literal','convocatoria ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201011,300201,11,'renglon_literal','2026-C2300 N.º de estudiantes ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201012,300201,12,'renglon_literal','a vincular','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201013,300201,13,'renglon_literal','1 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201014,300201,14,'renglon_literal','Facultad, ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201015,300201,15,'renglon_literal','dependencia o ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201016,300201,16,'renglon_literal','proyecto ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201017,300201,17,'renglon_literal','Facultad de Ciencias Agrarias - Departamento de Agronomía ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201018,300201,18,'renglon_literal','Fecha de publicación ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201019,300201,19,'renglon_literal','de la convocatoria 03 11 2026 Fecha de publicación de resultados 12 11 2026 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201020,300201,20,'renglon_literal','Requisitos Generales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201021,300201,21,'renglon_literal','(Art. 2 Acuerdo CSU ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201022,300201,22,'renglon_literal','024 de 2022) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201023,300201,23,'renglon_literal','a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201024,300201,24,'renglon_literal','b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un Promedio ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201025,300201,25,'renglon_literal','Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para estudiantes de pregrado, e igual o ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201026,300201,26,'renglon_literal','superior a 4.0 para estudiantes de posgrado. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201027,300201,27,'renglon_literal','c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar universitario ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201028,300201,28,'renglon_literal','o de gestión administrativa el estudiante deberá tener un Promedio Aritmético Ponderado Acumulado - ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201029,300201,29,'renglon_literal','P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201030,300201,30,'renglon_literal','posgrado ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201031,300201,31,'renglon_literal','d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que obtuvieron ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201032,300201,32,'renglon_literal','la beca de posgrado por la distinción de Grado de Honor de la Universidad Nacional de Colombia. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201033,300201,33,'renglon_literal','e. No tener calidad de funcionario público (administrativo o docente de planta) de la Universidad Nacional ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201034,300201,34,'renglon_literal','de Colombia. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201035,300201,35,'renglon_literal','f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e inscrita al ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201036,300201,36,'renglon_literal','menos la carga mínima exigida por el Estatuto Estudiantil. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201037,300201,37,'renglon_literal','g. No haber tenido sanciones disciplinarias. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201038,300201,38,'renglon_literal','PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de apoyo a ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201039,300201,39,'renglon_literal','estudiantes en las cuales no se reciba una retribución económica por la realización de actividades y que ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201040,300201,40,'renglon_literal','el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo de su actividad académica. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201041,300201,41,'renglon_literal','PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer periodo ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201042,300201,42,'renglon_literal','académico de un programade posgrado cumplir una de las siguientes condiciones, de acuerdo con el tipo ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201043,300201,43,'renglon_literal','de admisión, así: ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201044,300201,44,'renglon_literal','1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201045,300201,45,'renglon_literal','2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo 008 de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201046,300201,46,'renglon_literal','2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones académicas. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201047,300201,47,'renglon_literal','3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico igual o ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201048,300201,48,'renglon_literal','superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201049,300201,49,'renglon_literal','Perfil requerido ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201050,300201,50,'renglon_literal','- Estudiante de posgrado en Ciencias Agrarias, énfasis en fitopatología con avance en el plan de estudios ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201051,300201,51,'renglon_literal','igual o superior al 50%. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201052,300201,52,'renglon_literal','- Formación en pregrado en Ingeniería Agronómica. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201053,300201,53,'renglon_literal','- Conocimiento en fisiología vegetal, fitopatología y diagnóstico de las enfermedades con el uso de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201054,300201,54,'renglon_literal','firmas espectrales y manejo fitosanitario ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201055,300201,55,'renglon_literal','- Conocimientos en patógenos de cacao ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201056,300201,56,'renglon_literal','CRITERIOS DE SELECCIÓN Y EVALUACIÓN','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201057,300201,57,'renglon_literal','Criterios Ponderación ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201058,300201,58,'renglon_literal','(Asigne el peso porcentual de cada criterio) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201059,300201,59,'renglon_literal','1 P.A.P.A. 50% Máximo puntaje (2.5) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201060,300201,60,'renglon_literal','2 Hoja de vida 25% Máximo puntaje (1.25) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201061,300201,61,'renglon_literal','3 conocimientos en fisiología ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300201062,300201,62,'renglon_literal','Vegetal, Fitopatología y 25% Máximo puntaje (1.25) ','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300202,3002,2,'Macroproceso: Formación 
Proceso: Gestión Administrativa de Apoyo a la Formación 
Formato selección estudiantes auxiliares 
Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 3 
Diagnóstico de enfermedades 
con el uso de firmas espectrales 
y manejo fitosanitario. 
4 
5 
6 
7 
 
Sumatoria de 
porcentajes 100% 
DATOS DE LOS PARTICIPANTES 
No. Identificación 
 Puntaje por Criterio 
(De 0 a 5) (PBM de 0 a 100) 
*P.A.P.A. 
O puntaje de 
admisión (PA) 
(SI/NO) 
P.B.M. 
(si 
aplica) 
1 2 3 4 5 6 7 Total Seleccionado 
1 1014293104 4.3 2.15 1.25 1.25 4.65 X 
2 1003243856 4.5 2.25 1.0 1.0 4.25 
3 
4 
5 
6 
7 
8 
9 
10 
• Se deben relacionar todos los participantes que aplicaron a la convocatoria. 
• Si el (la-los) estudiante(s) incumple(n) alguno de los Requisitos mínimos no se debe continuar con la evaluación de la hoja de 
vida. 
• En caso de empate en el puntaje total, se dará prelación a los estudiantes cuyos puntajes básicos de matrícula (PBM) sean los 
más bajos. (En caso que aplique) 
• Marque una X en la columna "Seleccionado" para identificar el (los) ganador(es) de la convocatoria. 
• Marque con la palabra “Elegible” a el (la-los) estudiante(s) que quedará(n) en la lista de elegible(s). 
Certifico que el (los) estudiante(s) seleccionado(s) fue(ron) consultado(s) y manifiesta(n) no recibir ningún otro beneficio 
económico de la Universidad Nacional de Colombia y que no está(n) inhabilitado(s) para ser vinculado(s) como Estudiante(s) 
Auxiliar(es), a su vez asumo la responsabilidad de todo el proceso de selección del estudiante. 
En caso de que no se haya seleccionado a ningún estudiante como ganador de la convocatoria especifique el motivo: 
Observaciones: 
NOMBRE DEL 
RESPONSABLE DE LA 
Adriana González Almario ','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202001,300202,1,'renglon_literal','Macroproceso: Formación ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202002,300202,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202003,300202,3,'renglon_literal','Formato selección estudiantes auxiliares ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202004,300202,4,'renglon_literal','Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 3 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202005,300202,5,'renglon_literal','Diagnóstico de enfermedades ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202006,300202,6,'renglon_literal','con el uso de firmas espectrales ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202007,300202,7,'renglon_literal','y manejo fitosanitario. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202008,300202,8,'renglon_literal','4 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202009,300202,9,'renglon_literal','5 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202010,300202,10,'renglon_literal','6 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202011,300202,11,'renglon_literal','7 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202012,300202,12,'renglon_literal',' ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202013,300202,13,'renglon_literal','Sumatoria de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202014,300202,14,'renglon_literal','porcentajes 100% ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202015,300202,15,'renglon_literal','DATOS DE LOS PARTICIPANTES ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202016,300202,16,'renglon_literal','No. Identificación ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202017,300202,17,'renglon_literal',' Puntaje por Criterio ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202018,300202,18,'renglon_literal','(De 0 a 5) (PBM de 0 a 100) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202019,300202,19,'renglon_literal','*P.A.P.A. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202020,300202,20,'renglon_literal','O puntaje de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202021,300202,21,'renglon_literal','admisión (PA) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202022,300202,22,'renglon_literal','(SI/NO) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202023,300202,23,'renglon_literal','P.B.M. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202024,300202,24,'renglon_literal','(si ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202025,300202,25,'renglon_literal','aplica) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202026,300202,26,'renglon_literal','1 2 3 4 5 6 7 Total Seleccionado ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202027,300202,27,'renglon_literal','1 1014293104 4.3 2.15 1.25 1.25 4.65 X ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202028,300202,28,'renglon_literal','2 1003243856 4.5 2.25 1.0 1.0 4.25 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202029,300202,29,'renglon_literal','3 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202030,300202,30,'renglon_literal','4 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202031,300202,31,'renglon_literal','5 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202032,300202,32,'renglon_literal','6 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202033,300202,33,'renglon_literal','7 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202034,300202,34,'renglon_literal','8 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202035,300202,35,'renglon_literal','9 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202036,300202,36,'renglon_literal','10 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202037,300202,37,'renglon_literal','• Se deben relacionar todos los participantes que aplicaron a la convocatoria. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202038,300202,38,'renglon_literal','• Si el (la-los) estudiante(s) incumple(n) alguno de los Requisitos mínimos no se debe continuar con la evaluación de la hoja de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202039,300202,39,'renglon_literal','vida. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202040,300202,40,'renglon_literal','• En caso de empate en el puntaje total, se dará prelación a los estudiantes cuyos puntajes básicos de matrícula (PBM) sean los ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202041,300202,41,'renglon_literal','más bajos. (En caso que aplique) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202042,300202,42,'renglon_literal','• Marque una X en la columna "Seleccionado" para identificar el (los) ganador(es) de la convocatoria. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202043,300202,43,'renglon_literal','• Marque con la palabra “Elegible” a el (la-los) estudiante(s) que quedará(n) en la lista de elegible(s). ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202044,300202,44,'renglon_literal','Certifico que el (los) estudiante(s) seleccionado(s) fue(ron) consultado(s) y manifiesta(n) no recibir ningún otro beneficio ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202045,300202,45,'renglon_literal','económico de la Universidad Nacional de Colombia y que no está(n) inhabilitado(s) para ser vinculado(s) como Estudiante(s) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202046,300202,46,'renglon_literal','Auxiliar(es), a su vez asumo la responsabilidad de todo el proceso de selección del estudiante. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202047,300202,47,'renglon_literal','En caso de que no se haya seleccionado a ningún estudiante como ganador de la convocatoria especifique el motivo: ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202048,300202,48,'renglon_literal','Observaciones: ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202049,300202,49,'renglon_literal','NOMBRE DEL ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202050,300202,50,'renglon_literal','RESPONSABLE DE LA ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300202051,300202,51,'renglon_literal','Adriana González Almario ','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300203,3002,3,'Macroproceso: Formación 
Proceso: Gestión Administrativa de Apoyo a la Formación 
Formato selección estudiantes auxiliares 
Código: U.FT.05.007.014 Versión: 2.0 Página 3 de 3 
EVALUACIÓN 
CARGO Profesora Asociada 
EXTENSIÓN 19126 
CORREO adgonzalezal@unal.edu.co 
_________________________________ 
(Original Firmado
Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de 
identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección 
por los canales de divulgación que la Universidad disponga para tal fin. 
En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal 
recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección 
de Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual 
puede ser consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que 
garantizan la seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar 
las autorizaciones dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail 
protecdatos_na@unal.edu.co. ','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203001,300203,1,'renglon_literal','Macroproceso: Formación ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203002,300203,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203003,300203,3,'renglon_literal','Formato selección estudiantes auxiliares ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203004,300203,4,'renglon_literal','Código: U.FT.05.007.014 Versión: 2.0 Página 3 de 3 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203005,300203,5,'renglon_literal','EVALUACIÓN ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203006,300203,6,'renglon_literal','CARGO Profesora Asociada ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203007,300203,7,'renglon_literal','EXTENSIÓN 19126 ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203008,300203,8,'renglon_literal','CORREO adgonzalezal@unal.edu.co ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203009,300203,9,'renglon_literal','_________________________________ ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203010,300203,10,'renglon_literal','(Original Firmado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203011,300203,11,'renglon_literal','Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203012,300203,12,'renglon_literal','identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203013,300203,13,'renglon_literal','por los canales de divulgación que la Universidad disponga para tal fin. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203014,300203,14,'renglon_literal','En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203015,300203,15,'renglon_literal','recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203016,300203,16,'renglon_literal','de Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203017,300203,17,'renglon_literal','puede ser consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203018,300203,18,'renglon_literal','garantizan la seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203019,300203,19,'renglon_literal','las autorizaciones dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300203020,300203,20,'renglon_literal','protecdatos_na@unal.edu.co. ','pendiente');
INSERT INTO publicacion_resultados (publicacion_id,documento_id,codigo_convocatoria_literal,nombre_literal,estado_revision) VALUES (3002,3002,'2026-C2300','Resultados 2026-C2300','pendiente_cotejo_visual');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (3002001,3002,1,'1014293104','1 1014293104 4.3 2.15 1.25 1.25 4.65 X ','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200101,3002001,1,'token_de_fila','posición_léxica_1','4.3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200102,3002001,2,'token_de_fila','posición_léxica_2','2.15','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200103,3002001,3,'token_de_fila','posición_léxica_3','1.25','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200104,3002001,4,'token_de_fila','posición_léxica_4','1.25','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200105,3002001,5,'token_de_fila','posición_léxica_5','4.65','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200106,3002001,6,'token_de_fila','posición_léxica_6','X','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200107,3002001,7,'token_de_fila','posición_léxica_7','','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (3002002,3002,2,'1003243856','2 1003243856 4.5 2.25 1.0 1.0 4.25 ','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200201,3002002,1,'token_de_fila','posición_léxica_1','4.5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200202,3002002,2,'token_de_fila','posición_léxica_2','2.25','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200203,3002002,3,'token_de_fila','posición_léxica_3','1.0','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200204,3002002,4,'token_de_fila','posición_léxica_4','1.0','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200205,3002002,5,'token_de_fila','posición_léxica_5','4.25','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (300200206,3002002,6,'token_de_fila','posición_léxica_6','','sin_correspondencia_validada_con_encabezado');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (309,'2026-C2381','sin_verificar','Lote 3, fuente Convocatorias Abiertas fila 2');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (309,3,'Convocatorias Abiertas',2,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3091,309,309,'hoja_calculo','2026-C2381','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6181,309,'A','Tipo de convocatoria','Posgrado','{"stringValue":"Posgrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6182,309,'B','Facultad','Facultad de Ciencias','{"stringValue":"Facultad de Ciencias"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6183,309,'C','Programa curricular','Estudiante de posgrado en Química','{"stringValue":"Estudiante de posgrado en Química"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6184,309,'D','Coordinacion Pregrado de Diseno Grafico','https://drive.google.com/file/d/11e0uf_0IJ5dYra9RksPG1uIT9TkGXI9T/view?usp=drivesdk','{"stringValue":"https://drive.google.com/file/d/11e0uf_0IJ5dYra9RksPG1uIT9TkGXI9T/view?usp=drivesdk"}',NULL,'https://drive.google.com/file/d/11e0uf_0IJ5dYra9RksPG1uIT9TkGXI9T/view?usp=drivesdk',NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}},"link":{"uri":"https://drive.google.com/file/d/11e0uf_0IJ5dYra9RksPG1uIT9TkGXI9T/view?usp=drivesdk"}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6185,309,'E','Estado de la convocatoria','Abierta','{"stringValue":"Abierta"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6186,309,'F','Nombre de la convocatoria, proyecto o Proceso','Apoyo a cursos de Extensión en Química Básica','{"stringValue":"Apoyo a cursos de Extensión en Química Básica"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6187,309,'G','Correo del responsable','ysantosp@unal.edu.co','{"stringValue":"ysantosp@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6188,309,'H','Fecha de publicación','12-nov-2026','{"numberValue":46338}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6189,309,'I','Fecha y hora de cierre de la convocatoria','18/11/2026 4:00:00 p. m.','{"numberValue":46344.666666666664}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6190,309,'J','Número de convocatoria','2026-C2381','{"stringValue":"2026-C2381"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3091,'caso_convocatoria',309,'documento_pendiente','{"rol":"resultados","referencia_celda":"Pestaña de abiertas no tiene columna de resultados","motivo":"no_disponible_en_hoja_abiertas","verificacion":"pendiente_publicacion"}');
INSERT INTO documento (documento_id,tipo_sugerido,url_origen,drive_id,titulo_archivo,mime_type,capturado_en,estado_acceso,estado_extraccion,notas) VALUES (3003,'convocatoria','https://drive.google.com/file/d/11e0uf_0IJ5dYra9RksPG1uIT9TkGXI9T/view?usp=drivesdk','11e0uf_0IJ5dYra9RksPG1uIT9TkGXI9T','2026-C2381','application/pdf','2026-11-13','leido','transcrito_sin_cotejo_visual','El PDF binario y su huella SHA256 no se han incorporado; texto extraído literalmente disponible en campo_documento y renglones.');
INSERT INTO vinculo_caso (vinculo_id,caso_id,documento_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3092,309,3003,'convocatoria','2026-C2381','transcrito_pendiente_revision');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,estado_revision) VALUES (3003001,3003,'texto_extraido_integro',1,'Transcripción íntegra devuelta por Drive','Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 1 de 3
Número de la
Convocatoria
2026-C2381
Fecha de publicación de la
convocatoria
12 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
Facultad de Ciencias - Departamento de Química-Coordinación de Extensión
Nombre de la
convocatoria
Apoyo a cursos de Extensión en Química Básica
Tipo de estudiante Pregrado ☐ Posgrado ⛝
Tipo de actividades a
desarrollar en la
convocatoria
☐ ⛝ ☐ ☐ ☐
Docencia
(Apoyo
Académico)
Apoyo a proyectos
investigación o
extensión
Gestión
Administrativa
Bienestar
universitario
Otro
No. de estudiantes a
vincular
1
Requisitos generales
(Art. 2 Acuerdo CSU 024
de 2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de
Colombia.
b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener
un Promedio Aritmético Ponderado Acumulado P.A.P.A. igual o superior a 3.5. para
estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado
c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar
universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético
Ponderado Acumulado P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o
superior a 4.0 para estudiantes de posgrado
d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que
obtuvieron la beca de posgrado por la distinción de Grado de Honor de la Universidad
Nacional de Colombia.
e. No tener calidad de funcionario público (administrativo o docente de planta) de la
Universidad Nacional de Colombia.
f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e
inscrita al menos la carga mínima exigida por el Estatuto Estudiantil.
g. No haber tenido sanciones disciplinarias.
PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de
apoyo a estudiantes en las cuales no se reciba una retribución económica por la realización de
actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal
desarrollo de su actividad académica.
PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer
periodo académico de un programa de posgrado cumplir una de las siguientes condiciones, de
acuerdo con el tipo de admisión, así:
1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.
2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo
008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones
académicas.
3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico
igual o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.
Perfil requerido Estudiante de posgrado en Química
PAPA mayor o igual a 4.0Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 2 de 3
Dominio de conceptos fundamentales de química general
Experiencia en apoyo a cursos de laboratorio de Química básica
Experiencia en manejo del aplicativo HERMES
Actividades a desarrollar
1. Apoyo en el ajuste de la información solicitada en los reportes de laboratorio.
2. Apoyo en la consolidación de información de la evaluación al curso.
3. Apoyar en la generación del inventario de reactivos utilizados en las prácticas
seleccionadas.
Modalidad de las
actividades
⛝ ☐ ☐
Presencial Virtual Mixta
Disponibilidad de tiempo
requerida
20 H/semana
Estímulo económico
mensual
$ 1.850.000
Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de
monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por
la distinción de Grado de Honor de la Universidad Nacional de Colombia.
Duración de la vinculación
15 Días
Los Estudiantes Auxiliares no tendrán la calidad de empleados, trabajadores o contratistas. Su relación
es fundamentalmente académica y no constituye vínculo laboral ni contractual con la Universidad.
Forma de Selección
Se recibe el total de hojas de vida para evaluar por puntaje de criterios los cuales son:
1. Valor P.A. P.A.
2. Estudiante de posgrado del programa de Química.
3. Dominio de conceptos fundamentales de química general.
4. Experiencia en apoyo a cursos de laboratorio de Química básica.
5. Experiencia en manejo del aplicativo HERMES.
Tendrán una ponderación cada criterio del 20% para un total del 100%.
Términos para la
presentación de
documentos
Enviar los documentos al correo ysantosp@unal.edu.co oficina 441
Fecha de cierre de la
convocatoria
19/Nov/2026 04:00 p.m.
Documentación requerida
- Hoja de vida del estudiante.
- Fotocopia de la cédula.
- Fotocopia del carné de estudiante.
- Historia académica del SIA.
- Formato Autorización para Verificación de Inhabilidad por Delitos Sexuales Cometidos
Contra Menores. (Obligatorio)
Documentos opcionales
(no pueden ser
modificatorios)
En la hoja de vida, describir la experiencia en cursos de química básica y manejo de aplicativo
Hermes.Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de
identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección por
los canales de divulgación que la Universidad disponga para tal fin.
En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal
recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección de
Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual puede ser
consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que garantizan la
seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar las autorizaciones
dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail
protecdatos_na@unal.edu.co.
Código: U.FT.05.007.013 Versión: 2.0 Página 3 de 3
Responsable de la
convocatoria
Yesmith Santos Panqueva - Docente, ysantosp@unal.edu.co, Cel: 3044910572
Criterios de evaluación 1. P.A.P.A. 20%
2. Estudiante de posgrado en Química 20%
3. Dominio de conceptos fundamentales de química general 20%
4. Experiencia en apoyo a cursos de laboratorio de Química básica 20%
5. Experiencia en manejo del aplicativo HERMES 20%
Fecha límite de
Publicación de Resultados
08/Dic/2026 10:00 a.m.','sin_cotejo_visual');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003002,3003,'número_de_la',1,'Número de la','Número de la
Convocatoria
2026-C2381
Fecha de publicación de la
convocatoria
12 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
F','{"desplazamiento":179,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003003,3003,'fecha_de_publicación_de_la',1,'Fecha de publicación de la','Fecha de publicación de la
convocatoria
12 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
Facultad de Ciencias - Departamento de Qu','{"desplazamiento":219,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003004,3003,'nombre_de_la',1,'Nombre de la','Nombre de la
convocatoria
Apoyo a cursos de Extensión en Química Básica
Tipo de estudiante Pregrado ☐ Posgrado ⛝
Tipo de actividades a
desarrolla','{"desplazamiento":402,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003005,3003,'tipo_de_estudiante',1,'Tipo de estudiante','Tipo de estudiante Pregrado ☐ Posgrado ⛝
Tipo de actividades a
desarrollar en la
convocatoria
☐ ⛝ ☐ ☐ ☐
Docencia
(Apoyo
Académico)
Apoyo a pro','{"desplazamiento":477,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003006,3003,'perfil_requerido',1,'Perfil requerido','Perfil requerido Estudiante de posgrado en Química
PAPA mayor o igual a 4.0Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la For','{"desplazamiento":3043,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003007,3003,'actividades_a_desarrollar',1,'actividades a desarrollar','actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener
un Promedio Aritmético Ponderado Acumulado P.A.P.A. igual o sup','{"desplazamiento":922,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003008,3003,'actividades_a_desarrollar',2,'actividades a desarrollar','actividades a desarrollar están relacionadas con investigación, extensión, bienestar
universitario o de gestión administrativa el estudiante deberá t','{"desplazamiento":1181,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003009,3003,'actividades_a_desarrollar',3,'Actividades a desarrollar','Actividades a desarrollar
1. Apoyo en el ajuste de la información solicitada en los reportes de laboratorio.
2. Apoyo en la consolidación de informa','{"desplazamiento":3462,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003010,3003,'modalidad_de_las',1,'Modalidad de las','Modalidad de las
actividades
⛝ ☐ ☐
Presencial Virtual Mixta
Disponibilidad de tiempo
requerida
20 H/semana
Estímulo económico
mensual
$ 1.850','{"desplazamiento":3745,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003011,3003,'disponibilidad_de_tiempo',1,'Disponibilidad de tiempo','Disponibilidad de tiempo
requerida
20 H/semana
Estímulo económico
mensual
$ 1.850.000
Este estímulo es incompatible con el estímulo económico qu','{"desplazamiento":3809,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003012,3003,'estímulo_económico',1,'Estímulo económico','Estímulo económico
mensual
$ 1.850.000
Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de
monitor ac','{"desplazamiento":3859,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003013,3003,'estímulo_económico',2,'estímulo económico','estímulo económico que se otorga por ostentar la calidad de
monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de po','{"desplazamiento":3938,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003014,3003,'duración_de_la_vinculación',1,'Duración de la vinculación','Duración de la vinculación
15 Días
Los Estudiantes Auxiliares no tendrán la calidad de empleados, trabajadores o contratistas. Su relación
es funda','{"desplazamiento":4173,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003015,3003,'forma_de_selección',1,'Forma de Selección','Forma de Selección
Se recibe el total de hojas de vida para evaluar por puntaje de criterios los cuales son:
1. Valor P.A. P.A.
2. Estudiante de po','{"desplazamiento":4413,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003016,3003,'términos_para_la',1,'Términos para la','Términos para la
presentación de
documentos
Enviar los documentos al correo ysantosp@unal.edu.co oficina 441
Fecha de cierre de la
convocatoria
','{"desplazamiento":4843,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003017,3003,'fecha_de_cierre_de_la',1,'Fecha de cierre de la','Fecha de cierre de la
convocatoria
19/Nov/2026 04:00 p.m.
Documentación requerida
- Hoja de vida del estudiante.
- Fotocopia de la cédula.
- Fot','{"desplazamiento":4956,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003018,3003,'documentación_requerida',1,'Documentación requerida','Documentación requerida
- Hoja de vida del estudiante.
- Fotocopia de la cédula.
- Fotocopia del carné de estudiante.
- Historia académica del SIA','{"desplazamiento":5017,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003019,3003,'documentos_opcionales',1,'Documentos opcionales','Documentos opcionales
(no pueden ser
modificatorios)
En la hoja de vida, describir la experiencia en cursos de química básica y manejo de aplicativ','{"desplazamiento":5289,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003020,3003,'responsable_de_la',1,'Responsable de la','Responsable de la
convocatoria
Yesmith Santos Panqueva - Docente, ysantosp@unal.edu.co, Cel: 3044910572
Criterios de evaluación 1. P.A.P.A. 20%
2.','{"desplazamiento":6813,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3003021,3003,'criterios_de_evaluación',1,'Criterios de evaluación','Criterios de evaluación 1. P.A.P.A. 20%
2. Estudiante de posgrado en Química 20%
3. Dominio de conceptos fundamentales de química general 20%
4. Ex','{"desplazamiento":6920,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300301,3003,1,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 1 de 3
Número de la
Convocatoria
2026-C2381
Fecha de publicación de la
convocatoria
12 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
Facultad de Ciencias - Departamento de Química-Coordinación de Extensión
Nombre de la
convocatoria
Apoyo a cursos de Extensión en Química Básica
Tipo de estudiante Pregrado ☐ Posgrado ⛝
Tipo de actividades a
desarrollar en la
convocatoria
☐ ⛝ ☐ ☐ ☐
Docencia
(Apoyo
Académico)
Apoyo a proyectos
investigación o
extensión
Gestión
Administrativa
Bienestar
universitario
Otro
No. de estudiantes a
vincular
1
Requisitos generales
(Art. 2 Acuerdo CSU 024
de 2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de
Colombia.
b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener
un Promedio Aritmético Ponderado Acumulado P.A.P.A. igual o superior a 3.5. para
estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado
c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar
universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético
Ponderado Acumulado P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o
superior a 4.0 para estudiantes de posgrado
d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que
obtuvieron la beca de posgrado por la distinción de Grado de Honor de la Universidad
Nacional de Colombia.
e. No tener calidad de funcionario público (administrativo o docente de planta) de la
Universidad Nacional de Colombia.
f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e
inscrita al menos la carga mínima exigida por el Estatuto Estudiantil.
g. No haber tenido sanciones disciplinarias.
PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de
apoyo a estudiantes en las cuales no se reciba una retribución económica por la realización de
actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal
desarrollo de su actividad académica.
PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer
periodo académico de un programa de posgrado cumplir una de las siguientes condiciones, de
acuerdo con el tipo de admisión, así:
1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.
2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo
008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones
académicas.
3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico
igual o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.
Perfil requerido Estudiante de posgrado en Química
PAPA mayor o igual a 4.0','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301001,300301,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301002,300301,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301003,300301,3,'renglon_literal','Formato convocatoria estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301004,300301,4,'renglon_literal','Código: U.FT.05.007.013 Versión: 2.0 Página 1 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301005,300301,5,'renglon_literal','Número de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301006,300301,6,'renglon_literal','Convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301007,300301,7,'renglon_literal','2026-C2381','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301008,300301,8,'renglon_literal','Fecha de publicación de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301009,300301,9,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301010,300301,10,'renglon_literal','12 11 2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301011,300301,11,'renglon_literal','Nombre Facultad,','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301012,300301,12,'renglon_literal','dependencia o proyecto','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301013,300301,13,'renglon_literal','que convoca','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301014,300301,14,'renglon_literal','Facultad de Ciencias - Departamento de Química-Coordinación de Extensión','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301015,300301,15,'renglon_literal','Nombre de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301016,300301,16,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301017,300301,17,'renglon_literal','Apoyo a cursos de Extensión en Química Básica','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301018,300301,18,'renglon_literal','Tipo de estudiante Pregrado ☐ Posgrado ⛝','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301019,300301,19,'renglon_literal','Tipo de actividades a','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301020,300301,20,'renglon_literal','desarrollar en la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301021,300301,21,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301022,300301,22,'renglon_literal','☐ ⛝ ☐ ☐ ☐','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301023,300301,23,'renglon_literal','Docencia','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301024,300301,24,'renglon_literal','(Apoyo','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301025,300301,25,'renglon_literal','Académico)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301026,300301,26,'renglon_literal','Apoyo a proyectos','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301027,300301,27,'renglon_literal','investigación o','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301028,300301,28,'renglon_literal','extensión','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301029,300301,29,'renglon_literal','Gestión','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301030,300301,30,'renglon_literal','Administrativa','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301031,300301,31,'renglon_literal','Bienestar','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301032,300301,32,'renglon_literal','universitario','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301033,300301,33,'renglon_literal','Otro','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301034,300301,34,'renglon_literal','No. de estudiantes a','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301035,300301,35,'renglon_literal','vincular','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301036,300301,36,'renglon_literal','1','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301037,300301,37,'renglon_literal','Requisitos generales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301038,300301,38,'renglon_literal','(Art. 2 Acuerdo CSU 024','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301039,300301,39,'renglon_literal','de 2022)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301040,300301,40,'renglon_literal','a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301041,300301,41,'renglon_literal','Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301042,300301,42,'renglon_literal','b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301043,300301,43,'renglon_literal','un Promedio Aritmético Ponderado Acumulado P.A.P.A. igual o superior a 3.5. para','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301044,300301,44,'renglon_literal','estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301045,300301,45,'renglon_literal','c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301046,300301,46,'renglon_literal','universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301047,300301,47,'renglon_literal','Ponderado Acumulado P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301048,300301,48,'renglon_literal','superior a 4.0 para estudiantes de posgrado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301049,300301,49,'renglon_literal','d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301050,300301,50,'renglon_literal','obtuvieron la beca de posgrado por la distinción de Grado de Honor de la Universidad','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301051,300301,51,'renglon_literal','Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301052,300301,52,'renglon_literal','e. No tener calidad de funcionario público (administrativo o docente de planta) de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301053,300301,53,'renglon_literal','Universidad Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301054,300301,54,'renglon_literal','f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301055,300301,55,'renglon_literal','inscrita al menos la carga mínima exigida por el Estatuto Estudiantil.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301056,300301,56,'renglon_literal','g. No haber tenido sanciones disciplinarias.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301057,300301,57,'renglon_literal','PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301058,300301,58,'renglon_literal','apoyo a estudiantes en las cuales no se reciba una retribución económica por la realización de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301059,300301,59,'renglon_literal','actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301060,300301,60,'renglon_literal','desarrollo de su actividad académica.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301061,300301,61,'renglon_literal','PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301062,300301,62,'renglon_literal','periodo académico de un programa de posgrado cumplir una de las siguientes condiciones, de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301063,300301,63,'renglon_literal','acuerdo con el tipo de admisión, así:','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301064,300301,64,'renglon_literal','1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301065,300301,65,'renglon_literal','2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301066,300301,66,'renglon_literal','008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301067,300301,67,'renglon_literal','académicas.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301068,300301,68,'renglon_literal','3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301069,300301,69,'renglon_literal','igual o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301070,300301,70,'renglon_literal','Perfil requerido Estudiante de posgrado en Química','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300301071,300301,71,'renglon_literal','PAPA mayor o igual a 4.0','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300302,3003,2,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 2 de 3
Dominio de conceptos fundamentales de química general
Experiencia en apoyo a cursos de laboratorio de Química básica
Experiencia en manejo del aplicativo HERMES
Actividades a desarrollar
1. Apoyo en el ajuste de la información solicitada en los reportes de laboratorio.
2. Apoyo en la consolidación de información de la evaluación al curso.
3. Apoyar en la generación del inventario de reactivos utilizados en las prácticas
seleccionadas.
Modalidad de las
actividades
⛝ ☐ ☐
Presencial Virtual Mixta
Disponibilidad de tiempo
requerida
20 H/semana
Estímulo económico
mensual
$ 1.850.000
Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de
monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por
la distinción de Grado de Honor de la Universidad Nacional de Colombia.
Duración de la vinculación
15 Días
Los Estudiantes Auxiliares no tendrán la calidad de empleados, trabajadores o contratistas. Su relación
es fundamentalmente académica y no constituye vínculo laboral ni contractual con la Universidad.
Forma de Selección
Se recibe el total de hojas de vida para evaluar por puntaje de criterios los cuales son:
1. Valor P.A. P.A.
2. Estudiante de posgrado del programa de Química.
3. Dominio de conceptos fundamentales de química general.
4. Experiencia en apoyo a cursos de laboratorio de Química básica.
5. Experiencia en manejo del aplicativo HERMES.
Tendrán una ponderación cada criterio del 20% para un total del 100%.
Términos para la
presentación de
documentos
Enviar los documentos al correo ysantosp@unal.edu.co oficina 441
Fecha de cierre de la
convocatoria
19/Nov/2026 04:00 p.m.
Documentación requerida
- Hoja de vida del estudiante.
- Fotocopia de la cédula.
- Fotocopia del carné de estudiante.
- Historia académica del SIA.
- Formato Autorización para Verificación de Inhabilidad por Delitos Sexuales Cometidos
Contra Menores. (Obligatorio)
Documentos opcionales
(no pueden ser
modificatorios)
En la hoja de vida, describir la experiencia en cursos de química básica y manejo de aplicativo
Hermes.','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302001,300302,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302002,300302,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302003,300302,3,'renglon_literal','Formato convocatoria estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302004,300302,4,'renglon_literal','Código: U.FT.05.007.013 Versión: 2.0 Página 2 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302005,300302,5,'renglon_literal','Dominio de conceptos fundamentales de química general','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302006,300302,6,'renglon_literal','Experiencia en apoyo a cursos de laboratorio de Química básica','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302007,300302,7,'renglon_literal','Experiencia en manejo del aplicativo HERMES','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302008,300302,8,'renglon_literal','Actividades a desarrollar','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302009,300302,9,'renglon_literal','1. Apoyo en el ajuste de la información solicitada en los reportes de laboratorio.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302010,300302,10,'renglon_literal','2. Apoyo en la consolidación de información de la evaluación al curso.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302011,300302,11,'renglon_literal','3. Apoyar en la generación del inventario de reactivos utilizados en las prácticas','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302012,300302,12,'renglon_literal','seleccionadas.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302013,300302,13,'renglon_literal','Modalidad de las','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302014,300302,14,'renglon_literal','actividades','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302015,300302,15,'renglon_literal','⛝ ☐ ☐','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302016,300302,16,'renglon_literal','Presencial Virtual Mixta','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302017,300302,17,'renglon_literal','Disponibilidad de tiempo','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302018,300302,18,'renglon_literal','requerida','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302019,300302,19,'renglon_literal','20 H/semana','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302020,300302,20,'renglon_literal','Estímulo económico','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302021,300302,21,'renglon_literal','mensual','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302022,300302,22,'renglon_literal','$ 1.850.000','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302023,300302,23,'renglon_literal','Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302024,300302,24,'renglon_literal','monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302025,300302,25,'renglon_literal','la distinción de Grado de Honor de la Universidad Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302026,300302,26,'renglon_literal','Duración de la vinculación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302027,300302,27,'renglon_literal','15 Días','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302028,300302,28,'renglon_literal','Los Estudiantes Auxiliares no tendrán la calidad de empleados, trabajadores o contratistas. Su relación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302029,300302,29,'renglon_literal','es fundamentalmente académica y no constituye vínculo laboral ni contractual con la Universidad.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302030,300302,30,'renglon_literal','Forma de Selección','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302031,300302,31,'renglon_literal','Se recibe el total de hojas de vida para evaluar por puntaje de criterios los cuales son:','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302032,300302,32,'renglon_literal','1. Valor P.A. P.A.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302033,300302,33,'renglon_literal','2. Estudiante de posgrado del programa de Química.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302034,300302,34,'renglon_literal','3. Dominio de conceptos fundamentales de química general.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302035,300302,35,'renglon_literal','4. Experiencia en apoyo a cursos de laboratorio de Química básica.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302036,300302,36,'renglon_literal','5. Experiencia en manejo del aplicativo HERMES.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302037,300302,37,'renglon_literal','Tendrán una ponderación cada criterio del 20% para un total del 100%.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302038,300302,38,'renglon_literal','Términos para la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302039,300302,39,'renglon_literal','presentación de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302040,300302,40,'renglon_literal','documentos','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302041,300302,41,'renglon_literal','Enviar los documentos al correo ysantosp@unal.edu.co oficina 441','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302042,300302,42,'renglon_literal','Fecha de cierre de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302043,300302,43,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302044,300302,44,'renglon_literal','19/Nov/2026 04:00 p.m.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302045,300302,45,'renglon_literal','Documentación requerida','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302046,300302,46,'renglon_literal','- Hoja de vida del estudiante.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302047,300302,47,'renglon_literal','- Fotocopia de la cédula.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302048,300302,48,'renglon_literal','- Fotocopia del carné de estudiante.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302049,300302,49,'renglon_literal','- Historia académica del SIA.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302050,300302,50,'renglon_literal','- Formato Autorización para Verificación de Inhabilidad por Delitos Sexuales Cometidos','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302051,300302,51,'renglon_literal','Contra Menores. (Obligatorio)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302052,300302,52,'renglon_literal','Documentos opcionales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302053,300302,53,'renglon_literal','(no pueden ser','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302054,300302,54,'renglon_literal','modificatorios)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302055,300302,55,'renglon_literal','En la hoja de vida, describir la experiencia en cursos de química básica y manejo de aplicativo','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300302056,300302,56,'renglon_literal','Hermes.','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300303,3003,3,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de
identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección por
los canales de divulgación que la Universidad disponga para tal fin.
En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal
recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección de
Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual puede ser
consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que garantizan la
seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar las autorizaciones
dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail
protecdatos_na@unal.edu.co.
Código: U.FT.05.007.013 Versión: 2.0 Página 3 de 3
Responsable de la
convocatoria
Yesmith Santos Panqueva - Docente, ysantosp@unal.edu.co, Cel: 3044910572
Criterios de evaluación 1. P.A.P.A. 20%
2. Estudiante de posgrado en Química 20%
3. Dominio de conceptos fundamentales de química general 20%
4. Experiencia en apoyo a cursos de laboratorio de Química básica 20%
5. Experiencia en manejo del aplicativo HERMES 20%
Fecha límite de
Publicación de Resultados
08/Dic/2026 10:00 a.m.','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303001,300303,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303002,300303,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303003,300303,3,'renglon_literal','Formato convocatoria estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303004,300303,4,'renglon_literal','Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303005,300303,5,'renglon_literal','identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección por','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303006,300303,6,'renglon_literal','los canales de divulgación que la Universidad disponga para tal fin.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303007,300303,7,'renglon_literal','En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303008,300303,8,'renglon_literal','recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303009,300303,9,'renglon_literal','Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual puede ser','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303010,300303,10,'renglon_literal','consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que garantizan la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303011,300303,11,'renglon_literal','seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar las autorizaciones','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303012,300303,12,'renglon_literal','dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303013,300303,13,'renglon_literal','protecdatos_na@unal.edu.co.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303014,300303,14,'renglon_literal','Código: U.FT.05.007.013 Versión: 2.0 Página 3 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303015,300303,15,'renglon_literal','Responsable de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303016,300303,16,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303017,300303,17,'renglon_literal','Yesmith Santos Panqueva - Docente, ysantosp@unal.edu.co, Cel: 3044910572','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303018,300303,18,'renglon_literal','Criterios de evaluación 1. P.A.P.A. 20%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303019,300303,19,'renglon_literal','2. Estudiante de posgrado en Química 20%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303020,300303,20,'renglon_literal','3. Dominio de conceptos fundamentales de química general 20%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303021,300303,21,'renglon_literal','4. Experiencia en apoyo a cursos de laboratorio de Química básica 20%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303022,300303,22,'renglon_literal','5. Experiencia en manejo del aplicativo HERMES 20%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303023,300303,23,'renglon_literal','Fecha límite de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303024,300303,24,'renglon_literal','Publicación de Resultados','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300303025,300303,25,'renglon_literal','08/Dic/2026 10:00 a.m.','pendiente');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (310,'2026-C2380','sin_verificar','Lote 3, fuente Convocatorias Abiertas fila 3');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (310,3,'Convocatorias Abiertas',3,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3101,310,310,'hoja_calculo','2026-C2380','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6201,310,'A','Tipo de convocatoria','Pregrado','{"stringValue":"Pregrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6202,310,'B','Facultad','Facultad de Artes','{"stringValue":"Facultad de Artes"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6203,310,'C','Programa curricular','Estudiante de Arquitectura ','{"stringValue":"Estudiante de Arquitectura "}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6204,310,'D','Coordinacion Pregrado de Diseno Grafico','https://drive.google.com/file/d/1IjdXBQIWd2c1tGMGHTuC7d08vCvpqTvK/view?usp=drivesdk','{"stringValue":"https://drive.google.com/file/d/1IjdXBQIWd2c1tGMGHTuC7d08vCvpqTvK/view?usp=drivesdk"}',NULL,'https://drive.google.com/file/d/1IjdXBQIWd2c1tGMGHTuC7d08vCvpqTvK/view?usp=drivesdk',NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}},"link":{"uri":"https://drive.google.com/file/d/1IjdXBQIWd2c1tGMGHTuC7d08vCvpqTvK/view?usp=drivesdk"}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6205,310,'E','Estado de la convocatoria','Abierta','{"stringValue":"Abierta"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6206,310,'F','Nombre de la convocatoria, proyecto o Proceso','ESCUELA DE GESTIÓN AMBIENTAL COMUNITARIA ENDA -FASE XVIII - PIC 2026','{"stringValue":"ESCUELA DE GESTIÓN AMBIENTAL COMUNITARIA ENDA -FASE XVIII - PIC 2026"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6207,310,'G','Correo del responsable','aibatac@unal.edu.co','{"stringValue":"aibatac@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6208,310,'H','Fecha de publicación','12-nov-2026','{"numberValue":46338}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6209,310,'I','Fecha y hora de cierre de la convocatoria','19/11/2026 5:00:00 p. m.','{"numberValue":46345.708333333336}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (6210,310,'J','Número de convocatoria','2026-C2380','{"stringValue":"2026-C2380"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (3101,'caso_convocatoria',310,'documento_pendiente','{"rol":"resultados","referencia_celda":"Pestaña de abiertas no tiene columna de resultados","motivo":"no_disponible_en_hoja_abiertas","verificacion":"pendiente_publicacion"}');
INSERT INTO documento (documento_id,tipo_sugerido,url_origen,drive_id,titulo_archivo,mime_type,capturado_en,estado_acceso,estado_extraccion,notas) VALUES (3004,'convocatoria','https://drive.google.com/file/d/1IjdXBQIWd2c1tGMGHTuC7d08vCvpqTvK/view?usp=drivesdk','1IjdXBQIWd2c1tGMGHTuC7d08vCvpqTvK','2026-C2380','application/pdf','2026-11-13','leido','transcrito_sin_cotejo_visual','El PDF binario y su huella SHA256 no se han incorporado; texto extraído literalmente disponible en campo_documento y renglones.');
INSERT INTO vinculo_caso (vinculo_id,caso_id,documento_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (3102,310,3004,'convocatoria','2026-C2380','transcrito_pendiente_revision');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,estado_revision) VALUES (3004001,3004,'texto_extraido_integro',1,'Transcripción íntegra devuelta por Drive','Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 1 de 3
Número de la
Convocatoria
2026-C2380
Fecha de publicación de la
convocatoria
12 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
Facultad de Artes - Centro de Extensión Académica
Nombre de la
convocatoria
ESCUELA DE GESTIÓN AMBIENTAL COMUNITARIA ENDA -FASE XVIII - PIC 2026
Tipo de estudiante Pregrado ⛝ Posgrado ☐
Tipo de actividades a
desarrollar en la
convocatoria
☐ ⛝ ☐ ☐ ☐
Docencia
(Apoyo
Académico)
Apoyo a proyectos
investigación o
extensión
Gestión
Administrativa
Bienestar
universitario
Otro
No. de estudiantes a
vincular
1
Requisitos generales
(Art. 2 Acuerdo CSU 024
de 2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de
Colombia.
b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener
un Promedio Aritmético Ponderado Acumulado P.A.P.A. igual o superior a 3.5. para
estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado
c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar
universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético
Ponderado Acumulado P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o
superior a 4.0 para estudiantes de posgrado
d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que
obtuvieron la beca de posgrado por la distinción de Grado de Honor de la Universidad
Nacional de Colombia.
e. No tener calidad de funcionario público (administrativo o docente de planta) de la
Universidad Nacional de Colombia.
f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e
inscrita al menos la carga mínima exigida por el Estatuto Estudiantil.
g. No haber tenido sanciones disciplinarias.
PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de
apoyo a estudiantes en las cuales no se reciba una retribución económica por la realización de
actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal
desarrollo de su actividad académica.
PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer
periodo académico de un programa de posgrado cumplir una de las siguientes condiciones, de
acuerdo con el tipo de admisión, así:
1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.
2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo
008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones
académicas.
3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico
igual o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.
Perfil requerido Estudiante de Arquitectura
Promedio acumulado superior o igual a 3.0Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 2 de 3
Avance de carrera superior a 25%
Haber cursado historia de la arquitectura, teoría de la arquitectura con nota igual o superior a
4.5
Actividades a desarrollar
1. Apoyar el registro de los participantes de los cursos en la Plataforma HERMES.
2. Apoyar la consolidación de los certificados finales de los participantes en la plataforma
HERMES.
3. Apoyar en la entrega del informe final de gestión en el formato establecido por ENDA
Modalidad de las
actividades
☐ ☐ ⛝
Presencial Virtual Mixta
Disponibilidad de tiempo
requerida
10 H/semana
Estímulo económico
mensual
$ 1.780.000
Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de
monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por
la distinción de Grado de Honor de la Universidad Nacional de Colombia.
Duración de la vinculación
20 Días.
Los Estudiantes Auxiliares no tendrán la calidad de empleados, trabajadores o contratistas. Su relación
es fundamentalmente académica y no constituye vínculo laboral ni contractual con la Universidad.
Forma de Selección
SE SELECCIONARÀ AL ESTUDIANTE QUE OBTENGA EL MAYOR PUNTAJE DE LA SUMATORIA
DE LOS CRITERIOS DE EVALIACION PREVIO CUMPLIMIENO A CADA UNO DE LOS
CRITERIOS Y TENIENDO EN CUENTA QUE EL P.A.P.A. SE CALIFICARA A MAYOR P.A.P.A.
MAYOR PUNTAJE.
Términos para la
presentación de
documentos
Enviar los documentos a los correo cea_farbog@unal.edu.co
Fecha de cierre de la
convocatoria
19/Nov/2026 05:00 p.m.
Documentación requerida
• Hoja de vida formato único (debidamente firmada):
http://www.unal.edu.co/gerencia_finad/documentos/HV_ persona_natural.pdf
• Historia Académica del SIA incluido el P.A.P.A. y avance de carrera
• Fotocopia de la cédula de ciudadanía (por ambas caras)
• Formato Autorización para Verificación de Inhabilidad por Delitos Sexuales
Cometidos Contra Menores. (Obligatorio)
• Carta de motivación o de interés
Documentos opcionales
(no pueden ser
modificatorios)Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de
identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección por
los canales de divulgación que la Universidad disponga para tal fin.
En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal
recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección de
Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual puede ser
consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que garantizan la
seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar las autorizaciones
dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail
protecdatos_na@unal.edu.co.
Código: U.FT.05.007.013 Versión: 2.0 Página 3 de 3
Responsable de la
convocatoria
Alvaro Ibata Ceballos, aibatac@unal.edu.co, Ext: 12110
Criterios de evaluación 1. Estudiante de Arquitectura 10%
2. Promedio acumulado superior o igual a 3.0 = 10%
3. Avance de carrera superior a 25% = 10%
4. Haber cursado historia de la arquitectura, teoría de la arquitectura con nota igual o superior
a 4.5 = 30%
5. Carta de Motivación 40%
Fecha límite de
Publicación de Resultados
10/Dic/2026 05:00 p.m.','sin_cotejo_visual');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004002,3004,'número_de_la',1,'Número de la','Número de la
Convocatoria
2026-C2380
Fecha de publicación de la
convocatoria
12 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
F','{"desplazamiento":179,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004003,3004,'fecha_de_publicación_de_la',1,'Fecha de publicación de la','Fecha de publicación de la
convocatoria
12 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
Facultad de Artes - Centro de Extensión A','{"desplazamiento":219,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004004,3004,'nombre_de_la',1,'Nombre de la','Nombre de la
convocatoria
ESCUELA DE GESTIÓN AMBIENTAL COMUNITARIA ENDA -FASE XVIII - PIC 2026
Tipo de estudiante Pregrado ⛝ Posgrado ☐
Tipo de ac','{"desplazamiento":379,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004005,3004,'tipo_de_estudiante',1,'Tipo de estudiante','Tipo de estudiante Pregrado ⛝ Posgrado ☐
Tipo de actividades a
desarrollar en la
convocatoria
☐ ⛝ ☐ ☐ ☐
Docencia
(Apoyo
Académico)
Apoyo a pro','{"desplazamiento":477,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004006,3004,'perfil_requerido',1,'Perfil requerido','Perfil requerido Estudiante de Arquitectura
Promedio acumulado superior o igual a 3.0Macroproceso: Formación
Proceso: Gestión Administrativa de Apoy','{"desplazamiento":3043,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004007,3004,'actividades_a_desarrollar',1,'actividades a desarrollar','actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener
un Promedio Aritmético Ponderado Acumulado P.A.P.A. igual o sup','{"desplazamiento":922,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004008,3004,'actividades_a_desarrollar',2,'actividades a desarrollar','actividades a desarrollar están relacionadas con investigación, extensión, bienestar
universitario o de gestión administrativa el estudiante deberá t','{"desplazamiento":1181,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004009,3004,'actividades_a_desarrollar',3,'Actividades a desarrollar','Actividades a desarrollar
1. Apoyar el registro de los participantes de los cursos en la Plataforma HERMES.
2. Apoyar la consolidación de los certif','{"desplazamiento":3445,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004010,3004,'modalidad_de_las',1,'Modalidad de las','Modalidad de las
actividades
☐ ☐ ⛝
Presencial Virtual Mixta
Disponibilidad de tiempo
requerida
10 H/semana
Estímulo económico
mensual
$ 1.780','{"desplazamiento":3747,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004011,3004,'disponibilidad_de_tiempo',1,'Disponibilidad de tiempo','Disponibilidad de tiempo
requerida
10 H/semana
Estímulo económico
mensual
$ 1.780.000
Este estímulo es incompatible con el estímulo económico qu','{"desplazamiento":3811,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004012,3004,'estímulo_económico',1,'Estímulo económico','Estímulo económico
mensual
$ 1.780.000
Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de
monitor ac','{"desplazamiento":3861,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004013,3004,'estímulo_económico',2,'estímulo económico','estímulo económico que se otorga por ostentar la calidad de
monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de po','{"desplazamiento":3940,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004014,3004,'duración_de_la_vinculación',1,'Duración de la vinculación','Duración de la vinculación
20 Días.
Los Estudiantes Auxiliares no tendrán la calidad de empleados, trabajadores o contratistas. Su relación
es fund','{"desplazamiento":4175,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004015,3004,'forma_de_selección',1,'Forma de Selección','Forma de Selección
SE SELECCIONARÀ AL ESTUDIANTE QUE OBTENGA EL MAYOR PUNTAJE DE LA SUMATORIA
DE LOS CRITERIOS DE EVALIACION PREVIO CUMPLIMIENO A CA','{"desplazamiento":4416,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004016,3004,'términos_para_la',1,'Términos para la','Términos para la
presentación de
documentos
Enviar los documentos a los correo cea_farbog@unal.edu.co
Fecha de cierre de la
convocatoria
19/Nov/','{"desplazamiento":4676,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004017,3004,'fecha_de_cierre_de_la',1,'Fecha de cierre de la','Fecha de cierre de la
convocatoria
19/Nov/2026 05:00 p.m.
Documentación requerida
• Hoja de vida formato único (debidamente firmada):
http://www.','{"desplazamiento":4782,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004018,3004,'documentación_requerida',1,'Documentación requerida','Documentación requerida
• Hoja de vida formato único (debidamente firmada):
http://www.unal.edu.co/gerencia_finad/documentos/HV_ persona_natural.pdf','{"desplazamiento":4843,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004019,3004,'documentos_opcionales',1,'Documentos opcionales','Documentos opcionales
(no pueden ser
modificatorios)Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convoc','{"desplazamiento":5279,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004020,3004,'responsable_de_la',1,'Responsable de la','Responsable de la
convocatoria
Alvaro Ibata Ceballos, aibatac@unal.edu.co, Ext: 12110
Criterios de evaluación 1. Estudiante de Arquitectura 10%
2.','{"desplazamiento":6697,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (3004021,3004,'criterios_de_evaluación',1,'Criterios de evaluación','Criterios de evaluación 1. Estudiante de Arquitectura 10%
2. Promedio acumulado superior o igual a 3.0 = 10%
3. Avance de carrera superior a 25% = 1','{"desplazamiento":6786,"estado":"indice_no_cotejado"}','indice_sin_cotejo');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300401,3004,1,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 1 de 3
Número de la
Convocatoria
2026-C2380
Fecha de publicación de la
convocatoria
12 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
Facultad de Artes - Centro de Extensión Académica
Nombre de la
convocatoria
ESCUELA DE GESTIÓN AMBIENTAL COMUNITARIA ENDA -FASE XVIII - PIC 2026
Tipo de estudiante Pregrado ⛝ Posgrado ☐
Tipo de actividades a
desarrollar en la
convocatoria
☐ ⛝ ☐ ☐ ☐
Docencia
(Apoyo
Académico)
Apoyo a proyectos
investigación o
extensión
Gestión
Administrativa
Bienestar
universitario
Otro
No. de estudiantes a
vincular
1
Requisitos generales
(Art. 2 Acuerdo CSU 024
de 2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de
Colombia.
b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener
un Promedio Aritmético Ponderado Acumulado P.A.P.A. igual o superior a 3.5. para
estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado
c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar
universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético
Ponderado Acumulado P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o
superior a 4.0 para estudiantes de posgrado
d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que
obtuvieron la beca de posgrado por la distinción de Grado de Honor de la Universidad
Nacional de Colombia.
e. No tener calidad de funcionario público (administrativo o docente de planta) de la
Universidad Nacional de Colombia.
f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e
inscrita al menos la carga mínima exigida por el Estatuto Estudiantil.
g. No haber tenido sanciones disciplinarias.
PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de
apoyo a estudiantes en las cuales no se reciba una retribución económica por la realización de
actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal
desarrollo de su actividad académica.
PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer
periodo académico de un programa de posgrado cumplir una de las siguientes condiciones, de
acuerdo con el tipo de admisión, así:
1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.
2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo
008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones
académicas.
3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico
igual o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.
Perfil requerido Estudiante de Arquitectura
Promedio acumulado superior o igual a 3.0','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401001,300401,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401002,300401,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401003,300401,3,'renglon_literal','Formato convocatoria estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401004,300401,4,'renglon_literal','Código: U.FT.05.007.013 Versión: 2.0 Página 1 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401005,300401,5,'renglon_literal','Número de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401006,300401,6,'renglon_literal','Convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401007,300401,7,'renglon_literal','2026-C2380','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401008,300401,8,'renglon_literal','Fecha de publicación de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401009,300401,9,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401010,300401,10,'renglon_literal','12 11 2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401011,300401,11,'renglon_literal','Nombre Facultad,','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401012,300401,12,'renglon_literal','dependencia o proyecto','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401013,300401,13,'renglon_literal','que convoca','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401014,300401,14,'renglon_literal','Facultad de Artes - Centro de Extensión Académica','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401015,300401,15,'renglon_literal','Nombre de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401016,300401,16,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401017,300401,17,'renglon_literal','ESCUELA DE GESTIÓN AMBIENTAL COMUNITARIA ENDA -FASE XVIII - PIC 2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401018,300401,18,'renglon_literal','Tipo de estudiante Pregrado ⛝ Posgrado ☐','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401019,300401,19,'renglon_literal','Tipo de actividades a','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401020,300401,20,'renglon_literal','desarrollar en la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401021,300401,21,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401022,300401,22,'renglon_literal','☐ ⛝ ☐ ☐ ☐','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401023,300401,23,'renglon_literal','Docencia','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401024,300401,24,'renglon_literal','(Apoyo','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401025,300401,25,'renglon_literal','Académico)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401026,300401,26,'renglon_literal','Apoyo a proyectos','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401027,300401,27,'renglon_literal','investigación o','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401028,300401,28,'renglon_literal','extensión','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401029,300401,29,'renglon_literal','Gestión','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401030,300401,30,'renglon_literal','Administrativa','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401031,300401,31,'renglon_literal','Bienestar','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401032,300401,32,'renglon_literal','universitario','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401033,300401,33,'renglon_literal','Otro','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401034,300401,34,'renglon_literal','No. de estudiantes a','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401035,300401,35,'renglon_literal','vincular','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401036,300401,36,'renglon_literal','1','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401037,300401,37,'renglon_literal','Requisitos generales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401038,300401,38,'renglon_literal','(Art. 2 Acuerdo CSU 024','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401039,300401,39,'renglon_literal','de 2022)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401040,300401,40,'renglon_literal','a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401041,300401,41,'renglon_literal','Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401042,300401,42,'renglon_literal','b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401043,300401,43,'renglon_literal','un Promedio Aritmético Ponderado Acumulado P.A.P.A. igual o superior a 3.5. para','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401044,300401,44,'renglon_literal','estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401045,300401,45,'renglon_literal','c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401046,300401,46,'renglon_literal','universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401047,300401,47,'renglon_literal','Ponderado Acumulado P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401048,300401,48,'renglon_literal','superior a 4.0 para estudiantes de posgrado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401049,300401,49,'renglon_literal','d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401050,300401,50,'renglon_literal','obtuvieron la beca de posgrado por la distinción de Grado de Honor de la Universidad','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401051,300401,51,'renglon_literal','Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401052,300401,52,'renglon_literal','e. No tener calidad de funcionario público (administrativo o docente de planta) de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401053,300401,53,'renglon_literal','Universidad Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401054,300401,54,'renglon_literal','f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401055,300401,55,'renglon_literal','inscrita al menos la carga mínima exigida por el Estatuto Estudiantil.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401056,300401,56,'renglon_literal','g. No haber tenido sanciones disciplinarias.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401057,300401,57,'renglon_literal','PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401058,300401,58,'renglon_literal','apoyo a estudiantes en las cuales no se reciba una retribución económica por la realización de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401059,300401,59,'renglon_literal','actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401060,300401,60,'renglon_literal','desarrollo de su actividad académica.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401061,300401,61,'renglon_literal','PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401062,300401,62,'renglon_literal','periodo académico de un programa de posgrado cumplir una de las siguientes condiciones, de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401063,300401,63,'renglon_literal','acuerdo con el tipo de admisión, así:','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401064,300401,64,'renglon_literal','1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401065,300401,65,'renglon_literal','2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401066,300401,66,'renglon_literal','008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401067,300401,67,'renglon_literal','académicas.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401068,300401,68,'renglon_literal','3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401069,300401,69,'renglon_literal','igual o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401070,300401,70,'renglon_literal','Perfil requerido Estudiante de Arquitectura','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300401071,300401,71,'renglon_literal','Promedio acumulado superior o igual a 3.0','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300402,3004,2,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 2 de 3
Avance de carrera superior a 25%
Haber cursado historia de la arquitectura, teoría de la arquitectura con nota igual o superior a
4.5
Actividades a desarrollar
1. Apoyar el registro de los participantes de los cursos en la Plataforma HERMES.
2. Apoyar la consolidación de los certificados finales de los participantes en la plataforma
HERMES.
3. Apoyar en la entrega del informe final de gestión en el formato establecido por ENDA
Modalidad de las
actividades
☐ ☐ ⛝
Presencial Virtual Mixta
Disponibilidad de tiempo
requerida
10 H/semana
Estímulo económico
mensual
$ 1.780.000
Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de
monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por
la distinción de Grado de Honor de la Universidad Nacional de Colombia.
Duración de la vinculación
20 Días.
Los Estudiantes Auxiliares no tendrán la calidad de empleados, trabajadores o contratistas. Su relación
es fundamentalmente académica y no constituye vínculo laboral ni contractual con la Universidad.
Forma de Selección
SE SELECCIONARÀ AL ESTUDIANTE QUE OBTENGA EL MAYOR PUNTAJE DE LA SUMATORIA
DE LOS CRITERIOS DE EVALIACION PREVIO CUMPLIMIENO A CADA UNO DE LOS
CRITERIOS Y TENIENDO EN CUENTA QUE EL P.A.P.A. SE CALIFICARA A MAYOR P.A.P.A.
MAYOR PUNTAJE.
Términos para la
presentación de
documentos
Enviar los documentos a los correo cea_farbog@unal.edu.co
Fecha de cierre de la
convocatoria
19/Nov/2026 05:00 p.m.
Documentación requerida
• Hoja de vida formato único (debidamente firmada):
http://www.unal.edu.co/gerencia_finad/documentos/HV_ persona_natural.pdf
• Historia Académica del SIA incluido el P.A.P.A. y avance de carrera
• Fotocopia de la cédula de ciudadanía (por ambas caras)
• Formato Autorización para Verificación de Inhabilidad por Delitos Sexuales
Cometidos Contra Menores. (Obligatorio)
• Carta de motivación o de interés
Documentos opcionales
(no pueden ser
modificatorios)','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402001,300402,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402002,300402,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402003,300402,3,'renglon_literal','Formato convocatoria estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402004,300402,4,'renglon_literal','Código: U.FT.05.007.013 Versión: 2.0 Página 2 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402005,300402,5,'renglon_literal','Avance de carrera superior a 25%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402006,300402,6,'renglon_literal','Haber cursado historia de la arquitectura, teoría de la arquitectura con nota igual o superior a','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402007,300402,7,'renglon_literal','4.5','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402008,300402,8,'renglon_literal','Actividades a desarrollar','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402009,300402,9,'renglon_literal','1. Apoyar el registro de los participantes de los cursos en la Plataforma HERMES.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402010,300402,10,'renglon_literal','2. Apoyar la consolidación de los certificados finales de los participantes en la plataforma','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402011,300402,11,'renglon_literal','HERMES.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402012,300402,12,'renglon_literal','3. Apoyar en la entrega del informe final de gestión en el formato establecido por ENDA','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402013,300402,13,'renglon_literal','Modalidad de las','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402014,300402,14,'renglon_literal','actividades','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402015,300402,15,'renglon_literal','☐ ☐ ⛝','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402016,300402,16,'renglon_literal','Presencial Virtual Mixta','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402017,300402,17,'renglon_literal','Disponibilidad de tiempo','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402018,300402,18,'renglon_literal','requerida','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402019,300402,19,'renglon_literal','10 H/semana','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402020,300402,20,'renglon_literal','Estímulo económico','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402021,300402,21,'renglon_literal','mensual','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402022,300402,22,'renglon_literal','$ 1.780.000','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402023,300402,23,'renglon_literal','Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402024,300402,24,'renglon_literal','monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402025,300402,25,'renglon_literal','la distinción de Grado de Honor de la Universidad Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402026,300402,26,'renglon_literal','Duración de la vinculación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402027,300402,27,'renglon_literal','20 Días.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402028,300402,28,'renglon_literal','Los Estudiantes Auxiliares no tendrán la calidad de empleados, trabajadores o contratistas. Su relación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402029,300402,29,'renglon_literal','es fundamentalmente académica y no constituye vínculo laboral ni contractual con la Universidad.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402030,300402,30,'renglon_literal','Forma de Selección','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402031,300402,31,'renglon_literal','SE SELECCIONARÀ AL ESTUDIANTE QUE OBTENGA EL MAYOR PUNTAJE DE LA SUMATORIA','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402032,300402,32,'renglon_literal','DE LOS CRITERIOS DE EVALIACION PREVIO CUMPLIMIENO A CADA UNO DE LOS','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402033,300402,33,'renglon_literal','CRITERIOS Y TENIENDO EN CUENTA QUE EL P.A.P.A. SE CALIFICARA A MAYOR P.A.P.A.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402034,300402,34,'renglon_literal','MAYOR PUNTAJE.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402035,300402,35,'renglon_literal','Términos para la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402036,300402,36,'renglon_literal','presentación de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402037,300402,37,'renglon_literal','documentos','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402038,300402,38,'renglon_literal','Enviar los documentos a los correo cea_farbog@unal.edu.co','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402039,300402,39,'renglon_literal','Fecha de cierre de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402040,300402,40,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402041,300402,41,'renglon_literal','19/Nov/2026 05:00 p.m.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402042,300402,42,'renglon_literal','Documentación requerida','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402043,300402,43,'renglon_literal','• Hoja de vida formato único (debidamente firmada):','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402044,300402,44,'renglon_literal','http://www.unal.edu.co/gerencia_finad/documentos/HV_ persona_natural.pdf','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402045,300402,45,'renglon_literal','• Historia Académica del SIA incluido el P.A.P.A. y avance de carrera','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402046,300402,46,'renglon_literal','• Fotocopia de la cédula de ciudadanía (por ambas caras)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402047,300402,47,'renglon_literal','• Formato Autorización para Verificación de Inhabilidad por Delitos Sexuales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402048,300402,48,'renglon_literal','Cometidos Contra Menores. (Obligatorio)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402049,300402,49,'renglon_literal','• Carta de motivación o de interés','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402050,300402,50,'renglon_literal','Documentos opcionales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402051,300402,51,'renglon_literal','(no pueden ser','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300402052,300402,52,'renglon_literal','modificatorios)','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (300403,3004,3,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de
identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección por
los canales de divulgación que la Universidad disponga para tal fin.
En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal
recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección de
Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual puede ser
consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que garantizan la
seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar las autorizaciones
dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail
protecdatos_na@unal.edu.co.
Código: U.FT.05.007.013 Versión: 2.0 Página 3 de 3
Responsable de la
convocatoria
Alvaro Ibata Ceballos, aibatac@unal.edu.co, Ext: 12110
Criterios de evaluación 1. Estudiante de Arquitectura 10%
2. Promedio acumulado superior o igual a 3.0 = 10%
3. Avance de carrera superior a 25% = 10%
4. Haber cursado historia de la arquitectura, teoría de la arquitectura con nota igual o superior
a 4.5 = 30%
5. Carta de Motivación 40%
Fecha límite de
Publicación de Resultados
10/Dic/2026 05:00 p.m.','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403001,300403,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403002,300403,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403003,300403,3,'renglon_literal','Formato convocatoria estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403004,300403,4,'renglon_literal','Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403005,300403,5,'renglon_literal','identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección por','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403006,300403,6,'renglon_literal','los canales de divulgación que la Universidad disponga para tal fin.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403007,300403,7,'renglon_literal','En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403008,300403,8,'renglon_literal','recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403009,300403,9,'renglon_literal','Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual puede ser','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403010,300403,10,'renglon_literal','consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que garantizan la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403011,300403,11,'renglon_literal','seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar las autorizaciones','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403012,300403,12,'renglon_literal','dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403013,300403,13,'renglon_literal','protecdatos_na@unal.edu.co.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403014,300403,14,'renglon_literal','Código: U.FT.05.007.013 Versión: 2.0 Página 3 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403015,300403,15,'renglon_literal','Responsable de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403016,300403,16,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403017,300403,17,'renglon_literal','Alvaro Ibata Ceballos, aibatac@unal.edu.co, Ext: 12110','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403018,300403,18,'renglon_literal','Criterios de evaluación 1. Estudiante de Arquitectura 10%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403019,300403,19,'renglon_literal','2. Promedio acumulado superior o igual a 3.0 = 10%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403020,300403,20,'renglon_literal','3. Avance de carrera superior a 25% = 10%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403021,300403,21,'renglon_literal','4. Haber cursado historia de la arquitectura, teoría de la arquitectura con nota igual o superior','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403022,300403,22,'renglon_literal','a 4.5 = 30%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403023,300403,23,'renglon_literal','5. Carta de Motivación 40%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403024,300403,24,'renglon_literal','Fecha límite de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403025,300403,25,'renglon_literal','Publicación de Resultados','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (300403026,300403,26,'renglon_literal','10/Dic/2026 05:00 p.m.','pendiente');
COMMIT;
