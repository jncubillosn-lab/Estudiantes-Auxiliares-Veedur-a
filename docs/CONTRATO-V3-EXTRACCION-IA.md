# CONTRATO DE ENTREGA V3 — Extracción externa realizada por IA

**Normas rectoras:** [00 — validación integral](NORMA-00-validacion-integral.md), [01 — integridad](NORMA-01-integridad-exhaustividad.md), [02 — integración](NORMA-02-integracion-comparabilidad.md), [03 — IA externa](NORMA-03-extraccion-externa-ia.md).  
**Destinatario:** la IA que lee los documentos y entrega datos **a la base**, y los controles que comprueban que se respetaron límites y cobertura.  
**Separación fundamental:** la IA **lee, observa, interpreta y transcribe**; el programa **almacena, verifica estructura, preserva y expone**. No se implementa un extractor automático de requisitos, OCR o análisis semántico dentro de la aplicación.

## 1. Contrato de trabajo por interacción

1. **Unidad:** convocatoria distinta por código. **Máximo 50 convocatorias distintas por solicitud/interacción**, aunque haya múltiples filas Excel, versiones, anexos o resultados. En documentos complejos reducir el tamaño del lote; **el máximo no es una meta de producción**.
2. **Inicio de lote:** consultar los manifiestos persistidos y versiones de fuentes. No volver a extraer páginas/regiones de una misma fuente ya terminadas y verificadas, excepto cotejo o reextracción **justificada y versionada**.
3. **Orden obligatorio:** inventariar todas las fuentes y el código → leer Excel completo → leer PDF convocatoria completo → comprobar documentalmente resultados → leer PDF resultados completo **si existe** → integrar, cotejar y persistir → solicitar acta final **solo si todas las puertas se cumplieron**.
4. **Regla de contenido:** conservar cada celda, rótulo, tabla, requisito, ítem, fila de participante, criterio, puntaje, nota, marca visual, pie de página, adenda y versión. Ningún dato se reemplaza por promedio, suma, total, etiqueta o conclusión.
5. **Regla de duplicados:** `fuente + versión + ubicación` identifica una extracción. No repetir el trabajo ya registrado; **sí conservar dos contenidos idénticos que realmente aparecen en lugares diferentes**, con sus dos ubicaciones.
6. **Fuente inalcanzable:** conservar el enlace real y el fallo de acceso. No inventar el documento, no marcar cotejado y no cerrar como validado.
7. **Resultados:** si no hay hipervínculo en Excel, **comprobar igualmente** la publicación disponible; guardar fuente URL consultada, fecha, método y alcance. `indeterminado` no es `sin_pdf_verificado_al_corte`.
8. **Fin de interacción:** guardar avance real, todas las incidencias, fuentes/versiones, páginas y categorías revisadas, referencias persistidas y la próxima etapa. **Nada de prometer que quedó validado sin acta**.

## 2. ¿Qué debe suministrar la IA a la base?

El contrato se materializa en las tablas de [estructura_v3.sql](../db/estructura_v3.sql). Esta tabla diferencia captura, evidencia y validación:

| Elemento que suministra la IA | Destino SQL | Invariante |
|---|---|---|
| Código integrador y apariciones literales distintas | `v3_convocatoria`, `v3_fuente.codigo_interno_literal`, `v3_convocatoria_fuente` | Un código para agrupar; **todas sus apariciones originales** conservadas. |
| URL real, nombre, tipo, versión y acceso de **cada** documento | `v3_fuente` | **No inventar URLs**. Cuando el enlace está roto, conservarlo con fallo. |
| Excel con todas las filas y celdas, encabezados, fórmulas, metadatos, URL | `v3_excel_fila`, `v3_excel_celda`; captura íntegra `v3_captura_lote` | Número de filas y columnas cotejado contra la fuente, ninguna celda omitida. |
| PDF íntegro por página, elementos, tablas, coordenadas y celdas | `v3_pdf_pagina`, `v3_pdf_elemento`, `v3_pdf_tabla`, `v3_pdf_celda` | Cada página tiene estado y evidencia; no confundir texto plano con estructura. |
| Requisitos, subrequisitos y otras listas | `v3_lista_original`, `v3_item_original`, `v3_dato_original` | Un ítem **por ocurrencia**, orden, jerarquía, texto íntegro y posición. |
| Participantes, calificaciones, decisiones y columnas originales | `v3_pdf_tabla`, `v3_pdf_celda`, `v3_resultado_fila`, `v3_resultado_valor` | Toda fila y celda permanece, con los identificadores literales de la fuente. |
| Comprobación de presencia o ausencia de resultados | `v3_consulta_resultados` | URL consultada, fecha, método, alcance, resultado y vínculo al PDF si existe. |
| Evidencia de cobertura de **cada fuente** | `v3_revision_fuente`, `v3_revision_metrica` | Esperados/cotejados por página, tabla, celda, requisito, participante, etc., con URL y nota. |
| Cada puerta y sus condiciones individuales | `v3_puerta`, `v3_cumplimiento` | A+B+C+(D si procede)+E; **un indicador general no sustituye criterios**. |
| Incidencia y evidencia de su resolución | `v3_incidencia`, `v3_resolucion_incidencia` | Conservar fallo histórico; resolución como registro distinto. |
| Entrega íntegra del trabajo de IA | `v3_entrega_ia` | JSON literal + SHA de la entrega, número, fuente y estado de revisión; **sin certificación automática**. |
| Registro de regiones trabajadas | `v3_control_lectura` | Una extracción por fuente+versión+ubicación; cotejos y correcciones justificadas aparte. |
| Acta final del expediente | `v3_acta_validacion`, `v3_acta_fuente` | Se intenta **solo tras demostrar todas las puertas**, con versión persistida. |
| Síntesis derivada *opcional* | `v3_indicador_sintetico`, `v3_indicador_insumo` | Fórmula, versión, valor e insumos originales; **nunca sustituyen los originales**. |

