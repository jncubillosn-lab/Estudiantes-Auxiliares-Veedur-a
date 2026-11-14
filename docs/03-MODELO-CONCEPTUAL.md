# 03 — Modelo conceptual de información y relaciones

**Este documento describe información, no estructuras de programación.** El modelo definitivo surgirá del examen detallado de casos reales, antes de cualquier implementación.

## Unidad central: expediente de convocatoria

Un expediente es la integración de **todas las apariciones y documentos** correspondientes a una convocatoria identificada por código. La cabecera puede unificar datos compartidos, pero cada aparición original debe seguir recuperable y las diferencias deben verse.

### Objetos del dominio

| Objeto conceptual | Información indispensable |
|---|---|
| Convocatoria | Identidad, nombre, dependencia, periodo, estado, programa o proyecto, condiciones publicadas |
| Fuente | Tipo, origen, versión, fecha, acceso, integridad, documento o registro completo |
| Fragmento original | Contenido literal, ubicación, orden, pertenencia a una fuente y estructura |
| Perfil y requisito | Concepto, carácter habilitante o preferente, ámbito, condiciones, excepciones, evidencias |
| Actividad | Tarea específica, alcance, perfil relacionado y contexto |
| Oferta | Plazas, modalidad, dedicación, duración, estímulo y periodicidad |
| Postulación | Documentos obligatorios/opcionales, canales, destinatario, plazos |
| Criterio de evaluación | Identidad, orden, definición, ponderación, escala, condición y vínculos con el perfil |
| Resultado | Documento, estructura de tabla, participantes, calificaciones, totales, estado, observaciones |
| Modificación | Versión afectada, dato o condición modificada, momento y fuente de cambio |
| Interpretación | Concepto canónico, significado, operador, valor, unidad, rol, evidencia y grado de certeza |
| Incidencia | Diferencia observada, alcance, fuente, estado y resolución documentada |
| Verificación | Fuente o elemento cotejado, cobertura real, evidencia, puerta aplicable y resultado |

## Relaciones que deben conservarse

1. **Convocatoria — fuente — versión — ubicación:** toda aparición original debe poder identificarse.
2. **Requisito — condiciones particulares:** conjunciones, alternativas, negaciones, excepciones y umbrales no son notas accesorias.
3. **Concepto — rol:** el mismo título académico puede funcionar como requisito y como criterio ponderado, sin que una ocurrencia sustituya a la otra.
4. **Criterio — ponderación — escala — columna de resultados:** cada valor evaluado corresponde a un criterio definido, incluso si los encabezados de la tabla son números.
5. **Participante — fila — criterios — puntajes — total — decisión:** una selección no se reduce al total de participantes o ganadores.
6. **Publicación — adenda — resultado:** distinguir vigencia, modificación y discrepancia, conservando toda versión.
7. **Interpretación — evidencias:** un dato derivado siempre permite regresar al contexto de donde salió.
8. **Expediente — verificación:** identificación, extracción, interpretación, cotejo y validación son avances diferentes.

## Clasificación semántica de las condiciones

Una condición tiene como mínimo: **qué se exige o menciona; a quién aplica; con qué rol; qué operador; qué valor y unidad; qué otras condiciones la limitan; dónde se publicó; y con qué certeza se interpretó**.

Ejemplos:

- «Avance mínimo del 20 %»: avance académico **mayor o igual a 20 %**, si el texto realmente establece un mínimo.
- «Entre el 20 % y el 90 %»: conserva **ambos extremos** y la inclusividad respaldada por el texto.
- «Avance del 20 %»: porcentaje mencionado sin operador explícito; el contexto debe resolverlo o quedar pendiente.
- «Ser ingeniero mecánico»: puede ser requisito habilitante.
- «Título profesional — 30 %»: puede ser un criterio de evaluación. Si ambos aluden al mismo título, se **relacionan**, pero no se fusionan.
- «P.A.P.A. 3,5»: condición de promedio académico, diferente de P.B.M., porcentaje de avance o ponderación.

El vocabulario debe ser **común para comparación y extensible para casos nuevos**, pero no tan genérico que pierda diferencias jurídicas, académicas o documentales.

## Estructura documental mínima

La extracción debe preservar la organización física y lógica de cada fuente:

- **Hoja general:** hojas, filas, columnas, encabezados, celdas, fórmulas, notas, vínculos y múltiples filas de un mismo código.
- **Documento de convocatoria:** páginas, apartados, listas jerárquicas, tablas, celdas, requisitos generales y específicos, actividades, instrucciones, plazos, anexos, adendas y marcas visuales.
- **Documento de resultados:** criterios, ponderaciones, tablas, encabezados, participantes, identificación, indicadores académicos, puntaje por criterio, total, marca de seleccionado/elegible, observaciones y responsables.
- **Incidencias:** accesos fallidos, páginas ilegibles, inconsistencias entre fuentes o versiones, vacíos pendientes y códigos no coincidentes.

Un archivo obtenido o una página transcrita **no demuestra** que se hayan conservado sus tablas, sus casillas o sus relaciones.

## Categorías visibles de un expediente

La consulta prioritaria debe incluir siempre los apartados de **identificación; perfil y requisitos; actividades; condiciones de vinculación; postulación; método y criterios de selección; resultados; responsables; fuentes, incidencias y validación**. Un apartado sin registros interpretados permanece visible e indica su estado, no desaparece.

## Caso de referencia: publicación 2026-C2374

Esta convocatoria ofrece un ejemplo con **título profesional, nivel doctoral, pertenencia a semillero, tareas, dedicación, estímulo, duración y tres criterios ponderados**. La utilidad del modelo se mide por la posibilidad de mostrar cada condición en su lugar, representar ponderaciones y conectarlas con el perfil, sin mezclar unas con otras.

## Caso de referencia: resultados 2026-C2188

El documento de resultados dispone de criterios **Entrevista (40 %) y Hoja de vida (60 %)** y columnas numeradas correspondientes. Es necesario conservar explícitamente esa correspondencia y todas las filas de participantes, en lugar de almacenar solo el puntaje total. Este caso fue usado como referencia de estructura, **no como un expediente de la antigua muestra de 96**.

## Independencia del medio técnico

La descripción anterior no prescribe tablas de almacenamiento, formatos de intercambio ni componentes visuales particulares. Su aceptación se comprueba por la fidelidad y utilidad de las relaciones que representa.
