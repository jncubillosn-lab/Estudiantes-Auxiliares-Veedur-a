# NORMA 06 — Estandarización semántica de la información documental

**Jerarquía:** subordinada a la **NORMA 00** y al modelo `db/estructura_v3.sql`. **No modifica el esquema ni autoriza eliminar originales.**

## Objeto

La IA interpreta el significado y las relaciones de los originales para hacer comparables los requisitos, la oferta, la evaluación y los resultados de convocatorias redactadas de formas distintas. **No** es un sistema de sustitución de palabras ni una extracción de valores aislados. La base guarda la interpretación en las tablas v3 existentes, siempre **separada del texto literal** y vinculada a la fuente, página y fragmento. La interfaz consume esa información sin inventar equivalencias.

## Reglas obligatorias

1. **Dos capas:** original completo e inmutable, y representación estandarizada derivada. Nunca reemplazar, reescribir ni deduplicar la captura original.
2. **Identidad y contexto:** identificar convocatoria, documento, versión/adenda, sección, rol del dato, condición, operadores y unidades. No unir resultados de una convocatoria con otra por similitud de título.
3. **Conservar todos los límites:** «mínimo 20 %» equivale a `avance >= 20`; «mayor al 20 %» a `avance > 20`; «del 20 % al 90 %» implica ambos límites, con inclusividad según el literal. «Igual o inferior a 30 %» establece **solo un máximo**, no un mínimo.
4. **Interpretación contextual y dudas:** «avance del 20 %» dentro del perfil puede significar un umbral mínimo, pero la literalidad aislada no fija el operador. Si la IA concluye que se trata de un mínimo por evidencia contextual, debe señalar `inferencia_contextual`, el motivo y su confiabilidad. Si no puede justificarlo, preservar `valor_mencionado_pct` y marcar `operador=no_explicito`, sin filtro habilitado. Nunca convertir una duda en hecho certificado.
5. **Rol de cada condición:** distinguir requisito habilitante, preferencia, mérito deseable, criterio de puntuación, tarea, documentación obligatoria u opcional, plazo, oferta y resultado. La misma profesión, porcentaje o asignatura puede aparecer como requisito **y** como criterio ponderado. Conservar las dos ocurrencias y relacionarlas; no fusionarlas.
6. **Calificadores y estructura:** preservar negaciones, excepciones, alternativas `O`, condiciones simultáneas `Y`, intervalos, unidades, vigencia, jornadas, programas, sedes, cursos/códigos, grupos de investigación y niveles (pregrado, especialización, maestría, doctorado). Un porcentaje de ponderación **no** es un porcentaje de avance; un P.A.P.A. **no** es P.B.M.
7. **Resultados enlazados:** reconstruir criterios numerados con sus ponderaciones, columnas homólogas del cuadro de participantes, puntajes, totales, selección, empate y observaciones **sin perder filas, celdas ni participantes**. No calcular o presentar como validada una tabla sin cotejo visual completo.
8. **Anomalías y cambios:** si hay adenda, conservar original y modificación con sus fechas y precedencias. Ante contradicciones, coexistencia de PDFs o código de resultado discordante, registrar incidencia y no seleccionar arbitrariamente un valor.
9. **Trazabilidad:** toda faceta lleva `categoria`, `rol`, `valor_normalizado`, `criterio_de_interpretacion` y una o más `evidencias` con URL real, SHA256 binario y página. La evidencia es comprobada contra el PDF guardado. Un extracto de evidencia no pretende ser la totalidad del requisito.
10. **Sin falsa exhaustividad:** «sin faceta interpretada» significa pendiente de normalización, **no** «no existe ese requisito». La normalización parcial no modifica el estado A–E ni autoriza actas.

## Categorías de lectura — ampliables sin alterar el esquema

