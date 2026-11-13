# Arquitectura vigente — SQLite v3

La [NORMA 00](NORMA-00-validacion-integral.md) gobierna todo el proyecto. **La base de datos es el núcleo contractual.** Extracción externa por IA e interfaz dependen de ella; ninguna puede omitir información por limitaciones propias.

## Modelo

El contrato SQL [`db/estructura_v3.sql`](../db/estructura_v3.sql) separa:

- **Originales inmutables:** inventario por código, fuente y versión; URLs y PDF binarios con hash; filas/celdas Excel; páginas, elementos, tablas y celdas PDF; texto íntegro y posiciones; todos los requisitos y ocurrencias cuando se cotejen.
- **Control y evidencia:** consultas sobre disponibilidad de resultados, cobertura por categoría y fuente, incidencias, criterios y puertas A–E, actas y versiones.
- **Síntesis derivada (opcional):** indicadores vinculados a los datos originales; nunca los sustituyen.

La salida única para la interfaz es `scripts/exportar_base_v3.py` → `data/expedientes_v3.json`. La base SQLite se construye desde cero con `scripts/construir_base_v3.py`. El constructor **no interpreta PDF**, solo almacena y verifica los bytes y lecturas entregados por IA.

## Estado real del corte vigente (2026-11-13)

**96 códigos identificados**, 97 filas y 1.031 celdas Excel, **121 PDF binarios originales**, 397 páginas con texto y posiciones, **0 páginas visualmente cotejadas en su integridad, 0 actas A–E y 0 convocatorias validadas**. No se reconstruyeron automáticamente tablas de participantes ni puntajes.

Las 4 capturas históricas y sus seeds obsoletos fueron sustituidos, no mezclados. [Detalle de migración](CORTE-IA-V3-2026-11-13.md) · [Norma de continuidad](02-CONTINUIDAD-Y-VALIDACION.md) · [Contrato IA](CONTRATO-V3-EXTRACCION-IA.md) · [Contrato de visualización](CONTRATO-V3-VISUALIZACION.md).

La aplicación principal `index.html` consulta la proyección v3. `comparador-v2.html` y `visor.html` son únicamente antecedentes. El requisito de comparación transversal según [NORMA 02](NORMA-02-integracion-comparabilidad.md) continúa vigente, sin afirmar que la interfaz actual lo satisfaga.