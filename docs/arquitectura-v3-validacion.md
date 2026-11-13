# Arquitectura de base de datos V3 — Reconstrucción desde la Norma 00

**Fecha:** 13-11-2026 · **Estado:** nuevo esquema aislado, con pruebas de contrato y **cero migraciones reales**.  
**Precedencia:** [NORMA 00 — validación integral](NORMA-00-validacion-integral.md) > [NORMA 01 — integridad](NORMA-01-integridad-exhaustividad.md) > [NORMA 02 — comparabilidad](NORMA-02-integracion-comparabilidad.md) > [NORMA 03 — extracción externa por IA](NORMA-03-extraccion-externa-ia.md). La [NORMA 04](NORMA-04-validacion-convocatorias.md) detalla las puertas operativas A–E.

## 1. Decisión de reinicio

Se **reinicia el diseño lógico de la base**, no se borra la investigación ni se destruyen las fuentes. `db/estructura_v3.sql` define desde cero una BD aislada, independiente de `db/schema.sql` y `db/estructura_v2.sql`. Los lotes `data/lotes/lote_01.json` a `lote_04.json` y la página `index.html` **no se modifican** en esta fase.

**No migrar ni marcar validado ningún caso automáticamente.** Los 42 códigos históricos son identificados, pero **cero** cuentan como validados. Primero garantizar base y control, luego contrato de interfaz, luego extracción externa por IA.

### Principio de las dos capas

- **Originales:** hojas/celdas, PDF con URL original y versión, páginas, tablas, celdas, elementos visuales, requisitos y datos completos. Se guardan como hechos originales inmutables, incluso duplicados verdaderos; las adendas y revisiones se añaden como nuevas fuentes/versiones.
- **Derivados:** índices semánticos, indicadores de conteo, sumas y comparaciones. Se almacenan aparte y nunca sustituyen ningún dato original.

## 2. Tablas, por grupo y responsabilidad

| Grupo | Tablas | Qué garantiza |
|---|---|---|
| Identidad y fuentes | `v3_convocatoria`, `v3_fuente`, `v3_convocatoria_fuente` | Una convocatoria por código de integración, N documentos y versiones, **URL exacta obligatoria para cada fuente**, hash/binario opcional, acceso, fecha, nombre y código literal interno. |
| Excel original | `v3_excel_fila`, `v3_excel_celda` | Cada fila original diferenciada y **todas sus celdas y metadatos**, incluso si hay dos filas para el mismo código; total de columnas declarado comprobable. |
| PDF original | `v3_pdf_pagina`, `v3_pdf_elemento`, `v3_pdf_tabla`, `v3_pdf_celda` | Página/tabla/celda/elemento y su posición originales, marcas y literales. La IA reconstruye externamente, el programa almacena. |
| Interpretación y derivados | `v3_dato_original`, `v3_indicador_sintetico`, `v3_indicador_insumo` | Todos los requisitos siguen siendo elementos separados y rastreables; los cálculos derivan de ellos sin reemplazarlos. |
| Comprobación de resultados | `v3_consulta_resultados` | Tres estados **distintos**: `pdf_encontrado`, `sin_pdf_verificado_al_corte`, `indeterminado`. Consulta, URL, fecha, alcance, explicación y vínculo al PDF cuando existe. |
| Cotejo por documento | `v3_revision_fuente`, `v3_revision_metrica`, `v3_metrica_requerida` | Prueba por cada documento de **cobertura integral de filas/celdas/páginas/tablas/requisitos/participantes/puntajes**, según clase, con URL, totales y explicación. |
| Puertas y subcriterios | `v3_puerta`, `v3_criterio`, `v3_cumplimiento` | **A+B+C+(D si aplica)+E**, cada subcriterio con estado, evidencia URL, nota y conteos cuando procede. No basta un `validado=true`. |
| Fallas documentadas | `v3_incidencia`, `v3_resolucion_incidencia` | El problema se guarda sin borrarse; la justificación o cierre se registra aparte. Las incidencias críticas abiertas bloquean la validación. |
| Cierre y congelación de fuentes | `v3_acta_validacion`, `v3_acta_fuente` | Acta enlazada a las puertas, consulta de resultados y versión persistida. **Fotografía de todas las fuentes conocidas al cierre**; una fuente nueva obliga a recotejar. |

**No hay tabla con un booleano «validada» manipulable libremente**. El estado se obtiene de actas que pasan condiciones y se recalcula contra información nueva.

## 3. Flujo de una convocatoria y espacios de evidencia

### Puerta A — Excel

Guardar **todas** las filas, con todas sus celdas, encabezados y enlaces. La revisión `v3_revision_fuente` contiene la fuente, URL, versión, alcance, total esperado/cotejado. En `v3_revision_metrica` deben figurar, por separado, **filas, celdas e hipervínculos**. La puerta A tiene tres subcriterios: `A_FILAS`, `A_CELDAS`, `A_ENLACES`.

