# Arquitectura vigente — Base de datos SQLite v3

**Norma suprema:** [NORMA 00](NORMA-00-validacion-integral.md).  
**Esquema ejecutable:** [db/estructura_v3.sql](../db/estructura_v3.sql).  
**Operación:** [BASE-V3-OPERACION-Y-GARANTIAS](BASE-V3-OPERACION-Y-GARANTIAS.md).

## 1. Decisión central

La **convocatoria** es la unidad de integración, no una fila de Excel ni un PDF aislado. Cada código agrupa fuentes, versiones, observaciones originales, verificaciones, actas y cálculos **sin perder las apariciones literales** de cada fuente.

La base mantiene tres capas independientes:

1. **Originales inmutables:** Excel (todas las filas y celdas), PDF de convocatoria, PDF de resultados si existe, adendas y anexos. Cada PDF tiene URL real, versión y estructura de páginas, elementos, tablas, celdas y listas.
2. **Validación documental:** comprobación de resultados, cobertura por documento y tipo de elemento, evidencias para cada criterio A–E, incidencias/resoluciones y actas de cierre.
3. **Sintéticos opcionales:** indicadores y comparaciones derivados, con fórmula, versión e insumos rastreables, **sin sustituir originales**.

## 2. Modelo implementado

El esquema actual define **31 tablas y 5 vistas**. Grupos:

| Grupo | Relaciones principales |
|---|---|
| Convocatorias y fuentes | `v3_convocatoria`, `v3_fuente`, `v3_convocatoria_fuente` |
| Capturas literales de origen | `v3_captura_lote`, `v3_excel_fila`, `v3_excel_celda`, `v3_lectura_pdf_previa` |
| Estructura PDF que debe entregar la IA | `v3_pdf_pagina`, `v3_pdf_elemento`, `v3_pdf_tabla`, `v3_pdf_celda`, `v3_lista_original`, `v3_item_original`, `v3_resultado_fila`, `v3_resultado_valor` |
| Datos e indicadores | `v3_dato_original`, `v3_indicador_sintetico`, `v3_indicador_insumo` |
| Comprobación de resultados | `v3_consulta_resultados` (encontrado / sin PDF verificado al corte / indeterminado) |
| Cotejos y criterios | `v3_revision_fuente`, `v3_metrica_requerida`, `v3_revision_metrica`, `v3_puerta`, `v3_criterio`, `v3_cumplimiento` |
| Incidencias y actas | `v3_incidencia`, `v3_resolucion_incidencia`, `v3_acta_validacion`, `v3_acta_fuente` |
| Trazabilidad del trabajo externo | `v3_entrega_ia`, `v3_control_lectura` |

### Vistas de consumo

- `v3_convocatorias_validadas`: códigos que conservan cierre vigente conforme a las reglas del esquema.
- `v3_metrica_principal`: **convocatorias validadas** y, como dato auxiliar, identificadas.
- `v3_estado_por_convocatoria`: no iniciada / en curso / bloqueada / validada.
- `v3_fuentes_de_expediente`: enlaces y estados por documento.
- `v3_cobertura_para_visualizador`: cobertura declarada/cotejada por categoría y fuente.

**No existe una autorización para editar originales porque el visualizador o un indicador lo necesiten.** Las capturas y evidencias se guardan con registros inmutables y correcciones aditivas.

## 3. Puertas A–E

La base dispone de **espacio de evidencia individual** por criterio y fuente, no de un simple booleano manual:

- **A:** Excel íntegro y cotejado.
- **B:** PDF de convocatoria y todas las versiones/adendas/anexos disponibles, con URL y cotejo de páginas, tablas y elementos.
- **C:** comprobación real de publicación de resultados con URL, fecha, alcance y conclusión.
- **D:** PDF de resultados íntegro cuando existe; omisión de D solo ante ausencia **verificada al corte**.
- **E:** persistencia, trazabilidad, revisión de fuentes y cierre sin incidencias críticas.

La aceptación se registra en `v3_acta_validacion` y se refleja en las vistas de estado. La aparición de nuevas fuentes o una comprobación posterior de resultados puede retirar el estado actual de validación hasta un nuevo cotejo.

**Las pruebas SQL no prueban por sí mismas que una extracción visual fue exhaustiva.** La lectura/cotejo material sigue siendo obligación de la IA externa; los controles del programa evitan inconsistencias declaradas y falsas actas.

## 4. Entrada y salida única

```text
Fuentes originales ──(lectura y cotejo por IA externa)──> SQLite v3
                                          ├─ originales íntegros
                                          ├─ evidencia A–E
                                          └─ sintéticos adicionales
                                                        ↓
                                        exportar_base_v3.py
                                                        ↓
                                           expedientes_v3.json
                                                        ↓
                                         visualizador futuro v3
```

- **Entrada/contrato IA:** [CONTRATO-V3-EXTRACCION-IA](CONTRATO-V3-EXTRACCION-IA.md) · [configuración](../config/contrato_ia_v3.json). Máximo **50 convocatorias distintas por interacción**.
- **Salida/contrato para visualizador:** [CONTRATO-V3-VISUALIZACION](CONTRATO-V3-VISUALIZACION.md), con originales, controles y sintéticos separados dentro del expediente.
- **Construcción reproducible:** `scripts/construir_base_v3.py`; pruebas de base y exportación en [GitHub Actions](https://github.com/jncubillosn-lab/Estudiantes-Auxiliares-Veedur-a/actions).

## 5. Estado real

**42 convocatorias identificadas, 43 filas Excel, 470 celdas y 16 PDF de lectura textual previa** incorporables al SQLite v3 desde los cuatro lotes históricos. **Ningún PDF se ha cotejado visualmente íntegro y hay 0 convocatorias validadas**. Los binarios de PDF no están dentro de los lotes históricos.

La página de GitHub Pages **todavía consume v2**. Es histórico el diseño v2 y no debe confundirse con el contrato vigente v3. [Archivo histórico](historico/INDICE.md).
