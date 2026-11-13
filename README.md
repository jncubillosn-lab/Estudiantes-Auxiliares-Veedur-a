# Veeduría de convocatorias de estudiantes auxiliares — UNAL

**Estado del producto:** replanteamiento de arquitectura de extracción y comparabilidad (13 de noviembre de 2026).

## Arquitectura v2 — implementada como prototipo independiente

La implementación ya se inició en el **orden acordado**, sin tocar los cuatro lotes originales ni reemplazar el sitio `index.html`:

1. **Base de datos:** [esquema v2](db/estructura_v2.sql), originales inmutables, listas/celdas completas, referencias y derivados en tablas separadas.
2. **Página comparadora:** [abrir comparador v2](comparador-v2.html) · [en GitHub Pages](https://jncubillosn-lab.github.io/Estudiantes-Auxiliares-Veedur-a/comparador-v2.html). Compara los campos Excel de 42 convocatorias y deja señalados como pendientes los campos PDF todavía sin estructurar.
3. **Extracción:** [captura con geometría y binario original](scripts/extraer_pdf_v2.py), [importación relacional](scripts/importar_pdf_v2.py) y [exportación del comparador](scripts/exportar_comparador_v2.py).

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

**El sitio `index.html`/`visor.html` es un prototipo documental de navegación**, no una herramienta terminada de veeduría. Presenta los PDF como texto lineal, lo que pierde la estructura tabular necesaria para evaluar y contrastar. **No escalar este formato como producto final**. El contenido conservado es respaldo para reconstrucción posterior.

La próxima implementación comienza por una **prueba de extracción de celdas y posiciones desde el PDF original**, con cotejo visual de convocatoria y resultados. Después se conectarán los campos a una ficha única y se creará la matriz transversal de comparación (carrera, dependencia, requisitos, criterios, ponderaciones, postulantes y resultados).

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