# NORMA 02 — Integración estructural y comparabilidad entre convocatorias

**Jerarquía:** subordinada a [NORMA 01](NORMA-01-integridad-exhaustividad.md). **Objeto:** redefinir el producto desde una lista de publicaciones hacia una herramienta de veeduría documental comparativa.

## Contrato de integración: no confundir dos categorías de datos

1. **Datos originales:** conjunto completo de las fuentes, guardado sin cambios y representado íntegramente de forma estructurada, con acceso directo desde la interfaz. La estructura de cada lista, tabla y elemento original se conserva de manera rastreable.
2. **Datos sintéticos:** resultados derivados para análisis, comparación o visualización. Tienen nombre, regla de cálculo y procedencia; se muestran como adicionales y **nunca sustituyen ningún campo o elemento original**.

La ficha integrada puede mostrar una sola vez el **código de convocatoria** como clave compartida cuando coincida entre las fuentes, pero debe permitir inspeccionar las tres ocurrencias literales originales. Para un campo que no coincide o que cambia por adenda, la vista presenta todos los valores y sus documentos, no sobrescribe ninguno.

### Ejemplos de operaciones permitidas y prohibidas

| Operación | Estado | Razón |
|---|---|---|
| Relacionar el mismo código desde Excel, convocatoria y resultados | Permitida | Identificador común; las ocurrencias literales permanecen intactas |
| Integrar una lista de siete requisitos como siete registros individuales en una sola ficha | Obligatoria | Mantiene orden, literal y fuente de cada requisito |
| Añadir un indicador «7 requisitos» junto a la lista | Permitida como **dato sintético** | Se puede volver a los siete registros originales |
| Sustituir la lista de requisitos por el indicador «7» | **Prohibida** | Elimina información original |
| Convertir una tabla de resultados en solo «1 seleccionado» | **Prohibida** | Suprime filas, personas, puntajes, notas, estados y condiciones |
| Mostrar un resumen de resultados además de la tabla original completa | Permitida como **dato sintético** | Resumen y fuente permanecen distinguibles |
| Fusionar dos condiciones distintas porque producen el mismo valor calculado | **Prohibida** | Los textos y condiciones originales no son equivalentes |
| Presentar un texto extraído en bloque como si fuera tabla reconstruida | **Prohibida** | Pierde filas, columnas y relaciones de celdas |

**Contrato de interfaz:** cada campo comparable puede desplegar inmediatamente su valor original completo y la estructura en que aparece (requisitos individuales, tabla, celda y página), y diferenciar visualmente los indicadores sintéticos. No basta ofrecer un vínculo al PDF ni esconder el contenido en un bloque de texto plano.

**Contrato de base de datos:** los campos sintéticos usan registros/tablas lógicamente independientes, con referencia a los elementos originales que justifican su cálculo. Ningún valor sintetizado sobrescribe el texto literal, la tabla reconstruida ni el archivo original.

## 1. Unidad y resultado esperado

La unidad principal de análisis es **la convocatoria**, identificada por su código sin fusionar automáticamente filas, versiones o documentos con referencias contradictorias. Para cada convocatoria el sistema debe producir una **ficha integrada** a partir de tres fuentes:

1. **Excel:** registro publicado, estado, dependencia/facultad, programas, fechas, enlaces, contenido íntegro de sus celdas.
2. **PDF de convocatoria:** toda su estructura y contenido (celdas, tablas, casillas, bloques, requisitos generales y particulares, actividades, criterios, ponderaciones, normas, notas, adendas y otros campos).
3. **PDF de resultados:** toda su estructura y contenido (cabeceras, participantes, identificaciones, calificaciones por criterio, totales, estados, notas, evaluadores, firmas, aclaraciones, adendas, etc.).

Las tres fuentes se integran en un **modelo semántico común**. Las discrepancias no se resuelven escogiendo un valor; quedan visibles como valores paralelos con su procedencia.

**Integrar NO significa resumir, hacer una sola cadena de texto ni sustituir documentos por enlaces.** Cada valor estructurado debe conservar literal original y ubicación de celda o región gráfica del PDF; las representaciones derivadas no deben suprimir la información fuente.