### Obligaciones adicionales para IA

- Si una tabla tiene cinco columnas, deben almacenarse **las cinco columnas completas** en cada fila, incluidas celdas vacías y combinadas. No convertir un cuadro de evaluación en una suma sin sus criterios.
- Antes de concluir «cotejado», comparar la reconstrucción con la imagen del **PDF real** y registrar las páginas, celdas y discrepancias. Un patrón automático de texto no basta para confirmar participantes ni puntajes.
- Si una celda es ilegible, registrar `ilegible` con posición y pendiente; no rellenar por contexto. Un caso así **no puede cerrar** si afecta integridad.
- Si el PDF interno presenta otro código que el Excel, conservar ambas apariciones y documentar diferencia.
- Una adenda no borra versiones anteriores y cualquier PDF adicional vinculado requiere su propio cotejo.
- Un PDF con texto disponible pero tablas aún no reconstruidas tiene estado de **lectura previa**, no `validada`.
- **Nunca redactar un acta por aproximación:** solo pedirla cuando la evidencia y todos sus subcriterios están persistidos y cotejados.

## 3. Manifiesto mínimo de trabajo de IA

La IA crea un registro por lote y por convocatoria; **no introduce una segunda fuente original**. El manifiesto permite reproducir qué hizo y dónde, no sustituye los contenidos.

```json
{
  "version_contrato": "3.0",
  "lote_id": "EJEMPLO-2026-01",
  "fecha_corte": "2026-11-13",
  "convocatorias": [
    {
      "numero": "EJEMPLO-C0001",
      "orden": 1,
      "fuentes": [
        {"tipo": "excel", "url_original": "https://example.org/hoja",
         "version_fuente": "corte-1", "estado": "cotejada"},
        {"tipo": "convocatoria_pdf", "url_original": "https://example.org/conv.pdf",
         "version_fuente": "hash-o-version", "estado": "pendiente"}
      ],
      "consulta_resultados": {
        "estado": "indeterminado",
        "url_sitio_consultado": "https://example.org/publicaciones",
        "fecha_consulta": "2026-11-13",
        "alcance_y_metodo": "Consulta pendiente de completar",
        "justificacion_literal": "No se ha concluido la verificación"
      },
      "lecturas": [
        {"fuente_tipo": "excel", "version_fuente": "corte-1",
         "ubicacion": "pestaña:Abiertas/fila:2/celda:A",
         "accion": "extraer"}
      ],
      "cobertura": [
        {"fuente_tipo": "excel", "metrica": "celdas",
         "total_observado": 10, "total_cotejado": 10}
      ],
      "incidencias": ["PDF de convocatoria todavía sin cotejar"],
      "estado_cierre": "en_curso"
    }
  ]
}
```

**Ejemplo ficticio únicamente:** los códigos y enlaces no representan expedientes reales. **No es la entrega completa de los datos originales**. La IA entrega **además** todas las filas/celdas, páginas/tablas, ítems, resultados y evidencias mencionadas en §2, que se conservan en SQLite. Un manifiesto no puede sustituirlas.

## 4. Tres niveles de controles

1. **Recepción estructural:** lote dentro de 50; códigos únicos; fuentes identificadas; URL/versiones originales; filas y páginas declaradas; esquema de entrega coherente; duplicados de lectura detectados. Se pueden registrar entregas incompletas, pero **no validarlas**.
2. **Cobertura y cotejo:** comparaciones por página y tipo de contenido, URL/posición verificable, texto literal y tablas completas, resoluciones de incidencias, evidencia visual. Corresponde a la **IA externa**, apoyada por herramientas de revisión; el validador no finge haber visto lo que no vio.
3. **Aceptación de convocatoria:** el esquema SQLite exige todos los criterios de las puertas A–E, comprueba vínculo de fuente y conteos declarados, y sólo entonces admite acta. La vista de validación se recalcula si aparecen nuevas fuentes o consultas.

**Límite de los validadores:** un código corto no puede garantizar por sí mismo que no existe texto no observado en el PDF. Los controles miden que la extracción hecha **no esconda sus propios faltantes**; la garantía material requiere **lectura y cotejo real** por la IA.

## 5. Protocolo de continuidad y límites

- **No exceder 50 códigos por interacción.** Si la tarea desborda la ventana o el examen visual, documentar hasta dónde se llegó y dividir; no omitir páginas para completar el cupo.
- **Nunca leer el mismo fragmento para extraerlo dos veces** si la lectura anterior ya está verificada. Registrar acción `cotejar` para revisarlo y `reextraer_justificado` para corregirlo, preservando versiones.
- Respetar el orden `identificar → Excel → convocatoria → comprobación resultados → resultados si existe → integrar → cotejar → persistir → acta`.
- Después de cada expediente, dejar: código, referencias a fuentes/links, conteo de elementos originales observados/cotejados, incidencias y estado final.
- **No recontar expedientes parciales como validados.** El contador oficial siempre sale de `v3_metrica_principal`.

## 6. Responsabilidad de cada componente

**IA:** interpreta y extrae todo lo visible, evalúa cobertura, coteja y documenta cada decisión/limitación.  
**Base de datos:** recibe esa evidencia sin recortar originales, almacena por código y fuente, registra controles y bloquea actas incompletas.  
**Visualizador:** consulta el [contrato único de salida](CONTRATO-V3-VISUALIZACION.md), presenta originales y medios de verificación, distingue sintéticos y muestra número real de expedientes validados.

La decisión de visibilidad/publicación corresponde exclusivamente al responsable del proyecto. La IA **no** altera originales para tomar esa decisión.
