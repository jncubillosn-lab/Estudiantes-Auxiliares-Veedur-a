# Interfaz v3 — Jerarquía de lectura de convocatorias y resultados

**Fecha:** 13 de noviembre de 2026 · **Prioridad:** NORMA 00 → base SQLite v3 → contrato de visualización → interfaz.

## Decisión de diseño

La interfaz pública prioriza la lectura de los datos relevantes sin confundir su **preservación íntegra** con su **exhibición simultánea**. La **tabla comparativa y filtrable** organiza directamente convocatorias por código, nombre, facultad, carrera/perfil según Excel, nivel, estado publicado, cierre y vínculo de resultados. Al seleccionar una fila, la ficha lateral se actualiza sin abandonar ni reiniciar los filtros. La base no se modifica. Toda la exportación oficial `data/expedientes_v3.json` permanece accesible mediante secciones desplegables de **fuentes, originales, páginas, celdas y control de validación**, incluidos campos adicionales de futuras versiones.

La sección prioritaria no es fuente de información: solo dispone visualmente los registros ya presentes en el contrato v3. No extrae ni interpreta PDF, no decide diferencias entre fuentes y no altera los originales.

## Orden y agrupaciones de lectura

Las referencias visuales provienen de los PDF anotados por la dirección del proyecto. Los colores representan **temas**, no estados de validación.

| Sección prioritaria | Referencia cromática | Información destacada |
|---|---|---|
| Identificación | Rojo discreto | Código, título, dependencia, tipo de estudiante, fechas y plazas. |
| Perfil, actividades y condiciones | Verde discreto | Perfil solicitado, actividades, modalidad, horas, estímulo y duración. |
| Selección de la convocatoria | Amarillo discreto | Forma de selección, criterios y ponderaciones literales. |
| Responsable de convocatoria | Azul discreto | Persona responsable y contacto. |
| Resultados de selección | Azul/cian discreto | Datos de publicación, criterios ponderados, filas de participantes, identificación, P.A.P.A./PA, PBM, puntajes por criterio, total y decisión de selección, si el registro los contiene. |
| Responsable de evaluación | Separado dentro de resultados | Nombre, cargo, extensión, correo y observaciones cuando estén estructurados. |

La ficha mantiene los **rótulos literales** de los originales. La clasificación visual de conceptos existentes no corrige ni fusiona ocurrencias, y las listas preservan todos sus ítems y orden.

### Dos referencias de diseño, no incorporaciones automáticas

- `2026-C2374.pdf`: ejemplo de convocatoria con resaltados temáticos, especialmente páginas 1–3.
- `Resultados 2026-C2188.pdf`: ejemplo del formulario de resultados, particularmente la tabla de criterios/ponderaciones y la tabla de participantes de la página 2 y los datos de responsable en la página 3.

Estas referencias **no son nuevas fuentes importadas a SQLite** por el mero hecho de haberse compartido para diseñar la interfaz. Si sus códigos no figuran en la exportación actual, no deben aparecer como expedientes nuevos ni asumirse como validados.

## Estados y fidelidad

1. **Información estructurada v3:** se muestra con su rótulo original y enlace de fuente. Las listas se presentan por ítem. Las filas de resultados conservan identificación, valores literales por columna y observaciones; ningún vacío se convierte en cero.
2. **PDF con lectura textual histórica:** se permite visualizar los fragmentos de etiquetas previamente detectadas, en un desplegable denominado **«Lectura textual histórica»**. La etiqueta y fragmento son históricos, **no campos verificados**. Puede incluir texto de apartados contiguos; la vista lo advierte y da acceso al documento original.
3. **Información no estructurada:** se indica expresamente como pendiente de estructuración/cotejo. No se deducen ganadores, porcentajes, puntajes, fechas o disponibilidad de resultados desde fragmentos ambiguos.
4. **Sin PDF asociado:** no equivale a inexistencia. Solo `control_validacion.comprobaciones_resultados` permite documentar una búsqueda y su alcance.
5. **Validación:** el contador y el estado permanecen sujetos exclusivamente a `v3_metrica_principal`, `v3_estado_por_convocatoria` y las puertas A–E.

La navegación principal **sí incluye filtros por búsqueda general, carrera/perfil, facultad, nivel, estado publicado y vínculo a PDF de resultados**, y una tabla en la que pueden contrastarse visualmente varias convocatorias. El comparador v2 permanece como referencia separada. La comparación matricial transversal completa de todos los campos requerida por NORMA 02 sigue pendiente; este avance no cancela la norma.

## Responsabilidad de futuras extracciones

Cuando la IA registre nuevas fuentes, se debe respetar el contrato estructural v3 de conceptos, listas, tablas y resultados, incluidas posiciones y evidencias. **La interfaz no debe ejecutar procedimientos automáticos de extracción a partir del texto histórico para llenar campos faltantes.** La calidad de la ficha aumenta al aumentar la estructura y el cotejo disponibles en la base, sin alterar el visualizador.

## Corrección de usabilidad · 13 de noviembre de 2026

- **Motivo:** la presentación anterior obligaba a recorrer muchas secciones antes de obtener campos comparables; la vista principal tenía pocos criterios de selección y repetía textos técnicos.
- **Nuevo recorrido:** filtros → tabla estandarizada → ficha lateral sin cambio de página → consulta opcional de documento original y trazabilidad.
- **Homologación de lectura:** la interfaz reconoce los **rótulos originales de Excel** (`Nombre de la convocatoria, proyecto o Proceso`, `Programa curricular`, `Programa`, `Estado de la convocatoria`, etc.). No presupone que `codigo_concepto` use denominaciones anteriores porque el corte vigente tiene claves como `excel_A`, `excel_B`.
- **Fechas:** los números seriales Excel se convierten solo para lectura a fecha y hora, sin alterar los valores originales registrados en la base.
- **Fuente única:** `data/expedientes_v3.json`; no se consultan datos dispersos, la interfaz no interpreta PDF ni escribe a SQLite.
- **Resultados:** la tabla distingue «PDF vinculado» de «sin vínculo» y la ficha solo crea una tabla de puntajes cuando existen filas reales en `resultados_estructurados[]`. Un PDF con líneas de texto preliminares no acredita que el puntaje se haya cotejado.
- **Cobertura del corte vigente:** 96 convocatorias identificadas, 0 validadas, 97 filas Excel, 1.031 celdas, 97 PDF de convocatoria y 24 PDF de resultados. No se crea una métrica nueva de éxito.
- **Campos pendientes de filtrado:** el porcentaje de avance, las horas, el estímulo y los puntajes no se convierten en filtros cuantitativos hasta que existan en los datos originales estructurados. Un renglón preliminar no es una extracción confiable de esos valores.
- **Rendimiento:** las páginas, celdas y lecturas extensas del expediente se construyen visualmente solo cuando se despliega el detalle técnico, sin ocultar ni descartar información.
