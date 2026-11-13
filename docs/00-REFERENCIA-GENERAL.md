# Referencia general vigente — Revisión de convocatorias

**Corte:** 2026-11-13. **Sistema:** estudiantes auxiliares, Universidad Nacional de Colombia. **Estado del corte:** preliminar, sin validaciones completas.

## Autoridad y dependencias

La **NORMA 00** es el criterio supremo de integridad y validación: la **base SQLite v3** es el contrato central de datos. La IA externa extrae y coteja; la interfaz consulta y muestra los datos. **Ninguna interfaz ni extractor puede reducir el universo de datos exigible a la base.**

Originales: todas las filas y celdas de la hoja, PDF completos de publicación y anexos/adendas, PDF de resultados cuando existan, junto con el registro documentado de su disponibilidad. No se inventa una ausencia porque falte un hipervínculo. Cada ocurrencia y su evidencia deben conservarse, sin reemplazarlas por un indicador sintético.

## Corte documental actual

[Informe del primer corte IA v3](CORTE-IA-V3-2026-11-13.md): 96 convocatorias identificadas, 97 filas y 1.031 celdas, 97 PDF de publicación, 24 de resultados, 397 páginas con texto preliminar. **0 expedientes validados por A–E y 0 actas**.

Los estados de las fuentes y los conflictos permanecen íntegros en el JSON original comprimido en `data/ia_v3/`. En esta fase los PDF no se han cotejado visualmente en su totalidad ni reconstruido todas sus tablas. Esta condición debe ser visible en cada expediente.

## Contratos de referencia (únicos vigentes)

- [NORMA 00 — Validación integral](NORMA-00-validacion-integral.md)
- [NORMA 01 — Integridad y exhaustividad](NORMA-01-integridad-exhaustividad.md)
- [NORMA 02 — Comparabilidad e integración](NORMA-02-integracion-comparabilidad.md)
- [NORMA 03 — Extracción por IA externa](NORMA-03-extraccion-externa-ia.md)
- [NORMA 04 — Validación individual A–E](NORMA-04-validacion-convocatorias.md)
- [NORMA 05 — Orden de extracción de cerradas](NORMA-05-ORDEN-EXTRACCION-CERRADAS.md)
- [Modelo de base v3](../db/estructura_v3.sql) · [operación v3](BASE-V3-OPERACION-Y-GARANTIAS.md)
- [Contrato de entrega de IA](CONTRATO-V3-EXTRACCION-IA.md) · [salida de visualizador](CONTRATO-V3-VISUALIZACION.md)

## Flujo

```text
Excel + documentos PDF originales
 -> lectura y extracción externa realizada por IA (no por el programa)
 -> JSON literal con fuentes, URLs, códigos, páginas, posiciones, incidentes
 -> verificación SHA + almacenamiento estructurado SQLite v3
 -> cotejo de integridad, puertas y actas (pendientes en este corte)
 -> proyección única para el visualizador
```

**Nota:** la generación de un SQLite reproducible o el funcionamiento de GitHub Actions no certifican extracción completa de PDF. El comparador histórico v2 no constituye la interfaz autoritativa v3. El contrato de comparación transversal completa continúa vigente y su interfaz es materia independiente.

El siguiente código cerrado por procesar es `2026-C2285`.
