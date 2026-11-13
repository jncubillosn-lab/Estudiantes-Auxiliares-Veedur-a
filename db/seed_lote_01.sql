-- Veeduría UNAL / lote 1: transcripción literal y datos observados
-- Ejecutar sobre db/schema.sql. Cotejo visual de PDF pendiente.
BEGIN TRANSACTION;
INSERT INTO captura_hoja (captura_id,url_origen,titulo_original,capturada_en,parametros_json,notas) VALUES (1,'https://docs.google.com/spreadsheets/d/1f3qQNRiNwdFMtLrcBsP-JEgZwLBWmMVcq7QXCLo_Sps/edit','Copia de Convocatorias Estudiantes Auxiliares - Sede Bogotá','2026-11-13','{"lote":1,"archivo":"data/lotes/lote_01.json","version":"0.1.1"}','El texto completo se preserva; paginación heurística, gráficos/columnas por cotejar visualmente; campos_detectados son índices orientativos, no transcripción final validada.');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (101,'2026-C2368','sin_verificar','Lote 1, fuente Convocatorias Cerradas fila 2');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (101,1,'Convocatorias Cerradas',2,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (1011,101,101,'hoja_calculo','2026-C2368','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2021,101,'A','Programa','Posgrado','{"stringValue":"Posgrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2022,101,'B','Facultad','Facultad de Ingeniería','{"stringValue":"Facultad de Ingeniería"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2023,101,'C','Programa curricular','Estudiante de posgrado de Ingeniería Eléctrica o Mecánica, con título de pregrado en Ingeniería Mecánica o Eléctrica','{"stringValue":"Estudiante de posgrado de Ingeniería Eléctrica o Mecánica, con título de pregrado en Ingeniería Mecánica o Eléctrica"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2024,101,'D','Archivo PDF de la convocatoria','https://drive.google.com/file/d/1-y55cdNlpsrm74zYd-dsi8umXnyj8Vk4/view?usp=drivesdk','{"stringValue":"https://drive.google.com/file/d/1-y55cdNlpsrm74zYd-dsi8umXnyj8Vk4/view?usp=drivesdk"}',NULL,'https://drive.google.com/file/d/1-y55cdNlpsrm74zYd-dsi8umXnyj8Vk4/view?usp=drivesdk',NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}},"link":{"uri":"https://drive.google.com/file/d/1-y55cdNlpsrm74zYd-dsi8umXnyj8Vk4/view?usp=drivesdk"}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2025,101,'E','Estado de la convocatoria','Cerrada','{"stringValue":"Cerrada"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2026,101,'F','Resultados',NULL,NULL,NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":true,"italic":false,"underline":false},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2027,101,'G','Nombre de la convocatoria, proyecto o Proceso','LABORATORIO DE INNOVACIÓN EN ALTA TENSIÓN Y ENERGÍAS RENOVABLES LIAT-ER','{"stringValue":"LABORATORIO DE INNOVACIÓN EN ALTA TENSIÓN Y ENERGÍAS RENOVABLES LIAT-ER"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2028,101,'H','Correo del responsable','faherreral@unal.edu.co;admliaterfi _bog@unal.edu.co','{"stringValue":"faherreral@unal.edu.co;admliaterfi _bog@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2029,101,'I','Fecha de publicación','12-nov-2026','{"numberValue":46338}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2030,101,'J','Fecha y hora de cierre de la convocatoria','13/11/2026 8:00:00 a. m.','{"numberValue":46339.333333333336}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2031,101,'K','Número de convocatoria','2026-C2368','{"stringValue":"2026-C2368"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (1011,'caso_convocatoria',101,'documento_pendiente','{"rol":"resultados","referencia_celda":"","motivo":"celda_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO documento (documento_id,tipo_sugerido,url_origen,drive_id,titulo_archivo,mime_type,capturado_en,estado_acceso,estado_extraccion,notas) VALUES (1001,'convocatoria','https://drive.google.com/file/d/1-y55cdNlpsrm74zYd-dsi8umXnyj8Vk4/view?usp=drivesdk','1-y55cdNlpsrm74zYd-dsi8umXnyj8Vk4','2026-C2368','application/pdf','2026-11-13','leido','transcrito_sin_cotejo_visual','El PDF binario y su huella SHA256 no se han incorporado; texto extraído literalmente disponible en campo_documento y renglones.');
INSERT INTO vinculo_caso (vinculo_id,caso_id,documento_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (1012,101,1001,'convocatoria','2026-C2368','transcrito_pendiente_revision');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,estado_revision) VALUES (1001001,1001,'texto_extraido_integro',1,'Transcripción íntegra devuelta por Drive','Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 1 de 4
Número de la
Convocatoria
2026-C2368
Fecha de publicación de la
convocatoria
09 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
Facultad de Ingeniería - Departamento de Ingeniería Eléctrica y Electrónica-LABORATORIO -
LIATER - LABORATORIO LIAT-ER
Nombre de la
convocatoria
LABORATORIO DE INNOVACIÓN EN ALTA TENSIÓN Y ENERGÍAS RENOVABLES LIAT-ER
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
Perfil requerido Estudiante de posgrado de Ingeniería Eléctrica o Mecánica, con título de pregrado en
Ingeniería Mecánica o EléctricaMacroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 2 de 4
Haber cursado y aprobado al menos una de las siguientes asignaturas: ya sea en programas de
pregrado o posgrado: Transición Energética, Sistemas Energéticos Sostenibles o Energías
Renovables.
ADENDA 2026-C2368-1 DEL 12/11/2026
Por la cual se modifica el siguiente ítem:
Haber cursado y aprobado al menos uno de los siguientes diplomados: Instalaciones
fotovoltaicas (Solares) o Eficiencia Energética.
Tener disponibilidad horaria de 20 horas semanales para desarrollar actividades en
instalaciones del laboratorio.
Actividades a desarrollar
-Apoyar en la recopilación, organización y documentación de información relacionada con
asignaturas de energías renovables, tanto a nivel nacional como internacional.
-Apoyar en el diseño e implementación de la estación de carga para vehículos eléctricos
-Apoyar en la elaboración de la documentación técnica, memorias y planos requeridos para la
ampliación de la estación de carga de vehículos eléctricos
-Apoyar en la elaboración y organización de documentos relacionados con las asignaturas de
Energías Renovables, Almacenamiento de Energía, Formulación de Proyectos y Gestión de la
Energía.
Modalidad de las
actividades
☐ ☐ ⛝
Presencial Virtual Mixta
Disponibilidad de tiempo
requerida
20 H/semana
Estímulo económico
mensual
$ 3.000.000
Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de
monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por
la distinción de Grado de Honor de la Universidad Nacional de Colombia.
Duración de la vinculación
80 Días
NOTA IMPORTANTE: La duración solicitada (80 días) puede exceder el 31 de diciembre de
2026. Por tal motivo puede existir una primera vinculación hasta el 31 de diciembre de 2026
y una segunda vinculación por el período restante en la vigencia 2027. En el caso en que no se
realice la vinculación en el año 2026, esta se hará en su totalidad en la vigencia del 2027.
Los Estudiantes Auxiliares no tendrán la calidad de empleados, trabajadores o contratistas. Su relación
es fundamentalmente académica y no constituye vínculo laboral ni contractual con la Universidad.
Forma de Selección
Cumplir con el perfil indicado en la convocatoria
Que el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo de su
actividad académica.
Términos para la
presentación de
documentos
admliaterfi_bog@unal.edu.co; liater_fibog@unal.edu.co
En el asunto del correo escribir el número de convocatoria y el nombre del postulado
Fecha de cierre de la
convocatoria
ADENDA 2026-C2368-1 DEL 12/11/2026
Por la cual se modifica la fecha de cierre al 13/Nov/2026 08:00 a.m.Macroproceso: Formación
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
Código: U.FT.05.007.013 Versión: 2.0 Página 3 de 4
Documentación requerida
En un sólo archivo PDF y en el siguiente orden:
1. Imprimir PDF de la convocatoria
2. Fotocopia de cédula-LEGIBLE
3. Formato único de Hoja de Vida diligenciado en su totalidad y FIRMADO
https://www.funcionpublica.gov.co/documents/418537/28811162/formato-unico-dehoja-de-vida-persona-natural.pdf/
4. Fotocopia de carnet estudiantil-LEGIBLE
5. Imprimir PDF de la Historia académica del SIA con porcentaje de avance y PAPA que
indique el usuario.
6. Pantallazo del P.A.P.A de acuerdo con SIA que indique el usuario-PDF
7. Horario del SIA que indique el usuario
8. Certificado PBM (Recibo de pago matrícula que lo evidencie).
9. Autorización para verificación de inhabilidad por delitos
sexuales cometidos contra menores y tratamiento de datos personales.
https://docs.google.com/document/d/12t1s-e4sIuj3ZNBV6UMJXhnPkTfzhufd/edit#heading=
h.z6ojnhfkgkym
Documentos opcionales
(no pueden ser
modificatorios)
Certificados en PDF de cursos adicionales
Responsable de la
convocatoria
Fernando A. Herrera León-María Nohora Mahecha-faherreral@unal.edu.co,
faherreral@unal.edu.co;admliaterfi _bog@unal.edu.co, Ext: 11117
Criterios de evaluación 1. Haber cursado y aprobado al menos una de las asignaturas ya sea en programas de
pregrado o posgrado: Transición Energética, Sistemas Energéticos Sostenibles o Energías
Renovables. 10%
2. Haber cursado y aprobado al menos uno de los diplomados en : Instalaciones Solares o
Eficiencia Energética. 10%
3. Disponibilidad horaria para desarrollar actividades en instalaciones del laboratorio 30%
4. Entrevista 50%
Fecha límite de
Publicación de Resultados
05/Dic/2026 10:00 a.m.Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 4 de 4','sin_cotejo_visual');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001002,1001,'número_de_la',1,'Número de la','Número de la
Convocatoria
2026-C2368
Fecha de publicación de la
convocatoria
09 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
Facultad de Ingeniería - Departamento de Ingeniería Eléctrica y Electró','{"linea_aproximada":5,"ubicacion_caracter":179,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001003,1001,'fecha_de_publicación_de_la',1,'Fecha de publicación de la','Fecha de publicación de la
convocatoria
09 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
Facultad de Ingeniería - Departamento de Ingeniería Eléctrica y Electrónica-LABORATORIO -
LIATER - LABORATORIO','{"linea_aproximada":8,"ubicacion_caracter":219,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001004,1001,'nombre_facultad,',1,'Nombre Facultad,','Nombre Facultad,
dependencia o proyecto
que convoca
Facultad de Ingeniería - Departamento de Ingeniería Eléctrica y Electrónica-LABORATORIO -
LIATER - LABORATORIO LIAT-ER
Nombre de la
convocatoria
LABORATORIO DE I','{"linea_aproximada":11,"ubicacion_caracter":273,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001005,1001,'nombre_de_la',1,'Nombre de la','Nombre de la
convocatoria
LABORATORIO DE INNOVACIÓN EN ALTA TENSIÓN Y ENERGÍAS RENOVABLES LIAT-ER
Tipo de estudiante Pregrado ☐ Posgrado ⛝
Tipo de actividades a
desarrollar en la
convocatoria
☐ ⛝ ☐ ☐ ☐
Docencia
','{"linea_aproximada":16,"ubicacion_caracter":449,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001006,1001,'tipo_de_estudiante',1,'Tipo de estudiante','Tipo de estudiante Pregrado ☐ Posgrado ⛝
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
Bienestar','{"linea_aproximada":19,"ubicacion_caracter":550,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001007,1001,'tipo_de_actividades_a',1,'Tipo de actividades a','Tipo de actividades a
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
No. de estudiantes ','{"linea_aproximada":20,"ubicacion_caracter":592,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001008,1001,'no._de_estudiantes_a',1,'No. de estudiantes a','No. de estudiantes a
vincular
1
Requisitos generales
(Art. 2 Acuerdo CSU 024
de 2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de
Colombia.
b. Si las actividades a desa','{"linea_aproximada":35,"ubicacion_caracter":793,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001009,1001,'requisitos_generales',1,'Requisitos generales','Requisitos generales
(Art. 2 Acuerdo CSU 024
de 2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de
Colombia.
b. Si las actividades a desarrollar están relacionadas con doce','{"linea_aproximada":38,"ubicacion_caracter":828,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001010,1001,'perfil_requerido',1,'Perfil requerido','Perfil requerido Estudiante de posgrado de Ingeniería Eléctrica o Mecánica, con título de pregrado en
Ingeniería Mecánica o EléctricaMacroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Form','{"linea_aproximada":71,"ubicacion_caracter":3116,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001011,1001,'actividades_a_desarrollar',1,'actividades a desarrollar','actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener
un Promedio Aritmético Ponderado Acumulado P.A.P.A. igual o superior a 3.5. para
estudiantes de pregrado, e igual o superior a 4.0 p','{"linea_aproximada":43,"ubicacion_caracter":995,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001012,1001,'actividades_a_desarrollar',2,'actividades a desarrollar','actividades a desarrollar están relacionadas con investigación, extensión, bienestar
universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético
Ponderado Acumulado P.A.P.A. igual o supe','{"linea_aproximada":46,"ubicacion_caracter":1254,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001013,1001,'actividades_a_desarrollar',3,'Actividades a desarrollar','Actividades a desarrollar
-Apoyar en la recopilación, organización y documentación de información relacionada con
asignaturas de energías renovables, tanto a nivel nacional como internacional.
-Apoyar en el diseño e i','{"linea_aproximada":85,"ubicacion_caracter":3953,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001014,1001,'modalidad_de_las',1,'Modalidad de las','Modalidad de las
actividades
☐ ☐ ⛝
Presencial Virtual Mixta
Disponibilidad de tiempo
requerida
20 H/semana
Estímulo económico
mensual
$ 3.000.000
Este estímulo es incompatible con el estímulo económico que se o','{"linea_aproximada":94,"ubicacion_caracter":4583,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001015,1001,'disponibilidad_de_tiempo',1,'Disponibilidad de tiempo','Disponibilidad de tiempo
requerida
20 H/semana
Estímulo económico
mensual
$ 3.000.000
Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de
monitor académico o becario, s','{"linea_aproximada":98,"ubicacion_caracter":4647,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001016,1001,'estímulo_económico',1,'Estímulo económico','Estímulo económico
mensual
$ 3.000.000
Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de
monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la b','{"linea_aproximada":101,"ubicacion_caracter":4697,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001017,1001,'estímulo_económico',2,'estímulo económico','estímulo económico que se otorga por ostentar la calidad de
monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por
la distinción de Grado de Honor de la Universidad Nacional','{"linea_aproximada":104,"ubicacion_caracter":4776,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001018,1001,'duración_de_la_vinculación',1,'Duración de la vinculación','Duración de la vinculación
80 Días
NOTA IMPORTANTE: La duración solicitada (80 días) puede exceder el 31 de diciembre de
2026. Por tal motivo puede existir una primera vinculación hasta el 31 de diciembre de 2026
y u','{"linea_aproximada":107,"ubicacion_caracter":5011,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001019,1001,'forma_de_selección',1,'Forma de Selección','Forma de Selección
Cumplir con el perfil indicado en la convocatoria
Que el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo de su
actividad académica.
Términos para la
presentación de
docu','{"linea_aproximada":115,"ubicacion_caracter":5621,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001020,1001,'términos_para_la',1,'Términos para la','Términos para la
presentación de
documentos
admliaterfi_bog@unal.edu.co; liater_fibog@unal.edu.co
En el asunto del correo escribir el número de convocatoria y el nombre del postulado
Fecha de cierre de la
convocato','{"linea_aproximada":119,"ubicacion_caracter":5802,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001021,1001,'fecha_de_cierre_de_la',1,'Fecha de cierre de la','Fecha de cierre de la
convocatoria
ADENDA 2026-C2368-1 DEL 12/11/2026
Por la cual se modifica la fecha de cierre al 13/Nov/2026 08:00 a.m.Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formació','{"linea_aproximada":124,"ubicacion_caracter":5990,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001022,1001,'documentación_requerida',1,'Documentación requerida','Documentación requerida
En un sólo archivo PDF y en el siguiente orden:
1. Imprimir PDF de la convocatoria
2. Fotocopia de cédula-LEGIBLE
3. Formato único de Hoja de Vida diligenciado en su totalidad y FIRMADO
https','{"linea_aproximada":141,"ubicacion_caracter":7495,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001023,1001,'documentos_opcionales',1,'Documentos opcionales','Documentos opcionales
(no pueden ser
modificatorios)
Certificados en PDF de cursos adicionales
Responsable de la
convocatoria
Fernando A. Herrera León-María Nohora Mahecha-faherreral@unal.edu.co,
faherreral@unal.e','{"linea_aproximada":157,"ubicacion_caracter":8386,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001024,1001,'responsable_de_la',1,'Responsable de la','Responsable de la
convocatoria
Fernando A. Herrera León-María Nohora Mahecha-faherreral@unal.edu.co,
faherreral@unal.edu.co;admliaterfi _bog@unal.edu.co, Ext: 11117
Criterios de evaluación 1. Haber cursado y aprobado','{"linea_aproximada":161,"ubicacion_caracter":8485,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001025,1001,'criterios_de_evaluación',1,'Criterios de evaluación','Criterios de evaluación 1. Haber cursado y aprobado al menos una de las asignaturas ya sea en programas de
pregrado o posgrado: Transición Energética, Sistemas Energéticos Sostenibles o Energías
Renovables. 10%
2. Hab','{"linea_aproximada":165,"ubicacion_caracter":8654,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001026,1001,'fecha_límite_de',1,'Fecha límite de','Fecha límite de
Publicación de Resultados
05/Dic/2026 10:00 a.m.Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Ver','{"linea_aproximada":172,"ubicacion_caracter":9097,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001027,1001,'adenda',1,'ADENDA','ADENDA 2026-C2368-1 DEL 12/11/2026
Por la cual se modifica el siguiente ítem:
Haber cursado y aprobado al menos uno de los siguientes diplomados: Instalaciones
fotovoltaicas (Solares) o Eficiencia Energética.
Tener d','{"linea_aproximada":79,"ubicacion_caracter":3624,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1001028,1001,'adenda',2,'ADENDA','ADENDA 2026-C2368-1 DEL 12/11/2026
Por la cual se modifica la fecha de cierre al 13/Nov/2026 08:00 a.m.Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes a','{"linea_aproximada":126,"ubicacion_caracter":6027,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (100101,1001,1,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 1 de 4
Número de la
Convocatoria
2026-C2368
Fecha de publicación de la
convocatoria
09 11 2026
Nombre Facultad,
dependencia o proyecto
que convoca
Facultad de Ingeniería - Departamento de Ingeniería Eléctrica y Electrónica-LABORATORIO -
LIATER - LABORATORIO LIAT-ER
Nombre de la
convocatoria
LABORATORIO DE INNOVACIÓN EN ALTA TENSIÓN Y ENERGÍAS RENOVABLES LIAT-ER
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
Perfil requerido Estudiante de posgrado de Ingeniería Eléctrica o Mecánica, con título de pregrado en
Ingeniería Mecánica o Eléctrica','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101001,100101,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101002,100101,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101003,100101,3,'renglon_literal','Formato convocatoria estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101004,100101,4,'renglon_literal','Código: U.FT.05.007.013 Versión: 2.0 Página 1 de 4','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101005,100101,5,'renglon_literal','Número de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101006,100101,6,'renglon_literal','Convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101007,100101,7,'renglon_literal','2026-C2368','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101008,100101,8,'renglon_literal','Fecha de publicación de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101009,100101,9,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101010,100101,10,'renglon_literal','09 11 2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101011,100101,11,'renglon_literal','Nombre Facultad,','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101012,100101,12,'renglon_literal','dependencia o proyecto','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101013,100101,13,'renglon_literal','que convoca','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101014,100101,14,'renglon_literal','Facultad de Ingeniería - Departamento de Ingeniería Eléctrica y Electrónica-LABORATORIO -','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101015,100101,15,'renglon_literal','LIATER - LABORATORIO LIAT-ER','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101016,100101,16,'renglon_literal','Nombre de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101017,100101,17,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101018,100101,18,'renglon_literal','LABORATORIO DE INNOVACIÓN EN ALTA TENSIÓN Y ENERGÍAS RENOVABLES LIAT-ER','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101019,100101,19,'renglon_literal','Tipo de estudiante Pregrado ☐ Posgrado ⛝','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101020,100101,20,'renglon_literal','Tipo de actividades a','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101021,100101,21,'renglon_literal','desarrollar en la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101022,100101,22,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101023,100101,23,'renglon_literal','☐ ⛝ ☐ ☐ ☐','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101024,100101,24,'renglon_literal','Docencia','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101025,100101,25,'renglon_literal','(Apoyo','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101026,100101,26,'renglon_literal','Académico)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101027,100101,27,'renglon_literal','Apoyo a proyectos','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101028,100101,28,'renglon_literal','investigación o','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101029,100101,29,'renglon_literal','extensión','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101030,100101,30,'renglon_literal','Gestión','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101031,100101,31,'renglon_literal','Administrativa','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101032,100101,32,'renglon_literal','Bienestar','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101033,100101,33,'renglon_literal','universitario','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101034,100101,34,'renglon_literal','Otro','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101035,100101,35,'renglon_literal','No. de estudiantes a','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101036,100101,36,'renglon_literal','vincular','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101037,100101,37,'renglon_literal','1','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101038,100101,38,'renglon_literal','Requisitos generales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101039,100101,39,'renglon_literal','(Art. 2 Acuerdo CSU 024','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101040,100101,40,'renglon_literal','de 2022)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101041,100101,41,'renglon_literal','a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101042,100101,42,'renglon_literal','Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101043,100101,43,'renglon_literal','b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101044,100101,44,'renglon_literal','un Promedio Aritmético Ponderado Acumulado P.A.P.A. igual o superior a 3.5. para','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101045,100101,45,'renglon_literal','estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101046,100101,46,'renglon_literal','c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101047,100101,47,'renglon_literal','universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101048,100101,48,'renglon_literal','Ponderado Acumulado P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101049,100101,49,'renglon_literal','superior a 4.0 para estudiantes de posgrado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101050,100101,50,'renglon_literal','d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101051,100101,51,'renglon_literal','obtuvieron la beca de posgrado por la distinción de Grado de Honor de la Universidad','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101052,100101,52,'renglon_literal','Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101053,100101,53,'renglon_literal','e. No tener calidad de funcionario público (administrativo o docente de planta) de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101054,100101,54,'renglon_literal','Universidad Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101055,100101,55,'renglon_literal','f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101056,100101,56,'renglon_literal','inscrita al menos la carga mínima exigida por el Estatuto Estudiantil.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101057,100101,57,'renglon_literal','g. No haber tenido sanciones disciplinarias.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101058,100101,58,'renglon_literal','PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101059,100101,59,'renglon_literal','apoyo a estudiantes en las cuales no se reciba una retribución económica por la realización de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101060,100101,60,'renglon_literal','actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101061,100101,61,'renglon_literal','desarrollo de su actividad académica.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101062,100101,62,'renglon_literal','PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101063,100101,63,'renglon_literal','periodo académico de un programa de posgrado cumplir una de las siguientes condiciones, de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101064,100101,64,'renglon_literal','acuerdo con el tipo de admisión, así:','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101065,100101,65,'renglon_literal','1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101066,100101,66,'renglon_literal','2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101067,100101,67,'renglon_literal','008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101068,100101,68,'renglon_literal','académicas.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101069,100101,69,'renglon_literal','3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101070,100101,70,'renglon_literal','igual o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101071,100101,71,'renglon_literal','Perfil requerido Estudiante de posgrado de Ingeniería Eléctrica o Mecánica, con título de pregrado en','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100101072,100101,72,'renglon_literal','Ingeniería Mecánica o Eléctrica','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (100102,1001,2,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 2 de 4
Haber cursado y aprobado al menos una de las siguientes asignaturas: ya sea en programas de
pregrado o posgrado: Transición Energética, Sistemas Energéticos Sostenibles o Energías
Renovables.
ADENDA 2026-C2368-1 DEL 12/11/2026
Por la cual se modifica el siguiente ítem:
Haber cursado y aprobado al menos uno de los siguientes diplomados: Instalaciones
fotovoltaicas (Solares) o Eficiencia Energética.
Tener disponibilidad horaria de 20 horas semanales para desarrollar actividades en
instalaciones del laboratorio.
Actividades a desarrollar
-Apoyar en la recopilación, organización y documentación de información relacionada con
asignaturas de energías renovables, tanto a nivel nacional como internacional.
-Apoyar en el diseño e implementación de la estación de carga para vehículos eléctricos
-Apoyar en la elaboración de la documentación técnica, memorias y planos requeridos para la
ampliación de la estación de carga de vehículos eléctricos
-Apoyar en la elaboración y organización de documentos relacionados con las asignaturas de
Energías Renovables, Almacenamiento de Energía, Formulación de Proyectos y Gestión de la
Energía.
Modalidad de las
actividades
☐ ☐ ⛝
Presencial Virtual Mixta
Disponibilidad de tiempo
requerida
20 H/semana
Estímulo económico
mensual
$ 3.000.000
Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de
monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por
la distinción de Grado de Honor de la Universidad Nacional de Colombia.
Duración de la vinculación
80 Días
NOTA IMPORTANTE: La duración solicitada (80 días) puede exceder el 31 de diciembre de
2026. Por tal motivo puede existir una primera vinculación hasta el 31 de diciembre de 2026
y una segunda vinculación por el período restante en la vigencia 2027. En el caso en que no se
realice la vinculación en el año 2026, esta se hará en su totalidad en la vigencia del 2027.
Los Estudiantes Auxiliares no tendrán la calidad de empleados, trabajadores o contratistas. Su relación
es fundamentalmente académica y no constituye vínculo laboral ni contractual con la Universidad.
Forma de Selección
Cumplir con el perfil indicado en la convocatoria
Que el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo de su
actividad académica.
Términos para la
presentación de
documentos
admliaterfi_bog@unal.edu.co; liater_fibog@unal.edu.co
En el asunto del correo escribir el número de convocatoria y el nombre del postulado
Fecha de cierre de la
convocatoria
ADENDA 2026-C2368-1 DEL 12/11/2026
Por la cual se modifica la fecha de cierre al 13/Nov/2026 08:00 a.m.','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102001,100102,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102002,100102,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102003,100102,3,'renglon_literal','Formato convocatoria estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102004,100102,4,'renglon_literal','Código: U.FT.05.007.013 Versión: 2.0 Página 2 de 4','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102005,100102,5,'renglon_literal','Haber cursado y aprobado al menos una de las siguientes asignaturas: ya sea en programas de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102006,100102,6,'renglon_literal','pregrado o posgrado: Transición Energética, Sistemas Energéticos Sostenibles o Energías','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102007,100102,7,'renglon_literal','Renovables.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102008,100102,8,'renglon_literal','ADENDA 2026-C2368-1 DEL 12/11/2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102009,100102,9,'renglon_literal','Por la cual se modifica el siguiente ítem:','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102010,100102,10,'renglon_literal','Haber cursado y aprobado al menos uno de los siguientes diplomados: Instalaciones','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102011,100102,11,'renglon_literal','fotovoltaicas (Solares) o Eficiencia Energética.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102012,100102,12,'renglon_literal','Tener disponibilidad horaria de 20 horas semanales para desarrollar actividades en','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102013,100102,13,'renglon_literal','instalaciones del laboratorio.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102014,100102,14,'renglon_literal','Actividades a desarrollar','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102015,100102,15,'renglon_literal','-Apoyar en la recopilación, organización y documentación de información relacionada con','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102016,100102,16,'renglon_literal','asignaturas de energías renovables, tanto a nivel nacional como internacional.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102017,100102,17,'renglon_literal','-Apoyar en el diseño e implementación de la estación de carga para vehículos eléctricos','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102018,100102,18,'renglon_literal','-Apoyar en la elaboración de la documentación técnica, memorias y planos requeridos para la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102019,100102,19,'renglon_literal','ampliación de la estación de carga de vehículos eléctricos','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102020,100102,20,'renglon_literal','-Apoyar en la elaboración y organización de documentos relacionados con las asignaturas de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102021,100102,21,'renglon_literal','Energías Renovables, Almacenamiento de Energía, Formulación de Proyectos y Gestión de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102022,100102,22,'renglon_literal','Energía.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102023,100102,23,'renglon_literal','Modalidad de las','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102024,100102,24,'renglon_literal','actividades','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102025,100102,25,'renglon_literal','☐ ☐ ⛝','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102026,100102,26,'renglon_literal','Presencial Virtual Mixta','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102027,100102,27,'renglon_literal','Disponibilidad de tiempo','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102028,100102,28,'renglon_literal','requerida','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102029,100102,29,'renglon_literal','20 H/semana','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102030,100102,30,'renglon_literal','Estímulo económico','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102031,100102,31,'renglon_literal','mensual','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102032,100102,32,'renglon_literal','$ 3.000.000','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102033,100102,33,'renglon_literal','Este estímulo es incompatible con el estímulo económico que se otorga por ostentar la calidad de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102034,100102,34,'renglon_literal','monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102035,100102,35,'renglon_literal','la distinción de Grado de Honor de la Universidad Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102036,100102,36,'renglon_literal','Duración de la vinculación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102037,100102,37,'renglon_literal','80 Días','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102038,100102,38,'renglon_literal','NOTA IMPORTANTE: La duración solicitada (80 días) puede exceder el 31 de diciembre de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102039,100102,39,'renglon_literal','2026. Por tal motivo puede existir una primera vinculación hasta el 31 de diciembre de 2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102040,100102,40,'renglon_literal','y una segunda vinculación por el período restante en la vigencia 2027. En el caso en que no se','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102041,100102,41,'renglon_literal','realice la vinculación en el año 2026, esta se hará en su totalidad en la vigencia del 2027.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102042,100102,42,'renglon_literal','Los Estudiantes Auxiliares no tendrán la calidad de empleados, trabajadores o contratistas. Su relación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102043,100102,43,'renglon_literal','es fundamentalmente académica y no constituye vínculo laboral ni contractual con la Universidad.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102044,100102,44,'renglon_literal','Forma de Selección','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102045,100102,45,'renglon_literal','Cumplir con el perfil indicado en la convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102046,100102,46,'renglon_literal','Que el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo de su','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102047,100102,47,'renglon_literal','actividad académica.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102048,100102,48,'renglon_literal','Términos para la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102049,100102,49,'renglon_literal','presentación de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102050,100102,50,'renglon_literal','documentos','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102051,100102,51,'renglon_literal','admliaterfi_bog@unal.edu.co; liater_fibog@unal.edu.co','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102052,100102,52,'renglon_literal','En el asunto del correo escribir el número de convocatoria y el nombre del postulado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102053,100102,53,'renglon_literal','Fecha de cierre de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102054,100102,54,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102055,100102,55,'renglon_literal','ADENDA 2026-C2368-1 DEL 12/11/2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100102056,100102,56,'renglon_literal','Por la cual se modifica la fecha de cierre al 13/Nov/2026 08:00 a.m.','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (100103,1001,3,'Macroproceso: Formación
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
Código: U.FT.05.007.013 Versión: 2.0 Página 3 de 4
Documentación requerida
En un sólo archivo PDF y en el siguiente orden:
1. Imprimir PDF de la convocatoria
2. Fotocopia de cédula-LEGIBLE
3. Formato único de Hoja de Vida diligenciado en su totalidad y FIRMADO
https://www.funcionpublica.gov.co/documents/418537/28811162/formato-unico-dehoja-de-vida-persona-natural.pdf/
4. Fotocopia de carnet estudiantil-LEGIBLE
5. Imprimir PDF de la Historia académica del SIA con porcentaje de avance y PAPA que
indique el usuario.
6. Pantallazo del P.A.P.A de acuerdo con SIA que indique el usuario-PDF
7. Horario del SIA que indique el usuario
8. Certificado PBM (Recibo de pago matrícula que lo evidencie).
9. Autorización para verificación de inhabilidad por delitos
sexuales cometidos contra menores y tratamiento de datos personales.
https://docs.google.com/document/d/12t1s-e4sIuj3ZNBV6UMJXhnPkTfzhufd/edit#heading=
h.z6ojnhfkgkym
Documentos opcionales
(no pueden ser
modificatorios)
Certificados en PDF de cursos adicionales
Responsable de la
convocatoria
Fernando A. Herrera León-María Nohora Mahecha-faherreral@unal.edu.co,
faherreral@unal.edu.co;admliaterfi _bog@unal.edu.co, Ext: 11117
Criterios de evaluación 1. Haber cursado y aprobado al menos una de las asignaturas ya sea en programas de
pregrado o posgrado: Transición Energética, Sistemas Energéticos Sostenibles o Energías
Renovables. 10%
2. Haber cursado y aprobado al menos uno de los diplomados en : Instalaciones Solares o
Eficiencia Energética. 10%
3. Disponibilidad horaria para desarrollar actividades en instalaciones del laboratorio 30%
4. Entrevista 50%
Fecha límite de
Publicación de Resultados
05/Dic/2026 10:00 a.m.','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103001,100103,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103002,100103,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103003,100103,3,'renglon_literal','Formato convocatoria estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103004,100103,4,'renglon_literal','Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103005,100103,5,'renglon_literal','identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección por','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103006,100103,6,'renglon_literal','los canales de divulgación que la Universidad disponga para tal fin.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103007,100103,7,'renglon_literal','En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103008,100103,8,'renglon_literal','recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103009,100103,9,'renglon_literal','Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual puede ser','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103010,100103,10,'renglon_literal','consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que garantizan la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103011,100103,11,'renglon_literal','seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar las autorizaciones','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103012,100103,12,'renglon_literal','dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103013,100103,13,'renglon_literal','protecdatos_na@unal.edu.co.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103014,100103,14,'renglon_literal','Código: U.FT.05.007.013 Versión: 2.0 Página 3 de 4','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103015,100103,15,'renglon_literal','Documentación requerida','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103016,100103,16,'renglon_literal','En un sólo archivo PDF y en el siguiente orden:','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103017,100103,17,'renglon_literal','1. Imprimir PDF de la convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103018,100103,18,'renglon_literal','2. Fotocopia de cédula-LEGIBLE','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103019,100103,19,'renglon_literal','3. Formato único de Hoja de Vida diligenciado en su totalidad y FIRMADO','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103020,100103,20,'renglon_literal','https://www.funcionpublica.gov.co/documents/418537/28811162/formato-unico-dehoja-de-vida-persona-natural.pdf/','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103021,100103,21,'renglon_literal','4. Fotocopia de carnet estudiantil-LEGIBLE','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103022,100103,22,'renglon_literal','5. Imprimir PDF de la Historia académica del SIA con porcentaje de avance y PAPA que','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103023,100103,23,'renglon_literal','indique el usuario.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103024,100103,24,'renglon_literal','6. Pantallazo del P.A.P.A de acuerdo con SIA que indique el usuario-PDF','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103025,100103,25,'renglon_literal','7. Horario del SIA que indique el usuario','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103026,100103,26,'renglon_literal','8. Certificado PBM (Recibo de pago matrícula que lo evidencie).','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103027,100103,27,'renglon_literal','9. Autorización para verificación de inhabilidad por delitos','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103028,100103,28,'renglon_literal','sexuales cometidos contra menores y tratamiento de datos personales.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103029,100103,29,'renglon_literal','https://docs.google.com/document/d/12t1s-e4sIuj3ZNBV6UMJXhnPkTfzhufd/edit#heading=','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103030,100103,30,'renglon_literal','h.z6ojnhfkgkym','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103031,100103,31,'renglon_literal','Documentos opcionales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103032,100103,32,'renglon_literal','(no pueden ser','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103033,100103,33,'renglon_literal','modificatorios)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103034,100103,34,'renglon_literal','Certificados en PDF de cursos adicionales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103035,100103,35,'renglon_literal','Responsable de la','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103036,100103,36,'renglon_literal','convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103037,100103,37,'renglon_literal','Fernando A. Herrera León-María Nohora Mahecha-faherreral@unal.edu.co,','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103038,100103,38,'renglon_literal','faherreral@unal.edu.co;admliaterfi _bog@unal.edu.co, Ext: 11117','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103039,100103,39,'renglon_literal','Criterios de evaluación 1. Haber cursado y aprobado al menos una de las asignaturas ya sea en programas de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103040,100103,40,'renglon_literal','pregrado o posgrado: Transición Energética, Sistemas Energéticos Sostenibles o Energías','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103041,100103,41,'renglon_literal','Renovables. 10%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103042,100103,42,'renglon_literal','2. Haber cursado y aprobado al menos uno de los diplomados en : Instalaciones Solares o','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103043,100103,43,'renglon_literal','Eficiencia Energética. 10%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103044,100103,44,'renglon_literal','3. Disponibilidad horaria para desarrollar actividades en instalaciones del laboratorio 30%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103045,100103,45,'renglon_literal','4. Entrevista 50%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103046,100103,46,'renglon_literal','Fecha límite de','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103047,100103,47,'renglon_literal','Publicación de Resultados','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100103048,100103,48,'renglon_literal','05/Dic/2026 10:00 a.m.','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (100104,1001,4,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato convocatoria estudiantes auxiliares
Código: U.FT.05.007.013 Versión: 2.0 Página 4 de 4','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100104001,100104,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100104002,100104,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100104003,100104,3,'renglon_literal','Formato convocatoria estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100104004,100104,4,'renglon_literal','Código: U.FT.05.007.013 Versión: 2.0 Página 4 de 4','pendiente');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (102,'2026-C2330','sin_verificar','Lote 1, fuente Convocatorias Cerradas fila 19');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (102,1,'Convocatorias Cerradas',19,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (1021,102,102,'hoja_calculo','2026-C2330','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2041,102,'A','Programa','Pregrado','{"stringValue":"Pregrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2042,102,'B','Facultad','Sede Bogotá','{"stringValue":"Sede Bogotá"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2043,102,'C','Programa curricular','Estudiante activo de pregrado, preferiblemente de programas académicos de las Facultades de:  Ingeniería, Ciencias Humanas o Derecho, Ciencias Políticas y Sociales, sede Bogotá.','{"stringValue":"Estudiante activo de pregrado, preferiblemente de programas académicos de las Facultades de:  Ingeniería, Ciencias Humanas o Derecho, Ciencias Políticas y Sociales, sede Bogotá."}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2044,102,'D','Archivo PDF de la convocatoria','2026-C2330','{"stringValue":"2026-C2330"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2045,102,'E','Estado de la convocatoria','Cerrada','{"stringValue":"Cerrada"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2046,102,'F','Resultados','https://drive.google.com/file/d/1KJ4-yRuLBUF-u0AcyB2VfcNTFzlU7uDx/view?usp=drivesdk','{"stringValue":"https://drive.google.com/file/d/1KJ4-yRuLBUF-u0AcyB2VfcNTFzlU7uDx/view?usp=drivesdk"}',NULL,'https://drive.google.com/file/d/1KJ4-yRuLBUF-u0AcyB2VfcNTFzlU7uDx/view?usp=drivesdk',NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false,"link":{"uri":"https://drive.google.com/file/d/1KJ4-yRuLBUF-u0AcyB2VfcNTFzlU7uDx/view?usp=drivesdk"}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2047,102,'G','Nombre de la convocatoria, proyecto o Proceso','Apoyo al proyecto “Ruta de la Innovación Pedagógica UNAL” de la sede Bogotá ','{"stringValue":"Apoyo al proyecto “Ruta de la Innovación Pedagógica UNAL” de la sede Bogotá "}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2048,102,'H','Correo del responsable','lkherreraq@unal.edu.co','{"stringValue":"lkherreraq@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2049,102,'I','Fecha de publicación','5-nov-2026','{"numberValue":46331}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2050,102,'J','Fecha y hora de cierre de la convocatoria','11/11/2026 9:00:00 a. m.','{"numberValue":46337.375}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2051,102,'K','Número de convocatoria','2026-C2330','{"stringValue":"2026-C2330"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (1021,'caso_convocatoria',102,'documento_pendiente','{"rol":"convocatoria","referencia_celda":"2026-C2330","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO documento (documento_id,tipo_sugerido,url_origen,drive_id,titulo_archivo,mime_type,capturado_en,estado_acceso,estado_extraccion,notas) VALUES (1002,'resultados','https://drive.google.com/file/d/1KJ4-yRuLBUF-u0AcyB2VfcNTFzlU7uDx/view?usp=drivesdk','1KJ4-yRuLBUF-u0AcyB2VfcNTFzlU7uDx','Resultados 2026-C2330','application/pdf','2026-11-13','leido','transcrito_sin_cotejo_visual','El PDF binario y su huella SHA256 no se han incorporado; texto extraído literalmente disponible en campo_documento y renglones.');
INSERT INTO vinculo_caso (vinculo_id,caso_id,documento_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (1023,102,1002,'resultados','Resultados 2026-C2330','transcrito_pendiente_revision');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,estado_revision) VALUES (1002001,1002,'texto_extraido_integro',1,'Transcripción íntegra devuelta por Drive','Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 2
FORMATO PUBLICACIÓN DE RESULTADOS CONVOCATORIA ESTUDIANTE(S) AUXILIAR(ES)
Nombre de la Convocatoria Número de Convocatoria Nº de estudiantes a 
vincular Fecha de publicación de la convocatoria
Fecha de 
publicación de 
resultados 
Apoyo al proyecto “Ruta de la 
Innovación Pedagógica UNAL” de la 
sede Bogotá
2026-C2330 1 5-nov-26 12/11/2026
Requisitos Generales: (Art. 2 Acuerdo CSU 024 de 2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia.
b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un Promedio Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para 
estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado
c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar universitario o de gestión administrativa el estudiante deberá tener un Promedio 
Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado
d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por la distinción de Grado de Honor de la 
Universidad Nacional de Colombia.
e. No tener calidad de funcionario público (administrativo o docente de planta) de la Universidad Nacional de Colombia.
f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e inscrita al menos la carga mínima exigida por el Estatuto Estudiantil.
g. No haber tenido sanciones disciplinarias.
PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de apoyo a estudiantes en las cuales no se reciba una retribución económica por la 
realización de actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo de su actividad académica.
PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer periodo académico de un programa de posgrado cumplir una de las siguientes 
condiciones, de acuerdo con el tipo de admisión, así:
1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.
2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo 008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus 
disposiciones académicas.
3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico igual o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.
PERFIL REQUERIDO
Estudiante activo de pregrado, preferiblemente de programas académicos de las Facultades de: Ingeniería, Ciencias Humanas o Derecho, Ciencias Políticas y 
Sociales, sede Bogotá.
Nivel de avance en sus estudios: más del 60%
Demostrar habilidades de investigación, recopilación, organización y análisis de información cualitativa y cuantitativa; elaboración de documentos, 
relatorías e informes; y manejo de herramientas digitales para la gestión de información.
Contar con habilidades de comunicación escrita y oral, capacidad de trabajo en equipo y organización para la sistematización de proyectos o experiencias 
pedagógicas.
Disponibilidad de tiempo para acompañamiento presencial los viernes de 12:00 m. a 6:00 p. m.
CRITERIOS DE SELECCIÓN Y EVALUACIÓN
Criterios Ponderación
(Asigne el peso porcentual de cada criterio)
1. P.B.M. 20%
2. Capacidad para elaborar registros, organizar información y sistematizar datos. 30%
3. Manejo de herramientas digitales y ofimáticas (Excel, Word, PowerPoint, Google 
Drive y plataformas colaborativas). 30%
4. Disponibilidad horaria para acompañar las sesiones presenciales y remotas, 
reuniones y actividades programadas. 20%
Sumatoria porcentajes 100%
DATOS DE LOS PARTICIPANTES
No Identificación
Puntaje por Criterio
(De 0 a 5) (PBM de 0 a 100)
PAPA PBM
(si aplica) 1 2 3 4 Total Selección
1 1034657859 4,6 56 2,2 5 5 5 4,44 X
2 1007912198 4,3 9 4,6 4 4 5 4,31 ELEGIBLE
3 1032491281 3,8 41 3,0 4 3 5 3,69 ELEGIBLE
4 1034989094 4,7 41 3,0 4 3 5 3,69 ELEGIBLE
5 1138524496 4,5 74 1,3 4 4 5 3,66Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 2
6 1010960935 4,0 6 4,7 4 4 1 3,54
7 1002459414 4,3 8 4,6 4 4 1 3,52
8 1001058991 4,2 10 4,5 4 4 1 3,5
9 1018448728 3,8 11 4,5 4 4 1 3,49
10 1117808396 4,2 14 4,3 4 4 1 3,46
11 1006552135 4,1 14 4,3 4 4 1 3,46
12 1014666061 4,6 15 4,3 4 4 1 3,45
13 1085896254 3,7 1 5,0 4 3 1 3,29
14 1000931914 4,7 14 4,3 4 3 1 3,16
15 1000931705 4,7 46 2,7 4 4 1 3,14
16 1007535090 3,7 20 4,0 4 3 1 3,1
17 1006120608 3,8 51 2,5 4 4 1 3,09
18 1018426001 4,5 62 1,9 4 3 1 2,68
Certifico que el (los) estudiante(s) seleccionado(s) fue(ron) consultado(s) y manifiesta(n) no recibir ningún otro beneficio económico de la 
Universidad Nacional de Colombia y que no está(n) inhabilitado(s) para ser vinculado(s) como Estudiante(s) Auxiliar(es), a su vez asumo la 
responsabilidad de todo el proceso de selección del estudiante.
En caso de que no se haya seleccionado a ningún estudiante como ganador de la convocatoria especifique el motivo: No aplica
Observaciones: Ninguna
NOMBRE DEL RESPONSABLE DE LA EVALUACIÓN: PROFESORA LIZ KAREN HERRERA
CARGO: Docente
EXTENSIÓN: 14107
CORREO: lkherreraq@unal.edu.co
(Original Firmado)
Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de 
identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección por 
los canales de divulgación que la Universidad disponga para tal fin.
En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal 
recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección de 
Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual puede ser 
consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que garantizan la 
seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar las autorizaciones 
dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail 
protecdatos_na@unal.edu.co.','sin_cotejo_visual');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1002002,1002,'fecha_de_publicación_de_la',1,'Fecha de publicación de la','Fecha de publicación de la convocatoria
Fecha de 
publicación de 
resultados 
Apoyo al proyecto “Ruta de la 
Innovación Pedagógica UNAL” de la 
sede Bogotá
2026-C2330 1 5-nov-26 12/11/2026
Requisitos Generales: (','{"linea_aproximada":7,"ubicacion_caracter":331,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1002003,1002,'nombre_de_la',1,'Nombre de la','Nombre de la Convocatoria Número de Convocatoria Nº de estudiantes a 
vincular Fecha de publicación de la convocatoria
Fecha de 
publicación de 
resultados 
Apoyo al proyecto “Ruta de la 
Innovación Pedagógica UNAL','{"linea_aproximada":6,"ubicacion_caracter":251,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1002004,1002,'requisitos_generales',1,'Requisitos Generales','Requisitos Generales: (Art. 2 Acuerdo CSU 024 de 2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia.
b. Si las actividades a desarrollar están relacionadas con docenc','{"linea_aproximada":15,"ubicacion_caracter":528,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1002005,1002,'perfil_requerido',1,'PERFIL REQUERIDO','PERFIL REQUERIDO
Estudiante activo de pregrado, preferiblemente de programas académicos de las Facultades de: Ingeniería, Ciencias Humanas o Derecho, Ciencias Políticas y 
Sociales, sede Bogotá.
Nivel de avance en sus','{"linea_aproximada":34,"ubicacion_caracter":2813,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1002006,1002,'actividades_a_desarrollar',1,'actividades a desarrollar','actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un Promedio Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para 
estudiantes de pregrado, e igual o superior a 4.0','{"linea_aproximada":17,"ubicacion_caracter":693,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1002007,1002,'actividades_a_desarrollar',2,'actividades a desarrollar','actividades a desarrollar están relacionadas con investigación, extensión, bienestar universitario o de gestión administrativa el estudiante deberá tener un Promedio 
Aritmético Ponderado Acumulado - P.A.P.A. igual o su','{"linea_aproximada":19,"ubicacion_caracter":954,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1002008,1002,'disponibilidad_de_tiempo',1,'Disponibilidad de tiempo','Disponibilidad de tiempo para acompañamiento presencial los viernes de 12:00 m. a 6:00 p. m.
CRITERIOS DE SELECCIÓN Y EVALUACIÓN
Criterios Ponderación
(Asigne el peso porcentual de cada criterio)
1. P.B.M. 20%
2. Ca','{"linea_aproximada":42,"ubicacion_caracter":3467,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1002009,1002,'responsable_de_la',1,'RESPONSABLE DE LA','RESPONSABLE DE LA EVALUACIÓN: PROFESORA LIZ KAREN HERRERA
CARGO: Docente
EXTENSIÓN: 14107
CORREO: lkherreraq@unal.edu.co
(Original Firmado)
Los estudiantes que se postulen para la presente convocatoria aceptan que s','{"linea_aproximada":85,"ubicacion_caracter":5552,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1002010,1002,'datos_de_los_participantes',1,'DATOS DE LOS PARTICIPANTES','DATOS DE LOS PARTICIPANTES
No Identificación
Puntaje por Criterio
(De 0 a 5) (PBM de 0 a 100)
PAPA PBM
(si aplica) 1 2 3 4 Total Selección
1 1034657859 4,6 56 2,2 5 5 5 4,44 X
2 1007912198 4,3 9 4,6 4 4 5 4,31 ELE','{"linea_aproximada":53,"ubicacion_caracter":4044,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1002011,1002,'observaciones',1,'Observaciones','Observaciones: Ninguna
NOMBRE DEL RESPONSABLE DE LA EVALUACIÓN: PROFESORA LIZ KAREN HERRERA
CARGO: Docente
EXTENSIÓN: 14107
CORREO: lkherreraq@unal.edu.co
(Original Firmado)
Los estudiantes que se postulen para la ','{"linea_aproximada":84,"ubicacion_caracter":5517,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (100201,1002,1,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 2
FORMATO PUBLICACIÓN DE RESULTADOS CONVOCATORIA ESTUDIANTE(S) AUXILIAR(ES)
Nombre de la Convocatoria Número de Convocatoria Nº de estudiantes a 
vincular Fecha de publicación de la convocatoria
Fecha de 
publicación de 
resultados 
Apoyo al proyecto “Ruta de la 
Innovación Pedagógica UNAL” de la 
sede Bogotá
2026-C2330 1 5-nov-26 12/11/2026
Requisitos Generales: (Art. 2 Acuerdo CSU 024 de 2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia.
b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un Promedio Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para 
estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado
c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar universitario o de gestión administrativa el estudiante deberá tener un Promedio 
Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado
d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por la distinción de Grado de Honor de la 
Universidad Nacional de Colombia.
e. No tener calidad de funcionario público (administrativo o docente de planta) de la Universidad Nacional de Colombia.
f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e inscrita al menos la carga mínima exigida por el Estatuto Estudiantil.
g. No haber tenido sanciones disciplinarias.
PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de apoyo a estudiantes en las cuales no se reciba una retribución económica por la 
realización de actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo de su actividad académica.
PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer periodo académico de un programa de posgrado cumplir una de las siguientes 
condiciones, de acuerdo con el tipo de admisión, así:
1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.
2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo 008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus 
disposiciones académicas.
3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico igual o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.
PERFIL REQUERIDO
Estudiante activo de pregrado, preferiblemente de programas académicos de las Facultades de: Ingeniería, Ciencias Humanas o Derecho, Ciencias Políticas y 
Sociales, sede Bogotá.
Nivel de avance en sus estudios: más del 60%
Demostrar habilidades de investigación, recopilación, organización y análisis de información cualitativa y cuantitativa; elaboración de documentos, 
relatorías e informes; y manejo de herramientas digitales para la gestión de información.
Contar con habilidades de comunicación escrita y oral, capacidad de trabajo en equipo y organización para la sistematización de proyectos o experiencias 
pedagógicas.
Disponibilidad de tiempo para acompañamiento presencial los viernes de 12:00 m. a 6:00 p. m.
CRITERIOS DE SELECCIÓN Y EVALUACIÓN
Criterios Ponderación
(Asigne el peso porcentual de cada criterio)
1. P.B.M. 20%
2. Capacidad para elaborar registros, organizar información y sistematizar datos. 30%
3. Manejo de herramientas digitales y ofimáticas (Excel, Word, PowerPoint, Google 
Drive y plataformas colaborativas). 30%
4. Disponibilidad horaria para acompañar las sesiones presenciales y remotas, 
reuniones y actividades programadas. 20%
Sumatoria porcentajes 100%
DATOS DE LOS PARTICIPANTES
No Identificación
Puntaje por Criterio
(De 0 a 5) (PBM de 0 a 100)
PAPA PBM
(si aplica) 1 2 3 4 Total Selección
1 1034657859 4,6 56 2,2 5 5 5 4,44 X
2 1007912198 4,3 9 4,6 4 4 5 4,31 ELEGIBLE
3 1032491281 3,8 41 3,0 4 3 5 3,69 ELEGIBLE
4 1034989094 4,7 41 3,0 4 3 5 3,69 ELEGIBLE
5 1138524496 4,5 74 1,3 4 4 5 3,66','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201001,100201,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201002,100201,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201003,100201,3,'renglon_literal','Formato selección estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201004,100201,4,'renglon_literal','Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 2','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201005,100201,5,'renglon_literal','FORMATO PUBLICACIÓN DE RESULTADOS CONVOCATORIA ESTUDIANTE(S) AUXILIAR(ES)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201006,100201,6,'renglon_literal','Nombre de la Convocatoria Número de Convocatoria Nº de estudiantes a ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201007,100201,7,'renglon_literal','vincular Fecha de publicación de la convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201008,100201,8,'renglon_literal','Fecha de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201009,100201,9,'renglon_literal','publicación de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201010,100201,10,'renglon_literal','resultados ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201011,100201,11,'renglon_literal','Apoyo al proyecto “Ruta de la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201012,100201,12,'renglon_literal','Innovación Pedagógica UNAL” de la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201013,100201,13,'renglon_literal','sede Bogotá','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201014,100201,14,'renglon_literal','2026-C2330 1 5-nov-26 12/11/2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201015,100201,15,'renglon_literal','Requisitos Generales: (Art. 2 Acuerdo CSU 024 de 2022)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201016,100201,16,'renglon_literal','a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201017,100201,17,'renglon_literal','b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un Promedio Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201018,100201,18,'renglon_literal','estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201019,100201,19,'renglon_literal','c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar universitario o de gestión administrativa el estudiante deberá tener un Promedio ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201020,100201,20,'renglon_literal','Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o superior a 4.0 para estudiantes de posgrado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201021,100201,21,'renglon_literal','d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que obtuvieron la beca de posgrado por la distinción de Grado de Honor de la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201022,100201,22,'renglon_literal','Universidad Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201023,100201,23,'renglon_literal','e. No tener calidad de funcionario público (administrativo o docente de planta) de la Universidad Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201024,100201,24,'renglon_literal','f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e inscrita al menos la carga mínima exigida por el Estatuto Estudiantil.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201025,100201,25,'renglon_literal','g. No haber tenido sanciones disciplinarias.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201026,100201,26,'renglon_literal','PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de apoyo a estudiantes en las cuales no se reciba una retribución económica por la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201027,100201,27,'renglon_literal','realización de actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo de su actividad académica.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201028,100201,28,'renglon_literal','PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer periodo académico de un programa de posgrado cumplir una de las siguientes ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201029,100201,29,'renglon_literal','condiciones, de acuerdo con el tipo de admisión, así:','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201030,100201,30,'renglon_literal','1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201031,100201,31,'renglon_literal','2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo 008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201032,100201,32,'renglon_literal','disposiciones académicas.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201033,100201,33,'renglon_literal','3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico igual o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201034,100201,34,'renglon_literal','PERFIL REQUERIDO','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201035,100201,35,'renglon_literal','Estudiante activo de pregrado, preferiblemente de programas académicos de las Facultades de: Ingeniería, Ciencias Humanas o Derecho, Ciencias Políticas y ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201036,100201,36,'renglon_literal','Sociales, sede Bogotá.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201037,100201,37,'renglon_literal','Nivel de avance en sus estudios: más del 60%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201038,100201,38,'renglon_literal','Demostrar habilidades de investigación, recopilación, organización y análisis de información cualitativa y cuantitativa; elaboración de documentos, ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201039,100201,39,'renglon_literal','relatorías e informes; y manejo de herramientas digitales para la gestión de información.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201040,100201,40,'renglon_literal','Contar con habilidades de comunicación escrita y oral, capacidad de trabajo en equipo y organización para la sistematización de proyectos o experiencias ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201041,100201,41,'renglon_literal','pedagógicas.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201042,100201,42,'renglon_literal','Disponibilidad de tiempo para acompañamiento presencial los viernes de 12:00 m. a 6:00 p. m.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201043,100201,43,'renglon_literal','CRITERIOS DE SELECCIÓN Y EVALUACIÓN','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201044,100201,44,'renglon_literal','Criterios Ponderación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201045,100201,45,'renglon_literal','(Asigne el peso porcentual de cada criterio)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201046,100201,46,'renglon_literal','1. P.B.M. 20%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201047,100201,47,'renglon_literal','2. Capacidad para elaborar registros, organizar información y sistematizar datos. 30%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201048,100201,48,'renglon_literal','3. Manejo de herramientas digitales y ofimáticas (Excel, Word, PowerPoint, Google ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201049,100201,49,'renglon_literal','Drive y plataformas colaborativas). 30%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201050,100201,50,'renglon_literal','4. Disponibilidad horaria para acompañar las sesiones presenciales y remotas, ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201051,100201,51,'renglon_literal','reuniones y actividades programadas. 20%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201052,100201,52,'renglon_literal','Sumatoria porcentajes 100%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201053,100201,53,'renglon_literal','DATOS DE LOS PARTICIPANTES','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201054,100201,54,'renglon_literal','No Identificación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201055,100201,55,'renglon_literal','Puntaje por Criterio','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201056,100201,56,'renglon_literal','(De 0 a 5) (PBM de 0 a 100)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201057,100201,57,'renglon_literal','PAPA PBM','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201058,100201,58,'renglon_literal','(si aplica) 1 2 3 4 Total Selección','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201059,100201,59,'renglon_literal','1 1034657859 4,6 56 2,2 5 5 5 4,44 X','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201060,100201,60,'renglon_literal','2 1007912198 4,3 9 4,6 4 4 5 4,31 ELEGIBLE','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201061,100201,61,'renglon_literal','3 1032491281 3,8 41 3,0 4 3 5 3,69 ELEGIBLE','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201062,100201,62,'renglon_literal','4 1034989094 4,7 41 3,0 4 3 5 3,69 ELEGIBLE','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100201063,100201,63,'renglon_literal','5 1138524496 4,5 74 1,3 4 4 5 3,66','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (100202,1002,2,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 2
6 1010960935 4,0 6 4,7 4 4 1 3,54
7 1002459414 4,3 8 4,6 4 4 1 3,52
8 1001058991 4,2 10 4,5 4 4 1 3,5
9 1018448728 3,8 11 4,5 4 4 1 3,49
10 1117808396 4,2 14 4,3 4 4 1 3,46
11 1006552135 4,1 14 4,3 4 4 1 3,46
12 1014666061 4,6 15 4,3 4 4 1 3,45
13 1085896254 3,7 1 5,0 4 3 1 3,29
14 1000931914 4,7 14 4,3 4 3 1 3,16
15 1000931705 4,7 46 2,7 4 4 1 3,14
16 1007535090 3,7 20 4,0 4 3 1 3,1
17 1006120608 3,8 51 2,5 4 4 1 3,09
18 1018426001 4,5 62 1,9 4 3 1 2,68
Certifico que el (los) estudiante(s) seleccionado(s) fue(ron) consultado(s) y manifiesta(n) no recibir ningún otro beneficio económico de la 
Universidad Nacional de Colombia y que no está(n) inhabilitado(s) para ser vinculado(s) como Estudiante(s) Auxiliar(es), a su vez asumo la 
responsabilidad de todo el proceso de selección del estudiante.
En caso de que no se haya seleccionado a ningún estudiante como ganador de la convocatoria especifique el motivo: No aplica
Observaciones: Ninguna
NOMBRE DEL RESPONSABLE DE LA EVALUACIÓN: PROFESORA LIZ KAREN HERRERA
CARGO: Docente
EXTENSIÓN: 14107
CORREO: lkherreraq@unal.edu.co
(Original Firmado)
Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de 
identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección por 
los canales de divulgación que la Universidad disponga para tal fin.
En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal 
recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección de 
Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual puede ser 
consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que garantizan la 
seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar las autorizaciones 
dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail 
protecdatos_na@unal.edu.co.','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202001,100202,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202002,100202,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202003,100202,3,'renglon_literal','Formato selección estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202004,100202,4,'renglon_literal','Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 2','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202005,100202,5,'renglon_literal','6 1010960935 4,0 6 4,7 4 4 1 3,54','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202006,100202,6,'renglon_literal','7 1002459414 4,3 8 4,6 4 4 1 3,52','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202007,100202,7,'renglon_literal','8 1001058991 4,2 10 4,5 4 4 1 3,5','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202008,100202,8,'renglon_literal','9 1018448728 3,8 11 4,5 4 4 1 3,49','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202009,100202,9,'renglon_literal','10 1117808396 4,2 14 4,3 4 4 1 3,46','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202010,100202,10,'renglon_literal','11 1006552135 4,1 14 4,3 4 4 1 3,46','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202011,100202,11,'renglon_literal','12 1014666061 4,6 15 4,3 4 4 1 3,45','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202012,100202,12,'renglon_literal','13 1085896254 3,7 1 5,0 4 3 1 3,29','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202013,100202,13,'renglon_literal','14 1000931914 4,7 14 4,3 4 3 1 3,16','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202014,100202,14,'renglon_literal','15 1000931705 4,7 46 2,7 4 4 1 3,14','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202015,100202,15,'renglon_literal','16 1007535090 3,7 20 4,0 4 3 1 3,1','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202016,100202,16,'renglon_literal','17 1006120608 3,8 51 2,5 4 4 1 3,09','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202017,100202,17,'renglon_literal','18 1018426001 4,5 62 1,9 4 3 1 2,68','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202018,100202,18,'renglon_literal','Certifico que el (los) estudiante(s) seleccionado(s) fue(ron) consultado(s) y manifiesta(n) no recibir ningún otro beneficio económico de la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202019,100202,19,'renglon_literal','Universidad Nacional de Colombia y que no está(n) inhabilitado(s) para ser vinculado(s) como Estudiante(s) Auxiliar(es), a su vez asumo la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202020,100202,20,'renglon_literal','responsabilidad de todo el proceso de selección del estudiante.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202021,100202,21,'renglon_literal','En caso de que no se haya seleccionado a ningún estudiante como ganador de la convocatoria especifique el motivo: No aplica','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202022,100202,22,'renglon_literal','Observaciones: Ninguna','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202023,100202,23,'renglon_literal','NOMBRE DEL RESPONSABLE DE LA EVALUACIÓN: PROFESORA LIZ KAREN HERRERA','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202024,100202,24,'renglon_literal','CARGO: Docente','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202025,100202,25,'renglon_literal','EXTENSIÓN: 14107','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202026,100202,26,'renglon_literal','CORREO: lkherreraq@unal.edu.co','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202027,100202,27,'renglon_literal','(Original Firmado)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202028,100202,28,'renglon_literal','Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202029,100202,29,'renglon_literal','identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección por ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202030,100202,30,'renglon_literal','los canales de divulgación que la Universidad disponga para tal fin.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202031,100202,31,'renglon_literal','En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202032,100202,32,'renglon_literal','recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202033,100202,33,'renglon_literal','Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual puede ser ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202034,100202,34,'renglon_literal','consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que garantizan la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202035,100202,35,'renglon_literal','seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar las autorizaciones ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202036,100202,36,'renglon_literal','dadas a las finalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100202037,100202,37,'renglon_literal','protecdatos_na@unal.edu.co.','pendiente');
INSERT INTO publicacion_resultados (publicacion_id,documento_id,codigo_convocatoria_literal,nombre_literal,estado_revision) VALUES (1002,1002,'2026-C2330','Resultados 2026-C2330','pendiente_cotejo_visual');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002001,1002,1,'1034657859','1 1034657859 4,6 56 2,2 5 5 5 4,44 X','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200101,1002001,1,'token_de_fila','posición_léxica_1','4,6','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200102,1002001,2,'token_de_fila','posición_léxica_2','56','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200103,1002001,3,'token_de_fila','posición_léxica_3','2,2','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200104,1002001,4,'token_de_fila','posición_léxica_4','5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200105,1002001,5,'token_de_fila','posición_léxica_5','5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200106,1002001,6,'token_de_fila','posición_léxica_6','5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200107,1002001,7,'token_de_fila','posición_léxica_7','4,44','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200108,1002001,8,'token_de_fila','posición_léxica_8','X','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002002,1002,2,'1007912198','2 1007912198 4,3 9 4,6 4 4 5 4,31 ELEGIBLE','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200201,1002002,1,'token_de_fila','posición_léxica_1','4,3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200202,1002002,2,'token_de_fila','posición_léxica_2','9','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200203,1002002,3,'token_de_fila','posición_léxica_3','4,6','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200204,1002002,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200205,1002002,5,'token_de_fila','posición_léxica_5','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200206,1002002,6,'token_de_fila','posición_léxica_6','5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200207,1002002,7,'token_de_fila','posición_léxica_7','4,31','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200208,1002002,8,'token_de_fila','posición_léxica_8','ELEGIBLE','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002003,1002,3,'1032491281','3 1032491281 3,8 41 3,0 4 3 5 3,69 ELEGIBLE','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200301,1002003,1,'token_de_fila','posición_léxica_1','3,8','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200302,1002003,2,'token_de_fila','posición_léxica_2','41','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200303,1002003,3,'token_de_fila','posición_léxica_3','3,0','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200304,1002003,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200305,1002003,5,'token_de_fila','posición_léxica_5','3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200306,1002003,6,'token_de_fila','posición_léxica_6','5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200307,1002003,7,'token_de_fila','posición_léxica_7','3,69','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200308,1002003,8,'token_de_fila','posición_léxica_8','ELEGIBLE','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002004,1002,4,'1034989094','4 1034989094 4,7 41 3,0 4 3 5 3,69 ELEGIBLE','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200401,1002004,1,'token_de_fila','posición_léxica_1','4,7','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200402,1002004,2,'token_de_fila','posición_léxica_2','41','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200403,1002004,3,'token_de_fila','posición_léxica_3','3,0','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200404,1002004,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200405,1002004,5,'token_de_fila','posición_léxica_5','3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200406,1002004,6,'token_de_fila','posición_léxica_6','5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200407,1002004,7,'token_de_fila','posición_léxica_7','3,69','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200408,1002004,8,'token_de_fila','posición_léxica_8','ELEGIBLE','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002005,1002,5,'1138524496','5 1138524496 4,5 74 1,3 4 4 5 3,66Macroproceso: Formación','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200501,1002005,1,'token_de_fila','posición_léxica_1','4,5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200502,1002005,2,'token_de_fila','posición_léxica_2','74','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200503,1002005,3,'token_de_fila','posición_léxica_3','1,3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200504,1002005,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200505,1002005,5,'token_de_fila','posición_léxica_5','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200506,1002005,6,'token_de_fila','posición_léxica_6','5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200507,1002005,7,'token_de_fila','posición_léxica_7','3,66Macroproceso:','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200508,1002005,8,'token_de_fila','posición_léxica_8','Formación','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002006,1002,6,'1010960935','6 1010960935 4,0 6 4,7 4 4 1 3,54','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200601,1002006,1,'token_de_fila','posición_léxica_1','4,0','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200602,1002006,2,'token_de_fila','posición_léxica_2','6','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200603,1002006,3,'token_de_fila','posición_léxica_3','4,7','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200604,1002006,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200605,1002006,5,'token_de_fila','posición_léxica_5','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200606,1002006,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200607,1002006,7,'token_de_fila','posición_léxica_7','3,54','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002007,1002,7,'1002459414','7 1002459414 4,3 8 4,6 4 4 1 3,52','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200701,1002007,1,'token_de_fila','posición_léxica_1','4,3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200702,1002007,2,'token_de_fila','posición_léxica_2','8','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200703,1002007,3,'token_de_fila','posición_léxica_3','4,6','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200704,1002007,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200705,1002007,5,'token_de_fila','posición_léxica_5','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200706,1002007,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200707,1002007,7,'token_de_fila','posición_léxica_7','3,52','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002008,1002,8,'1001058991','8 1001058991 4,2 10 4,5 4 4 1 3,5','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200801,1002008,1,'token_de_fila','posición_léxica_1','4,2','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200802,1002008,2,'token_de_fila','posición_léxica_2','10','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200803,1002008,3,'token_de_fila','posición_léxica_3','4,5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200804,1002008,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200805,1002008,5,'token_de_fila','posición_léxica_5','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200806,1002008,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200807,1002008,7,'token_de_fila','posición_léxica_7','3,5','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002009,1002,9,'1018448728','9 1018448728 3,8 11 4,5 4 4 1 3,49','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200901,1002009,1,'token_de_fila','posición_léxica_1','3,8','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200902,1002009,2,'token_de_fila','posición_léxica_2','11','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200903,1002009,3,'token_de_fila','posición_léxica_3','4,5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200904,1002009,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200905,1002009,5,'token_de_fila','posición_léxica_5','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200906,1002009,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100200907,1002009,7,'token_de_fila','posición_léxica_7','3,49','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002010,1002,10,'1117808396','10 1117808396 4,2 14 4,3 4 4 1 3,46','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201001,1002010,1,'token_de_fila','posición_léxica_1','4,2','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201002,1002010,2,'token_de_fila','posición_léxica_2','14','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201003,1002010,3,'token_de_fila','posición_léxica_3','4,3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201004,1002010,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201005,1002010,5,'token_de_fila','posición_léxica_5','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201006,1002010,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201007,1002010,7,'token_de_fila','posición_léxica_7','3,46','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002011,1002,11,'1006552135','11 1006552135 4,1 14 4,3 4 4 1 3,46','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201101,1002011,1,'token_de_fila','posición_léxica_1','4,1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201102,1002011,2,'token_de_fila','posición_léxica_2','14','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201103,1002011,3,'token_de_fila','posición_léxica_3','4,3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201104,1002011,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201105,1002011,5,'token_de_fila','posición_léxica_5','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201106,1002011,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201107,1002011,7,'token_de_fila','posición_léxica_7','3,46','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002012,1002,12,'1014666061','12 1014666061 4,6 15 4,3 4 4 1 3,45','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201201,1002012,1,'token_de_fila','posición_léxica_1','4,6','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201202,1002012,2,'token_de_fila','posición_léxica_2','15','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201203,1002012,3,'token_de_fila','posición_léxica_3','4,3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201204,1002012,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201205,1002012,5,'token_de_fila','posición_léxica_5','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201206,1002012,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201207,1002012,7,'token_de_fila','posición_léxica_7','3,45','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002013,1002,13,'1085896254','13 1085896254 3,7 1 5,0 4 3 1 3,29','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201301,1002013,1,'token_de_fila','posición_léxica_1','3,7','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201302,1002013,2,'token_de_fila','posición_léxica_2','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201303,1002013,3,'token_de_fila','posición_léxica_3','5,0','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201304,1002013,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201305,1002013,5,'token_de_fila','posición_léxica_5','3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201306,1002013,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201307,1002013,7,'token_de_fila','posición_léxica_7','3,29','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002014,1002,14,'1000931914','14 1000931914 4,7 14 4,3 4 3 1 3,16','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201401,1002014,1,'token_de_fila','posición_léxica_1','4,7','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201402,1002014,2,'token_de_fila','posición_léxica_2','14','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201403,1002014,3,'token_de_fila','posición_léxica_3','4,3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201404,1002014,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201405,1002014,5,'token_de_fila','posición_léxica_5','3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201406,1002014,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201407,1002014,7,'token_de_fila','posición_léxica_7','3,16','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002015,1002,15,'1000931705','15 1000931705 4,7 46 2,7 4 4 1 3,14','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201501,1002015,1,'token_de_fila','posición_léxica_1','4,7','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201502,1002015,2,'token_de_fila','posición_léxica_2','46','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201503,1002015,3,'token_de_fila','posición_léxica_3','2,7','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201504,1002015,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201505,1002015,5,'token_de_fila','posición_léxica_5','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201506,1002015,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201507,1002015,7,'token_de_fila','posición_léxica_7','3,14','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002016,1002,16,'1007535090','16 1007535090 3,7 20 4,0 4 3 1 3,1','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201601,1002016,1,'token_de_fila','posición_léxica_1','3,7','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201602,1002016,2,'token_de_fila','posición_léxica_2','20','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201603,1002016,3,'token_de_fila','posición_léxica_3','4,0','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201604,1002016,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201605,1002016,5,'token_de_fila','posición_léxica_5','3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201606,1002016,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201607,1002016,7,'token_de_fila','posición_léxica_7','3,1','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002017,1002,17,'1006120608','17 1006120608 3,8 51 2,5 4 4 1 3,09','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201701,1002017,1,'token_de_fila','posición_léxica_1','3,8','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201702,1002017,2,'token_de_fila','posición_léxica_2','51','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201703,1002017,3,'token_de_fila','posición_léxica_3','2,5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201704,1002017,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201705,1002017,5,'token_de_fila','posición_léxica_5','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201706,1002017,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201707,1002017,7,'token_de_fila','posición_léxica_7','3,09','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1002018,1002,18,'1018426001','18 1018426001 4,5 62 1,9 4 3 1 2,68','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201801,1002018,1,'token_de_fila','posición_léxica_1','4,5','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201802,1002018,2,'token_de_fila','posición_léxica_2','62','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201803,1002018,3,'token_de_fila','posición_léxica_3','1,9','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201804,1002018,4,'token_de_fila','posición_léxica_4','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201805,1002018,5,'token_de_fila','posición_léxica_5','3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201806,1002018,6,'token_de_fila','posición_léxica_6','1','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100201807,1002018,7,'token_de_fila','posición_léxica_7','2,68','sin_correspondencia_validada_con_encabezado');
INSERT INTO caso_convocatoria (caso_id,codigo_referencia,estado_conciliacion,notas) VALUES (103,'2026-C2312','sin_verificar','Lote 1, fuente Convocatorias Cerradas fila 36');
INSERT INTO fila_hoja (fila_id,captura_id,pestaña_literal,indice_fila,estado_extraccion) VALUES (103,1,'Convocatorias Cerradas',36,'celda_a_celda');
INSERT INTO vinculo_caso (vinculo_id,caso_id,fila_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (1031,103,103,'hoja_calculo','2026-C2312','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2061,103,'A','Programa','Pregrado','{"stringValue":"Pregrado"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2062,103,'B','Facultad','Facultad de Ciencias Agrarias','{"stringValue":"Facultad de Ciencias Agrarias"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2063,103,'C','Programa curricular','Ingeniería Agronómica','{"stringValue":"Ingeniería Agronómica"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2064,103,'D','Archivo PDF de la convocatoria','2026-C2312','{"stringValue":"2026-C2312"}',NULL,NULL,NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"OVERFLOW_CELL","textFormat":{"foregroundColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863},"fontFamily":"\"Google Sans\", Roboto, RobotoDraft, Helvetica, Arial, sans-serif","bold":false,"foregroundColorStyle":{"rgbColor":{"red":0.12156863,"green":0.12156863,"blue":0.12156863}}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2065,103,'E','Estado de la convocatoria','Cerrada','{"stringValue":"Cerrada"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2066,103,'F','Resultados','https://drive.google.com/file/d/1BdKbtbIhlMQRwjKrWGJrYD3aGXhPuSB_/view?usp=drivesdk','{"stringValue":"https://drive.google.com/file/d/1BdKbtbIhlMQRwjKrWGJrYD3aGXhPuSB_/view?usp=drivesdk"}',NULL,'https://drive.google.com/file/d/1BdKbtbIhlMQRwjKrWGJrYD3aGXhPuSB_/view?usp=drivesdk',NULL,'{"formato":{"backgroundColor":{"red":1,"green":1,"blue":1},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false,"link":{"uri":"https://drive.google.com/file/d/1BdKbtbIhlMQRwjKrWGJrYD3aGXhPuSB_/view?usp=drivesdk"}},"backgroundColorStyle":{"rgbColor":{"red":1,"green":1,"blue":1}}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2067,103,'G','Nombre de la convocatoria, proyecto o Proceso','Estudiante auxiliar apoyo a investigación en geomática','{"stringValue":"Estudiante auxiliar apoyo a investigación en geomática"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2068,103,'H','Correo del responsable','lcastillov@unal.edu.co','{"stringValue":"lcastillov@unal.edu.co"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2069,103,'I','Fecha de publicación','4-nov-2026','{"numberValue":46330}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE","pattern":"d\"-\"mmm\"-\"yyyy"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2070,103,'J','Fecha y hora de cierre de la convocatoria','11/11/2026 6:00:00 p. m.','{"numberValue":46337.75}',NULL,NULL,NULL,'{"formato":{"numberFormat":{"type":"DATE_TIME","pattern":"d\"/\"m\"/\"yyyy\" \"h\":\"mm\":\"ss\" \"am/pm"},"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO celda_hoja (celda_id,fila_id,columna_letra,encabezado_literal,valor_visible,valor_origen_json,formula,hipervinculo,nota,metadatos_formato_json,estado_lectura) VALUES (2071,103,'K','Número de convocatoria','2026-C2312','{"stringValue":"2026-C2312"}',NULL,NULL,NULL,'{"formato":{"horizontalAlignment":"CENTER","verticalAlignment":"MIDDLE","wrapStrategy":"WRAP","textFormat":{"fontSize":10,"bold":false,"italic":false,"underline":false}},"texto_formato_tramos":null}','leido');
INSERT INTO evento_revision (revision_id,objeto_tipo,objeto_id,accion,descripcion) VALUES (1031,'caso_convocatoria',103,'documento_pendiente','{"rol":"convocatoria","referencia_celda":"2026-C2312","motivo":"referencia_sin_url_pdf","verificacion":"pendiente_de_localizar"}');
INSERT INTO documento (documento_id,tipo_sugerido,url_origen,drive_id,titulo_archivo,mime_type,capturado_en,estado_acceso,estado_extraccion,notas) VALUES (1003,'resultados','https://drive.google.com/file/d/1BdKbtbIhlMQRwjKrWGJrYD3aGXhPuSB_/view?usp=drivesdk','1BdKbtbIhlMQRwjKrWGJrYD3aGXhPuSB_','Resultados 2026-C2312','application/pdf','2026-11-13','leido','transcrito_sin_cotejo_visual','El PDF binario y su huella SHA256 no se han incorporado; texto extraído literalmente disponible en campo_documento y renglones.');
INSERT INTO vinculo_caso (vinculo_id,caso_id,documento_id,rol_en_caso,evidencia_literal,estado_verificacion) VALUES (1033,103,1003,'resultados','Resultados 2026-C2312','transcrito_pendiente_revision');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,estado_revision) VALUES (1003001,1003,'texto_extraido_integro',1,'Transcripción íntegra devuelta por Drive','Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 3
Nombre de la convocatoria
Estudiante auxiliar apoyo a investigación en 
geomática
Número de la convocatoria
2026-C2302 N.º de estudiantes 
a vincular
3
Facultad, dependencia o 
proyecto
Departamento de Agronomía
Fecha de publicación de la 
convocatoria 04 11 2026
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
Ingeniería Agronómica
Haber cursado y aprobado la asignatura Geomática Básica.
Nociones generales sobre los principios de la geomática, percepción remota y uso de sensores 
ópticos en agricultura. Manejo de herramientas informáticas para la organización y 
sistematización de datos de campo.
Puntualidad en el cumplimiento de compromisos y alto sentido de responsabilidad y 
compromiso con las actividades asignadas en el marco del proyecto de investigación.
Disposición para el trabajo en equipo multidisciplinario.
CRITERIOS DE SELECCIÓN Y EVALUACIÓN
Criterios Ponderación 
(Asigne el peso porcentual de cada criterio)Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 3
1 P.A.P.A. 25%
2 Entrevista 40%
3 Disponibilidad de tiempo 15%
4 Conocimientos específicos 20%
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
1 1012322452 4 4 4.4 4.3 4.2 X
2 1000688625 4 4 4.4 4.4 4.3 X
3 1011320273 3.9 3.9 4.6 3.8 4.4 X
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
Observaciones:Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 3 de 3
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
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1003002,1003,'número_de_la',1,'Número de la','Número de la convocatoria
2026-C2302 N.º de estudiantes 
a vincular
3
Facultad, dependencia o 
proyecto
Departamento de Agronomía
Fecha de publicación de la 
convocatoria 04 11 2026
Fecha de publicación de 
res','{"linea_aproximada":8,"ubicacion_caracter":261,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1003003,1003,'fecha_de_publicación_de_la',1,'Fecha de publicación de la','Fecha de publicación de la 
convocatoria 04 11 2026
Fecha de publicación de 
resultados 13 11 2026
Requisitos Generales
(Art. 2 Acuerdo CSU 024 de 
2022)
a. Tener la calidad de estudiante de pregrado o postgrado d','{"linea_aproximada":15,"ubicacion_caracter":398,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1003004,1003,'nombre_de_la',1,'Nombre de la','Nombre de la convocatoria
Estudiante auxiliar apoyo a investigación en 
geomática
Número de la convocatoria
2026-C2302 N.º de estudiantes 
a vincular
3
Facultad, dependencia o 
proyecto
Departamento de Agronomía','{"linea_aproximada":5,"ubicacion_caracter":176,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1003005,1003,'requisitos_generales',1,'Requisitos Generales','Requisitos Generales
(Art. 2 Acuerdo CSU 024 de 
2022)
a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia. 
b. Si las actividades a desarrollar están relacionadas con doc','{"linea_aproximada":19,"ubicacion_caracter":501,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1003006,1003,'perfil_requerido',1,'Perfil requerido','Perfil requerido
Ingeniería Agronómica
Haber cursado y aprobado la asignatura Geomática Básica.
Nociones generales sobre los principios de la geomática, percepción remota y uso de sensores 
ópticos en agricultura. Ma','{"linea_aproximada":51,"ubicacion_caracter":2815,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1003007,1003,'actividades_a_desarrollar',1,'actividades a desarrollar','actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un 
Promedio Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para estudiantes de 
pregrado, e igual o superior a 4','{"linea_aproximada":23,"ubicacion_caracter":669,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1003008,1003,'actividades_a_desarrollar',2,'actividades a desarrollar','actividades a desarrollar están relacionadas con investigación, extensión, bienestar 
universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético 
Ponderado Acumulado - P.A.P.A. igual o ','{"linea_aproximada":26,"ubicacion_caracter":934,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1003009,1003,'disponibilidad_de_tiempo',1,'Disponibilidad de tiempo','Disponibilidad de tiempo 15%
4 Conocimientos específicos 20%
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
O','{"linea_aproximada":68,"ubicacion_caracter":3675,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1003010,1003,'responsable_de_la',1,'RESPONSABLE DE LA','RESPONSABLE DE LA 
EVALUACIÓN
Liliana Carolina Castillo Villamor
CARGO Profesora Auxiliar
EXTENSIÓN 19073
CORREO lcastillov@unal.edu.co
_________________________________
(Original Firmado
Los estudiantes que se p','{"linea_aproximada":116,"ubicacion_caracter":5374,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1003011,1003,'datos_de_los_participantes',1,'DATOS DE LOS PARTICIPANTES','DATOS DE LOS PARTICIPANTES
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
1 10123224','{"linea_aproximada":77,"ubicacion_caracter":3783,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO campo_documento (campo_id,documento_id,ruta_campo,ocurrencia,rotulo_original,texto_original,valor_normalizado_json,estado_revision) VALUES (1003012,1003,'observaciones',1,'Observaciones','Observaciones:Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 3 de 3
NOMBRE DEL 
RESPONSABLE DE LA','{"linea_aproximada":111,"ubicacion_caracter":5171,"tipo":"hallazgo_de_etiqueta_no_confirmado"}','indice_sin_cotejo');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (100301,1003,1,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 3
Nombre de la convocatoria
Estudiante auxiliar apoyo a investigación en 
geomática
Número de la convocatoria
2026-C2302 N.º de estudiantes 
a vincular
3
Facultad, dependencia o 
proyecto
Departamento de Agronomía
Fecha de publicación de la 
convocatoria 04 11 2026
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
Ingeniería Agronómica
Haber cursado y aprobado la asignatura Geomática Básica.
Nociones generales sobre los principios de la geomática, percepción remota y uso de sensores 
ópticos en agricultura. Manejo de herramientas informáticas para la organización y 
sistematización de datos de campo.
Puntualidad en el cumplimiento de compromisos y alto sentido de responsabilidad y 
compromiso con las actividades asignadas en el marco del proyecto de investigación.
Disposición para el trabajo en equipo multidisciplinario.
CRITERIOS DE SELECCIÓN Y EVALUACIÓN
Criterios Ponderación 
(Asigne el peso porcentual de cada criterio)','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301001,100301,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301002,100301,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301003,100301,3,'renglon_literal','Formato selección estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301004,100301,4,'renglon_literal','Código: U.FT.05.007.014 Versión: 2.0 Página 1 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301005,100301,5,'renglon_literal','Nombre de la convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301006,100301,6,'renglon_literal','Estudiante auxiliar apoyo a investigación en ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301007,100301,7,'renglon_literal','geomática','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301008,100301,8,'renglon_literal','Número de la convocatoria','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301009,100301,9,'renglon_literal','2026-C2302 N.º de estudiantes ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301010,100301,10,'renglon_literal','a vincular','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301011,100301,11,'renglon_literal','3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301012,100301,12,'renglon_literal','Facultad, dependencia o ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301013,100301,13,'renglon_literal','proyecto','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301014,100301,14,'renglon_literal','Departamento de Agronomía','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301015,100301,15,'renglon_literal','Fecha de publicación de la ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301016,100301,16,'renglon_literal','convocatoria 04 11 2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301017,100301,17,'renglon_literal','Fecha de publicación de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301018,100301,18,'renglon_literal','resultados 13 11 2026','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301019,100301,19,'renglon_literal','Requisitos Generales','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301020,100301,20,'renglon_literal','(Art. 2 Acuerdo CSU 024 de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301021,100301,21,'renglon_literal','2022)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301022,100301,22,'renglon_literal','a. Tener la calidad de estudiante de pregrado o postgrado de la Universidad Nacional de Colombia. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301023,100301,23,'renglon_literal','b. Si las actividades a desarrollar están relacionadas con docencia, el estudiante deberá tener un ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301024,100301,24,'renglon_literal','Promedio Aritmético Ponderado Acumulado - P.A.P.A. igual o superior a 3.5. para estudiantes de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301025,100301,25,'renglon_literal','pregrado, e igual o superior a 4.0 para estudiantes de posgrado. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301026,100301,26,'renglon_literal','c. Si las actividades a desarrollar están relacionadas con investigación, extensión, bienestar ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301027,100301,27,'renglon_literal','universitario o de gestión administrativa el estudiante deberá tener un Promedio Aritmético ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301028,100301,28,'renglon_literal','Ponderado Acumulado - P.A.P.A. igual o superior a 3.0. para estudiantes de pregrado, e igual o ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301029,100301,29,'renglon_literal','superior a 4.0 para estudiantes de posgrado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301030,100301,30,'renglon_literal','d. No ostentar la calidad de monitor académico o becario, salvo para aquellos estudiantes que ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301031,100301,31,'renglon_literal','obtuvieron la beca de posgrado por la distinción de Grado de Honor de la Universidad Nacional ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301032,100301,32,'renglon_literal','de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301033,100301,33,'renglon_literal','e. No tener calidad de funcionario público (administrativo o docente de planta) de la Universidad ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301034,100301,34,'renglon_literal','Nacional de Colombia.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301035,100301,35,'renglon_literal','f. Durante el periodo lectivo el Estudiante Auxiliar debe mantener la calidad de estudiante e ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301036,100301,36,'renglon_literal','inscrita al menos la carga mínima exigida por el Estatuto Estudiantil. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301037,100301,37,'renglon_literal','g. No haber tenido sanciones disciplinarias.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301038,100301,38,'renglon_literal','PARÁGRAFO 1. La figura de Estudiante Auxiliar podrá ser compatible con las modalidades de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301039,100301,39,'renglon_literal','apoyo a estudiantes en las cuales no se reciba una retribución económica por la realización de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301040,100301,40,'renglon_literal','actividades y que el desempeño como Estudiante Auxiliar no interfiera con el normal desarrollo ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301041,100301,41,'renglon_literal','de su actividad académica. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301042,100301,42,'renglon_literal','PARÁGRAFO 2. Para los estudiantes de posgrado que se encuentren matriculados en el primer ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301043,100301,43,'renglon_literal','periodo académico de un programade posgrado cumplir una de las siguientes condiciones, de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301044,100301,44,'renglon_literal','acuerdo con el tipo de admisión, así: ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301045,100301,45,'renglon_literal','1. Admisión regular. Se privilegia a los que hayan obtenido los mayores puntajes de admisión.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301046,100301,46,'renglon_literal','2. Haber sido admitido por admisión automática, según el literal c del artículo 57 del Acuerdo ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301047,100301,47,'renglon_literal','008 de 2008 del Consejo Superior Universitario - Estatuto Estudiantil en sus disposiciones ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301048,100301,48,'renglon_literal','académicas.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301049,100301,49,'renglon_literal','3. Admisión mediante tránsito entre programas de posgrado, tener un promedio académico igual ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301050,100301,50,'renglon_literal','o superior a 4.0 en el programa de posgrado desde el cual se aprobó el tránsito.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301051,100301,51,'renglon_literal','Perfil requerido','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301052,100301,52,'renglon_literal','Ingeniería Agronómica','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301053,100301,53,'renglon_literal','Haber cursado y aprobado la asignatura Geomática Básica.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301054,100301,54,'renglon_literal','Nociones generales sobre los principios de la geomática, percepción remota y uso de sensores ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301055,100301,55,'renglon_literal','ópticos en agricultura. Manejo de herramientas informáticas para la organización y ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301056,100301,56,'renglon_literal','sistematización de datos de campo.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301057,100301,57,'renglon_literal','Puntualidad en el cumplimiento de compromisos y alto sentido de responsabilidad y ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301058,100301,58,'renglon_literal','compromiso con las actividades asignadas en el marco del proyecto de investigación.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301059,100301,59,'renglon_literal','Disposición para el trabajo en equipo multidisciplinario.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301060,100301,60,'renglon_literal','CRITERIOS DE SELECCIÓN Y EVALUACIÓN','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301061,100301,61,'renglon_literal','Criterios Ponderación ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100301062,100301,62,'renglon_literal','(Asigne el peso porcentual de cada criterio)','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (100302,1003,2,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 3
1 P.A.P.A. 25%
2 Entrevista 40%
3 Disponibilidad de tiempo 15%
4 Conocimientos específicos 20%
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
1 1012322452 4 4 4.4 4.3 4.2 X
2 1000688625 4 4 4.4 4.4 4.3 X
3 1011320273 3.9 3.9 4.6 3.8 4.4 X
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
Observaciones:','segmentacion_por_cabecera_heuristica','pendiente','Los límites de página son estimados; revisar original PDF.');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302001,100302,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302002,100302,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302003,100302,3,'renglon_literal','Formato selección estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302004,100302,4,'renglon_literal','Código: U.FT.05.007.014 Versión: 2.0 Página 2 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302005,100302,5,'renglon_literal','1 P.A.P.A. 25%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302006,100302,6,'renglon_literal','2 Entrevista 40%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302007,100302,7,'renglon_literal','3 Disponibilidad de tiempo 15%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302008,100302,8,'renglon_literal','4 Conocimientos específicos 20%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302009,100302,9,'renglon_literal','5','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302010,100302,10,'renglon_literal','6','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302011,100302,11,'renglon_literal','7','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302012,100302,12,'renglon_literal','Sumatoria ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302013,100302,13,'renglon_literal','de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302014,100302,14,'renglon_literal','porcentajes','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302015,100302,15,'renglon_literal','100%','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302016,100302,16,'renglon_literal','DATOS DE LOS PARTICIPANTES','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302017,100302,17,'renglon_literal','No. Identificación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302018,100302,18,'renglon_literal','Puntaje por Criterio','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302019,100302,19,'renglon_literal','(De 0 a 5) (PBM de 0 a 100)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302020,100302,20,'renglon_literal','*P.A.P.A. ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302021,100302,21,'renglon_literal','O puntaje ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302022,100302,22,'renglon_literal','de admisión ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302023,100302,23,'renglon_literal','(PA) (SI/NO)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302024,100302,24,'renglon_literal','P.B.M.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302025,100302,25,'renglon_literal','(si ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302026,100302,26,'renglon_literal','aplica)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302027,100302,27,'renglon_literal','1 2 3 4 5 6 7 Total Seleccionad','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302028,100302,28,'renglon_literal','o','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302029,100302,29,'renglon_literal','1 1012322452 4 4 4.4 4.3 4.2 X','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302030,100302,30,'renglon_literal','2 1000688625 4 4 4.4 4.4 4.3 X','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302031,100302,31,'renglon_literal','3 1011320273 3.9 3.9 4.6 3.8 4.4 X','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302032,100302,32,'renglon_literal','4','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302033,100302,33,'renglon_literal','5','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302034,100302,34,'renglon_literal','6','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302035,100302,35,'renglon_literal','7','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302036,100302,36,'renglon_literal','8','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302037,100302,37,'renglon_literal','9','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302038,100302,38,'renglon_literal','10','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302039,100302,39,'renglon_literal','• Se deben relacionar todos los participantes que aplicaron a la convocatoria.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302040,100302,40,'renglon_literal','• Si el (la-los) estudiante(s) incumple(n) alguno de los Requisitos mínimos no se debe continuar con la evaluación de la hoja de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302041,100302,41,'renglon_literal','vida.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302042,100302,42,'renglon_literal','• En caso de empate en el puntaje total, se dará prelación a los estudiantes cuyos puntajes básicos de matrícula (PBM) sean los ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302043,100302,43,'renglon_literal','más bajos. (En caso que aplique)','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302044,100302,44,'renglon_literal','• Marque una X en la columna "Seleccionado" para identificar el (los) ganador(es) de la convocatoria.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302045,100302,45,'renglon_literal','• Marque con la palabra “Elegible” a el (la-los) estudiante(s) que quedará(n) en la lista de elegible(s).','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302046,100302,46,'renglon_literal','Certifico que el (los) estudiante(s) seleccionado(s) fue(ron) consultado(s) y manifiesta(n) no recibir ningún otro beneficio ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302047,100302,47,'renglon_literal','económico de la Universidad Nacional de Colombia y que no está(n) inhabilitado(s) para ser vinculado(s) como Estudiante(s) ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302048,100302,48,'renglon_literal','Auxiliar(es), a su vez asumo la responsabilidad de todo el proceso de selección del estudiante.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302049,100302,49,'renglon_literal','En caso de que no se haya seleccionado a ningún estudiante como ganador de la convocatoria especifique el motivo:','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100302050,100302,50,'renglon_literal','Observaciones:','pendiente');
INSERT INTO pagina_pdf (pagina_id,documento_id,numero_pagina,texto_extraido_literal,metodo_extraccion,estado_revision_visual,notas) VALUES (100303,1003,3,'Macroproceso: Formación
Proceso: Gestión Administrativa de Apoyo a la Formación
Formato selección estudiantes auxiliares
Código: U.FT.05.007.014 Versión: 2.0 Página 3 de 3
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
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303001,100303,1,'renglon_literal','Macroproceso: Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303002,100303,2,'renglon_literal','Proceso: Gestión Administrativa de Apoyo a la Formación','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303003,100303,3,'renglon_literal','Formato selección estudiantes auxiliares','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303004,100303,4,'renglon_literal','Código: U.FT.05.007.014 Versión: 2.0 Página 3 de 3','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303005,100303,5,'renglon_literal','NOMBRE DEL ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303006,100303,6,'renglon_literal','RESPONSABLE DE LA ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303007,100303,7,'renglon_literal','EVALUACIÓN','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303008,100303,8,'renglon_literal','Liliana Carolina Castillo Villamor','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303009,100303,9,'renglon_literal','CARGO Profesora Auxiliar','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303010,100303,10,'renglon_literal','EXTENSIÓN 19073','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303011,100303,11,'renglon_literal','CORREO lcastillov@unal.edu.co','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303012,100303,12,'renglon_literal','_________________________________','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303013,100303,13,'renglon_literal','(Original Firmado','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303014,100303,14,'renglon_literal','Los estudiantes que se postulen para la presente convocatoria aceptan que sus datos personales (nombre completo y/o documento de ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303015,100303,15,'renglon_literal','identificación, BPM o puntaje de admisión y P.A.P.A) sean publicados al momento de dar a conocer los resultados del proceso de selección ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303016,100303,16,'renglon_literal','por los canales de divulgación que la Universidad disponga para tal fin.','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303017,100303,17,'renglon_literal','En el marco normativo de la Ley 1581 de 2012, la Universidad Nacional de Colombia se permite informar que la información personal ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303018,100303,18,'renglon_literal','recolectada mediante la presente Convocatoria de Estudiantes Auxiliares se rige bajo los principios rectores del Régimen de Protección ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303019,100303,19,'renglon_literal','de Datos de la Universidad Nacional, Resolución de Rectoría No. 207 de 2021, en especial el de Legalidad y Veracidad o calidad, la cual ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303020,100303,20,'renglon_literal','puede ser consultada en http://www.legal.unal.edu.co/rlunal/home/doc.jsp?d_i=97992. Sus datos se encuentran bajo medidas que ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303021,100303,21,'renglon_literal','garantizan la seguridad, confidencialidad e integridad. Puede ejercer sus derechos como titular a conocer, actualizar, rectificar y revocar ','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303022,100303,22,'renglon_literal','las autorizaciones dadas a lasfinalidades aplicables a través de los canales dispuestos y disponibles en https://unal.edu.co/ o en el e-mail','pendiente');
INSERT INTO fragmento_pdf (fragmento_id,pagina_id,orden_lectura,tipo_fragmento,texto_literal,estado_clasificacion) VALUES (100303023,100303,23,'renglon_literal','protecdatos_na@unal.edu.co.','pendiente');
INSERT INTO publicacion_resultados (publicacion_id,documento_id,codigo_convocatoria_literal,nombre_literal,estado_revision) VALUES (1003,1003,'2026-C2302','Resultados 2026-C2312','pendiente_cotejo_visual');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1003001,1003,1,'1012322452','1 1012322452 4 4 4.4 4.3 4.2 X','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300101,1003001,1,'token_de_fila','posición_léxica_1','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300102,1003001,2,'token_de_fila','posición_léxica_2','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300103,1003001,3,'token_de_fila','posición_léxica_3','4.4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300104,1003001,4,'token_de_fila','posición_léxica_4','4.3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300105,1003001,5,'token_de_fila','posición_léxica_5','4.2','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300106,1003001,6,'token_de_fila','posición_léxica_6','X','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1003002,1003,2,'1000688625','2 1000688625 4 4 4.4 4.4 4.3 X','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300201,1003002,1,'token_de_fila','posición_léxica_1','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300202,1003002,2,'token_de_fila','posición_léxica_2','4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300203,1003002,3,'token_de_fila','posición_léxica_3','4.4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300204,1003002,4,'token_de_fila','posición_léxica_4','4.4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300205,1003002,5,'token_de_fila','posición_léxica_5','4.3','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300206,1003002,6,'token_de_fila','posición_léxica_6','X','sin_correspondencia_validada_con_encabezado');
INSERT INTO postulacion (postulacion_id,publicacion_id,orden_en_tabla,identificacion_literal,observacion_literal,estado_revision) VALUES (1003003,1003,3,'1011320273','3 1011320273 3.9 3.9 4.6 3.8 4.4 X','lectura_provisional_pendiente_cotejo_visual');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300301,1003003,1,'token_de_fila','posición_léxica_1','3.9','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300302,1003003,2,'token_de_fila','posición_léxica_2','3.9','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300303,1003003,3,'token_de_fila','posición_léxica_3','4.6','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300304,1003003,4,'token_de_fila','posición_léxica_4','3.8','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300305,1003003,5,'token_de_fila','posición_léxica_5','4.4','sin_correspondencia_validada_con_encabezado');
INSERT INTO dato_postulacion (dato_id,postulacion_id,orden_en_fuente,etiqueta_original,columna_original,valor_literal,estado_revision) VALUES (100300306,1003003,6,'token_de_fila','posición_léxica_6','X','sin_correspondencia_validada_con_encabezado');
COMMIT;
