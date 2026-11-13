# Veeduría de convocatorias de estudiantes auxiliares — UNAL

**Estado actual de la base V3:** el SQLite se construye desde los cuatro lotes históricos y conserva 42 códigos, 43 filas, 470 celdas y 16 enlaces PDF con su transcripción previa. **Cero convocatorias validadas; cero PDF cotejados visualmente.** Esto no implica haber terminado una extracción documental.

**Referencias operativas:** [Base V3 y garantías](docs/BASE-V3-OPERACION-Y-GARANTIAS.md) · [Contrato de visualización](docs/CONTRATO-V3-VISUALIZACION.md) · [Contrato de extracción externa por IA](docs/CONTRATO-V3-EXTRACCION-IA.md). La web publicada todavía usa v2 y no se modificó.

## Base de datos V3 operativa — Norma 00

**Regla de máxima jerarquía: [NORMA 00 — Validación integral e inviolable](docs/NORMA-00-validacion-integral.md).** Una convocatoria **solo suma** si tiene **Excel íntegro + PDF de convocatoria íntegro con URL + comprobación real de resultados + PDF de resultados completo con URL cuando esté disponible + evidencia y acta final de integración**. Cualquier puerta no cumplida = no validada.

**Nuevo diseño desde cero:** [`db/estructura_v3.sql`](db/estructura_v3.sql) · [documentación de arquitectura v3](docs/arquitectura-v3-validacion.md) · [pruebas del contrato](scripts/probar_estructura_v3.py). La nueva estructura incorpora comprobación individual A–E, **13 criterios**, cobertura por tipo de elemento documental, evidencias URL, registro/resolución de incidencias, actas inmutables y contador recalculado ante fuentes nuevas.

**Estado exacto:** los 42 códigos históricos y sus datos disponibles se importan a una base SQLite V3 reproducible, pero no se ha validado ninguna convocatoria real. La interfaz Pages continúa en v2.


## Métrica principal y criterio de validación — NORMA 04

**Indicador rector: [convocatorias VALIDADAS](docs/NORMA-04-validacion-convocatorias.md)**, no convocatorias identificadas ni PDF leídos.

**Corte histórico (13-11-2026): 0 validadas / 42 identificadas.** La validación exige, para cada código, **Excel íntegro y cotejado + PDF de convocatoria íntegro y cotejado con enlace guardado + comprobación documentada de la existencia del PDF de resultados + (si existe, PDF de resultados íntegro y cotejado con enlace guardado) + acta de persistencia**.

No encontrar un hipervínculo en Excel no demuestra ausencia de resultados; debe verificarse y registrar fuente/URL, fecha y alcance. Un expediente parcial nunca suma al contador. [Estado computable para Pages](data/estado_validacion.json) · [restricciones SQL del acta](db/estructura_v2.sql).


**Estado del producto (13 de noviembre de 2026):** comparador v2 conectado a la proyección de la base documental; extracción estructural y cotejo de PDF reales pendientes. No es una auditoría concluida.

**Enlaces PDF como evidencia:** la importación v2 ahora incorpora a SQLite las **URL y transcripciones ya disponibles de los 16 PDF**, con su tipo, código literal observado y estado `pendiente` de cotejo. Los originales de los cuatro lotes no se modifican. La prueba [`probar_validacion_convocatorias.py`](scripts/probar_validacion_convocatorias.py) comprueba sus enlaces y deja **0 actas reales**.

## Documentación de referencia — empezar aquí

La documentación del proyecto está **consolidada y ordenada** para que una nueva interacción pueda continuar sin reconstruir la conversación:

1. **[00 — REFERENCIA GENERAL: objetivos, normas, arquitectura, parámetros y estado](docs/00-REFERENCIA-GENERAL.md)** — documento central; distingue explícitamente lo implementado, probado y pendiente.
2. **[01 — REGISTRO DE DECISIONES, ERRORES Y CORRECCIONES](docs/01-REGISTRO-DECISIONES.md)** — explica el historial de la herramienta, cambios de criterio y por qué se descartaron enfoques anteriores.
3. **[02 — CONTINUIDAD Y VALIDACIÓN](docs/02-CONTINUIDAD-Y-VALIDACION.md)** — procedimiento para cada lote externo por IA, máximo 50 convocatorias, control de fuentes/lecturas y criterios para darlo por cerrado.

