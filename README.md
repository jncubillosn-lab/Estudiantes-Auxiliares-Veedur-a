# Veeduría de convocatorias de estudiantes auxiliares — UNAL

**Versión:** piloto documental v0.2 (13 de noviembre de 2026).  
**Estado:** cuatro lotes importados y verificados en su capa textual; cotejo visual y recuperación de PDF faltantes pendientes.

## Norma superior del proyecto

**[NORMA 01 — Integridad, exhaustividad y visibilidad de las fuentes](docs/NORMA-01-integridad-exhaustividad.md)**. La tarea es transformar, nunca escoger qué datos conservar. Todo el contenido original de Excel, convocatorias y resultados debe permanecer completo y consultable en estructuras explícitas, sin alias sustitutos, omisiones, anonimización en la base fiel ni normalizaciones que sobrescriban lo literal. Toda extracción debe conservar referencia a su fuente y ubicación original.

## Visor HTML de validación

**[Abrir el archivo del visor](visor.html)** (en el repositorio privado, usar **Download raw file** y abrir `visor.html` en el navegador). **No exige servidor ni instalación**: los 43 registros de la hoja y los 16 textos PDF ya están embebidos en una copia portátil. El visor agrupa por **42 códigos distintos de convocatoria**; conserva las dos filas del código `2026-C2324`.

El buscador incluye: texto libre, carrera mencionada (clasificación heurística), facultad, dependencia extraída del PDF, estado abierto/cerrado, presencia de PDF de resultados, cobertura documental, progreso de validación y ordenamientos. En cada ficha pueden consultarse todas las celdas originales y el texto completo que devolvió el extractor para los documentos disponibles.

La pestaña **Revisión y notas** permite verificar por separado hoja, PDF convocatoria y PDF resultados, registrar discrepancias, anotar el número de postulantes *confirmado manualmente* y guardar observaciones. **La validación manual no modifica los datos fuente**.

Las observaciones se conservan **solo en el navegador** mediante almacenamiento local. Para compartirlas con el proyecto debe elegirse **Exportar observaciones JSON** y adjuntar ese archivo a una revisión. También se pueden importar para retomar el trabajo en otro equipo. **No se suben automáticamente a GitHub.**

### Limitaciones expresas
- «Sin PDF enlazado» no significa que el documento no exista o que la convocatoria no tenga resultados.
- Un PDF leído es una **transcripción textual pendiente de cotejo visual**, no un PDF revisado integralmente.
- Los números de participantes detectados mediante patrones son preliminares: el visor distingue explícitamente ese conteo de una cifra confirmada.
- La clasificación por carrera y la identificación de la dependencia son **ayudas de búsqueda**, no sustituyen el valor literal de las fuentes.
- El HTML incorpora datos originales, incluidos identificadores presentes en resultados; **su distribución debe permanecer bajo controles de acceso autorizados**, como los del repositorio privado.

## Estado de importación

| Lote | Expedientes registrados | PDF leídos | Celdas | Renglones PDF |
|---|---:|---:|---:|---:|
| 01 — piloto | 3 | 3 | 33 | 415 |
| 02 — primera implementación | 5 | 5 | 55 | 668 |
| 03 — regular | 10 | 4 | 108 | 569 |
| 04 — optimizado | 25 | 4 | 274 | 688 |
| **Total** | **43** | **16** | **470** | **2.340** |

Se han detectado **51 registros provisionales de postulaciones** en los documentos de resultados y **4 hallazgos preliminares** con fuentes contrastables. El repositorio es privado. **Ninguno de los 43 expedientes está documentalmente completo todavía**, porque no se ha recuperado simultáneamente PDF de convocatoria y PDF de resultados para un mismo expediente. Los documentos disponibles se conservan sin supresión de contenido textual; faltan binarios, revisión visual y estructuración semántica final.

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

## Privacidad

**La base íntegra conserva todos los datos literales**, incluidos los identificadores y resultados necesarios para la trazabilidad. No se anonimizan ni sustituyen dentro de la base fiel. La protección de acceso se gestiona en la infraestructura de almacenamiento, separadamente de la extracción. Mientras el repositorio no figure como privado y no se haya confirmado autorización efectiva de acceso, no se incorporarán archivos con datos personales. Una eventual versión de consulta pública no podrá modificar la base íntegra ni se elaborará sin decisión expresa del responsable del proyecto.

## Ruta propuesta

1. Congelar captura de la hoja: filas, celdas, valores literales, fórmulas e hipervínculos.
2. Hacer piloto de 15–30 casos con alta variabilidad, incluyendo adendas y resultados.
3. Ajustar diccionario y extracción con base en el piloto, manteniendo versionado.
4. Importar por lotes, registrar errores y revisar integridad documental.
5. Registrar todos los datos íntegros en un almacenamiento con acceso controlado; si se decide elaborar una vista pública, crearla como producto separado y sin alterar los registros originales.

> La base no establece irregularidades por sí sola. Registra evidencias, diferencias, hipótesis y su estado de revisión.