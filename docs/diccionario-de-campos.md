# Diccionario inicial de información — abierto y no excluyente

> **Catálogo auxiliar de rótulos observados, no contrato obligatorio ni lista cerrada.** La entrada/salida vigente se define en [CONTRATO-V3-EXTRACCION-IA](CONTRATO-V3-EXTRACCION-IA.md), [CONTRATO-V3-VISUALIZACION](CONTRATO-V3-VISUALIZACION.md) y [NORMA 01](NORMA-01-integridad-exhaustividad.md). Todo campo original no previsto también debe registrarse íntegramente; el nombre observado en Excel se conserva literalmente aunque parezca inusual. Ninguna columna de este diccionario demuestra por sí sola que un expediente fue validado.


El diccionario es una ayuda para el tratamiento estructurado y **no establece una lista cerrada**. Todo texto, elemento visual o campo no previsto debe conservarse y quedar visible.

## Hoja «Convocatorias Abiertas» (10 columnas)
| Columna | Rótulo original |
|---|---|
| A | Tipo de convocatoria |
| B | Facultad |
| C | Programa curricular |
| D | Coordinacion Pregrado de Diseno Grafico |
| E | Estado de la convocatoria |
| F | Nombre de la convocatoria, proyecto o Proceso |
| G | Correo del responsable |
| H | Fecha de publicación |
| I | Fecha y hora de cierre de la convocatoria |
| J | Número de convocatoria |

Nota: se conserva el rótulo inusual de D tal como aparece; **no se corrige** a «PDF de convocatoria» sin dejar constancia de su procedencia.

## Hoja «Convocatorias Cerradas» (11 columnas)
| Columna | Rótulo original |
|---|---|
| A | Programa |
| B | Facultad |
| C | Programa curricular |
| D | Archivo PDF de la convocatoria |
| E | Estado de la convocatoria |
| F | Resultados |
| G | Nombre de la convocatoria, proyecto o Proceso |
| H | Correo del responsable |
| I | Fecha de publicación |
| J | Fecha y hora de cierre de la convocatoria |
| K | Número de convocatoria |

## PDF de convocatoria: etiquetas observadas hasta ahora
Código, versión, número y fecha; facultad/dependencia/proyecto; nombre; modalidad y tipo de estudiante; número de plazas; requisitos generales y particulares; perfil requerido; actividades; tipo, modalidad y horas de vinculación; estímulo; duración; procedimiento de selección; recepción de documentos; fecha de cierre; documentos obligatorios y opcionales; responsables; criterios de evaluación con pesos; fecha límite de publicación de resultados; leyendas, advertencias y referencias normativas. Incluye todo texto intermedio, tablas, casillas y adendas integradas.

## PDF de resultados: etiquetas observadas hasta ahora
Datos de la convocatoria; requisitos generales y perfil reproducidos; criterios y ponderaciones; lista de postulantes, identificación literal, PAPA, PBM, puntuaciones por criterio, puntaje total y decisión; condiciones eliminatorias; elegibles, renuncias, descalificaciones; observaciones; certificaciones y responsables; leyendas, firmas y referencias normativas.

Los PDF pueden incluir términos, columnas, escalas o disposiciones no enumeradas aquí. Registrar como campo adicional explícito y nunca descartarlos.

## Significado de valores faltantes
- `null`: no hay valor en el registro observado.
- `celda_sin_url_pdf`: la celda carece de enlace; el PDF **no se declara inexistente**.
- `referencia_sin_url_pdf`: el valor es textual pero no hay un enlace técnico recuperable.
- `fallo_lectura`: se intentó leer un enlace sin éxito.
- `pendiente_de_cotejo_visual`: la transcripción necesita comparación con su imagen de página.

## Fidelidad documental
`campo_documento.texto_extraido_integro` y `fragmento_pdf.texto_literal` conservan el texto capturado. **No equivalen a una reproducción íntegra de símbolos, posición y forma del PDF** hasta que se almacene y verifique una copia binaria de sus páginas. No declarar completitud sin esta revisión.
