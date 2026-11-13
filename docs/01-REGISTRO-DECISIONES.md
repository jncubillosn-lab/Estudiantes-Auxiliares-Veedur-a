# Registro histórico de decisiones, problemas y correcciones

**Carácter:** historia del desarrollo, no especificación técnica ejecutable.  
**Norma vigente:** [NORMA 00](NORMA-00-validacion-integral.md).  
**Estado actual:** [referencia general](00-REFERENCIA-GENERAL.md) · [base v3 operativa](BASE-V3-OPERACION-Y-GARANTIAS.md).

## Secuencia de decisiones

1. **Fuentes y Excel:** se consultó una copia de la hoja de convocatorias abiertas/cerradas, con celdas y enlaces reales. Se comprobó que algunas referencias a resultados eran **texto**, no URLs de PDF. Ausencia de enlace **no equivale** a inexistencia de resultados.
2. **Cuatro lotes iniciales:** 3 + 5 + 10 + 25 filas Excel, para 42 códigos distintos (43 filas en total). Se guardaron 470 celdas y transcripciones de 16 PDF. La duplicación del código `2026-C2324` demuestra que código y fila no son la misma unidad.
3. **Problema de fidelidad:** convertir PDF en texto plano deshace filas/columnas. Los patrones textuales de postulaciones eran **candidatos de extracción**, no tablas cotejadas. Se descartó contar PDF leído como PDF validado.
4. **Corrección de integridad:** quedó prohibido reemplazar listas de requisitos por conteos, resultados por totales o datos originales por versiones seleccionadas. **Originales inmutables** y **sintéticos separados**. La selección de visibilidad corresponde al responsable del proyecto.
5. **Corrección del objetivo:** el visor inicial era un catálogo; se exigió una **matriz comparativa transversal** entre convocatorias, con inspección de requisitos, criterios, evaluaciones, diferencias y fuentes originales.
6. **Publicación:** GitHub Pages se configuró desde `main/(root)`. El sitio publicado mantiene el comparador **v2** y el anterior visor `visor.html`; no constituye evidencia de cumplimiento v3.
7. **Orden arquitectónico:** primero **estructura de la base**, después **contrato de visualización**, por último la **extracción externa por IA**. El sistema no debe añadir un motor de interpretación automática de PDFs.
8. **Definición de validada:** se detectó el error de tratar 42 códigos como «avance validado». Se adoptó la **NORMA 00**, con Excel íntegro, PDF de convocatoria íntegro, comprobación de resultados, PDF de resultados íntegro cuando exista y acta verificable. Resultado real del corte: **0 validadas**.
9. **Reinicio de base v3:** se construyó un modelo con fuentes y URL, tablas/celdas/listas, cotejos por criterio, incidencias, actas y cómputo SQL. La construcción conserva íntegros los lotes antiguos sin certificar PDFs históricos.
10. **Contratos v3:** el futuro visualizador recibirá un único JSON desde SQLite; esta IA entregará contenidos y cotejos reales en lotes de hasta 50 códigos. Los scripts solo reciben, almacenan y controlan, **no leen ni interpretan** los PDF.

## Casos conocidos que no deben interpretarse como hallazgos probados

- `2026-C2381`: fechas de cierre discordantes entre fuentes.
- `2026-C2312` y `2026-C2302`: posible discrepancia entre referencia e identificación interna en resultados.
- `2026-C2324`: dos filas Excel con el mismo código, **ambas conservadas**.
- `2026-C2308`: transcripción textual escasa; no permite afirmar ausencia de postulaciones.
- `2026-C2361` y `2026-C2363`: adendas con cambios que requieren análisis de versiones.

Se trata de **pistas para cotejo documental**, no de conclusiones sobre prácticas indebidas.

## Archivos anteriores

La [documentación histórica](historico/INDICE.md) conserva antecedentes v1/v2, diagnósticos y el contrato de consulta anterior, **sin precedencia operativa**. Los scripts y esquemas heredados permanecen en GitHub para reproducibilidad, pero las únicas instrucciones actuales de implementación se encuentran en los **contratos v3**.

**No se borra la historia para simular que las versiones anteriores cumplieron los criterios actuales.**
