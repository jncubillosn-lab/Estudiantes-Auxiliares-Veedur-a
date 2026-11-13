# REGISTRO DE DECISIONES, CORRECCIONES Y PROBLEMAS

**Corte:** 13 de noviembre de 2026. **Alcance:** reconstrucción de decisiones del proyecto de veeduría; se refiere al historial de este repositorio, no a hallazgos concluyentes contra la universidad.  
**Referencia vigente:** [00 — Referencia general](00-REFERENCIA-GENERAL.md). **Normas superiores:** [01](NORMA-01-integridad-exhaustividad.md), [02](NORMA-02-integracion-comparabilidad.md) y [03](NORMA-03-extraccion-externa-ia.md).

Este registro conserva **por qué cambiaron** las decisiones técnicas. Los errores se reconocen; no se borran datos de origen para corregirlos.

## 1. Investigación y verificación inicial de acceso

**Petición original:** comprobar que el asistente puede leer la copia del Excel y **abrir realmente el contenido** de los PDF enlazados, no solo ver los títulos y URLs.

**Comprobado:** conexión a Google Sheets con pestañas «Convocatorias Abiertas» y «Convocatorias Cerradas», lectura de filas/celdas y vínculos reales, y obtención de texto de PDF de convocatoria y resultados. Se observó que varias celdas contenían **códigos o «Resultados C…» sin vínculo PDF**. La ausencia de enlace **no demuestra** inexistencia del documento.

**Primera limitación reconocida:** extraer texto de un PDF no garantiza preservar su estructura visual. Esta diferencia resultó central para la orientación posterior del proyecto.

## 2. Definición de la veeduría

**Decisión vigente:** no desarrollar un publicador de anuncios ni emitir juicios automáticos sobre prácticas. El propósito es **consolidar las tres fuentes y comparar requisitos y criterios** entre procesos y respecto de los resultados.

La persona responsable realiza la interpretación. El sistema identifica diferencias constatables, referencias, cambios, datos sin evidencia, valores y cálculos reproducibles.

## 3. Integridad de originales — varias correcciones del alcance

**Problema ocurrido:** durante el planteamiento inicial se sugirió sustituir identificaciones por alias o excluir/filtrar datos considerados personales y posteriormente se insistió en decisiones de visibilidad. El usuario rechazó expresamente que el asistente asumiera esa atribución.

**Corrección vinculante:** **el asistente no decide qué omitir, anonimizar, esconder, modificar ni publicar**. Su función es transformar y conservar lo que se observa, incluido todo dato original que permita rastrear personas y decisiones que figuren en fuentes. El usuario responsable establece visibilidad, permisos y publicación. El repositorio pasó por estado privado y después público por decisión del responsable.

**Error técnico relacionado:** se confundió «integrar» con «resumir» o «normalizar de modo que algo desaparece».

**Corrección formal:** dos categorías distintas:
- **Originales:** documentos y estructuras completas, literales e inmutables, accesibles desde la interfaz.
- **Sintéticos:** nuevos indicadores y cálculos con regla e insumos, **adicionales**.

**Ejemplo de aceptación:** `7 requisitos` es un conteo sintético; la lista original completa y cada uno de los siete textos siguen disponibles. Un indicador de personas seleccionadas no sustituye una tabla de resultados.

**Persistencia normativa:** [Norma 01](NORMA-01-integridad-exhaustividad.md).

## 4. Primera importación: cuatro etapas

Se propuso y ejecutó un primer piloto de **3 + 5 + 10 + 25 registros** (43 filas Excel agrupadas en **42 convocatorias**). Se procesaron **16 PDF como texto**, no como celdas/tablas verificadas. Hubo **51 posibles filas de participantes** reconocidas por patrones de texto y **4 observaciones documentales preliminares**.

**Problema:** el recuento de «43 registros» se podía malinterpretar como 43 convocatorias completas, y «16 PDF» como 16 documentos reconstruidos fielmente.