- **Identificación:** código, convocante/dependencia, título, fechas y tipo de actividad.
- **Perfil y elegibilidad:** nivel/carrera(s), avance (`minimo_pct`, `maximo_pct`, inclusividad), P.A.P.A., asignaturas con código y aprobación, competencias, experiencia, grupos/semilleros, condiciones conjuntas y excepciones.
- **Oferta y postulación:** plazas, modalidad, dedicación en horas/semana, estímulo y periodicidad, duración, fechas, canales, anexos y documentos obligatorios.
- **Evaluación:** cada criterio individual, ordinal, condición, ponderación, escala, umbral y desempate, vinculados al perfil cuando corresponda.
- **Resultados:** cada participante y celda de criterio, puntaje, total, marca de selección, elegibilidad y notas, asociados al PDF y a la convocatoria correcta.

## Dos ejemplos reales revisados

**2026-C2374 (PDF de convocatoria, 3 páginas).** Página 1: exige título de Ingeniería Mecánica; página 2: ser estudiante activo del doctorado en Ingeniería Mecánica y Mecatrónica y pertenecer a SEMIBIOT. En la misma página se informa modalidad **presencial**, **8 horas/semana**, **COP 2.000.000/mes** y **1 mes** de duración, con nota adicional sobre vigencias 2026–2027. Página 3: fecha límite **18/11/2026 10:00 a. m.** y evaluación por título (**30 %**), matrícula doctoral (**40 %**) y pertenencia al semillero (**30 %**). No se ha identificado un porcentaje mínimo de avance curricular específico en el perfil; no debe inventarse. Los pesos de evaluación son categorías separadas de las condiciones habilitantes. El PDF subido adicionalmente a esta conversación tiene una huella binaria distinta de la fuente incorporada al corte: no reemplazar fuentes ni dar por iguales sus versiones sin cotejo.

**Resultados 2026-C2188 (ejemplo de estructura, no integrante de los 96 códigos del corte).** El perfil se extiende de la página 1 a la 2, que contiene un **avance mínimo del 40 %**. En página 2 aparecen los criterios ordinales 1 = **Entrevista (40 %)** y 2 = **Hoja de vida (60 %)**. Las columnas 1 y 2 de la tabla de participantes corresponden a esas definiciones; el total y la marca de selección son otras columnas y no sustituyen los valores individuales. El PDF está disponible como ejemplo suministrado en la conversación, **no** se incorpora como expediente adicional ni como resultado de una de las 96 convocatorias.

## Antecedente histórico — implementación inicial 13/11/2026 (sustituida por v2)

La antigua entrega `normalizacion_semantica_v1.json`, retirada de los insumos activos al integrar v2, contenía una **interpretación inicial por IA** de condiciones de avance, aspectos seleccionados de 2026-C2374 y 29 facetas adicionales de 2026-C2381 (perfil, plazas, actividades, dedicación, estímulo, documentos, criterios, responsable y plazos), cada una con evidencia de documento y página. El corte contiene 98 facetas en 60 expedientes; sigue siendo parcial y **no afirma haber estandarizado el resto de criterios y campos de los 96 expedientes**. `scripts/construir_base_v3.py` exige que las citas y sus SHA/páginas correspondan a fuentes ya guardadas e inserta la interpretación en `v3_indicador_sintetico`, con sus insumos literales en `v3_dato_original` y vínculos `v3_indicador_insumo`. La exportación de visualización v3 ya contempla esas tablas (`indicadores_sinteticos` e `insumos_datos_originales`). No cambia `db/estructura_v3.sql`, no se crean actas A–E y el historial original permanece inalterado.

**Límite documentado:** los registros sin revisión semántica permanecen pendientes. Completar la normalización por categorías y el cotejo visual (y luego A–E) son operaciones distintas.
## Visualización de facetas sin certificación

Las facetas almacenadas en `v3_indicador_sintetico` se muestran ahora como **lectura interpretada por IA, sin cotejo visual**, con enlaces a PDF y página. Se prefiere siempre un dato original semánticamente estructurado cuando exista; si no lo hay, la interfaz muestra la faceta sin presentarla como valor original certificado. El texto preliminar completo permanece consultable por páginas; no se ejecutan extractores ni normalizadores automáticos dentro del navegador.

