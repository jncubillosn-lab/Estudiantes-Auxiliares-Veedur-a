# Veeduría de convocatorias de estudiantes auxiliares — UNAL Bogotá

**Propósito:** conservar, integrar y comparar la información original publicada sobre convocatorias de estudiantes auxiliares. La herramienta ofrece evidencia para la veeduría; **no determina por sí sola si una práctica es indebida**.

## Regla superior: una convocatoria solo cuenta si está validada

La [NORMA 00 — Validación integral e inviolable](docs/NORMA-00-validacion-integral.md) prevalece sobre cualquier implementación. Para cerrar cada convocatoria son obligatorios:

1. **Excel completo:** todas las filas y celdas correspondientes, cotejadas.
2. **PDF de convocatoria completo:** contenido, tablas, requisitos y versiones cotejados, con **URL real guardada**.
3. **Resultados comprobados:** verificar documentalmente si se publicó PDF, con URL de consulta, fecha y alcance.
4. **PDF de resultados completo cuando exista:** todas sus páginas, participantes, columnas, puntajes y notas, con URL real guardada. Si no está disponible tras la búsqueda verificada, registrar esa conclusión y su evidencia; **no presumir ausencia por una celda vacía**.
5. **Integridad y cierre:** evidencias, incidencias y revisión final persistidas; acta aceptada por la base.

**Cualquier requisito incumplido impide contar la convocatoria como validada.** Las cifras de inventario, PDFs leídos y pruebas automáticas no sustituyen esta métrica.

## Jerarquía arquitectónica inviolable

**La base de datos es el núcleo y contrato central de información.** La visualización y la extracción externa realizada por esta IA dependen de ella, no al revés. Sus limitaciones **no justifican alterar, omitir ni sustituir** datos originales o condiciones de validación. Toda ampliación del modelo se decide desde la base y se documenta con sus efectos sobre los dos componentes.

Esta jerarquía desarrolla la [NORMA 00](docs/NORMA-00-validacion-integral.md) y está explicada en la [referencia general](docs/00-REFERENCIA-GENERAL.md).

## Estado real del corte histórico

| Indicador | Estado |
|---|---:|
| Convocatorias **validadas** | **0** |
| Convocatorias identificadas | 42 |
| Filas / celdas Excel capturadas | 43 / 470 |
| PDF con respaldo **textual previo** | 16 (7 convocatorias, 9 resultados) |
| PDF reales con tablas visualmente cotejadas | **0** |

Los cuatro lotes originales permanecen en `data/lotes/`. La base **SQLite v3 es construible** desde ellos, conserva las capturas originales y sus enlaces PDF, pero **no transforma retroactivamente los PDF en documentos cotejados ni crea actas de validación**.

## Documentación vigente (único punto de partida)

| Documento | Propósito |
|---|---|
| [Referencia general](docs/00-REFERENCIA-GENERAL.md) | Objetivos, jerarquía, estado y mapa de documentos. |
| [Norma 00](docs/NORMA-00-validacion-integral.md) | **Máxima jerarquía:** integridad de la validación y métrica principal. |
| [Norma 01](docs/NORMA-01-integridad-exhaustividad.md) | Integridad de los **originales** y separación de sintéticos. |
| [Norma 02](docs/NORMA-02-integracion-comparabilidad.md) | Expediente integrado y comparación transversal. |
| [Norma 03](docs/NORMA-03-extraccion-externa-ia.md) | La **IA realiza la extracción** externamente; el software controla el proceso. |
| [Norma 04](docs/NORMA-04-validacion-convocatorias.md) | Puertas A–E y reglas de acta **en v3**. |
| [Base v3: operación y garantías](docs/BASE-V3-OPERACION-Y-GARANTIAS.md) | Estructura SQLite, construcción, pruebas y límites. |
| [Contrato de entrada del visualizador](docs/CONTRATO-V3-VISUALIZACION.md) | **Un único JSON** con originales, validación y sintéticos separados. |
| [Contrato de entregas de IA](docs/CONTRATO-V3-EXTRACCION-IA.md) | Qué debe leer, entregar, cotejar y registrar la IA; límite de 50 códigos. |
| [Continuidad y validación](docs/02-CONTINUIDAD-Y-VALIDACION.md) | Procedimiento vigente para retomar los trabajos. |

**Contrato ejecutable:** `db/estructura_v3.sql`, `config/contrato_ia_v3.json`, `scripts/construir_base_v3.py`, `scripts/exportar_base_v3.py`. No se añade un motor automático de extracción de PDF: **la interpretación documental corresponde a esta IA**.

## Construcción reproducible de la base

```bash
python scripts/probar_estructura_v3.py
python scripts/probar_construccion_v3.py
python scripts/probar_exportacion_v3.py
python scripts/probar_control_ia_v3.py
python scripts/probar_registro_ia_v3.py
python scripts/construir_base_v3.py --salida salidas/convocatorias_v3.sqlite
python scripts/exportar_base_v3.py --db salidas/convocatorias_v3.sqlite --salida salidas/expedientes_v3.json
```

[GitHub Actions — validación y artefactos SQLite + JSON](https://github.com/jncubillosn-lab/Estudiantes-Auxiliares-Veedur-a/actions).

## Publicación web y antecedentes

**[Interfaz principal](https://jncubillosn-lab.github.io/Estudiantes-Auxiliares-Veedur-a/)**: `index.html` consulta exclusivamente `data/expedientes_v3.json`, proyección generada desde SQLite v3 por [el flujo de publicación del visor](.github/workflows/publicar_visor_v3.yml). Muestra una lista sin filtros y un expediente por convocatoria, con fuentes originales, detalles completos, resultados, controles y sintéticos por separado. El [comparador v2](comparador-v2.html) se conserva como herramienta histórica; no es una comparación certificada sobre v3. El visor anterior sigue disponible en `visor.html`.

**Alcance normativo pendiente:** la ficha documental v3 representa los datos, pero la comparación transversal simultánea exigida en la [NORMA 02](docs/NORMA-02-integracion-comparabilidad.md) todavía no está implementada sobre v3. La simplificación de la pantalla principal no modifica este requisito de la base ni autoriza afirmar su cumplimiento.

Las especificaciones antiguas y el desarrollo previo se consultan solo como **antecedentes**, no como instrucciones vigentes. Véase el [registro histórico de decisiones](docs/01-REGISTRO-DECISIONES.md) y el [archivo de documentación heredada](docs/historico/INDICE.md).

**La responsabilidad de la visibilidad/publicación corresponde al responsable del proyecto.** Ningún procedimiento de la IA altera los datos originales por iniciativa propia.
