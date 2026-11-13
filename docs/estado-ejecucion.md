# Estado de la primera ejecución — 13 de noviembre de 2026

## Evaluación crítica de la interfaz y nueva dirección — 13 de noviembre de 2026

Tras la revisión visual del usuario se constató que **el visor actual NO cumple la función principal de la veeduría**. Aunque permite buscar y leer textos, presenta los documentos como bloques planos, desarmando su estructura de tablas y columnas; por ello no sirve para comparar rigurosamente requisitos, criterios y resultados.

**No considerar el sitio actual como un comparador de convocatorias ni un instrumento de validación de criterios de selección.** Es una interfaz de navegación provisional. No se debe escalar la ingestión solo para alimentar ese formato.

### Recuento de cobertura (sin métricas engañosas)

- **42 códigos de convocatoria distintos** representados en **43 registros de Excel** (dos filas tienen el mismo código `2026-C2324`).
- **16 PDF con texto extraído**: 7 convocatorias y 9 resultados.
- **0 PDF con sus tablas/celdas reconstruidas y cotejadas visualmente**.
- **0 convocatorias con sus tres fuentes integradas y comparables por campo**.
- **51 registros provisionales** de participantes reconocidos por patrón: la estructura y el total real de postulantes NO están confirmados.
- **4 diferencias/observaciones documentales preliminares**: evidencias por contrastar, no calificaciones de prácticas.

### Redefinición del trabajo

El objetivo deja de ser publicar una lista de convocatorias con enlace a PDF y pasa a ser **integrar Excel + PDF de convocatoria + PDF de resultados en una única ficha semántica comparable**, sin sacrificar literalidad. El producto central deberá ser una **matriz transversal de varias convocatorias** con filtros por carrera, dependencia convocante, estado, requisitos, criterios, ponderaciones, modalidades, plazas, valores económicos y resultados.

La extracción debe reconstruir **rótulos, celdas, filas, columnas y coordenadas en página** del PDF antes de normalizar campos. La información textual ya guardada permanece como respaldo, pero **no puede considerarse extracción estructurada final**.

Una fila de participante detectada por una expresión regular **no equivale** a participante validado ni puede usarse para decir que solamente se presentó una persona.

El sistema registra diferencias y relaciones; **no determina si una práctica es adecuada, irregular o indebida**. Esa valoración corresponde al responsable del proyecto.

La especificación rectora es [NORMA 02 — Integración estructural y comparabilidad](NORMA-02-integracion-comparabilidad.md), subordinada a NORMA 01. El actual `index.html`/`visor.html` permanece sin cambios en esta revisión; **está reconocido como prototipo no conforme con el objetivo definitivo**.

## Resultado persistido

Se ejecutaron cuatro etapas acumulativas, usando la copia de Google Sheets como referencia estática:

| Lote | Tipo | Expedientes (filas) | PDF con texto extraído | Celdas literales | Renglones PDF |
|---|---|---:|---:|---:|---:|
| 01 | Piloto | 3 | 3 | 33 | 415 |
| 02 | Primera implementación | 5 | 5 | 55 | 668 |
| 03 | Regular | 10 | 4 | 108 | 569 |
| 04 | Optimizado | 25 | 4 | 274 | 688 |
| **Total** | | **43** | **16** | **470** | **2.340** |

Se detectaron **51 filas candidatas de postulantes** mediante lectura literal y se registraron sus identificadores. Las puntuaciones y la asociación exacta con encabezados siguen pendientes de cotejo visual; no se presumió una calificación si el formato no permite establecerla.

## Verificación automática ejecutada

- [Ejecución satisfactoria de GitHub Actions](https://github.com/jncubillosn-lab/Estudiantes-Auxiliares-Veedur-a/actions/runs/43474267345) (13 de noviembre de 2026).
- El script validó las **470 celdas y los 16 textos íntegros de PDF** contra los JSON de origen; también comprobó la integridad SQLite.
- Se construyó exitosamente una base binaria con 43 expedientes, 16 documentos, 470 celdas, 2.340 renglones, 51 postulaciones provisionales y 4 hallazgos pendientes.
- [Artefacto SQLite privado](https://github.com/jncubillosn-lab/Estudiantes-Auxiliares-Veedur-a/actions/runs/43474267345/artifacts/14063085090) disponible temporalmente hasta el **20 de noviembre de 2026**. Los datos y SQL permanentes permiten reconstruirlo después de ese plazo.

## Persistencia
- `data/lotes/lote_01.json` a `lote_04.json`: fuentes textuales literales.
- `db/seed_lote_01.sql` a `seed_lote_04.sql`: tablas relacionales con los mismos textos.
- `db/schema.sql`: modelo SQLite.
- `scripts/verificar_base.py`: comparación de textos y celdas tras importación.
- `scripts/importar.py`: reconstrucción de la capa literal desde JSON.

## Limitaciones observadas
La mayoría de filas examinadas solo contienen códigos, no enlaces al PDF. Para los expedientes de esta ronda, ninguna fila aportó a la vez un PDF de convocatoria y uno de resultados. **43 registros no son 43 expedientes completos**.

Los PDF leídos son recuperaciones de texto, sin copia binaria local ni revisión visual de marcas, tablas y firmas. Por norma, **ningún expediente se considera auditado todavía**.

El archivo de resultados asociado a `2026-C2312` parece identificar `2026-C2302` en su contenido; y la convocatoria `2026-C2381` muestra una diferencia de fecha de cierre entre Excel y PDF. Se registrarán como contrastes pendientes, no como faltas probadas.

## Siguiente frontera técnica
1. Localizar y verificar enlaces a PDF que solo se citan mediante códigos.
2. Incorporar copias binarias/hash con permisos controlados.
3. Cotejar visualmente todas las páginas, tablas, casillas y columnas de resultados.
4. Completar los campos semánticos detallados sin pérdida del texto fuente.
5. Conservar cada hallazgo y sus evidencias, con estado de revisión.

**No se han alterado la hoja de origen ni los PDF de Google Drive.**