**Corrección:** unidad de conteo principal = **convocatoria distinta**. Separar contadores de filas Excel, PDF enlazados/consultados, PDF estructurados y expedientes cotejados. `2026-C2324` tiene dos filas pero un código.

**Problema de los PDF:** muchos resultados solo figuraban con una referencia textual en la hoja; para estas convocatorias no se recuperaron simultáneamente ambos tipos de PDF. No declarar documentos inexistentes.

**Preservación:** los datos de los cuatro lotes originales siguen disponibles en `data/lotes/lote_01.json` a `lote_04.json`, y su importación histórica en `db/seed_lote_*.sql`.

## 5. Corrección de persistencia SQL y trazabilidad

**Problema detectado:** la primera exportación SQL no reprodujo exactamente algunos saltos de línea del texto original al reconstruir la base.

**Corrección ejecutada:** preservar caracteres de control literales y comprobar valores de Excel y textos PDF guardados contra cada JSON. Se incorporó CI para pruebas de fidelidad. Esta comprobación garantiza **igualdad textual entre representaciones almacenadas**, no fidelidad visual del PDF original.

**Decisión:** mantener el esquema histórico para consultar lo ya procesado, pero elaborar v2 con invariantes de originales, vínculos, celdas y sintéticos.

## 6. Primer visor y rechazo del enfoque publicador

**Se implementó:** un HTML autónomo con búsqueda/filtros, acceso a transcripciones y notas de validación. Su valor práctico inicial fue la navegación.

**Observación del usuario:** la presentación resultaba más semejante a un **catálogo de convocatorias** que a una veeduría. Mostrar PDF como texto plano deshace tablas/celdas y hace difícil contrastar requisitos o resultados.

**Corrección:** la vista principal es una **matriz de comparación de varias convocatorias**; la ficha por convocatoria es una vista de inspección, no la única función. Los PDF deben convertirse a listas, tablas, celdas y campos completos, con vínculos a evidencia exacta. Una suma o indicador no reemplaza la estructura original.

**Persistencia normativa:** [Norma 02](NORMA-02-integracion-comparabilidad.md). El visor inicial permanece en `visor.html` como referencia histórica.

## 7. Cambio de publicación en GitHub Pages

**Dificultad inicial:** un repositorio privado de cuenta personal no pudo publicarse como sitio de acceso privado bajo la configuración de prueba Enterprise que se intentó. El responsable del proyecto decidió pasar el repositorio a público.

**Problema técnico:** con Pages desde `main/(root)`, inicialmente faltaba una página de entrada `index.html`.

**Corrección inicial:** se creó `index.html` como copia del visor autónomo. Más tarde se publicó **el comparador v2** como `index.html`, conservando el anterior en `visor.html`.

**Arquitectura vigente:** Pages es **estático**, sin servidor ni SQLite ejecutándose en línea. Consume `data/exportacion_v2.json`. Esta proyección se verifica frente a las fuentes y se actualiza explícitamente, no constituye una nueva fuente original.

## 8. Base de datos v2

**Decisión:** diseñar primero la base, después la interfaz y, por último, la extracción que las alimentará.

**Implementado:** `db/estructura_v2.sql` con 19 tablas aditivas, triggers de inmutabilidad en estructuras originales, vínculos por código, campos/ítems/tablas/participantes, revisiones y sintéticos separados.

**Pruebas:** ejemplos **ficticios** confirman que borrar un indicador no borra requisitos originales, que los originales se tratan como inmutables y que la importación de los 43 registros Excel conserva las 470 celdas.

**Advertencia:** un esquema preparado para PDF completos no equivale a que los 16 PDF reales estén estructurados.

## 9. Cambio definitivo de extracción: IA externa, no motor propio

