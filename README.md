# Revisión de convocatorias — estudiantes auxiliares UNAL

Este proyecto conserva e integra la información **original y verificable** de convocatorias. La interpretación de hallazgos corresponde a las personas usuarias, no al sistema.

## NORMA 00 — Regla suprema

La **base de datos v3 es el núcleo y contrato central**; la interfaz y la extracción de IA dependen de ella. Ninguna convocatoria cuenta como validada sin Excel completo, publicación PDF completa, búsqueda documentada de resultados, PDF de resultados completo cuando exista, evidencia de cotejo y acta A–E aprobada. **Identificada, extraída y validada son estados distintos**.

## Estado del primer corte v3 — 13 de noviembre de 2026

| Métrica de captura | Valor |
|---|---:|
| Convocatorias identificadas | **96** |
| Abiertas / cerradas | 36 / 60 |
| Filas / celdas literales Excel | 97 / 1.031 |
| PDF de publicación / resultados enlazados | 97 / 24 |
| Páginas con extracción textual inicial | 397 |
| **Convocatorias validadas A–E** | **0** |

El corte es **preliminar**; sus textos y coordenadas no equivalen a cotejo visual de tablas ni de puntajes. El registro de incidencias y de incertidumbres forma parte integral de los originales.

**[Detalle del corte y de la migración](docs/CORTE-IA-V3-2026-11-13.md)** · **[NORMA 05 — Orden de cerradas](docs/NORMA-05-ORDEN-EXTRACCION-CERRADAS.md)**.

## Construcción reproducible y sin contaminación histórica

Los datos de entrada vigentes son `data/ia_v3/integrado_96_2026-11-13.json.zlib.b64` y los **121 PDF originales** archivados con manifiesto de integridad en `data/ia_v3/pdf_originales/` (JSON de IA original íntegro, comprimido en zlib y codificado Base64; SHA-256 verificable). Los **viejos cuatro archivos** `data/lotes/lote_*.json` y los seeds SQL obsoletos se eliminaron; no se mezclan ni se utilizan en la construcción del SQLite v3.

```bash
python scripts/probar_estructura_v3.py
python scripts/probar_construccion_v3.py
python scripts/probar_exportacion_v3.py
python scripts/probar_control_ia_v3.py
python scripts/probar_registro_ia_v3.py
python scripts/construir_base_v3.py --salida salidas/convocatorias_v3.sqlite
python scripts/exportar_base_v3.py --db salidas/convocatorias_v3.sqlite --salida salidas/expedientes_v3.json
```

El constructor no sobrescribe archivos existentes. La exportación desde SQLite produce `data/expedientes_v3.json` para la [interfaz publicada](https://jncubillosn-lab.github.io/Estudiantes-Auxiliares-Veedur-a/) mediante GitHub Actions. Los resultados no cotejados se señalan como tales, no se promueven a actas ni a indicadores validados.

## Contratos vigentes

[Referencia general](docs/00-REFERENCIA-GENERAL.md) · [NORMA 00](docs/NORMA-00-validacion-integral.md) · [NORMA 01](docs/NORMA-01-integridad-exhaustividad.md) · [NORMA 02](docs/NORMA-02-integracion-comparabilidad.md) · [NORMA 03](docs/NORMA-03-extraccion-externa-ia.md) · [NORMA 04](docs/NORMA-04-validacion-convocatorias.md) · [NORMA 05](docs/NORMA-05-ORDEN-EXTRACCION-CERRADAS.md) · [Base v3](docs/BASE-V3-OPERACION-Y-GARANTIAS.md) · [Entrega IA v3](docs/CONTRATO-V3-EXTRACCION-IA.md) · [Contrato visualización v3](docs/CONTRATO-V3-VISUALIZACION.md).

La extracción interpreta los documentos **exclusivamente mediante IA**, no mediante el programa. El programa almacena y verifica estructura/evidencia. El comparador v2 y el visualizador heredado permanecen como referencia histórica, no como fuente de datos vigentes. Ninguna nueva característica de interfaz forma parte de esta migración.
