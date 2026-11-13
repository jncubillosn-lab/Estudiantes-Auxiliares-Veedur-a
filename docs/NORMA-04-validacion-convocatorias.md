# NORMA 04 — Reglas operativas de validación por convocatoria (v3)

**Jerarquía:** desarrolla la [NORMA 00 — validación integral inviolable](NORMA-00-validacion-integral.md); **no puede modificar ni suavizar sus condiciones**.  
**Implementación vigente:** [db/estructura_v3.sql](../db/estructura_v3.sql).  
**Métrica:** `v3_metrica_principal.convocatorias_validadas`; **no** cantidad de códigos encontrados, filas Excel, PDF leídos ni manifiestos recibidos.

## Puertas obligatorias para acta final

| Puerta | Requisito de aceptación | Dónde registrar y verificar |
|---|---|---|
| **A — Excel** | Todas las filas y celdas del código y sus metadatos, verificadas contra la fuente. | `v3_excel_fila`, `v3_excel_celda`, `v3_revision_fuente`, `v3_revision_metrica`, criterios `A_*` en `v3_cumplimiento`. |
| **B — Convocatoria** | PDF real completo, con URL verdadera, páginas, tablas, requisitos, criterios, adendas y anexos disponibles cotejados. | `v3_fuente`, `v3_pdf_pagina`, `v3_pdf_tabla`, `v3_pdf_celda`, listas, revisiones y `B_*`. |
| **C — Disponibilidad de resultados** | Consulta **expresa** de publicación, con URL del sitio, fecha, alcance/método, resultado y documento vinculado cuando lo hay. | `v3_consulta_resultados` y criterio `C_BUSQUEDA`. |
| **D — Resultados (condicional)** | Si el PDF existe: todos los participantes, identificaciones, valores, puntajes, decisiones, filas y columnas; URL y cotejo. Si no está disponible tras consulta documentada: omitir **solo D**. | `v3_fuente`, `v3_resultado_fila`, `v3_resultado_valor`, revisiones y `D_*`, o `sin_pdf_verificado_al_corte` en consulta. |
| **E — Cierre y trazabilidad** | Originales y enlaces persistidos y consultables, ninguna omisión crítica pendiente, evidencias por criterio y acta final. | `v3_puerta`, `v3_cumplimiento`, `v3_incidencia`, `v3_resolucion_incidencia`, `v3_acta_validacion`, `v3_acta_fuente`. |

**Una sola condición fallida, no ejecutada o no demostrada ⇒ convocatoria NO validada.** «En curso», «bloqueada», «identificada» y «leída como texto» no son estados contables como validación.

## Medios de verificación y fallos

La URL real de **cada documento disponible** se conserva en `v3_fuente.url_original`, asociada al código por `v3_convocatoria_fuente`, con versión, fecha y estado de acceso. La interfaz debe permitir al auditor abrir el documento y contrastar la página/celda original. Un enlace roto no debe borrarse: registrar acceso fallido.

**Nunca declarar ausencia de resultados por un hipervínculo vacío**. Distinguir `pdf_encontrado`, `sin_pdf_verificado_al_corte` e `indeterminado`. El último estado **bloquea el cierre**. Una discrepancia documental *registrada y cotejada* puede formar parte de una validación; una omisión o fuente sin revisar, no.

Registrar toda incidencia, su evidencia y su resolución **sin sobrescribir el registro inicial**. Un PDF adicional o una adenda pendiente puede impedir cerrar el expediente aunque sus PDFs principales se hayan leído.

## Acta y métrica SQL

Las verificaciones individuales se guardan en `v3_puerta` y `v3_cumplimiento`; cada fuente dispone de `v3_revision_fuente` y métricas específicas en `v3_revision_metrica`. El esquema compara cantidades declaradas con elementos almacenados, sin pretender que una máquina pueda detectar elementos que la IA nunca observó.

La tabla `v3_acta_validacion` requiere referencias a A, B, C, E y **D cuando se encontró un PDF de resultados**, junto a la última consulta documentada y una versión persistida. El trigger `v3_acta_check` comprueba estos requisitos y evita crear un acta sin evidencias obligatorias. La tabla `v3_acta_fuente` guarda las fuentes conocidas al cierre.

La vista `v3_convocatorias_validadas` y el contador `v3_metrica_principal` se **recalculan**: si aparece una nueva fuente, otra consulta de resultados o una incidencia crítica, el acta histórica no necesariamente mantiene el estado actual de validación. Se conserva el acta anterior y se realiza el cotejo necesario.

**Control automático ≠ garantía material de lectura:** solo el cotejo completo del PDF real por esta IA puede justificar honestamente los estados de las puertas. Las pruebas de SQLite son requisitos técnicos, no sustitutos de la revisión documental.

## Estado del corte 2026-11-13

**42 convocatorias identificadas, 43 filas y 470 celdas Excel, 16 PDF con lectura textual histórica, 0 PDF visualmente cotejados y 0 convocatorias validadas.**

La recepción de un manifiesto IA mediante `registrar_entrega_ia_v3.py` **no crea actas ni valida expedientes**.

[Contrato de extracción externa](CONTRATO-V3-EXTRACCION-IA.md) · [Contrato de visualización](CONTRATO-V3-VISUALIZACION.md) · [Pruebas de aceptación](../scripts/probar_estructura_v3.py).