**Intento anterior:** se prepararon scripts experimentales (`extraer_pdf_v2.py`, `importar_pdf_v2.py`) para obtener geometría y celdas. Las pruebas se hicieron con **PDF sintético**, no constituyeron una extracción completa de los PDF reales.

**Aclaración del usuario:** **no reinventar la rueda**: la IA hace la interpretación directamente fuera del programa. El código debe proporcionar **herramientas de verificación, reglas de operación y control de capacidad**, no otro extractor con heurísticas propias que decida el contenido de los PDF.

**Corrección vigente:** [Norma 03](NORMA-03-extraccion-externa-ia.md). Los scripts de lectura PDF quedan como auxiliares experimentales; los operativos son parámetros, validador de manifiestos, pruebas de cobertura y persistencia.

**Controles:** máximo **50 convocatorias distintas por interacción**; etapas siempre en orden; leer una región una sola vez para **extraerla** salvo revisión/reextracción documentada; guardar **todas las repeticiones auténticas** impresas en lugares diferentes. Verificación y registro de pendientes antes de afirmar persistencia.

## 10. Comparador v2 y unión de la base con Pages

**Implementación inicial:** `comparador-v2.html` permite selección múltiple de convocatorias y matrices por variables. Los campos PDF no estructurados aparecen como pendientes.

**Conexión posterior:** se publicó `data/exportacion_v2.json` agrupando los cuatro lotes por código sin perder sus celdas ni las transcripciones PDF. El comparador ahora lee esa exportación en lugar de volver a ensamblar los cuatro JSON en el navegador.

**Verificaciones ejecutadas:** igualdad literal de 470 celdas Excel y de los textos PDF respecto de los lotes; CI de sintaxis y contrato; controles de estructura y límites de lotes.

**Publicación:** `index.html` es copia exacta del comparador v2; `visor.html` mantiene el primer prototipo. GitHub Pages reportó despliegue correcto.

**Problema aún abierto:** existe más de una vía histórica de exportación. El generador vigente de Pages reconstruye datos desde los cuatro lotes; el exportador de campos PDF relacionales aún no forma parte del mismo flujo. No se deben cargar nuevos datos estructurados PDF con riesgo de reemplazar u omitir información en una publicación posterior.

## 11. Correcciones que siguen pendientes

1. Reconstruir de **PDF reales** tablas y celdas mediante lectura IA de todas sus páginas.
2. Garantizar que el sitio muestre **todos** los requisitos y resultados originales, no solo su transcripción plana.
3. Integrar y comparar requisitos generales, condiciones especiales, ponderaciones, participantes, calificaciones y adendas **con trazabilidad a fuente y posición**.
4. Unificar los exportadores antes de publicar los primeros campos PDF estructurados.
5. Guardar manifiestos **reales** de extracción IA; los ejemplos actuales de los validadores son ficticios.
6. Validar casos difíciles (`C2381` fechas, `C2312` códigos, `C2324` repetición de filas, `C2308` texto breve, y adendas `C2361/C2363`) sin etiquetarlos como infracciones comprobadas.

## 12. Alcance de las certificaciones del proyecto

No mezclar las siguientes afirmaciones:

- **«Pasó GitHub Actions»** = la implementación satisface los *tests existentes*.
- **«PDF consultado»** = se leyó cierto contenido, que puede no conservar su estructura.
- **«PDF íntegramente representado»** = todas las tablas, celdas, marcas y excepciones originales son accesibles y rastreables.
- **«Convocatoria contrastada»** = las tres fuentes fueron integradas y comparadas con evidencia suficiente, incluidos faltantes o cambios.
- **«Práctica indebida»** = conclusión que **no corresponde al programa ni se deduce automáticamente de un contraste**.

**Conclusión del estado actual:** la base y el comparador ofrecen una infraestructura inicial aceptable, **no** un sistema de veeduría documental terminado. La siguiente mejora debe medirse por **fidelidad de los PDF reales y comparabilidad**, no por estética ni cantidad de registros.

