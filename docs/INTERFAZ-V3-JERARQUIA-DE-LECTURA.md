# Interfaz v3 — Jerarquía de lectura de convocatorias y resultados

**Fecha:** 13 de noviembre de 2026 · **Prioridad:** NORMA 00 → base SQLite v3 → contrato de visualización → interfaz.

## Decisión de diseño

La interfaz pública prioriza la lectura de los datos relevantes sin confundir su **preservación íntegra** con su **exhibición simultánea**. Los **filtros superiores** organizan las convocatorias por código, nombre, facultad, carrera/perfil según Excel, nivel, estado publicado, cierre y vínculo de resultados. A la izquierda permanece una **barra de convocatorias filtradas**; a la derecha, una **ficha técnica amplia** con secciones de estructura fija. Seleccionar otra convocatoria actualiza solo la ficha, sin reiniciar filtros ni navegar a otra página. La base no se modifica. Toda la exportación oficial `data/expedientes_v3.json` permanece accesible mediante secciones desplegables de **fuentes, originales, páginas, celdas y control de validación**, incluidos campos adicionales de futuras versiones.

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

La ficha incluye siempre los espacios previstos para cada categoría. Si falta un dato estructurado, muestra expresamente **«Sin dato»**; si no hay filas de resultados reconstruidas, presenta la tabla vacía con su encabezado y un mensaje de ausencia de carga. Esta ausencia no significa que la información falte en el PDF, ni que los resultados no se hayan publicado. La ficha mantiene los **rótulos literales** de los originales. La clasificación visual de conceptos existentes no corrige ni fusiona ocurrencias, y las listas preservan todos sus ítems y orden.

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

La navegación principal **sí incluye filtros por búsqueda general, carrera/perfil, facultad, nivel, estado publicado y vínculo a PDF de resultados**, y una barra lateral compacta con selección de expedientes, sin abandonar la ficha en foco. El comparador v2 permanece como referencia separada. La comparación matricial transversal completa de todos los campos requerida por NORMA 02 sigue pendiente; este avance no cancela la norma.

## Responsabilidad de futuras extracciones

Cuando la IA registre nuevas fuentes, se debe respetar el contrato estructural v3 de conceptos, listas, tablas y resultados, incluidas posiciones y evidencias. **La interfaz no debe ejecutar procedimientos automáticos de extracción a partir del texto histórico para llenar campos faltantes.** La calidad de la ficha aumenta al aumentar la estructura y el cotejo disponibles en la base, sin alterar el visualizador.

## Corrección de usabilidad · 13 de noviembre de 2026

- **Motivo:** la presentación anterior obligaba a recorrer muchas secciones antes de obtener campos comparables; la vista principal tenía pocos criterios de selección y repetía textos técnicos.
- **Nuevo recorrido:** filtros → barra lateral compacta de convocatorias → ficha técnica amplia, sin cambio de página → consulta opcional de documento original y trazabilidad.
- **Homologación de lectura:** la interfaz reconoce los **rótulos originales de Excel** (`Nombre de la convocatoria, proyecto o Proceso`, `Programa curricular`, `Programa`, `Estado de la convocatoria`, etc.). No presupone que `codigo_concepto` use denominaciones anteriores porque el corte vigente tiene claves como `excel_A`, `excel_B`.
- **Fechas:** los números seriales Excel se convierten solo para lectura a fecha y hora, sin alterar los valores originales registrados en la base.
- **Fuente única:** `data/expedientes_v3.json`; no se consultan datos dispersos, la interfaz no interpreta PDF ni escribe a SQLite.
- **Resultados:** la barra lateral y la ficha distinguen «PDF vinculado» de «sin vínculo»; la tabla de resultados **siempre se representa**, con encabezados y celda «Sin dato» cuando `resultados_estructurados[]` está vacío. Cuando haya filas reales, se muestran todas las columnas reconstruidas. Un PDF con líneas de texto preliminares no acredita que el puntaje se haya cotejado.
- **Cobertura del corte vigente:** 96 convocatorias identificadas, 0 validadas, 97 filas Excel, 1.031 celdas, 97 PDF de convocatoria y 24 PDF de resultados. No se crea una métrica nueva de éxito.
- **Campos pendientes de filtrado:** el porcentaje de avance, las horas, el estímulo y los puntajes no se convierten en filtros cuantitativos hasta que existan en los datos originales estructurados. Un renglón preliminar no es una extracción confiable de esos valores.
- **Rendimiento:** las páginas, celdas y lecturas extensas del expediente se construyen visualmente solo cuando se despliega el detalle técnico, sin ocultar ni descartar información.

