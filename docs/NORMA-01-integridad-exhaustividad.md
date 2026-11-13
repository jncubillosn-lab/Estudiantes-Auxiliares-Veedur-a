# NORMA 01 — Integridad, exhaustividad y visibilidad de las fuentes

**Prioridad:** máxima.  
**Vigencia:** a partir del 13 de noviembre de 2026.  
**Ámbito:** Excel original, PDF de convocatoria, PDF de resultados, adendas, anexos y futuras incorporaciones.

## Mandato

La herramienta y sus operadores **transforman, transcriben, relacionan y contrastan información**. No tienen autorización para determinar qué fragmentos del documento son prescindibles.

La extracción debe conservar **el 100 % de la información observable** de cada documento, aunque sea repetida, aparentemente irrelevante, contradictoria, extraordinaria, incómoda o difícil de estructurar.

No se permite omitir, editar, corregir, abreviar, anonimizar, sustituir por un alias, resumir o esconder un dato **en la base documental fiel** por decisión del sistema. La condición de dato personal tampoco autoriza eliminarlo de la fuente o de su transcripción. El control de acceso y las condiciones de almacenamiento son problemas distintos de la fidelidad de extracción.

## Reglas obligatorias (en orden jerárquico)

1. **Fuente íntegra e inalterada.** Conservar referencia inequívoca y, cuando sea posible, copia verificable del archivo original, integridad criptográfica, fecha y versión observada.
2. **Extracción literal completa.** Registrar la totalidad del contenido textual y visual significativo: tablas, filas, celdas, encabezados, pies, casillas, marcas, firmas, sellos, notas, referencias, adendas y anexos. Conservar también los elementos que el extractor no pueda descifrar.
3. **Trazabilidad localizable.** Todo dato transformado debe enlazar con archivo y página y, cuando se pueda, con celda, región, fragmento, fila u orden de lectura precisos.
4. **Estructura explícita.** Los campos extraídos se muestran como columnas o registros claramente nombrados; no se ocultan datos detrás de códigos, campos genéricos opacos, indicadores agregados, resúmenes ni claves sustitutas. Las estructuras extensibles pueden complementar, pero no reemplazar, las columnas legibles.
5. **Preservación de diferencias.** Excel, convocatoria y resultados son fuentes autónomas. No elegir un ganador entre versiones discrepantes: registrar ambas y permitir su contraste.
6. **Sin inferencia disfrazada de hecho.** Separar exactamente lo observado, lo normalizado, lo inferido y lo evaluado. Conservar la redacción original junto a cualquier normalización.
7. **Sin pérdida de casos excepcionales.** Requisitos duplicados o modificados, criterios compuestos, resultados sin seleccionados, adendas insertas, filas mal alineadas, múltiples documentos y datos atípicos deben representarse sin forzar ni descartar contenido.
8. **Ausencias transparentes.** Diferenciar expresamente 'vacío en fuente', 'no encontrado', 'ilegible', 'inaccesible' y 'pendiente de extracción'. Nunca completar silenciosamente ni usar cero donde falta un dato.
9. **Comprobación de exhaustividad.** Cada documento debe declarar páginas y fragmentos procesados, elementos pendientes, anomalías y resultado de verificación. 'Extraído' no equivale automáticamente a 'verificado'.
10. **Prohibición de cambios invisibles.** Toda corrección de transcripción, revisión humana o modificación del esquema se documenta y deja trazabilidad histórica.

## Responsabilidad sobre visibilidad y fidelidad de datos

**El responsable del proyecto decide la visibilidad, acceso, publicación y tratamiento de la información.** El sistema no decide estos aspectos por iniciativa propia y, en particular, no omite, anonimiza, oculta, sustituye ni modifica ningún dato por razones de presentación o publicación.

La eventual creación de una vista adicional, si el responsable la solicita, no altera la base documental íntegra, la estructura relacional ni las fuentes originales. **Conservar la información y definir su visibilidad son decisiones separadas.**

## Criterio de aceptación

Un lote **no puede marcarse como completo** si un elemento observable fue omitido, desplazado a un campo no inspeccionable, agregado sin detalle o sustituido por una interpretación, ni si existen páginas o tablas pendientes sin anotarlo explícitamente.

## Regla de precedencia

Si una solución técnica, una estrategia de almacenamiento o una extracción automática contradice esta norma, **la solución debe adaptarse**. No se rebaja la fidelidad del registro para acomodarse a la herramienta.
