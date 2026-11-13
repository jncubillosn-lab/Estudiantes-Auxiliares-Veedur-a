# NORMA 01 — Integridad, exhaustividad y visibilidad de las fuentes

**Prioridad:** norma vinculante de integridad, **subordinada exclusivamente a la NORMA 00**, de máxima jerarquía. [Leer NORMA 00](NORMA-00-validacion-integral.md).  
**Vigencia:** a partir del 13 de noviembre de 2026.  
**Ámbito:** Excel original, PDF de convocatoria, PDF de resultados, adendas, anexos y futuras incorporaciones.

## Mandato

La herramienta y sus operadores **transforman, transcriben, relacionan y contrastan información**. No tienen autorización para determinar qué fragmentos del documento son prescindibles.

La extracción debe conservar **el 100 % de la información observable** de cada documento, aunque sea repetida, aparentemente irrelevante, contradictoria, extraordinaria, incómoda o difícil de estructurar.

No se permite omitir, editar, corregir, abreviar, anonimizar, sustituir por un alias, resumir o esconder un dato **en la base documental fiel** por decisión del sistema. La condición de dato personal tampoco autoriza eliminarlo de la fuente o de su transcripción. El control de acceso y las condiciones de almacenamiento son problemas distintos de la fidelidad de extracción.

## Distinción obligatoria: datos originales y datos sintéticos

La base está compuesta por **dos categorías de datos con funciones distintas**, no por un resumen que sustituye los documentos:

**A. Datos originales: permanentes, íntegros e intocables.**
- Comprenden cada fuente tal como existe: hoja de cálculo, PDF de convocatoria, PDF de resultados y cualquier adenda/anexo. Deben conservarse el documento original y la representación **estructurada fiel de todo su contenido**, incluidas tablas, celdas, rótulos, listas, condiciones, puntuaciones, marcas y excepciones.
- Cada elemento tiene identidad, contenido literal, orden, ubicación, fuente, versión y relaciones con otros elementos. No se reemplaza por un agregado, etiqueta, conclusión o conteo.
- Deben ser **consultables directamente desde la interfaz**, no solo permanecer guardados en archivos ocultos, bloques opacos o texto plano desordenado.
- Integrar por convocatoria permite evitar repetir en la **vista unificada** un dato efectivamente común (por ejemplo, número de convocatoria), **sin alterar ni retirar ninguna de sus apariciones en las tres fuentes originales**. Si alguna fuente difiere, se muestran todas sus versiones.
- Los datos originales no pueden sobrescribirse mediante una normalización, revisión, interpretación, filtrado o publicación.

**B. Datos sintéticos: secundarios, derivados, identificables y opcionales.**
- Son resultados calculados a partir de los originales: conteos, sumas, indicadores, métricas, agrupaciones, índices, alertas de diferencias, etc.
- Deben identificarse expresamente como **sintéticos**, documentar fórmula/regla, versión, entradas originales y estado de verificación.
- Pueden facilitar búsquedas y comparaciones, pero **nunca sustituyen, condensan definitivamente, eliminan ni corrigen datos originales**.
- La generación, modificación o eliminación de un indicador sintético no debe afectar las fuentes ni su representación estructurada.

**Ejemplo vinculante:** si una convocatoria contiene siete requisitos completos, el sistema conserva los **siete requisitos por separado, con su literalidad y procedencia**. Puede generar el indicador sintético `cantidad_de_requisitos = 7`, pero jamás sustituir la lista por ese valor. Un resultado de selección debe conservar sus filas, participantes, identificaciones, columnas y notas, aunque exista un indicador agregado de participantes.

**Prueba de conformidad:** desde la ficha integrada debe ser posible abrir cada lista, cada elemento y cada tabla de las fuentes originales, reconstruir su contenido y verificar cualquier dato sintético. Si una representación no permite esto, no cumple la norma.

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

Si una solución técnica, una estrategia de almacenamiento o una extracción automática contradice esta norma, **la solución debe adaptarse**. Esta norma desarrolla la [NORMA 00](NORMA-00-validacion-integral.md) y nunca sustituye sus condiciones de aceptación. No se rebaja la fidelidad del registro para acomodarse a la herramienta.
