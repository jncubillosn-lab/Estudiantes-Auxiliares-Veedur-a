# REFERENCIA GENERAL — Veeduría de convocatorias de estudiantes auxiliares (UNAL Bogotá)

## Regla suprema y reinicio del diseño de datos — v3

La [**NORMA 00 — Validación integral e inviolable**](NORMA-00-validacion-integral.md) prevalece sobre todas las normas y decisiones técnicas anteriores. La métrica principal **no** es «convocatorias registradas» sino **convocatorias validadas**, únicamente tras cumplir A Excel, B PDF convocatoria, C comprobación de resultados, D PDF resultados si existe, E integración y acta final, con URL verificable de todos los PDF disponibles.

La [arquitectura v3](arquitectura-v3-validacion.md) se diseñó **desde cero** para registrar evidencia y cumplimiento **de cada requisito**, incluyendo cobertura por tipo de contenido, enlaces, excepciones, incidencias, condiciones de resultados y acta enlazada. El esquema v2 anterior y su comparador siguen como antecedentes; **el producto Pages todavía no consume la base v3**. No declarar migración o validaciones reales v3 que no existan.


## Corrección vinculante — Qué cuenta como una convocatoria validada

**Métrica principal: número de convocatorias VALIDADAS**, exclusivamente desde `v2_conteo_convocatorias_validadas` respaldada por actas finales en la base, **no** desde la cantidad de códigos, filas, URLs o PDF con texto leído.

**[NORMA 04 — Cierre y pruebas por convocatoria](NORMA-04-validacion-convocatorias.md)**: (A) Excel completo y cotejado; (B) PDF de convocatoria completo, cotejado y con enlace en BD; (C) comprobar documentalmente si hay PDF de resultados; (D) si existe, extraer/cotejar PDF entero y guardar su enlace; si no se encuentra tras una comprobación real, registrar `sin_pdf_verificado` con URL, fecha y alcance; (E) comprobar persistencia, accesibilidad y ausencia de omisiones críticas.

**Regla de falla cerrada:** cualquier paso sin ejecutar o sin evidencia impide sumar la convocatoria. **No hay «validada a medias».** Con los datos del corte actual hay **0 convocatorias validadas de 42 identificadas**. El fichero [estado de validación de Pages](../data/estado_validacion.json) se genera desde la vista SQL, y el esquema prohíbe actas sin controles suficientes.

Las URLs de los PDF son **evidencia obligatoria almacenada y consultable**, no simples adornos ni meros enlaces de navegación. Ningún texto PDF extraído suple el cotejo visual de sus tablas originales.


**Edición:** 2026-11-13 · **Estado:** referencia consolidada de lo acordado e implementado, **no** certificación de expedientes auditados.  
**Propósito de este documento:** que otra interacción pueda comprender, verificar y continuar el proyecto sin reconstruir esta conversación.  
**Documentos complementarios:** [historial de decisiones y correcciones](01-REGISTRO-DECISIONES.md) · [procedimiento de continuidad y aceptación](02-CONTINUIDAD-Y-VALIDACION.md).

> **Regla central:** conservar todos los originales, transformarlos a estructuras fieles y explícitas, integrarlos por convocatoria y compararlos. Los indicadores derivados **nunca** reemplazan ni modifican la evidencia original. El sistema presenta diferencias; la valoración corresponde a la persona que realiza la veeduría.

**Enlaces PDF en la base:** [`scripts/importar_excel_v2.py`](../scripts/importar_excel_v2.py) conserva ahora también en `v2_fuente_original.uri_original` los enlaces y textos de los **16 PDF conocidos** de los lotes, con referencia por código y estado no cotejado; su importación **no** crea actas de validación. Los mismos vínculos pueden abrirse desde el comparador. El código interno literal que difiera del código de Excel se conserva sin corregirlo. Los PDF originales binarios y sus estructuras visuales siguen pendientes.

## 1. Objetivos y alcance

### Objetivo general

Construir una **herramienta documental de veeduría** de las convocatorias de estudiantes auxiliares de la Universidad Nacional de Colombia, sede Bogotá, que permita **identificar, comparar y revisar documentalmente** las condiciones y resultados publicados, sin decidir automáticamente si una práctica es buena, mala, legítima o irregular.

### Objetivos específicos