## 2. Problema demostrado por el primer visor

La interfaz actual (`visor.html`/`index.html`) se centra en publicar y navegar convocatorias. Muestra gran parte de los PDF en bloques de texto plano, perdiendo:
- Correspondencia de **rótulo ↔ celda ↔ valor**.
- Geometría de tablas y orden de columnas/filas.
- Ponderaciones, subcriterios, puntajes y resultados **en el mismo esquema comparativo**.
- Capacidad de seleccionar **varias convocatorias** y ver sus requisitos lado a lado.
- Relación explícita entre **lo exigido en convocatoria** y **lo evaluado en resultados**.

**Conclusión técnica:** la preservación de texto es un respaldo parcial, no una base semántica suficiente para la veeduría. La presentación bonita de PDF transcritos no constituye validación documental ni integración analítica.

**Estado honesto del piloto:** 43 filas de Excel asociadas a 42 códigos distintos, 16 PDF leídos como texto, **0 PDF con estructura de celdas/tablas cotejada y validada**. No se puede afirmar que existan 16 PDF documentados con fidelidad integral, 42 expedientes completos o resultados estructurados y comparables. Los 51 registros de postulantes son únicamente detecciones textuales provisionales, no 51 postulaciones verificadas.

## 3. Método obligado de captura estructural del PDF

### 3.1 Documento íntegro

Se parte del **PDF binario original**, no de la extracción lineal. Se conserva versión, origen y huella de integridad cuando sea posible. Se procesa **página por página**.

### 3.2 Reconstrucción de tablas

Para cada tabla, guardar explícitamente:
- ID del documento, página, orden y región de la tabla.
- Número de filas y columnas observadas.
- **Cada celda con coordenadas, fila, columna, combinaciones de celdas (rowspan/colspan), texto literal y marcas gráficas.**
- Rótulos, jerarquías y relación con el valor vecino, sin asumir que el orden del texto extraído coincide con el de las celdas.
- Tablas fragmentadas entre páginas, casillas, tildes, tachaduras, notas manuscritas e insertos de adendas, cuando aparezcan.
- Estado de inspección visual y elementos no interpretados.

Cuando el PDF no permita resolver una celda, se preserva su evidencia visual y se marca como **no resuelta**, sin inventar valores ni ocultarla.

### 3.3 Campos semánticos

Después de reconstruir la estructura, cada dato se proyecta a categorías explícitas (no limitativas): identificación; entidad convocante; programa/perfil; actividad; horario; estímulo; duración; requisito general; requisito particular; documento exigido; criterio/subcriterio; ponderación; regla de evaluación; postulante; identificador literal; puntaje; orden; decisión; observación; adenda y modificación; referencias legales; cualquier campo extraordinario.

Cada dato conserva vínculo directo hacia la celda/rótulo visual de origen. Una misma etiqueta puede aparecer varias veces y no se deduplica silenciosamente.

## 4. Comparación entre convocatorias

El producto principal NO es una ficha aislada, sino una **matriz comparable configurable**: filas = características o requisitos, columnas = convocatorias seleccionadas. Las celdas muestran valores estructurados y origen; pueden expandirse para ver literal íntegro, documento, página, región y versiones.

Filtros y agrupaciones mínimas:
- Carrera o programa curricular (**pertenencia múltiple**, no un único texto que forzosamente clasifique una convocatoria).
- Facultad, dependencia, unidad o proyecto convocante.
- Abierta, cerrada, desierta, suspendida, corregida u otros estados publicados (por fuente y con fecha).
- Con/sin resultados publicados o enlazados (distinguir publicación, enlace y lectura efectiva).
- Requisitos académicos: PAPA, avance curricular, cursos previos, experiencia, tipo de estudiante y condiciones específicas.
- Estímulo económico, duración, horas semanales, modalidad, plazas.
- Criterios de evaluación y porcentajes; carácter eliminatorio, fórmulas y diferencias de ponderación.
- Número de postulantes **confirmado** / desconocido / conteo provisional, seleccionados, elegibles, descalificados y renuncias.
- Cobertura documental y estado de cotejo; presencia de adendas, modificaciones y discrepancias.