## Uso de lectura semántica ya existente · 13 de noviembre de 2026

La ficha prioriza datos originales estructurados. Cuando un campo aún no existe como original semántico, usa las interpretaciones producidas por IA, incluidas en `indicadores_sinteticos[]` como **capa derivada explícita**, con `evidencias` de fuente y página y aviso «Lectura IA · sin cotejo visual». Se muestran los 58 porcentajes de avance interpretados y la ficha parcial trazable de `2026-C2381`; el filtro «Avance mínimo exigido desde (%)» solo admite facetas con `minimo_pct` y `filtro_habilitado=true`. No interpreta textos de PDF en el navegador. Adicionalmente, la captura textual preliminar se puede leer por página en un panel documental, sin alterar valores ni convertirlo en cotejo visual.

## Diseño de ficha persistente y espacios vacíos · 13 de noviembre de 2026

- **Distribución:** filtros superiores fijos en el flujo de página; barra lateral compacta y desplazable con convocatoria, código, estado, facultad/programa y fecha de cierre; ficha principal amplia y desplazable, con dos columnas de tarjetas en escritorio y adaptación a móviles.
- **Categorías estables:** información general; perfil y requisitos; condiciones de vinculación; selección y criterios; responsable y contacto; resultados de selección; fuentes y control de validación.
- **Ausencias visibles:** los campos de una categoría se presentan siempre. Se lee `Sin dato` cuando el valor no está estructurado en `datos_originales[]` o `listas_originales[]`. También se reserva espacio para las listas de requisitos, actividades y criterios, aunque no contengan ítems.
- **Resultados vacíos:** el encabezado de la tabla permanece visible incluso para expedientes sin participantes reconstruidos. Se distingue entre PDF de resultados vinculado pero sin tabla estructurada, verificación documental de ausencia al corte y ausencia de vínculo sin búsqueda confirmada.
- **Fidelidad:** no se sintetizan resultados desde texto plano histórico ni se altera el contrato de la base. Las fuentes, las lecturas originales y los controles A–E continúan disponibles en desplegables de trazabilidad.
- **Filtro actual:** se conservan filtros ya implementados (texto, carrera/perfil, facultad, nivel, estado y vínculo PDF). Los campos todavía no estructurados no se convierten en falsos filtros de valores numéricos.
- **Implementación:** `index.html`, sin modificación de `db/estructura_v3.sql` ni `scripts/exportar_base_v3.py`.

## Corrección de conexión entre datos y ficha · 13 de noviembre de 2026

La ficha anterior mostraba «Sin dato» para condiciones cuya lectura estaba conservada en `fuentes_originales[].pdf_lectura_previa` o ya había sido normalizada por IA en `v3_indicador_sintetico`. No era una ausencia del documento original, sino una desconexión de presentación.

