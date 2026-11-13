# Referencia general vigente — Veeduría de convocatorias

**Corte documental:** 13 de noviembre de 2026.  
**Alcance:** Universidad Nacional de Colombia, sede Bogotá; convocatorias de estudiantes auxiliares.  
**Naturaleza:** guía de navegación y estado verificable; no es acta de auditoría de convocatorias reales.

## 1. Objetivo

Integrar por **código de convocatoria** tres fuentes documentales independientes: (A) hoja Excel, (B) PDF de convocatoria y modificaciones, (C) PDF de resultados cuando exista. La integración conserva **todas las apariciones originales**, su orden, tablas, celdas, listas, versiones y enlaces verificables. La interfaz debe comparar requisitos, condiciones y resultados entre convocatorias y permitir revisar la evidencia íntegra.

El sistema **no califica** automáticamente buenas o malas prácticas. La persona responsable interpreta las diferencias documentadas y decide la visibilidad de los datos. Los indicadores sintéticos son opcionales y **nunca reemplazan** originales.

## Principio estructural: la base es el núcleo

La **Norma 00** gobierna el proyecto. Bajo ella, la **base SQLite v3** constituye el contrato central que establece qué información existe, cómo se conserva y cómo se valida. La **interfaz** y la **extracción externa por IA** son componentes dependientes de la base, **no fuentes de autoridad para rediseñarla a conveniencia**.

**Dependencias:** Norma 00 → **base de datos** → {interfaz de consulta, extracción externa por IA}. El flujo de datos de ejecución puede ir desde las fuentes hacia la base y luego a la interfaz, pero **la dirección de dependencia arquitectónica es desde la base hacia ambos componentes**.

Si aparece contenido que la estructura no prevé, se documenta y se amplía/versiona el contrato **sin perder el original**; después se ajustan la salida para el visualizador y el protocolo de entrega de la IA. Los cambios deben preservar integridad y compatibilidad verificables.

## 2. Jerarquía y contratos vigentes

| Orden | Documento | Obligatoriedad |
|---|---|---|
| **Suprema** | [NORMA 00 — Validación integral](NORMA-00-validacion-integral.md) | **Solo cuentan convocatorias validadas** tras cumplir todas las puertas; ninguna excepción por fallos, plazos o volumen. |
| 1 | [NORMA 01 — Integridad de originales](NORMA-01-integridad-exhaustividad.md) | Preservación literal, estructural e inmutable de las fuentes y sus ocurrencias. |
| 2 | [NORMA 02 — Comparabilidad](NORMA-02-integracion-comparabilidad.md) | Expediente integrado y comparación transversal sin pérdida ni juicios automáticos. |
| 3 | [NORMA 03 — Extracción por IA externa](NORMA-03-extraccion-externa-ia.md) | La IA lee los PDF; el programa solo recibe datos y controla estructura, límites y evidencia. |
| 4 | [NORMA 04 — Cierre por convocatoria](NORMA-04-validacion-convocatorias.md) | Puertas A–E, URL, cobertura, actas y cómputo v3. |

**Arquitectura operativa:** [base de datos v3](BASE-V3-OPERACION-Y-GARANTIAS.md), [esquema SQL v3](../db/estructura_v3.sql) y [modelo v3 explicado](arquitectura-v3-validacion.md).

**Entradas y salidas contractuales:**
- [Entrega y cotejo de IA](CONTRATO-V3-EXTRACCION-IA.md), regida por [configuración v3](../config/contrato_ia_v3.json).
- [Única salida JSON para el visualizador](CONTRATO-V3-VISUALIZACION.md), generada por [exportar_base_v3.py](../scripts/exportar_base_v3.py).
- [Procedimiento de continuidad](02-CONTINUIDAD-Y-VALIDACION.md), dirigido a nuevas interacciones.

## 3. Unidad documental y estados

**Convocatoria identificada** significa que se encontró su código. **Convocatoria validada** significa que se cotejaron Excel y PDF de convocatoria íntegros, se comprobó la disponibilidad de resultados, se cotejó el PDF de resultados **si existe**, y se guardó el cierre con evidencias. La ausencia de enlace **no** equivale a una ausencia de PDF verificada.

Las evidencias deben incluir enlaces reales al PDF, versión y código literal observado, ubicación por página/celda, fecha/corte, cobertura por categoría y registro de incidencias. Una fuente con texto extraído pero sin reconstrucción visual es **parcial**. Los controles automáticos no certifican por sí solos que la IA leyó correctamente cada casilla.

## 4. Arquitectura actual

```text
Excel + PDF convocatoria + PDF resultados cuando existe + adendas/anexos
    ↓  lectura, estructuración y cotejo EXTERNOS por esta IA
Entregas íntegras + manifiesto por lote (≤ 50 convocatorias distintas)
    ↓  validaciones formales de entrada sin interpretar PDF
SQLite V3
    ├─ originales (fuentes, URL, filas, páginas, tablas y celdas)
    ├─ verificación (puertas A–E, evidencias, incidencias, actas)
    └─ sintéticos opcionales (fórmulas e insumos originales)
    ↓  exportación única verificable
JSON de expediente V3 → futuro visualizador comparador
```

**GitHub Pages no ejecuta SQLite.** La página actual `index.html` continúa utilizando **v2**; todavía no recibe el JSON v3. La base v3 ya se construye y exporta, sin modificar esa página.

## 5. Estado real del corte histórico

| Concepto | Cantidad | Significado |
|---|---:|---|
| **Convocatorias validadas** | **0** | Ninguna cumple el cotejo documental integral bajo Norma 00. |
| Convocatorias identificadas | 42 | Inventario de códigos, **no** expedientes auditados. |
| Filas Excel / celdas | 43 / 470 | Registros capturados de cuatro lotes, cotejados contra sus propios JSON. |
| PDF con transcripción previa | 16 | 7 de convocatoria y 9 de resultados, sin reconstrucción visual de tablas. |
| PDF realmente estructurados/cotejados en v3 | 0 | No existen actas de cotejo real. |

Los cuatro JSON se conservan en `data/lotes/`, completos e inalterados. La construcción v3 guarda la captura literal y SHA256, los valores de Excel, enlaces y textos PDF previos **sin conferirles validación**. No están incluidos los binarios PDF originales en esas capturas.

**Casos documentales que siguen pendientes de cotejo:** `2026-C2381` (fechas distintas), `2026-C2312` (código discordante en resultados), `2026-C2324` (dos filas Excel), `2026-C2308` (texto PDF breve), `2026-C2361` y `2026-C2363` (adendas). Son asuntos para revisar, no conclusiones de irregularidad.

## 6. Qué está implementado y qué NO

**Implementado y probado:** esquema SQL v3; constructor SQLite reproducible; exportación JSON por código; almacenamiento de entregas/manifiestos de IA; validadores de límites, lecturas y cobertura; pruebas contra las 470 celdas y 16 capturas textuales PDF.

**No ejecutado:** cotejo visual íntegro de PDF reales, validación de convocatorias, análisis transversal completo de requisitos/resultados, ni adaptación de la página web a v3. **Ninguna prueba automática convierte texto PDF parcial en un expediente validado.**

[Historial de decisiones y errores](01-REGISTRO-DECISIONES.md) · [Documentación heredada, solo archivo](historico/INDICE.md).