1. Conservar **íntegros** los datos de las fuentes, incluso textos repetidos, anomalías, campos poco frecuentes, requisitos normativos, identificaciones que figuren en resultados, observaciones, adendas y casillas.
2. Organizar **tres fuentes** por convocatoria: **(A) Excel publicado, (B) PDF de convocatoria, (C) PDF de resultados**, incluidas adendas, anexos, aclaraciones y versiones.
3. Convertir estructuras visibles de los PDF a **tablas/celdas/listas completas** con procedencia y referencia a página; no a un único bloque de texto plano.
4. Mantener una **ficha integrada por número de convocatoria**, preservando la literalidad y cada aparición del mismo dato en sus fuentes. No fusionar códigos disonantes ni perder registros duplicados.
5. Producir una **matriz transversal** para comparar múltiples convocatorias por carrera, dependencia, estado, requisitos, criterios, ponderaciones, duración, estímulo, participantes, decisiones y otros conceptos originales.
6. Permitir inspeccionar desde la interfaz **cada dato original** que respalda una comparación, y registrar preguntas, notas y hallazgos **sin alterar las fuentes**.
7. Mantener una extracción **externa realizada por IA**, con controles de calidad y avance; evitar construir otro motor de interpretación PDF dentro de la aplicación.
8. Trabajar incrementalmente con controles verificables y persistencia por lote.

**Fuera del alcance:** decidir qué contenido es prescindible, anonimizar u ocultar información por iniciativa del asistente, emitir conclusiones jurídicas automáticas, inventar campos, dar por inexistente un PDF no enlazado, reescribir un documento original, o convertir el sitio en un mero catálogo de anuncios.

## 2. Orden de desarrollo y jerarquía de normas

### Orden técnico irreversible de referencia

**1. Base de datos → 2. Herramienta de visualización/comparación → 3. Extracción externa por IA.**

Se definen primero **qué significa fidelidad** y dónde se representa cada elemento; después **cómo se consulta y compara**; finalmente **cómo la IA suministra datos comprobados**. Las mejoras siguen ese orden: contrato de datos → presentación → extracción/validación → revisión.

### Jerarquía de obligaciones

| Prioridad | Norma vinculante | Mandato |
|---|---|---|
| 1 (máxima) | [NORMA 01 — Integridad y exhaustividad](NORMA-01-integridad-exhaustividad.md) | **100 % de lo observado** debe permanecer representado, íntegro, visible y rastreable; originales separados de sintéticos; no eliminación, sustitución ni ocultamiento de datos. |
| 2 | [NORMA 02 — Integración y comparabilidad](NORMA-02-integracion-comparabilidad.md) | Ficha integrada con las **tres fuentes**, tablas/celdas/listas originales y matriz comparativa; las discrepancias se preservan. |
| 3 (puerta de cierre) | [NORMA 04 — Validación por convocatoria](NORMA-04-validacion-convocatorias.md) | Una convocatoria solo suma si Excel, PDF convocatoria, verificación de resultados y PDF resultados cuando exista están completos, enlazados y con acta. |
| 4 (operativa) | [NORMA 03 — Extracción externa por IA](NORMA-03-extraccion-externa-ia.md) | La IA **extrae fuera del programa** siguiendo orden, límite de lote, controles de páginas, lecturas, pendientes y persistencia. |
| Operativa | [Parámetros vigentes](../config/operacion_ia.json) | Archivo verificable con valores actuales y orden exacto de etapas. |

**No se sustituye una norma superior por una implementación que resulte más cómoda.** El titular del proyecto determina la visibilidad de datos y las decisiones de interpretación/publicación; estas cuestiones no autorizan al asistente a modificar las fuentes.

## 3. Definiciones que no deben confundirse

| Término | Significado |
|---|---|
| **Convocatoria** | Unidad principal identificada por código. Puede contener más de una fila Excel, varios PDF y versiones. |
| **Registro de Excel** | **Una fila** de la hoja; no equivale a un expediente completo. |
| **PDF consultado / leído** | Documento cuyo **texto** se recuperó; NO implica que se hayan reconstruido tablas ni leído todas las marcas visuales. |
| **PDF estructurado** | Se han registrado tablas, celdas, listas y elementos con ubicación en páginas; puede seguir **pendiente de cotejo**. |
| **PDF cotejado** | Comparación visual suficiente de estructura y contenidos con el PDF de origen, con excepciones documentadas. |
| **Expediente integrado** | Las tres fuentes disponibles están relacionadas por concepto y se pueden inspeccionar íntegramente; los faltantes quedan explícitos. |
| **Dato original** | Ocurrencia literal observada en una fuente con identidad, ubicación, orden y versión; **inmutable**. |
| **Dato sintético** | Cálculo, agrupación, diferencia o indicador **adicional**, con regla e insumos originales rastreables. |
| **Pendiente** | Falta evidencia, acceso, extracción o cotejo; nunca equivale a `0`, ausencia comprobada ni declaración de inexistencia. |
| **Hallazgo** | Diferencia documentada/condición a revisar, no sentencia ni clasificación autónoma de legalidad. |