### Puerta B — PDF de convocatoria

Guardar URL original, código literal, versión, todas las páginas/elementos/tablas/celdas. Registrar revisiones con categorías **páginas, tablas, celdas, requisitos, criterios y otros elementos**. La puerta B exige `B_URL`, `B_PAGINAS` y `B_CONTENIDO`. Si hay anexos, adendas u otras versiones disponibles, también deben estar vinculados y cotejados por separado.

### Puerta C — Comprobación de resultados

`v3_consulta_resultados` guarda **el sitio/publicación consultado, URL, fecha, alcance, método, conclusión y vínculo a la fuente si se encontró PDF**. Sin comprobación real, el estado es `indeterminado` y no se cierra el expediente. La puerta C usa `C_BUSQUEDA`.

### Puerta D — Resultados (condicional)

Si C señala `pdf_encontrado`, es obligatorio guardar su PDF como `v3_fuente`, vincularlo, extraer todas sus páginas, **filas de participantes, puntajes y decisiones**, y completar los criterios `D_URL`, `D_PAGINAS`, `D_CONTENIDO`. Si C declara `sin_pdf_verificado_al_corte` con fuente/fecha/alcance, se omite **únicamente D**, no las demás puertas.

### Puerta E — Persistencia y auditoría final

Registrar evidencia de que el contenido original y sus URLs son accesibles desde el expediente, que la base conserva los datos y que no queda información disponible sin examinar. Los criterios `E_PERSISTENCIA`, `E_INTERFAZ` y `E_INCIDENCIAS` deben estar respaldados. Una diferencia entre fuentes puede documentarse sin declarar culpabilidad; **un error de cobertura o un documento omitido bloquea el cierre**.

### Acta

`v3_acta_validacion` referencia las puertas A, B, C, D si aplica, E, la última consulta de resultados, URL del expediente de interfaz, fecha, responsable y versión de persistencia. El trigger `v3_acta_check` bloquea el INSERT ante criterios incompletos, fuentes sin URL/revisión, faltas en celdas Excel, páginas PDF, adendas y críticas abiertas.

`v3_acta_fuente` registra automáticamente cuáles fuentes existían al aprobar el acta. No se borra el acta si después aparece una nueva: queda histórica, pero **el código deja de contar en la vista actual** hasta un nuevo cierre.

## 4. Métrica principal

`v3_metrica_principal` devuelve:

- `convocatorias_validadas`: cantidad de códigos distintos en `v3_convocatorias_validadas` después de aplicar todas las condiciones y comprobar nuevas fuentes.
- `convocatorias_identificadas`: inventario secundario; nunca se presenta como avance equivalente.

`v3_estado_por_convocatoria` separa: `no_iniciada`, `en_curso`, `bloqueada`, `validada`.

**Corte histórico:** 42 identificadas, **0 validadas**. El esquema nuevo empieza vacío, sin falsas validaciones heredadas; no debe interpretarse como borrado de la investigación existente.

## 5. Garantías y limitaciones explícitas

**Controlado por SQLite:** claves foráneas, múltiples fuentes, URL, conservación de datos originales, actas inmutables, puertas A–E y criterios individuales, cobertura declarada por tipo de dato, ausencia/presencia de resultados, fuente adicional y crítica sin resolver.

**No controlable automáticamente:** si la IA omitió una marca visual que no registró o si una URL corresponde realmente al documento correcto. La base verifica **consistencia y trazabilidad de la evidencia registrada**, no su veracidad material. El cotejo real de los originales y la comprobación de los enlaces siguen siendo obligatorios.

**Sin mecanismo de extracción autónoma:** los scripts de la fase 3 sirven para controles y pruebas; la IA lee y estructura las fuentes externamente.

## 6. Secuencia para continuar sin desviarnos

1. **Validar esquema v3 y puertas** con casos ficticios incompletos y completos en `scripts/probar_estructura_v3.py`, mediante [GitHub Actions](../.github/workflows/validar_v3.yml).
2. **Definir contrato de exportación v3 y actualizar la interfaz** para presentar todos los datos originales, enlaces PDF y estado detallado de puertas A–E. No suponer que la página v2 satisface todavía la arquitectura v3.
3. **Empezar extracción externa de PDF real** sobre pocos expedientes de distinto formato, con cobertura y URLs precisas, antes de crecer en lotes hasta el máximo de 50.
4. Reconstruir o migrar solo **capturas originales verificadas** a la estructura v3, sin transformar códigos identificados o textos PDF históricos en actas validadas.
5. Publicar la vista de validaciones únicamente tras comprobar coherencia entre SQLite, exportación JSON y evidencias disponibles desde Pages.

**Criterio de aceptación:** una sola omisión impide el acta. Una acta solo existe si las pruebas estructurales pasan y el cotejo documental real fue realizado y registrado.
