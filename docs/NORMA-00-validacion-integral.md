# NORMA 00 — Validación integral e inviolable

**Jerarquía:** máxima. Rige todas las estructuras de datos, extracciones, vistas, pruebas, exportaciones y reportes. Es anterior a las Normas 01–04 y prevalece en caso de conflicto.

## Principio arquitectónico obligatorio — Centralidad de la base de datos

**La base de datos es el núcleo arquitectónico y el contrato central de información del proyecto.** La herramienta de visualización y la extracción externa realizada por esta IA son componentes **subordinados** a ese contrato. Esta jerarquía es una regla de diseño permanente, distinta del orden cronológico de trabajo.

1. **Base de datos → interfaz.** La base define qué originales, fuentes, relaciones, verificaciones, incidencias y derivados existen y cómo se conservan. La interfaz consulta y representa esa información; ninguna limitación visual permite omitirla, modificarla, resumirla en sustitución o alterar el modelo de validación.
2. **Base de datos → extracción por IA.** La base define la estructura de entrega, evidencia, completitud y validación. La IA interpreta y extrae íntegramente las fuentes **fuera del programa** y entrega lo que exige el contrato. El programa no asume esa interpretación ni reduce las exigencias de la base.
3. **Evolución desde el núcleo.** Si la IA encuentra datos originales no previstos, debe conservarlos sin pérdida, documentar el descubrimiento y ampliar/versionar el contrato de la base antes de exigir cambios a la interfaz o al protocolo de entrega. Nunca se descartan datos para ajustarlos a un componente.
4. **Independencia de componentes.** La interfaz y el procedimiento de extracción pueden corregirse o reemplazarse sin destruir el historial, los originales ni las evidencias. Los cambios de estructura requieren mantener integridad, trazabilidad y una migración verificable.

**Precedencia:** la Norma 00 es superior a toda implementación; **dentro de la arquitectura**, la base es el núcleo y los otros componentes dependen de ella. Esta jerarquía **no habilita** a la base a cambiar los originales ni a suavizar la definición de convocatoria validada.

## Regla principal

**La única métrica rectora de avance es el NÚMERO DE CONVOCATORIAS VALIDADAS.** Un código encontrado, una fila del Excel, un PDF leído como texto, una URL, un manifiesto, un registro importado o una prueba automática satisfactoria **no** acreditan validación.

Una convocatoria solo es **VALIDADA** cuando se documenta y comprueba con éxito, en este orden:

| Puerta | Requisito | Evidencias obligatorias |
|---|---|---|
| A | **Excel íntegro:** todas las filas y celdas asociadas a la convocatoria, con su literalidad, estructura, hipervínculos, encabezados, notas y valores. | Fuente y corte; hoja, filas/celdas esperadas vs cotejadas; evidencia de cotejo. |
| B | **PDF de convocatoria íntegro:** todas las páginas, tablas, listas, requisitos y demás elementos disponibles, incluyendo versiones y adendas que correspondan. | **URL original del PDF guardada en base**, versión, páginas y elementos verificados, notas y evidencias de revisión. |
| C | **Comprobación de resultados:** verificar explícitamente si hay PDF de resultados. | URL de la publicación/ubicación consultada, fecha, alcance, resultado de consulta y su justificación; una celda vacía en Excel no demuestra ausencia. |
| D | **Si hay PDF de resultados:** todas sus páginas, tablas, participantes, encabezados, calificaciones, decisiones y observaciones cotejados. **Si no hay PDF disponible tras búsqueda verificable:** documentar esa no disponibilidad en el corte. | URL del PDF en la base cuando existe; si no se encontró, URL de consulta, fecha y alcance. |
| E | **Cierre integral:** todos los originales y enlaces se conservan, son consultables desde la interfaz, están integrados sin pérdida y no hay incidencias críticas pendientes. | Acta final con referencias a verificaciones de A–D, reporte de incidencias, consulta del expediente persistido y versión de cierre. |

**Una puerta ausente, inconclusa, fallida o sin respaldo = NO VALIDADA.** No existe «validada a medias». El avance parcial se conserva, pero **no suma**. La vista y el contador deben derivarse de actas de cierre que superen estas puertas, nunca de la mera existencia de registros.

### Reglas de evidencia

1. **Originales intocables:** toda ocurrencia original sigue disponible, incluidas repeticiones auténticas, discrepancias, celdas y contenido inusual. Las síntesis se almacenan separadamente.
2. **URL obligatoria de PDF:** cada PDF disponible tiene en la base su URL real, tipo, convocatoria asociada, versión/corte, acceso y procedencia; se expone al auditor en la interfaz. No inventar URLs.
3. **Resultados:** ausencia de vínculo, fallo de lectura, enlace roto y «sin PDF verificado al corte» son estados **distintos**. Solo este último, con consulta documentada, permite omitir la extracción de resultados.
4. **Sin fallos ocultos:** las fallas de extracción, lagunas, fuentes no consultadas e incidencias quedan visibles. Las diferencias entre fuentes no se corrigen por cuenta del sistema: se conservan y contrastan.
5. **Fuentes posteriores:** adendas, versiones, resultados o datos nuevos obligan a revisar el estado de validación; un acta histórica no basta para sostener una validación actual.
6. **No falsa garantía:** los validadores automáticos comprueban consistencia y cobertura registrada; **no demuestran por sí mismos** que la lectura visual por IA fue correcta. La certificación documental exige cotejo real.
7. **Sin excepciones:** tiempo, volumen de trabajo, fallas de acceso, diseño de interfaz, limitaciones del código o intención de mostrar progreso no justifican reducir estas condiciones.

## Diseño estructural obligatorio

La base de datos debe disponer de lugares **individuales y verificables** para:

- Fuentes, URLs, versiones, páginas, tablas, celdas, listas y ocurrencias literales originales.
- Verificación por **cada puerta**, su estado, fecha, alcance, autor/proceso responsable, cobertura, fuente y evidencia enlazada.
- Comprobación explícita de disponibilidad del PDF de resultados.
- Incidencias y sus cierres justificados, **sin borrarlas**.
- Acta final que enlaza A+B+C+(D si aplica)+E y su referencia de persistencia.
- Vista de convocatorias validadas que solo cuenta actas conformes y no ignora fuentes nuevas.

**El esquema se adapta a esta norma; nunca se redefine «VALIDADA» para acomodar lo que la base o el visor alcancen a hacer.**

Referencia técnica: [Arquitectura de base v3](arquitectura-v3-validacion.md). Las Normas 01–04 siguen vigentes y subordinadas a este principio.