# Estado de implementación v2 — 13 de noviembre de 2026

> **Nota histórica (13-11-2026):** este documento conserva el estado y las decisiones **en el momento en que fue redactado**. Algunas referencias a `index.html`, extractores experimentales o «próximo trabajo» han cambiado. Para el **estado vigente**, consultar [Referencia general](00-REFERENCIA-GENERAL.md), [Registro de decisiones](01-REGISTRO-DECISIONES.md) y [Continuidad](02-CONTINUIDAD-Y-VALIDACION.md). No reinterpretar una fase histórica como la arquitectura actual.


**Orden exigido:** base de datos → comparador → extracción. El usuario determina el tratamiento, la visibilidad y la interpretación de los datos.

## 1. Modelo relacional (implementado y probado)

- [db/estructura_v2.sql](../db/estructura_v2.sql): 19 tablas aditivas sobre el repositorio actual, sin alterar `db/schema.sql` ni los cuatro lotes JSON.
- Fuentes originales: binario exacto en BLOB con SHA256, captura literal de Excel, páginas PNG y texto con geometría, tablas/celdas, campos, listas e ítems, filas/columnas de resultados.
- Datos sintéticos: tablas separadas y vinculadas a campos/celdas originales, no son reemplazos.
- Triggers impiden borrar o actualizar originales ya persistidos. Una corrección se registra mediante una nueva versión/corrida.
- Código de convocatoria como clave de integración; cada código observado en las distintas fuentes se conserva independientemente, sin inventar que coinciden.
- `scripts/importar_excel_v2.py` conserva íntegramente cada celda de los 4 lotes tal como se capturó. Importa 43 filas, 470 celdas, 42 convocatorias distintas. **Todavía no es una copia binaria nativa de la hoja de Google Sheets**.
- `scripts/probar_estructura_v2.py` verifica que una lista de 7 requisitos sigue teniendo sus 7 elementos al eliminar un indicador sintético y que modificar originales se rechaza.

**Límite de calidad:** disponer de estructura SQL no implica que los PDF reales ya estén convertidos.

## 2. Comparador web (prototipo separado)

- [comparador-v2.html](../comparador-v2.html), también accesible desde GitHub Pages en `/comparador-v2.html`.
- Compara variables como requisitos, criterios, programa, facultad, dependencias, fechas, estímulos, participantes y puntuaciones **por convocatoria**.
- Permite seleccionar múltiples convocatorias sin límite artificial, buscar por programa/facultad/estado y verificar celdas originales de Excel.
- Cuando `data/exportacion_v2.json` contenga información estructurada de los PDF, presenta sus valores, **listas completas, tablas/celdas completas y procedencia**. Los indicadores sintéticos se muestran con identificación explícita.
- Hoy las celdas de PDF no extraídas aparecen como **pendientes**, no como cero, no disponibles de facto o listas vacías.
- El visor existente `index.html` no fue reemplazado durante este desarrollo.
- `scripts/probar_comparador_v2.py` comprueba estructura, sintaxis JS y conservación de la fuente Excel, **no verifica la interacción visual del navegador**.

**Límite de calidad:** la matriz comparativa es real para los campos Excel, pero los requisitos y evaluaciones PDF están pendientes de extracción estructural real.

## 3. Operación vigente: extracción externa por IA

**Corrección arquitectónica del 13 de noviembre de 2026.** La extracción y reconstrucción de los PDF reales serán realizadas directamente por la IA en sus interacciones, **no** por un programa extractor autónomo.

- [Norma 03](NORMA-03-extraccion-externa-ia.md): proceso y responsabilidad de lectura integral.
- [Parámetros del proceso](../config/operacion_ia.json): límite duro de **50 convocatorias distintas por interacción**, orden de etapas y reglas contra lecturas redundantes.
- [Validador de manifiestos](../scripts/validar_lote_ia.py): controla secuencia, duplicidad de lecturas de la misma región, cobertura declarada, pendientes y persistencia.
- [Pruebas de control](../scripts/probar_control_lotes_ia.py): muestran que dos ubicaciones con el mismo texto son originales distintos, mientras que repetir una lectura ya registrada se detecta.
- Un documento con resultados, convocatorias o adendas faltantes NO queda marcado completo; la falta de enlace se documenta sin inferir inexistencia.
- El protocolo se ejecuta y registra dentro de la interacción y se guarda junto a los expedientes; el **siguiente lote se reanuda desde lo persistido**, no desde cero.

**Herramientas experimentales anteriores:** `scripts/extraer_pdf_v2.py`, `scripts/importar_pdf_v2.py` y `scripts/probar_extraccion_v2.py` siguen en GitHub como apoyo opcional para imágenes/coordenadas. Su existencia y sus pruebas sobre un PDF ficticio son históricas; **no son el flujo operativo ni tienen autorización para interpretar automáticamente documentos reales**. La acción CI habitual comprueba estructura, comparador y controles del protocolo, sin ejecutar un extractor de PDF.

Ejemplo de validación:

```bash
python scripts/validar_lote_ia.py tests/fixtures/lote_ia_ejemplo.json
python scripts/validar_lote_ia.py data/manifiestos/lote_05.json --anteriores data/manifiestos/lote_01.json data/manifiestos/lote_02.json
```

El segundo comando describe el uso cuando esos manifiestos reales existan; no indica que ya se hayan creado. **La validación de manifiesto verifica disciplina del proceso, no reemplaza el cotejo visual de PDF.**

## Orden de mejora y puertas de validación

1. **Cotejar una convocatoria PDF real**: páginas, cabeceras, requisitos, celdas, fusiones y elementos extraordinarios contra su raster; corregir nuevas versiones sin tocar originales.
2. **Cotejar un PDF de resultados real**: participantes y cada columna de criterios, puntajes y decisiones.
3. **Cotejar un caso con adendas**: secuencia y cambios conservando texto anterior.
4. Verificar que cada campo de las tres fuentes se consulta desde la **misma ficha integrada**.
5. Verificar que la matriz permite comparar estos tres expedientes, con listas completas, sin conteos que los reemplacen.
6. Solo entonces aumentar el tamaño de los lotes; los PDF no accesibles o ilegibles quedan abiertos y explícitos.

Ningún documento, fuente ni valoración podrá marcarse automáticamente como «cotejado». El sistema es una herramienta documental; **no decide qué constituye una buena o mala práctica**.

## Tests y preservación

- [GitHub Actions: Validar arquitectura v2](https://github.com/jncubillosn-lab/Estudiantes-Auxiliares-Veedur-a/actions) ejecuta las tres pruebas.
- Los archivos `data/lotes/lote_01.json` a `lote_04.json`, `db/schema.sql` e `index.html` mantienen sus contenidos anteriores. Se trabajó con archivos v2 nuevos.
