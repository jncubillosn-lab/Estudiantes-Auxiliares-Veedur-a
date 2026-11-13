# NORMA 02 — Integración estructural y comparabilidad

**Precedencia:** subordinada a la [NORMA 00](NORMA-00-validacion-integral.md) y a la [NORMA 01](NORMA-01-integridad-exhaustividad.md).  
**Ámbito:** base de datos e interfaz de la herramienta de veeduría, con [contrato v3 de salida](CONTRATO-V3-VISUALIZACION.md).

## Mandato

La aplicación es una **herramienta de comparación documental**, no un catálogo de anuncios ni un sistema que declare automáticamente si existen prácticas indebidas. Su unidad de integración es **una convocatoria identificada por código**; las apariciones originales de ese código en Excel y PDF permanecen disponibles, incluso cuando son contradictorias.

Cada expediente integra **tres fuentes independientes**: Excel, PDF de convocatoria y PDF de resultados cuando exista, más sus anexos, adendas y versiones. Una fuente faltante o no cotejada permanece con estado explícito; **no se inventa ni se da por inexistente**.

## Integridad estructural de cada fuente

- **Excel:** todas las filas y celdas de cada código, encabezados, fórmulas, notas, hipervínculos y literales.
- **PDF de convocatoria:** todas las páginas, listas de requisitos, condiciones, criterios, tablas, celdas, notas y versiones; conservar orden y ubicación.
- **PDF de resultados:** todas las filas y columnas de postulantes, identificaciones, criterios, valores, puntajes, decisiones y observaciones, sin reducirlas a «número de seleccionados».
- **Otras fuentes:** adendas, anexos o correcciones se conservan como documentos/versiones adicionales, no sustituyen silenciosamente un documento anterior.

Una lista de siete requisitos sigue teniendo **siete ítems íntegros**, aunque se añada el indicador sintético «cantidad = 7». Un resultado agregado **no sustituye** los valores ni las celdas de su tabla. Un PDF convertido solo a texto **no equivale** a una tabla reconstruida.

## Originales y sintéticos: dos capas distintas

**Originales:** registros con fuente, URL, versión, página, tabla, celda, literal, orden y cualquier incertidumbre observable. **Sintéticos:** comparaciones, sumas y métricas derivadas con fórmula, versión e insumos originales, siempre adicionales.

Se admite que la **cabecera unificada** presente un dato común una sola vez, siempre que se pueda abrir cada ocurrencia original. Si dos fuentes difieren, se muestran ambos valores sin resolver automáticamente cuál prevalece.

## Comparación transversal

La herramienta debe permitir seleccionar **varias convocatorias simultáneamente** y contrastar por filas de conceptos, columnas de convocatorias, filtros por carrera/programa, facultad, dependencia y estado, y variables que procedan de fuentes reales: requisitos, plazas, dedicación, estímulos, criterios, ponderaciones, participantes y resultados.

Cada celda comparativa debe poder mostrar la **información original completa y su enlace documental**. Los datos no recuperados, ilegibles, ausentes de la fuente y pendientes de verificación se diferencian explícitamente; ninguno se presenta como cero.

La comparación muestra diferencias objetivas y documentadas, **no juicios normativos automáticos**. El responsable del proyecto decide cómo interpreta y publica la evidencia.

## Entrada única y aceptación

La base SQLite v3 integra los originales, verificaciones y sintéticos; el visualizador recibe **únicamente** el JSON descrito en [CONTRATO-V3-VISUALIZACION](CONTRATO-V3-VISUALIZACION.md), producido por `scripts/exportar_base_v3.py`. **GitHub Pages actual aún utiliza la interfaz v2** y no acredita el contrato v3.

La **métrica principal no es «convocatorias integradas», «campos comparables» ni «PDF leídos»**: es el número de **convocatorias validadas**, exclusivamente conforme a la [NORMA 00](NORMA-00-validacion-integral.md) y a las puertas [A–E de la NORMA 04](NORMA-04-validacion-convocatorias.md).

**Prohibido ajustar la definición de «validada» para compensar limitaciones de la interfaz o de la base.**