El avance mínimo se puede filtrar exclusivamente cuando la interpretación contiene `filtro_habilitado=true` y `minimo_pct` inequívoco. Los valores mencionados sin operador aparecen en la ficha, pero no intervienen en ese filtro. Las fechas de cierre contradictorias entre Excel y PDF aparecen en campos separados. Ninguna faceta altera las puertas A–E ni equivale a validación.


## Entrega vigente — normalización semántica v2.0 (96 convocatorias)

La interpretación de IA se suministra en **tres lotes independientes** de 36/30/30 códigos, con máximo de 50 por lote y hashes SHA-256 de los JSON íntegros. `data/ia_v3/normalizacion_semantica_v2/{abiertas,cerradas_01,cerradas_02}.json.zlib.b64` es la fuente **derivada**, subordinada al corte original inmutable. No reemplaza PDFs ni Excel.

| Lote | Expedientes | Facetas con evidencias | Observaciones pendientes |
|---|---:|---:|---:|
| Abiertas | 36 | 1.119 | 16 |
| Cerradas 01 | 30 | 966 | 24 |
| Cerradas 02 | 30 | 1.070 | 24 |
| **Total** | **96** | **3.155** | **64** |

Se reconocen **73 categorías** documentales, entre ellas tipo de estudiante/actividad, programas, cursos y títulos, porcentaje de avance (límites y operadores inclusivos o exclusivos), requisitos académicos y competencias, herramientas, proyectos, tareas, documentos de postulación, plazas, modalidad, dedicación, estímulo económico, duración, fechas y criterios individuales de ponderación y resultados. **11 menciones de avance tienen el operador no explícito** y no se transforman en restricciones filtrables sin un cotejo adicional.

### Relaciones y límites de comparación

- Un mismo concepto puede funcionar como *requisito de admisión*, *actividad* o *criterio evaluado*. Se conservan las ocurrencias y roles diferenciados junto con el orden y vínculo a la evidencia literal. No convertir una ponderación en umbral de elegibilidad.
- `v3_indicador_sintetico` almacena cada interpretación con su categoría, rol y valores en `valor_json`; `v3_dato_original` conserva pasajes/celdas comprobables, y `v3_indicador_insumo` enlaza cada faceta con uno o más originales. Las categorías repetidas reciben sufijos de ocurrencia; ninguna sustitución de texto original se permite. **No se alteró `db/estructura_v3.sql`.**
- El programa **solamente verifica SHA-256, código, URL, página, pasaje y celda** antes de persistir la entrega IA: no ejecuta lectura, OCR ni extracción semántica. La cobertura documental material todavía depende de revisión humana/IA sobre los originales.
- Los PDF de resultados presentes permiten reconocer metadatos y criterios cuando el texto es localizable, **no** inventar participantes, puntuaciones o selección no cotejados visualmente. `v3_pdf_tabla` y `v3_resultado_fila` siguen vacías por el momento, y no se genera ninguna acta A–E.

### Pendientes visibles, sin conciliación automática

Discrepancias Excel/PDF en cierre: `2026-C2381` (18/11/2026 16:00 vs 19/11/2026 16:00), `2026-C2361` (13/11/2026 11:00 vs 17/11/2026 11:00), `2026-C2295` (09/11/2026 14:00 vs 06/11/2026 14:00). `2026-C2286` contiene modificación de dedicación semanal mediante adenda (10 horas). Resultados `2026-C2312` enlazados con código interno discordante `2026-C2302`; `C2308` y `C2309` requieren cotejo visual. El listado completo de **64 observaciones** permanece en el JSON derivado por lote.

**Alcance exacto:** primera estructuración semántica amplia de 96 expedientes, **no** declaración de haber verificado exhaustivamente cada original ni de haber reconstruido todas las tablas/celdas de resultados. NORMA 00 sigue intacta: **0 validadas A–E**.