- `index.html` interpreta para **presentación** las facetas previamente entregadas por IA y proyectadas como `indicadores_sinteticos[]`; no ejecuta extracción semántica del PDF.
- Se muestran valores, categorías y evidencia URL/página con la marca «Lectura IA · sin cotejo visual», sin confundirlos con datos cotejados ni alterar originales.
- Los campos esperados siguen mostrando «Sin dato» cuando **no existe un dato estructurado o una faceta asociada**; no se interpreta esto como ausencia del documento.
- Las listas de actividades, requisitos/documentos y criterios representan todos los ítems semánticos entregados. Los criterios no se reemplazan únicamente por totales.
- El buscador general ahora considera los textos de las facetas IA y las citas documentales asociadas. Las categorías no reconocidas se exponen en «Otros campos interpretados por IA» en lugar de ocultarse.
- «Lectura documental preliminar por páginas» pone a disposición la transcripción de PDF en la ficha, con advertencias de sus limitaciones y sin convertirla automáticamente en datos comparables.
- Caso de control: `2026-C2381`, con facetas de plazas, perfil, actividades, horas, estímulo, modalidad, duración, cinco criterios, contacto y fechas documentales (incluida discrepancia Excel/PDF).
- **Cobertura todavía parcial:** 98 facetas en 60 de 96 expedientes según el corte semántico actual; 0 expedientes validados por NORMA 00. La normalización de las restantes características y de los otros expedientes continúa pendiente; no confundir mejora de exposición con extracción completada.

## Implementación de interfaz ideal de consulta · 13 de noviembre de 2026

La interfaz pública fue reconstruida sin alterar las tablas SQL ni el contrato de exportación V3. Usa `index.html`, `assets/visor-ideal-v3.css` y `assets/visor-ideal-v3.js` con diseño minimalista y lectura adaptable a pantallas de escritorio y móviles.

La estructura visual contiene siempre diez apartados: (1) identificación general, (2) perfil y requisitos, (3) actividades a desarrollar, (4) condiciones de vinculación, (5) postulación y documentación, (6) proceso de selección, (7) criterios y ponderaciones, (8) resultados de selección con tabla dinámica de participantes, (9) responsables de convocatoria y evaluación, (10) fuentes y trazabilidad con verificaciones A–E. Incluso sin registros estructurados, permanecen visibles los rótulos, listas vacías y encabezados de tablas. «Sin dato» describe únicamente ausencia en la representación estructurada.

Los filtros se mantienen arriba: búsqueda por código y texto documental, facultad, programa y perfil, nivel, estado, vinculación de resultados, semillero, actividad, modalidad, rangos de plazas, horas y estímulo, P.A.P.A., avance curricular inequívoco, número de criterios, cierre por fecha, validación y campos aún no estructurados. Los filtros de rango excluyen los expedientes sin valores comparables; no asignan ceros implícitos. El porcentaje mínimo solo utiliza interpretaciones que explícitamente contienen `minimo_pct` y `filtro_habilitado` habilitado. Los filtros de fechas usan como fuente el cierre en Excel y mantienen visible el cierre divergente del PDF.

La barra de convocatorias permanece a la izquierda y la ficha ampliada en el panel principal, sin cambiar de página. También existe comparación paralela de hasta **cuatro expedientes** seleccionados mediante casillas de la barra lateral. Los resultados se muestran mediante columnas variables según los valores originales presentes en `resultados_estructurados[]`; si no hay filas, se preserva el encabezado de referencia y se marca la ausencia de carga. No se simulan participantes, ganadores ni puntajes.

La página da prioridad a `datos_originales[]` y `listas_originales[]`, y puede mostrar las facetas `IA-normalizacion-1.0` claramente etiquetadas **«Lectura IA · sin cotejo visual»** con vínculo a la fuente. Ninguna interpretación reemplaza registros originales, supera la jerarquía de la base o altera estados de validación. Las páginas textuales preliminares permanecen accesibles en controles desplegables, sin utilizarlas como fuente de filtros cuantitativos sin estructuración previa.

La acción `.github/workflows/publicar_visor_v3.yml` verifica los archivos CSS y JS externos, valida JavaScript con `node --check` y proyecta `data/expedientes_v3.json` desde SQLite V3. Se comprobó en un modelo DOM de prueba el renderizado de los diez apartados, campos vacíos permanentes, criterios, resultados vacíos y filtros por facultad, P.A.P.A. y presencia de filas de resultados; la verificación visual definitiva depende de la publicación en GitHub Pages.