**Ejemplo de no sustitución:** una convocatoria con siete requisitos debe conservar los siete requisitos íntegros e individuales; un sintético «cantidad = 7» puede acompañarlos, nunca reemplazarlos. Del mismo modo, «1 persona seleccionada» no sustituye la tabla original de postulantes, columnas, criterios y decisiones.

## 4. Fuentes, alcance de captura y relaciones

### 4.1 Excel: origen y corte

- Hoja de trabajo de referencia: [Copia de Convocatorias Estudiantes Auxiliares — Sede Bogotá](https://docs.google.com/spreadsheets/d/1f3qQNRiNwdFMtLrcBsP-JEgZwLBWmMVcq7QXCLo_Sps/edit).
- Pestaña **Convocatorias Abiertas:** 10 columnas; **Convocatorias Cerradas:** 11 columnas. Las dimensiones vistas inicialmente (37 filas de cuadrícula de abiertas y 7.558 de cerradas) **no** son un conteo de convocatorias procesadas.
- Se conservan los rótulos literales, aunque sean inusuales; en la columna D de «Abiertas» aparece `Coordinacion Pregrado de Diseno Grafico`, que **no se corrige silenciosamente**.
- Cada celda debe retener valor visible, valor de origen, posible fórmula, hipervínculo real, nota y formato conocido; una referencia textual como «Resultados 2026-C…» **no es un enlace a PDF**.
- La copia de Sheets se usa como **punto de corte estable**; no equivale a que los originales en Drive estén almacenados como binarios dentro del repositorio.

### 4.2 PDF de convocatoria y sus modificaciones

Conservar código literal, órgano/dependencia convocante, facultad, programa/perfil, número de plazas, tipo de estudiante, requisitos generales y particulares, actividades, modalidad, horas, duración, estímulo, documentos exigidos, procedimiento, fechas, criterios/subcriterios/pesos, referencias normativas, notas y **todo campo no previsto**, con la **geometría de las tablas/celdas** y sus posiciones. Las adendas no borran el texto anterior: registran otra versión y sus cambios.

### 4.3 PDF de resultados

Conservar **todas las filas y columnas** de la tabla, identificaciones y nombres literales, criterios, ponderaciones, puntajes, totales, selección, elegibilidad, descalificación, renuncias, observaciones, responsables, firmas y modificaciones, sin reducirlas a un total de participantes o seleccionados.

### 4.4 Relación e identidad

El **número de convocatoria** es la clave de **integración**, no una orden de reemplazar los códigos textuales que aparezcan en las fuentes. Puede aparecer una sola vez en la **cabecera de la interfaz** cuando coincide, pero deben conservarse todas sus ocurrencias originales. Si no coincide entre Excel y PDF, registrar ambos valores con procedencia y estado de cotejo. Un código con dos filas no se convierte automáticamente en dos convocatorias.

## 5. Arquitectura actual y flujo de datos

```text
Excel fuente / PDF convocatoria / PDF resultados / adendas
               │   (fuentes autónomas, preservadas)
               ▼
       Extracción EXTERNA por IA
       + lectura visual de PDF
       + registro de contenido íntegro
       + manifiesto y controles
               │
               ▼
    Base documental / contrato SQLite v2
    ├─ ORIGINALES: fuente → versión/página → tabla/celda/lista/ítem
    ├─ INTEGRACIÓN: convocatoria ↔ fuentes y campos
    ├─ SINTÉTICOS: indicadores separados con fórmula e insumos
    └─ REVISIÓN: cotejos, diferencias, notas y pendientes
               │
               ▼
      Exportación JSON estática verificable
               │
               ▼
     GitHub Pages / comparador entre convocatorias
```

**Importante:** GitHub Pages **no ejecuta SQLite**. El navegador obtiene [`data/exportacion_v2.json`](../data/exportacion_v2.json); esa publicación es una **proyección**, no el original ni un reemplazo de la base. Los cuatro JSON de lotes y el esquema SQLite siguen separados.

### 5.1 Archivos de arquitectura

| Archivo | Propósito / estado |
|---|---|
| [`db/estructura_v2.sql`](../db/estructura_v2.sql) | Contrato aditivo de **21 tablas**, **25 triggers** (incluidas puertas de cierre) y **4 vistas**. Incluye fuentes, vínculo, celdas Excel, páginas, elementos, tablas, celdas PDF, listas/ítems, resultados, revisiones y sintéticos. |
| [`db/schema.sql`](../db/schema.sql) | Esquema **histórico inicial** de 23 tablas. No es el esquema rector para nuevas integraciones v2. |
| [`scripts/importar_excel_v2.py`](../scripts/importar_excel_v2.py) | Transforma **los JSON de captura Excel existentes** a SQLite v2 conservando celdas. No genera nuevos datos de PDF. |
| [`scripts/generar_publicacion_v2.py`](../scripts/generar_publicacion_v2.py) | Reconstruye/valida la **proyección estática actual** desde lotes + SQLite v2 y compara valores. |
| [`scripts/exportar_comparador_v2.py`](../scripts/exportar_comparador_v2.py) | Exportación relacional **experimental** de campos/listas/tablas v2; su salida aún debe conciliarse con el publicador estático antes de introducir resultados PDF nuevos. |
| [`data/contrato-v2.md`](../data/contrato-v2.md) | Contrato de intercambio para la interfaz. La captura Excel y el documento PDF estructurado no deben confundirse. |
| [`config/operacion_ia.json`](../config/operacion_ia.json) | Parámetros controlables del procesamiento externo por IA. |
| [`scripts/validar_lote_ia.py`](../scripts/validar_lote_ia.py) | Verifica manifiesto de trabajo, orden, tamaño, lecturas redundantes, cobertura declarada y persistencia. |
| `scripts/extraer_pdf_v2.py`, `scripts/importar_pdf_v2.py` | **Experimentos auxiliares**, no motor central ni flujo operativo de interpretación documental. |

Los **datos originales** y los derivados se mantienen en estructuras distintas. Las correcciones de extracción no deben sobrescribir una evidencia anterior: se añade versión/registro de corrección que conserve el historial.

### 5.2 Publicación actual

- [**Sitio principal — comparador v2**](https://jncubillosn-lab.github.io/Estudiantes-Auxiliares-Veedur-a/) se sirve desde `index.html`; el mismo contenido está en [`comparador-v2.html`](../comparador-v2.html).
- [**Visor anterior**](../visor.html) es histórico y permanece disponible.
- El comparador actual permite **selección múltiple**, búsqueda, filtros básicos por programa (texto), facultad, estado y PDF de resultados leído/no recuperado; matriz por atributos, inspección de celdas originales de Excel y respaldo textual de PDF.
- La clasificación avanzada por carrera/órgano convocante/requisitos/resultados **no está completada**; faltan las estructuras PDF. No afirmar que filtros textuales equivalen a categorías fiables y exhaustivas.
- Su objetivo es **comparación de evidencias**, no presentación atractiva de anuncios. La interfaz actual es **aceptable como prototipo**; no está aprobada como instrumento definitivo de auditoría.

## 6. Parámetros de operación de la IA

**Fuente ejecutable:** [`config/operacion_ia.json`](../config/operacion_ia.json); esta tabla explica sus valores **vigentes**.

| Parámetro | Valor / regla |
|---|---|
| `modo` | `extraccion_externa_por_ia` |
| `limite_convocatorias_por_interaccion` | **50 convocatorias distintas**, no 50 filas ni 50 PDF. Reducir si la complejidad impide verificar íntegramente. |
| `unidad_lote` | `codigo_de_convocatoria_distinto` |
| `orden_proyecto` | `estructura_base_datos → interfaz_comparadora → extraccion_externa_por_ia` |
| `orden_por_convocatoria` | `identificar_fuentes → leer_excel → leer_convocatoria → leer_resultados → integrar → verificar → persistir` |
| Evitar lecturas redundantes | No extraer dos veces **misma fuente + versión + ubicación** como dos eventos originales. |
| Preservar repeticiones originales | Si el texto aparece en **dos celdas o regiones auténticas**, conservar **las dos ocurrencias**, incluso si son idénticas. |
| Cobertura | Registrar páginas, tablas, celdas, listas, ítems, campos, filas y columnas previstas/observadas. |
| Pendientes | Permitidos, **visibles y con referencia**; impiden declarar expediente completamente cotejado cuando corresponda. |
| Certificación automática integral | `false`; el validador de manifiestos NO sustituye lectura visual y contraste con PDF. |
| Persistencia | Cada interacción termina con lote **guardado**, estado de avance y referencia para reanudar, si se afirma que se ejecutó. |

**Regla de continuidad:** recuperar el último lote guardado y no releer por sistema documentos correctamente procesados; el cotejo justificado sí puede volver a mirar una fuente **sin generar un dato original ficticio nuevo**.

## 7. Estado comprobado de la investigación y de los datos

**Corte documentado:** 13 de noviembre de 2026. **No es** la totalidad del histórico de la hoja.

| Indicador | Valor | Interpretación correcta |
|---|---:|---|
| Convocatorias distintas | **42** | Claves distintas agrupadas por código. |
| Registros Excel | **43** | Una convocatoria (`2026-C2324`) aparece en dos filas. |
| Celdas Excel capturadas | **470** | Con rótulos y metadatos disponibles. |
| PDF con **texto extraído** | **16** | **7 de convocatoria + 9 de resultados**, sin estructura visual cotejada. |
| Renglones textuales PDF | **2.340** | Segmentación histórica de texto, **no** equivalencia con celdas del PDF. |
| Filas candidatas de postulantes | **51** | Identificación provisional por patrón, **no** total verificado de personas postuladas. |
| Observaciones/hallazgos iniciales | **4** | Pendientes de análisis, no «prácticas indebidas» probadas. |
| PDF con tablas/celdas reconstruidas y cotejadas visualmente | **0** | La nueva etapa de lectura estructural sigue pendiente. |
| Convocatorias con tres fuentes completas e integradas por conceptos | **0** | No confundir «registro publicado» con «expediente auditado». |

### Primeros cuatro lotes (históricos)

| Lote | Filas Excel | PDF texto | Celdas Excel | Renglones PDF |
|---|---:|---:|---:|---:|
| 01 piloto | 3 | 3 | 33 | 415 |
| 02 implementación | 5 | 5 | 55 | 668 |
| 03 regular | 10 | 4 | 108 | 569 |
| 04 optimizado | 25 | 4 | 274 | 688 |
| **Total** | **43** | **16** | **470** | **2.340** |

Archivos fuente: [`data/lotes/lote_01.json`](../data/lotes/lote_01.json), [02](../data/lotes/lote_02.json), [03](../data/lotes/lote_03.json), [04](../data/lotes/lote_04.json). Son registros persistidos de la extracción previa. **No contienen los PDF binarios originales; contienen el texto devuelto por el extractor, así que no basta con ellos para reconstruir por sí solos la geometría original.**

El JSON integrado [`data/exportacion_v2.json`](../data/exportacion_v2.json) agrupa los cuatro lotes, incluye sus celdas originales y el **texto recuperado** de los PDF. Las estructuras PDF cotejadas y los sintéticos provenientes de su contenido **todavía no están incorporados**.

### Diferencias y casos de prueba pendientes

| Caso | Observación documental | Estado |
|---|---|---|
| `2026-C2381` | Excel y PDF indican **distintas fechas de cierre** (18 y 19 de noviembre de 2026). | Revisar visualmente y determinar versión/adenda relevante; no decidir cuál prevalece. |
| `2026-C2312` / `2026-C2302` | Título o vínculo de resultados asociado a un código cuyo **contenido textual interno muestra otro**. | Cotejar encabezado y vinculación. |
| `2026-C2324` | **Dos filas** Excel con el mismo código. | Conservar ambas; analizar correspondencia sin borrar. |
| `2026-C2308` | Transcripción de resultados particularmente corta; no permite inferir «0 postulantes». | Cotejo visual pendiente. |
| `2026-C2361` | Adenda integrada cambia condición de avance curricular. | Comparar literal previo y posterior. |
| `2026-C2363` | Adenda integrada incluye anuncio sobre convocatoria desierta por duplicidad. | Preservar su redacción y contexto. |

Los primeros **cuatro hallazgos registrados en SQL** son observaciones, **no resultados concluyentes**. Los dos ejemplos de adenda complementan el catálogo de casos de prueba; no implican que se hayan convertido semánticamente.

## 8. Validaciones alcanzadas y sus límites

- **Validado por pruebas automáticas:** sintaxis JavaScript del comparador; integridad relacional del esquema; comparación de celdas Excel y textos PDF guardados contra los JSON de sus lotes; reproducción de la proyección Pages desde lotes y SQLite; control de máximo 50, secuencia, persistencia y lecturas redundantes de manifiestos ficticios.
- **Probado solo con ejemplos sintéticos:** una lista de siete requisitos coexiste con su conteo sintético sin perder ítems; pruebas opcionales de coordenadas/tablas sobre PDF ficticio. **No prueban que un PDF real esté fielmente reconstruido**.
- **No realizado:** auditoría visual de cada página de los 16 PDF reales; reconstrucción completa de sus tablas; correspondencia de encabezados y puntajes; cotejo de anexos/adendas; contrastes transversales verificables de requisitos/criterios con resultados.
- **Publicación:** GitHub Pages está configurado desde `main` y raíz, con `index.html` apuntando al comparador v2. Se comprobó una publicación correcta el 13-11-2026.

Herramientas de prueba: [`scripts/probar_estructura_v2.py`](../scripts/probar_estructura_v2.py), [`scripts/probar_comparador_v2.py`](../scripts/probar_comparador_v2.py), [`scripts/probar_control_lotes_ia.py`](../scripts/probar_control_lotes_ia.py), [`scripts/generar_publicacion_v2.py`](../scripts/generar_publicacion_v2.py). Acciones: [`.github/workflows/verificar_v2.yml`](../.github/workflows/verificar_v2.yml) y [`validar.yml`](../.github/workflows/validar.yml).

## 9. Prioridades pendientes para una siguiente etapa

1. **No procesar 50 convocatorias reales de golpe todavía.** Seleccionar un piloto de formatos diferentes: convocatoria, resultados y adenda.
2. Leer **PDF real visualmente** y reconstruir todas sus tablas, celdas, listas, repeticiones auténticas y notas, sin sustituirlas por indicadores.
3. Guardar la lectura externa como registros originales **por fuente/versión/página/celda**, con un manifiesto por convocatoria y una prueba de cobertura.
4. **Conciliar las rutas de exportación:** el publicador estático actual (`generar_publicacion_v2.py`) reconstruye desde los lotes históricos Excel/texto PDF; el exportador relacional de tablas (`exportar_comparador_v2.py`) es una vía diferente. **Antes de agregar nuevas extracciones reales, unificarlas en un contrato de publicación que no descarte información PDF estructurada**.
5. Visualizar y cotejar **listas de requisitos y criterios** completos al comparar varias convocatorias; inspeccionar las tablas de resultados en la misma ficha.
6. Tras comprobar fidelidad en el piloto, crecer por lotes de hasta **50 convocatorias distintas** con checkpoints persistentes y sin relecturas redundantes.

**Puerta de calidad:** no declarar una convocatoria «integrada y cotejada» porque su JSON existe, porque su PDF se abrió, por una etiqueta de IA o porque las pruebas pasan. Debe poder reconstruirse desde la interfaz lo publicado en **cada celda y documento disponible** y dejar en evidencia cualquier falta de acceso o cotejo.

## 10. Guía de referencias

- [Normas originales 01, 02 y 03](NORMA-01-integridad-exhaustividad.md) · [02](NORMA-02-integracion-comparabilidad.md) · [03](NORMA-03-extraccion-externa-ia.md).
- [Registro cronológico de decisiones y errores corregidos](01-REGISTRO-DECISIONES.md).
- [Procedimiento de continuidad y criterios de aceptación](02-CONTINUIDAD-Y-VALIDACION.md).
- [Diccionario de campos inicial](diccionario-de-campos.md) y [modelo histórico](modelo-de-datos.md).
- [Arquitectura v2](arquitectura-v2-plan-trabajo.md) y [estado histórico de su implementación](estado-arquitectura-v2.md).
- [Protocolo inicial de comprobación](protocolo-de-validacion.md) y [ejecución de los lotes](estado-ejecucion.md).

**Precedencia documental:** las **Normas 01–03** y [`config/operacion_ia.json`](../config/operacion_ia.json) son fuentes vinculantes de reglas. Este documento consolida **estado y navegación vigentes**. Cuando un texto histórico afirme que `index.html` no fue reemplazado, o se refiera al extractor automático como flujo principal, debe interpretarse como **estado de aquel momento**, no como la decisión actual.
