# Arquitectura v2 y secuencia obligatoria de trabajo

**Estado:** especificación ejecutable inicial; no sustituye las fuentes ni modifica los lotes existentes.
**Orden aprobado:** 1. Base de datos → 2. Página comparadora → 3. Extracción de PDF.
**Normas superiores:** [Norma 01](NORMA-01-integridad-exhaustividad.md) y [Norma 02](NORMA-02-integracion-comparabilidad.md).

## 1 — Modelo de información íntegra

### Identidad
- **Convocatoria = número de convocatoria** como clave de integración.
- El código visible en cada fuente es un **dato original diferente de la clave de integración**: se preserva literalmente su aparición en Excel, convocatoria, resultado y adenda, incluso si no coincide con el código esperado.
- Cada convocatoria puede tener N filas de Excel, N PDF de convocatoria, N resultados, N adendas, N versiones. No deduplicar silenciosamente.
- La organización se divide en **originales inmutables**, **interpretaciones enlazadas sin sustitución**, **sintéticos derivados** y **revisiones**.

### Fuentes originales (obligatorias)
1. **Archivo original:** conservar copia binaria de PDF cuando esté disponible, hash SHA256, bytes, metadatos, URL, fecha de captura, versión y estado de acceso. En Excel conservar captura de sus celdas/hipervínculos/fórmulas/formato.
2. **Estructura de PDF por página:** tamaño, rotación, texto con coordenadas, dibujos, imágenes, anotaciones, casillas, líneas, geometría y orden. Incluir elementos no interpretados.
3. **Tablas y celdas:** cada tabla con su región; cada celda con fila, columna, celdas combinadas, texto íntegro, coordenadas y señalamiento de vacíos, ilegibles y dudas. Ninguna celda puede desaparecer por no ser clasificada.
4. **Campos y listas:** relación entre rótulo y valor, lista completa de requisitos, criterios de evaluación y subcriterios, elementos extraordinarios. La clasificación no debe sustituir el literal.
5. **Resultados:** las filas y todas las columnas de participantes y evaluaciones se conservan; su interpretación semántica es una *capa enlazada* con evidencia.

### Sintéticos (independientes)
- Conteos, indicadores, sumas, diferencias y normalizaciones se almacenan en tabla independiente con fórmula/versionado, entradas y estado.
- Si una convocatoria tiene nueve requisitos, hay nueve registros originales. El sintético `cantidad_requisitos=9` jamás los sustituye.
- Un campo puede tener varias versiones y discrepancias entre fuentes: se conservan **todas**.

### Reversibilidad y pruebas
1. Verificar binarios/hashes y total de páginas.
2. Verificar cobertura de elementos visibles, tablas y celdas originales en cada página.
3. Consultar la lista íntegra de requisitos desde el registro de convocatoria, y acceder a su fuente.
4. Inspeccionar cada columna de resultados desde los registros originales.
5. Quitar todos los sintéticos y comprobar que los datos originales permanecen completos.
6. Alterar o eliminar datos originales debe ser rechazado por diseño: se agregan nuevas versiones/correcciones con trazabilidad, no se reescribe el registro histórico.

**Entregable:** `db/estructura_v2.sql` (aditivo, no toca `db/schema.sql`), pruebas del contrato y ejemplos sintéticos solo para test.

## 2 — Comparador web

El producto principal es una **matriz de convocatorias**. Los datos originales siguen disponibles mediante una ficha integrada y evidencia expandible, sin tener que abrir un bloque indiferenciado de texto. Partes:

1. Filtros multicriterio: carrera/programa, facultad/dependencia, estado, rango de fechas, requisitos, estímulo, criterios, disponibilidad de resultados y estado de extracción.
2. Selector de múltiples convocatorias.
3. Matriz **atributo × convocatoria**. Las filas muestran campos originales (sin comprimir listas) y opcionalmente sintéticos etiquetados.
4. Al expandir una celda: valor íntegro, fuente, PDF original, página, coordenada, celda/tabla y adendas.
5. Ficha integrada: Excel + convocatoria + resultados alineados por conceptos; acceso a las tablas originales de cada fuente.
6. Comparar valores diferentes de múltiples fuentes de un mismo código sin resolverlos arbitrariamente.
7. Registro de anotaciones humanas vinculadas a evidencia, sin reescribir datos.
8. Panel de estado honesto: `PDF sin enlace`, `PDF localizado`, `PDF descargado`, `estructura extraída`, `visualmente cotejado`, `expediente integrado`.

El HTML `index.html` existente **no se reemplaza** durante el desarrollo. El comparador v2 se publica en una ruta separada hasta completar la validación.

**Entregable:** `comparador-v2.html` y contrato de intercambio `data/contrato-v2.md`. El comparador debe tolerar campos sin extraer, **sin inventar** valores.

## 3 — Proceso de extracción, posterior al contrato y la interfaz

**Secuencia documental**:
1. Descargar PDF **binario original** de enlace verificado y calcular hash.
2. Renderizar y conservar referencia visual de todas las páginas.
3. Extraer sin pérdida **objetos con coordenadas** (palabras/bloques, trazos, imágenes, anotaciones).
4. Detectar tablas y asignar sus celdas, incluyendo celdas vacías/combinadas.
5. Registrar elementos no clasificados; nunca descartarlos.
6. Clasificar rótulos, valores y listas; enlazarlos a elementos/celdas originales.
7. Vincular por código de convocatoria sin borrar códigos disonantes.
8. Contrastar estructura reconstruida con página visual; **cero documentos pasan a `cotejado` automáticamente**.
9. Escribir lote atómico con estados, excepciones y una prueba de reversibilidad.
10. Publicar estado de cada convocatoria y exportación al comparador.

**Extracción ≠ validación:** el software puede capturar coordenadas y proponer celdas; una prueba visual de integridad debe confirmar las relaciones complejas, casillas y tablas fusionadas. Si falla, se mantiene como `pendiente`.

**Entregable:** extractor v2 y protocolo de revisión. Se valida con PDF de convocatoria, resultados y adenda de formatos distintos; solo después se escala por lotes.

## Secuencia de mejora

Cambios de esquema → prueba de reversibilidad → contrato de salida → interfaz → extracción de un PDF → cotejo → mejoras documentadas → nuevo lote. No correr una carga masiva si alguna puerta de calidad está sin pasar.

## Estado de los datos actuales

Los cuatro lotes piloto (43 filas, 42 códigos, 16 PDF leídos como texto) permanecen intactos. **No constituyen una extracción estructural verificada de PDF**, ni hay aún expedientes plenamente integrados. Su contenido servirá como material de contraste, pero no se publicará como si fuera una base completada.
