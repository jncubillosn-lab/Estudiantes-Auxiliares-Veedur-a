# Estado de implementación v2 — 13 de noviembre de 2026

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

## 3. Extracción (proceso construido y probado con PDF sintético)

Scripts independientes:
- `scripts/extraer_pdf_v2.py`: a partir del PDF descargado conserva copia binaria **byte por byte**, hash, nombre original, páginas rasterizadas, caracteres con coordenadas, geometrías, imágenes, anotaciones y tablas candidatas con todas sus posiciones, incluidas celdas no detectadas.
- `scripts/importar_pdf_v2.py`: vuelca esas estructuras y el PDF binario a SQLite sin sobrescribir originales ni asignar códigos internos que no se hayan observado en la fuente.
- `scripts/exportar_comparador_v2.py`: exporta por convocatoria los campos, listas y tablas de las fuentes y los indicadores sintéticos de forma independiente.
- `scripts/probar_extraccion_v2.py`: crea un PDF **de prueba** con tabla; ejecuta extracción → base SQLite → salida de comparación. Confirma estructura, hash y que 7 ítems originales coexisten con indicador derivado.

**Límite de calidad:** las tablas son candidatas automáticas y todas sus páginas permanecen **pendientes de cotejo visual**. No se ha aplicado ni certificado esta nueva extracción sobre un PDF real de la UNAL. El estado visual es explícito.

### Ejecución reproducible

```bash
python -m pip install pymupdf pdfplumber
python scripts/probar_estructura_v2.py
python scripts/probar_comparador_v2.py
python scripts/probar_extraccion_v2.py

# Construcción inicial de SQLite con los cuatro lotes existentes:
python scripts/importar_excel_v2.py --db salidas/estructura_v2.sqlite

# Un PDF real previamente descargado del enlace verificado:
python scripts/extraer_pdf_v2.py archivo.pdf --numero 2026-C2381 --tipo convocatoria_pdf --salida salidas/extracciones_v2
python scripts/importar_pdf_v2.py salidas/extracciones_v2/EL_SHA256/manifest.json --db salidas/estructura_v2.sqlite

# La exportación se produce con salida nueva; no reescribe anteriores:
python scripts/exportar_comparador_v2.py --db salidas/estructura_v2.sqlite --salida data/exportacion_v2.json
```

El PDF real debe ser obtenido sin alteración del original. `EL_SHA256` es el directorio devuelto por el extractor; no se construyen direcciones arbitrarias ni se suponen documentos existentes.

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
