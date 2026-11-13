# Base de datos v3 — Operación y garantías

**Versión contractual:** 3.0 · **Corte operativo:** 2026-11-13 · **Autoridad:** NORMA 00.

La base de datos es el núcleo del proyecto. Define campos, relaciones, preservación y controles; la IA que efectúa extracción documental y la interfaz son componentes subordinados. El programa almacena los documentos y evidencias **que la IA realmente entregó**, nunca llena vacíos por inferencia.

## Esquema, captura y ejecución

- `db/estructura_v3.sql`: claves relacionales, fuentes inmutables, filas/celdas Excel, páginas/elementos/tablas PDF, listas/requisitos/resultados, evidencias de cobertura, puertas A–E y actas.
- `data/ia_v3/integrado_96_2026-11-13.json.zlib.b64`: **única captura de IA real vigente**, que contiene los tres lotes originales completos (36 abiertas y 60 cerradas). El archivo es JSON comprimido con zlib y codificado en Base64 para conservar exactamente sus bytes y permitir versionado Git.
- `scripts/construir_base_v3.py`: verifica SHA-256 del JSON original y de los **121 PDF originales** versionados en 32 archivos ZIP (véase `data/ia_v3/pdf_originales/manifest.json`), almacena sus binarios BLOB en SQLite, reconstruye desde cero y comprueba integridad referencial y cantidades declaradas. **No realiza OCR, ni infiere requisitos, ni convierte automáticamente tablas visuales en datos cotejados.** Rechaza sobrescribir una base existente.
- `scripts/exportar_base_v3.py`: proyecta un JSON de lectura por convocatoria, separando `fuentes_originales`, `datos_originales`, `listas_originales`, `resultados_estructurados`, `indicadores_sinteticos` y `control_validacion`.
- `scripts/registrar_entrega_ia_v3.py` y validadores: aceptan futuras entregas conforme al contrato sin inventar contenido ni validar expedientes automáticamente.

### Operación

```bash
python scripts/probar_estructura_v3.py
python scripts/probar_construccion_v3.py
python scripts/probar_exportacion_v3.py
python scripts/probar_control_ia_v3.py
python scripts/probar_registro_ia_v3.py
python scripts/construir_base_v3.py --salida salidas/convocatorias_v3.sqlite
python scripts/exportar_base_v3.py --db salidas/convocatorias_v3.sqlite --salida salidas/expedientes_v3.json
```

El workflow `validar_v3.yml` ejecuta controles y publica como artefactos el SQLite y su proyección. `publicar_visor_v3.yml` proyecta esa base desde los datos nuevos, actualiza `data/expedientes_v3.json` y la muestra a través de `index.html`. Ninguno de esos artefactos es otra fuente original.

## Estado verificable

| Indicador | Valor | Significado |
|---|---:|---|
| Códigos identificados | 96 | Inventario, no validación |
| Filas / celdas Excel | 97 / 1.031 | Captura literal conservada |
| Fuentes PDF convocatoria / resultados | 97 / 24 | 121 referencias con URLs originales |
| Páginas registradas | 397 | Transcripción inicial con posiciones; cotejo visual pendiente |
| Tablas PDF reconstruidas y cotejadas | 0 | No se inventaron columnas ni filas |
| Actas A–E / convocatorias validadas | **0 / 0** | Métrica de NORMA 00 |

La captura conserva diferencias de fechas, conflictos de códigos, PDFs distintos asociados a un mismo código y límites de lectura en resultados. Véase [detalle del corte](CORTE-IA-V3-2026-11-13.md) y [contrato de extracción por IA](CONTRATO-V3-EXTRACCION-IA.md).

## Política de limpieza inicial

Se descartan **las cuatro capturas históricas de 42 códigos y sus seeds derivados**, junto con la exportación v2 y el antiguo estado de validación. Se conserva el esquema v3, contratos, controles, pruebas y páginas. Ninguna cifra histórica se mezcla con la base inicial de 96. Para nuevas tandas la IA continuará desde `2026-C2285`, con el orden establecido en NORMA 05 y límite máximo de 50 por interacción.

**Límites actuales:** los 121 PDF originales están archivados por URL, SHA-256 y bytes BLOB verificables en SQLite. No obstante, almacenar y verificar bytes no sustituye examinar visualmente todas las páginas. La reconstrucción de tablas y cotejo visual siguen pendientes; por tanto, la base no certifica integridad material de los documentos, aunque preserve los datos ya extraídos sin pérdida.