**Jerarquía vinculante:** [NORMA 01 — Integridad](docs/NORMA-01-integridad-exhaustividad.md) → [NORMA 02 — Comparabilidad](docs/NORMA-02-integracion-comparabilidad.md) → [NORMA 04 — Aceptación y conteo](docs/NORMA-04-validacion-convocatorias.md) → [NORMA 03 — IA externa](docs/NORMA-03-extraccion-externa-ia.md) → [configuración operativa](config/operacion_ia.json).

**Principio no negociable:** datos originales completos e inmutables, **separados** de indicadores sintéticos. El asistente estructura y verifica; el responsable del proyecto determina visibilidad e interpretación.

**Fotografía real del avance:** 42 convocatorias distintas; 43 filas Excel; 470 celdas; 16 PDF recuperados **solo como texto** (7 convocatoria, 9 resultados); **0 PDF reales con tablas/celdas cotejadas y 0 expedientes plenamente integrados**. Los lotes de prueba y sus textos no constituyen auditoría documental concluida.

## Sitio publicado: comparador v2 integrado

**[Abrir la herramienta principal en GitHub Pages](https://jncubillosn-lab.github.io/Estudiantes-Auxiliares-Veedur-a/)**

- `index.html` y `comparador-v2.html` publican la misma interfaz comparativa. El visor previo permanece íntegro en [`visor.html`](visor.html).
- La página lee [`data/exportacion_v2.json`](data/exportacion_v2.json), una proyección reproducible desde la base SQLite v2 y los cuatro lotes originales. **Pages no ejecuta SQLite**: la base se consulta mediante esta exportación estática.
- Mantiene **42 convocatorias, 43 filas originales de Excel, 470 celdas con sus metadatos y los textos completos disponibles de 16 PDF**. Las dos filas del mismo código permanecen diferenciadas dentro de su convocatoria.
- Los PDF con texto recuperado pero sin reconstrucción de tablas se presentan como **respaldo pendiente de cotejo**, no como requisitos ni resultados estructurados.
- El comparador permite seleccionar varias convocatorias, contrastar campos originales, consultar todas las celdas de Excel y acceder a los PDF disponibles. Los criterios, requisitos y resultados PDF se incorporarán cuando exista su extracción externa validada por la IA, bajo la [Norma 03](docs/NORMA-03-extraccion-externa-ia.md).
- La exportación se comprueba con `python scripts/generar_publicacion_v2.py --comprobar`; para generar la proyección desde fuentes y estructura se usa `--actualizar`. La validación automática exige la igualdad de cada celda y transcripción con las fuentes, no solamente de contadores.

**Límite actual verificable:** 0 tablas PDF cotejadas y 0 expedientes con los tres documentos integrados en campos semánticos. La interfaz no suplanta ese trabajo.

## Arquitectura v2 — implementada como prototipo independiente

La implementación se desarrolló en el **orden acordado**. Tras validar la integración, se publicó el comparador como página principal y se conservó el antiguo visor en `visor.html`, sin cambiar los cuatro lotes originales:

1. **Base de datos:** [esquema v2](db/estructura_v2.sql), originales inmutables, listas/celdas completas, referencias y derivados en tablas separadas.
2. **Página comparadora:** [abrir comparador v2](comparador-v2.html) · [en GitHub Pages](https://jncubillosn-lab.github.io/Estudiantes-Auxiliares-Veedur-a/comparador-v2.html). Compara los campos Excel de 42 convocatorias y deja señalados como pendientes los campos PDF todavía sin estructurar.
3. **Extracción externa por IA:** [Norma 03 y protocolo](docs/NORMA-03-extraccion-externa-ia.md), [parámetros operativos](config/operacion_ia.json), [validador de lotes](scripts/validar_lote_ia.py). La IA lee, transforma y coteja las fuentes; el código controla límites y fidelidad del proceso, **no sustituye la extracción humana/IA por heurísticas automáticas**.

**[Estado técnico, límites y comandos reproducibles](docs/estado-arquitectura-v2.md)**. Las pruebas automáticas han confirmado la persistencia de 470 celdas existentes y un recorrido completo sobre **PDF de prueba**. **No se ha hecho aún un cotejo visual estructural sobre PDF reales de la UNAL; no declarar expedientes completos**.

## Regla de datos — distinción estricta

**Datos originales:** los tres documentos fuente y todos sus elementos se conservan **íntegros, inalterados, estructurados y accesibles desde la interfaz**. Una convocatoria integrada puede presentar una sola vez un dato coincidente entre fuentes, como el número de convocatoria, pero cada ocurrencia original continúa disponible para inspección. Una lista de requisitos sigue siendo una lista completa con todos sus requisitos, no un indicador agregado.

**Datos sintéticos:** cálculos, sumas, conteos, indicadores o métricas **adicionales** con regla y procedencia explícitas. **Nunca reemplazan datos originales.** Por ejemplo, `7 requisitos` es un conteo sintético; los siete requisitos originales siguen existiendo por separado.

Se define de forma vinculante en la [Norma 01](docs/NORMA-01-integridad-exhaustividad.md) y el [contrato de integración de la Norma 02](docs/NORMA-02-integracion-comparabilidad.md).

## Propósito rector

Transformar **tres fuentes completas** —Excel, PDF de convocatoria y PDF de resultados— en **una única estructura por convocatoria**, verificable, integrable y **comparable entre múltiples convocatorias**. No es un directorio de publicaciones ni una vitrina para leer PDF como texto plano.

1. **[NORMA 01 — Integridad y exhaustividad](docs/NORMA-01-integridad-exhaustividad.md):** conservar y rastrear absolutamente todos los datos observables.
2. **[NORMA 02 — Integración estructural y comparabilidad](docs/NORMA-02-integracion-comparabilidad.md):** reconstruir tablas/celdas de los PDF, integrar fuentes, comparar requisitos/criterios/resultados y permitir veeduría sin calificar prácticas.
3. **[Diagnóstico y estado real](docs/estado-ejecucion.md):** describe dónde falló el primer prototipo y las puertas de calidad pendientes.

### Estado real, sin equiparar lectura a validación

| Métrica | Estado |
|---|---:|
| Códigos distintos de convocatoria | 42 |
| Filas originales en Excel | 43 |
| PDF consultados como texto (7 convocatoria + 9 resultados) | 16 |
| PDF con tablas y celdas visualmente reconstruidas/verificadas | **0** |
| Convocatorias con tres fuentes integradas y comparables | **0** |

**El sitio `visor.html` es el prototipo documental anterior de navegación**, no una herramienta terminada de veeduría. Presenta los PDF como texto lineal, lo que pierde la estructura tabular necesaria para evaluar y contrastar. **No escalar este formato como producto final**. El contenido conservado es respaldo para reconstrucción posterior.

La próxima implementación comienza por una **extracción externa de celdas y tablas por la IA** desde los PDF originales, con control de lote (máximo 50 convocatorias), cotejo visual y manifiesto verificable. Después se conectarán los campos a una ficha única y se creará la matriz transversal de comparación (carrera, dependencia, requisitos, criterios, ponderaciones, postulantes y resultados).

---

## Estado de importación

| Lote | Expedientes registrados | PDF leídos | Celdas | Renglones PDF |
|---|---:|---:|---:|---:|
| 01 — piloto | 3 | 3 | 33 | 415 |
| 02 — primera implementación | 5 | 5 | 55 | 668 |
| 03 — regular | 10 | 4 | 108 | 569 |
| 04 — optimizado | 25 | 4 | 274 | 688 |
| **Total** | **43** | **16** | **470** | **2.340** |

Se han detectado **51 registros provisionales de postulaciones** en los documentos de resultados y **4 hallazgos preliminares** con fuentes contrastables. La configuración de visibilidad del repositorio es decidida por su responsable. **Ninguno de los 43 expedientes está documentalmente completo todavía**, porque no se ha recuperado simultáneamente PDF de convocatoria y PDF de resultados para un mismo expediente. Los documentos disponibles se conservan sin supresión de contenido textual; faltan binarios, revisión visual y estructuración semántica final.

## Acceso a los datos

- [Estado y limitaciones actuales](docs/estado-ejecucion.md)
- [Norma superior de integridad](docs/NORMA-01-integridad-exhaustividad.md)
- [Modelo de datos](docs/modelo-de-datos.md)
- [Diccionario de campos](docs/diccionario-de-campos.md)
- [Protocolo de verificación](docs/protocolo-de-validacion.md)
- Datos fuente literales: `data/lotes/lote_01.json` … `lote_04.json`.
- Tablas relacionales: `db/schema.sql` y `db/seed_lote_01.sql` … `seed_lote_04.sql`.
- Vistas y posibles discrepancias: `db/views.sql` y `db/hallazgos_iniciales.sql`.

Para verificar y construir la base SQLite localmente, sin dependencias externas:

```bash
python scripts/verificar_base.py
python scripts/construir_base.py
```

La base resultante se guarda en `salidas/veeduria.sqlite` (local, no versionada). La acción de GitHub también puede generar un artefacto temporal de esta base, accesible a usuarios autorizados del repositorio.

**La verificación automática compara datos de origen y tablas relacionales, pero no valida visualmente el PDF.**

## Propósito

Construir una base documental **verificable, reversible y auditable** a partir de tres clases de fuentes independientes:

1. Hoja de cálculo original (celdas, enlaces, formatos, fórmulas y capturas temporales).
2. PDF de convocatoria (y adendas, tanto integradas como independientes).
3. PDF de resultados (y publicaciones sucesivas, aclaraciones o correcciones).

No fusionar ni corregir automáticamente valores contradictorios. Conservar originales, transcripción, interpretación y hallazgo en planos separados.

## Archivos

- `docs/modelo-de-datos.md`: arquitectura de fuentes, datos, excepciones y comparaciones.
- `docs/diccionario-de-campos.md`: campos esperados (ampliables) para las tres fuentes.
- `docs/protocolo-de-validacion.md`: pasos y criterios de aceptación para extracción de alta fidelidad.
- `db/schema.sql`: esquema SQLite inicial, extensible, sin datos personales incorporados.

## Estado de verificación real

Se comprobó acceso a dos pestañas de la hoja `Copia de Convocatorias Estudiantes Auxiliares - Sede Bogotá` (37 filas de cuadrícula abiertas; 7.558 filas de cuadrícula cerradas). **Estas son dimensiones declaradas por Google Sheets, no un recuento definitivo de registros**. También se verificó lectura de convocatorias y de resultados desde vínculos de Google Drive.

Casos reales útiles como pruebas posteriores:
- 2026-C2381: Excel informa cierre el 18/11; PDF informa 19/11.
- 2026-C2361: adenda integrada modifica requisito de avance curricular.
- 2026-C2363: adenda integrada anuncia desierta por duplicidad.
- Archivo de resultados llamado 2026-C2312: en texto interno figura otro identificador (2026-C2302); requiere cotejo visual antes de concluir cuál es correcto.
- 2026-C2309: incluye selección, renuncia y descalificación, y ponderaciones con subcriterios.

## Responsabilidad del tratamiento y de la publicación

La base original se conserva completa y sin omisiones decididas por el sistema. El usuario responsable determina la visibilidad y el alcance de las publicaciones. El asistente no altera, elimina, oculta, anonimiza ni publica datos originales por iniciativa propia.

## Ruta propuesta

1. Congelar captura de la hoja: filas, celdas, valores literales, fórmulas e hipervínculos.
2. Hacer piloto de 15–30 casos con alta variabilidad, incluyendo adendas y resultados.
3. Ajustar diccionario y extracción con base en el piloto, manteniendo versionado.
4. Importar por lotes, registrar errores y revisar integridad documental.
5. Registrar todos los datos íntegros en un almacenamiento con acceso controlado; si se decide elaborar una vista pública, crearla como producto separado y sin alterar los registros originales.

> La base no establece irregularidades por sí sola. Registra evidencias, diferencias, hipótesis y su estado de revisión.