Los campos estándar se expresan en columnas comprensibles; las variaciones se agregan de forma abierta, **nunca a una caja opaca de JSON como única interfaz**.

## 5. Contrastes dentro de una convocatoria

Permitir comparar por campo:
- Excel ↔ convocatoria ↔ resultados (por ejemplo código, fechas, título, entidad, plazas).
- Requisito publicado ↔ condición utilizada en evaluación, sin declarar de oficio si es legítimo.
- Criterios y ponderaciones anunciadas ↔ columnas y puntajes realmente aplicados.
- Valoración por postulante ↔ total reportado, con recalculo sólo cuando las reglas estén explícitas y suficientes.
- Texto previo ↔ adenda ↔ texto posterior, preservando la secuencia temporal y la literalidad.

Los informes señalan **diferencia, ausencia de evidencia, modificación documental o cálculo reproducible**, nunca «mala práctica», «fraude», «irregularidad demostrada» u otra calificación de oficio. La interpretación corresponde a quien hace la veeduría.

## 6. Vista de producto y navegación

**Pantalla de inicio: matriz/comparador**, no lista de anuncios.

1. Seleccionar uno o varios grupos mediante filtros.
2. Escoger variables/atributos que ocuparán las filas.
3. Ver columnas por convocatoria, con celdas completas y expandibles.
4. Abrir ficha integrada de una convocatoria con las tres fuentes alineadas por concepto, no como tres páginas de texto plano.
5. Abrir evidencia puntual en la **página/celda del PDF original**.
6. Registrar observación o solicitud de cotejo con vínculo a cada origen y exportar retroalimentación sin reescribir datos.

No se considera validada una fuente porque su enlace funciona o porque se obtuvo texto. La validación exige correspondencia entre la estructura PDF visible y los datos transformados.

## 7. Orden de implementación y puertas de calidad

**P0 — Prueba de fidelidad estructural:** elegir PDF de convocatoria, resultados y adenda con tablas distintas; extraer originales con posición de celdas, renderizar, cotejar y reconstruir una matriz completa sin perder ningún dato visual.

**P1 — Esquema común y contratos:** tablas relacionales explícitas para elementos del documento, celdas, relaciones rótulo/valor, requisitos, criterios, puntuaciones y versiones; preservar índices de procedencia y literalidad. Probar integridad sobre el piloto.

**P2 — Integración de expedientes:** mapear Excel + PDF de convocatoria + PDF de resultados por código con discrepancias identificadas, sin inferir documentos ausentes ni fusionar códigos ambiguos.

**P3 — Comparador transversal:** filtros por carrera/dependencia/estado y matriz de requisitos, condiciones económicas, criterios y resultados. Probar ejemplos con múltiples convocatorias y diferentes formatos.

**P4 — Veeduría asistida:** diferencias neutras, comparación adenda-criterios-evaluación, registro de revisión y exportación.

### Criterio de aceptación

Un lote no aumenta el contador de «convocatorias integradas» hasta que:
1. Las fuentes disponibles están delimitadas y los faltantes son explícitos.
2. Las tablas y celdas de **cada PDF recuperado** están reconstruidas y cotejadas visualmente.
3. Los campos están representados en la ficha común con trazabilidad a documento/página/celda.
4. La convocatoria se puede comparar con otras por esos campos sin abandonar la vista.
5. Cualquier elemento sin clasificar queda visible como pendiente, no oculto.

La cobertura se mide por **convocatorias completas e integradas**, no por cantidades de texto, filas o PDF visitados.

## 8. Restricción de alcance decisoria

El asistente no decide qué información se omite, qué dato es importante, la visibilidad del proyecto ni la valoración de las prácticas. Su función es conservar, estructurar, relacionar, contrastar y documentar hechos con procedencia. El responsable del proyecto decide las interpretaciones y publicación.
