# NORMA 04 — Cierre verificable y conteo de convocatorias validadas

**Vigente desde:** 2026-11-13. **Carácter:** obligatorio para todo lote, base de datos, visor, indicador y reporte. **Precedencia:** aplica las Normas 01 (integridad) y 02 (integración) y define los requisitos concretos de cierre para la Norma 03 (extracción externa por IA).

## 0. ÚNICA unidad principal de avance: convocatoria VALIDADA

**No contabilizar como avances válidos las filas de Excel, códigos registrados, PDFs leídos, URLs encontradas ni textos extraídos.** Son métricas auxiliares de inventario, nunca sustituyen el indicador rector:

> **Convocatorias validadas = número de códigos distintos que superan TODOS los controles A + B + C + D + E, con acta persistida y evidencia accesible.**

No existe estado «parcialmente validada». Se permiten «no iniciada», «en curso», «bloqueada» y «validada». Los expedientes en curso **no suman** al total. Una convocatoria puede contener varias filas, PDF, adendas y versiones; toda la información disponible debe conservarse.

## 1. Puertas secuenciales obligatorias

| Puerta | Condición innegociable | Evidencia exigida |
|---|---|---|
| **A. Excel** | Extraer y verificar todas las celdas de **todas las filas** que correspondan al código; valores literales y originales, hipervínculos, encabezados, fechas, observaciones y formato disponible. | URL de la hoja/corte, pestaña, números de fila, rango, fecha/corte, inventario de celdas, vínculo a registros persistidos y contraste con la fuente. |
| **B. PDF de convocatoria** | **Localizar el PDF**, verificar que se puede acceder a él, almacenar la **URL exacta como dato verificable**, leer **todas sus páginas** y representar íntegramente texto, tablas, filas, celdas, listas de requisitos, criterios, marcas, notas, anexos y adendas disponibles. Cotejar visualmente la información. | URL directa/identificador de archivo en BD, fecha de consulta, identificador de fuente y versión, páginas procesadas vs totales, revisión de tablas/celdas y lista de pendientes. |
| **C. Disponibilidad de resultados** | **Comprobar expresamente** si hay PDF de resultados correspondiente al proceso/código/versión/corte. No usar «celda sin hipervínculo» como prueba de inexistencia. | URL y fecha de consulta de la publicación o fuente donde se comprobó, alcance de búsqueda, código comparado y resultado de la consulta. |
| **D1. Resultados disponibles** | Si existe PDF de resultados: guardar enlace verificable y extraer/cotejar todas sus páginas, tablas, filas, personas, identificaciones, criterios, ponderaciones, puntajes, decisiones y anotaciones; conservar originales. | URL exacta y verificable en BD, fuente/versión, conteos completos y acta de cotejo. |
| **D2. Resultados NO disponibles tras verificación** | Si la comprobación concluye que **no hay PDF de resultados disponible en las fuentes revisadas al corte**, dejar registro expreso `sin_pdf_verificado` con fuente, URL, fecha, método y alcance. **No inferir que jamás se publicó ni que no hubo postulaciones.** | Registro de consulta reproducible, sin fabricar PDF ni URL de documento. Esta rama **sustituye solo D1**, nunca A, B o C. |
| **E. Persistencia y revisión final** | Releer la ficha integrada ya persistida, contrastar que no falta ningún dato disponible, que los enlaces PDF de la convocatoria y resultados (si existen) están en la BD y accesibles desde la interfaz, que los originales no fueron reemplazados por sintéticos y que **no queda ningún fallo oculto ni pendiente crítico**. | Acta final con IDs de controles A/B/C-D, referencias a fuente y registros, commit/versión/corte y resultado de comprobaciones. |

**Una sola puerta fallida ⇒ convocatoria NO validada.** No hay excepción por plazo, número de documentos, volumen de texto ni éxito de GitHub Actions.

## 2. Cuándo no puede cerrarse

Bloquear el estado `validada` si ocurre cualquiera de estas situaciones:

- No se ha leído la totalidad de la(s) fila(s) Excel, aunque se tenga código y título.
- Se desconoce el enlace real al PDF de convocatoria, no abre, no se ha extraído íntegramente o se perdió su estructura de tablas/celdas.
- No se examinó la disponibilidad del PDF de resultados; la celda de Excel contiene un código pero no enlace; se intentó abrir un enlace y falló; **todos son estados pendientes, no «sin_pdf_verificado».**
- Se encontró PDF de resultados pero no se han revisado **todos** sus registros y columnas.
- Faltan URLs guardadas como campos consultables de BD o faltan referencias que vinculen un dato a su evidencia.
- Hay discrepancias **no registradas**, documentos adicionales sin revisar, casillas omitidas o problemas de integridad sin resolver/documentar.
- Se marcó revisión sin haber cotejado la persistencia o no es posible reconstruir desde la interfaz la evidencia íntegra.

Una **diferencia documentada entre fuentes** no invalida por sí sola la revisión: si ambas versiones están completas, preservadas y cotejadas, se registra la diferencia sin imponer un valor «correcto». En cambio, **una incertidumbre sobre si se extrajo el contenido completo** bloquea la validación.

## 3. Enlaces como dato original y medio de verificación

