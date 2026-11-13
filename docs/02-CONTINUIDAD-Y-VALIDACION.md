# CONTINUIDAD Y VALIDACIÓN — Procedimiento operativo

**Continuidad V3:** [operación del SQLite](BASE-V3-OPERACION-Y-GARANTIAS.md) · [contrato de salida](CONTRATO-V3-VISUALIZACION.md) · [entrega externa IA](CONTRATO-V3-EXTRACCION-IA.md). La próxima etapa podrá emplear la misma estructura; hoy hay 42 identificadas y 0 validadas, con la página aún en V2.


## Nuevo punto de continuación — Base v3 antes de interfaz y extracción

La [Norma 00](NORMA-00-validacion-integral.md) es la condición superior del proyecto. **Primero** validar el nuevo [esquema de base v3](../db/estructura_v3.sql), después adaptar el contrato de la interfaz y solo entonces alimentar el sistema mediante extracción externa por IA.

**No migrar automáticamente como validadas** las 42 convocatorias históricas. La base v3 se puede construir desde **las cuatro capturas reales**, pero ningún PDF real está visualmente cotejado y los cierres ficticios de prueba no constituyen validaciones reales. Los datos históricos siguen intactos.

La [arquitectura v3](arquitectura-v3-validacion.md) contiene espacios explícitos para A–E, URL PDF, cobertura por páginas/tablas/requisitos/puntajes, evidencia de búsqueda de resultados, fallas y acta final. El contador de la v3 solo nace de `v3_metrica_principal` después de pasar pruebas de cierre. El visor Pages actual es v2 y **todavía no implementa este contrato**.


## Puerta de aceptación actual: NORMA 04

**El proceso NO se considera completado ni suma una convocatoria validada** porque existan su código, las celdas Excel o un PDF abierto. Se exigen **todas** las comprobaciones de [NORMA 04](NORMA-04-validacion-convocatorias.md) y un acta SQL final:

**Excel completo → PDF convocatoria íntegro + URL en base → verificación real de disponibilidad de resultados → PDF resultados íntegro + URL si existe / ausencia comprobada con fuente, fecha y alcance si no existe → persistencia y cotejo final.**

Si una fuente está inaccesible, no enlazada, parcialmente leída o sin revisión tabular, registrar **bloqueo o progreso parcial**, nunca «validada». La **métrica principal del estado** es [`v2_conteo_convocatorias_validadas`](../db/estructura_v2.sql); al corte histórico: **0/42**. Los enlaces a PDF deben ser campos de evidencia consultables desde la interfaz.


**Versión de procedimiento:** 2026-11-13 · **Estado:** instrucciones vigentes para retomar trabajo posterior.  
**Leer primero:** [referencia general](00-REFERENCIA-GENERAL.md) · [decisiones históricas](01-REGISTRO-DECISIONES.md).  
**Precedencia:** [Norma 01](NORMA-01-integridad-exhaustividad.md) → [Norma 02](NORMA-02-integracion-comparabilidad.md) → [Norma 04 — Cierre obligatorio](NORMA-04-validacion-convocatorias.md) → [Norma 03](NORMA-03-extraccion-externa-ia.md) → [configuración de operación](../config/operacion_ia.json).

**Prueba de enlace PDF:** al reconstruir SQLite v2 desde los cuatro lotes se comprueba que existan **16 fuentes PDF con URL real y texto leído**, y que sigan con estado no cotejado. El auditor debe tener el enlace disponible junto a cada fila/criterio documental; no aceptar acta final cuyo PDF principal o de resultados carezca de URL en la base y de acceso desde la interfaz.

## A. Punto de control actual

**Foto documental consolidada:**

- Código del proyecto: `jncubillosn-lab/Estudiantes-Auxiliares-Veedur-a`.
- Rama de trabajo: `main`. Pages: [sitio principal](https://jncubillosn-lab.github.io/Estudiantes-Auxiliares-Veedur-a/) desde `main/(root)`.
- `index.html` = comparador v2; `comparador-v2.html` = misma interfaz; `visor.html` = visor histórico.
- `data/exportacion_v2.json` = proyección integrada **de 42 códigos**, 43 filas Excel, 470 celdas, 16 transcripciones PDF (7 convocatorias, 9 resultados).
- `db/estructura_v2.sql` = contrato relacional, **sin** PDF real estructurado y cotejado aún.
- Datos persistidos: `data/lotes/lote_01.json`–`lote_04.json`; SQL histórico `db/seed_lote_*.sql`.
- **No hay que reimportar o volver a leer desde cero** esos lotes para seguir: consultar su contenido y sus identificadores de fuente.
- **Primer trabajo técnico siguiente:** cotejar un PDF de convocatoria, otro de resultados y uno con adenda que tengan tablas de formatos diferentes. **No comenzar masivamente** mientras no se garantice su integración sin pérdida.
- Antes de nuevas publicaciones con contenido PDF estructurado, **resolver la diferencia entre** `scripts/generar_publicacion_v2.py` (proyección actual Excel/texto) y `scripts/exportar_comparador_v2.py` (campos/listas/tablas relacionales). Es una dependencia pendiente, **no** una funcionalidad ya completada.
- Los procedimientos de extracción por IA tienen **ejemplos de prueba ficticios**; no se debe afirmar que existen manifiestos de extracción rigurosa de los PDF reales históricos.

**Límites del estado actual: 0 tablas PDF reales cotejadas; 0 expedientes con las tres fuentes estructuradas íntegramente.**

## B. Antes de una nueva interacción de trabajo

1. Consultar [Normas 01–03](NORMA-01-integridad-exhaustividad.md) y [parámetros](../config/operacion_ia.json). Nunca reemplazar datos originales por sintéticos.
2. Inspeccionar `main`, referencia del último commit y archivos del último lote **persistido**. No suponer que el estado de la conversación es más reciente que GitHub.
3. Elegir **hasta 50 códigos distintos de convocatoria**. No cuentan como distintas las filas repetidas de un código.
4. Registrar orden del lote, fuente/corte de Excel, PDF accesibles, adendas, versiones y códigos literales. Mantener una cola explícita para pendientes sin enlace.
5. Verificar que los documentos no estén ya extraídos para la misma **fuente + versión + región**. No volver a generar la misma extracción solo por comodidad.
6. Confirmar qué esquema y formato de salida será consumido por el comparador. **Primero base, después interfaz, después extracción**.
7. Si no existe el binario de un PDF, no afirmar que la transcripción disponible es una copia fiel de su geometría original.

## C. Orden exacto por convocatoria

La secuencia reglada por `config/operacion_ia.json` es:

| Etapa | Acción y evidencia mínima | Estado de salida |
|---|---|---|
| 1. `identificar_fuentes` | Identificador de integración, filas de Excel, URL verdaderas y versiones de los PDF; adendas; enlaces ausentes. | Inventario completo de lo encontrado, **no** de lo supuesto. |
| 2. `leer_excel` | Capturar cada celda, valor visible, valor origen, encabezado, fórmula/nota/enlace/formato y posición. | Registro íntegro de Excel. |
| 3. `leer_convocatoria` | Lectura IA visual por página, todas las tablas y celdas, requisitos individualizados, rótulos, excepciones, notas, firmas y versiones. | Documento reconstruido o pendientes **localizados**. |
| 4. `leer_resultados` | Lectura IA de toda la tabla de participantes, encabezados, identificaciones, puntajes, estados y criterios. | Resultados estructurados o estado real de falta de enlace/acceso/publicación. |
| 5. `integrar` | Asociar observaciones de las tres fuentes por concepto, sin sustituir textos originales. | Ficha unificada, con discrepancias paralelas visibles. |
| 6. `verificar` | Cotejar con PDF visible; comparar conteos de páginas, tablas, filas, celdas, listas y encabezados; distinguir dudas. | Validado **solo** lo que se cotejó. |
| 7. `persistir` | Escribir y comprobar original, listas/celdas, referencias y manifiesto; publicar proyección solo si pasa las pruebas. | Commit y referencia verificable del lote. |

**Excepción importante:** cuando no existe acceso al PDF de resultados, registrar `sin_enlace` o el estado real dentro de la etapa 4; no saltarla silenciosamente ni inventar resultado. Esto impide cerrar **las tres fuentes como cotejadas**, pero permite guardar un progreso parcial honesto.

## D. Control de lecturas y repeticiones

- Identidad de lectura de **extracción**: `fuente_id + versión + ubicación` (página/tabla/celda o región). El validador rechaza dos eventos de extracción iguales.
- Revisión/cotejo de una región ya leída: acción separada de `extraer`, con motivo y estado, **no crea otra copia ficticia** del dato original.
- Reextracción por error: justificar y versionar; **conservar tanto el original previo como la corrección**.
- Un requisito impreso en 3 lugares **debe aparecer 3 veces** con 3 ubicaciones originales. No deduplicar por similitud de texto.
- Una adenda con nuevo texto **no sobrescribe** lo publicado antes: ambas versiones son información original.
- Una tabla repartida entre páginas debe preservar los fragmentos reales antes de construir una vista lógica unificada.

## E. Manifiesto y pruebas de calidad

**Parámetros vinculantes:** máximo `50` convocatorias distintas, estados `sin_enlace/localizada/leida/estructura_capturada/cotejada/fallo_acceso` para fuentes, `pendiente/parcial/cotejada` para cotejo, y `pendiente/parcial/confirmada` para persistencia.

**Mínimo del manifiesto por lote:**

- `lote_id`, versión del manifiesto, corte, ubicación del conjunto, códigos distintos en orden.
- Por convocatoria: `numero`, `orden`, `etapas_completadas`, `fuentes` con tipo/ID/versión/URL o referencia y estado.
- `lecturas`: fuente, versión, ubicación, acción y, cuando corresponda, justificación y nueva versión.
- `cobertura`: fuente y métricas `paginas/tablas/celdas/listas/items/campos/filas/columnas` con cantidades **esperadas y registradas** cuando sean comprobables.
- `pendientes`: lista **expresa**, aunque vacía.
- `cotejo`: estado de revisión contrastado.
- `persistencia`: estado y referencia de commit/base para reanudación.

**Ejemplo de formato no real:** [`tests/fixtures/lote_ia_ejemplo.json`](../tests/fixtures/lote_ia_ejemplo.json). Está marcado como *ficticio* y **no** sirve como evidencia de una convocatoria real.

**Validación operativa:**

```bash
python scripts/validar_lote_ia.py tests/fixtures/lote_ia_ejemplo.json
python scripts/probar_control_lotes_ia.py
python scripts/probar_estructura_v2.py
python scripts/probar_comparador_v2.py
python scripts/generar_publicacion_v2.py --comprobar
```

En un lote **real**, sustituir el ejemplo por el manifiesto correspondiente y pasar `--anteriores` con los manifiestos que ya contienen las extracciones anteriores.

**Atención:** las pruebas automatizadas verifican disciplina declarada, consistencia relacional y fidelidad respecto de **capturas guardadas**. No pueden demostrar solas que se leyó visualmente hasta la última casilla de un PDF.

## F. Tabla de pruebas de aceptación obligatorias

| Comprobación | Condición de aceptación | Acción si falla |
|---|---|---|
| Integridad original Excel | Cada celda recuperable con literal, origen y posición; 470 de 470 en el corte conocido. | No avanzar sobre esa migración. |
| Integridad original PDF | Todas las páginas, tablas y celdas visibles representadas o excepciones visuales localizadas. | Marcar parcial y conservar evidencia; no certificar. |
| Listas de requisitos | Todos los requisitos por separado, literal y orden. | Recuperar lista completa; **no sustituirla por conteo**. |
| Resultados | Cada participante, cada encabezado/columna, notas y decisiones originales. | No afirmar cantidad total ni selección por un patrón de texto. |
| Código e integración | Un código agrupa fuentes; cada ocurrencia literal sigue consultable; desacuerdos se preservan. | Marcar diferencia y revisar vínculo. |
| Corrección/adenda | Se conservan versión previa y nueva con procedencia. | Guardar versión adicional sin sobrescribir. |
| Separación sintéticos | Indicadores adicionales tienen regla e insumos; eliminar el indicador no altera originales. | Bloquear publicación/guardar revisión de cálculo. |
| Comparabilidad | Se seleccionan varias convocatorias y se ven **valores completos** por concepto. | Ajustar contrato/interfaz antes de escalar extracción. |
| Lecturas redundantes | Una única extracción por `fuente + versión + ubicación`, salvo nueva versión justificada. | Reconciliar manifiesto; no borrar ocurrencias auténticas. |
| Límite de interacción | `≤ 50` convocatorias distintas. | Dividir lote y crear punto de continuación. |
| Publicación Pages | JSON proyectado reconstruible, sin caída de campos nuevos al actualizar. | Detener publicación hasta conciliar exportadores. |
| Estado de cierre | Ningún expediente `cotejado` con fuentes imprescindibles ausentes o pendientes. | Mantener `parcial/pendiente` y registrar por qué. |

## G. Publicación, persistencia y reanudación

- **Página principal:** [GitHub Pages](https://jncubillosn-lab.github.io/Estudiantes-Auxiliares-Veedur-a/).
- **Fuente de publicación actual:** [`data/exportacion_v2.json`](../data/exportacion_v2.json), construida como proyección de los **cuatro lotes existentes**.
- **Archivos de base:** [`db/estructura_v2.sql`](../db/estructura_v2.sql) y migradores. Pages no ejecuta SQLite.
- **No sobrescribir:** PDF original, fila/celda original, versión anterior de documento, requisito o registro de resultados. Generar un nuevo registro/versionado y su trazabilidad.
- **No publicar un exportador sobre otro sin cotejar los campos:** la base puede contener datos PDF que el exportador histórico no integra todavía.
- **Estado de la interfaz:** la matriz contiene realmente las comparaciones Excel existentes; las tablas PDF pendientes **no se consideran comparables ni verificadas**.

Al cerrar una interacción de extracción, registrar:

1. Último número de convocatoria **completamente procesado**, últimos parcialmente procesados y sus pendientes.
2. Cantidad de convocatorias distintas; filas Excel; PDF localizados, leídos, estructurados y cotejados **por separado**.
3. Lista de archivos y commits creados o actualizados; **verificados** en GitHub.
4. Cobertura, estado de validador y diferencias documentales sin juicios autónomos.
5. Próxima convocatoria/etapa concreta desde la cual continuar.

Si el trabajo se interrumpe, **el estado guardado en GitHub es la referencia**, no promesas sobre trabajo futuro.

## H. Pruebas piloto recomendadas

Empezar con **tres tipos de documentos diferentes** para validar el método, sin inventar que son 3 expedientes completos:

1. PDF de **convocatoria** con requisitos, criterios y condiciones.
2. PDF de **resultados** con varios participantes/columnas y estados de evaluación.
3. PDF con **adenda** que cambie textos y permita reconstruir versiones.

Casos potencialmente útiles del material ya consultado: `2026-C2381` (diferencia de fechas), `2026-C2312` (discrepancia de código entre referencia y texto interno), `2026-C2309` (selección/renuncia/descalificación), `2026-C2361` o `2026-C2363` (adendas). **No asumir la disponibilidad de todos los PDF ni confirmar resultados antes de acceder y cotejar el original.**

La continuación no consiste en agregar otro visor ni nuevos indicadores decorativos: consiste en **demostrar que la base, la interfaz y la extracción externa permiten recuperar y comparar todo el contenido documental**.