- Para **cada PDF realmente disponible** conservar en la BD la **URL concreta**, nombre/ID de archivo (si existe), clase (convocatoria/resultados/adenda), convocatoria vinculada, versión/corte, fecha y resultado de acceso, junto al propio contenido estructurado. En el esquema base ya existe `v2_fuente_original.uri_original`, pero **su existencia como campo opcional no basta para certificar nada**; el acta de control de validación exige explícitamente el enlace.
- En la **interfaz** mostrar «Abrir PDF de convocatoria» y «Abrir PDF de resultados» cuando corresponda, junto a datos extraídos, evidencia de página/celda y el estado de revisión. No hacer al auditor depender de la transcripción.
- Para **ausencia comprobada de resultados** registrar la URL real del **sitio/hoja/publicación consultado**, fecha y alcance de búsqueda; **no inventar un enlace PDF** para rellenar la estructura.
- En caso de PDF retirado o enlace roto, conservar la URL original y estado del acceso, marcar bloqueo o revisión y no esconder la fuente.
- Si el PDF enlazado es de otro código o tiene versiones disonantes, registrar diferencia en clave de integración y literal interno, sin alterar ninguno.

## 4. Modelo de actas y regla de cómputo

Las tablas **aditivas** `v2_control_validacion_fuente` y `v2_acta_validacion_convocatoria` (definidas en `db/estructura_v2.sql`) **no reescriben originales**. Cada control identifica:

- Convocatoria y papel de la fuente (`excel`, `convocatoria_pdf`, `resultados_pdf`).
- Fuente original persistida y URL exacta (si existe PDF); para ausencia de resultados, prueba de consulta y fecha/corte.
- Estado final (`cotejada` o, solo para resultados, `sin_pdf_verificado`), cobertura total declarada y cotejada, descripción firmada de la inspección y **0 pendientes críticos**.
- Un acta final que refiere los **tres controles específicos** y la referencia de persistencia para permitir comprobación independiente. Los controles son históricos/aditivos, no sobrescritos.

La **vista** `v2_conteo_convocatorias_validadas` cuenta **códigos distintos** con acta final aceptada por las restricciones de BD. Los reportes pueden mostrar inventario, expedientes en curso y bloqueados, pero el **primer indicador de avance** es este conteo.

**Las restricciones y validadores solo garantizan que las evidencias declaradas están presentes y son coherentes.** No pueden por sí solos certificar honestidad de la declaración ni lectura visual completa: esa comprobación corresponde a la extracción externa de IA con cotejo explícito. Nunca afirmar «revisada» solo porque una estructura o consulta SQL devuelve resultados.

## 5. Aceptación operativa, no narrativa

El expediente se muestra como **validado** únicamente cuando:
1. Existe control **A** aceptado, con todas las filas/celdas Excel cotejadas y la referencia de su captura.
2. Existe control **B** aceptado con URL del PDF de convocatoria, páginas íntegramente cotejadas y datos persistidos.
3. Existe control **C** comprobando resultados; tiene **D1** con URL y PDF íntegro cotejado o **D2** con evidencia real de no disponibilidad.
4. Se incluyen adendas, anexos y otras versiones efectivamente disponibles, preservados con sus referencias; ninguna omisión crítica queda oculta.
5. Existe acta **E** con evidencia de persistencia y consulta en interfaz, y los controles permiten reconstruir el expediente.

**No se admite un acta de validación sin enlace verificable al PDF de convocatoria; si hay resultados, tampoco sin el enlace de su PDF.**

## 6. Estado del corte previo y consecuencias

**Al 13 de noviembre de 2026:** los cuatro lotes históricos contienen **42 códigos**, **43 filas Excel**, **470 celdas** y textos extraídos de **16 PDF** (7 convocatorias, 9 resultados). La extracción histórica **no** comprobó la estructura íntegra de las tablas PDF; no se registraron actas finales con estas puertas de calidad.

**Indicador rector vigente al corte: 0 convocatorias validadas.** El conteo 42 indica expedientes identificados, no comprobados. Las 51 filas candidatas de postulantes tampoco son un conjunto cotejado.

Se conservará toda esa investigación como **avance parcial y punto de partida**, sin convertirla retroactivamente en «validada». Para subir el indicador, hay que terminar realmente A+B+C+(D1 o D2)+E para cada convocatoria.

## 7. Validación revocable cuando aparece información adicional

**Una acta de validación histórica no es un permiso permanente para ignorar documentos nuevos.** La vista SQL de convocatorias validadas se recalcula contra las fuentes y celdas originales disponibles actualmente. Si se incorporan nuevas celdas Excel, otro PDF de resultados, una adenda, un anexo o una nueva versión de PDF sin cotejo, el código **deja de sumar al contador** hasta completar la verificación del nuevo material.

La comprobación abarca **todos los PDF vinculados a la convocatoria**, no solamente el principal. El acta original se conserva íntegra como evidencia histórica; la fuente adicional requiere su propio control, enlace, versión, páginas y cotejo. No borrar ni actualizar actas para corregir el estado.

El validador automático exige coherencia de controles y enlaces persistidos; el operador debe comprobar la **existencia real de fuentes adicionales** antes de afirmar el cierre. Un PDF todavía no detectado o no enlazado no puede descubrirse únicamente mirando la base.

## 8. Orden de ejecución de controles

**Antes de procesar:** inventariar fuentes y links reales; máximo 50 convocatorias distintas/interacción.  
**Después de cada fuente:** cotejar extracción original y estructura contra evidencia; guardar estado y pendientes.  
**Al cerrar una convocatoria:** ejecutar `scripts/validar_lote_ia.py`, comprobar enlaces en la BD y aceptar **acta final solo si todas las puertas pasan**.  
**Antes de publicar:** ejecutar pruebas sobre lote y cómputo SQL, y asegurar que la interfaz no exprese una condición más fuerte que la evidencia.

**Si no es comprobable, no se marca validada.** Se conserva todo avance parcial con motivo explícito.
