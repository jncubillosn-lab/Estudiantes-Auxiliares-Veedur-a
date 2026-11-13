# Arquitectura documental de la base

> **ARCHIVO HISTÓRICO — NO VIGENTE (13-11-2026).** Este texto corresponde a una fase anterior a la base v3. No utilizar sus esquemas, estados, parámetros ni pasos como instrucciones actuales. **Prevalecen [NORMA 00](../NORMA-00-validacion-integral.md), [base v3](../BASE-V3-OPERACION-Y-GARANTIAS.md) y [contratos vigentes](../00-REFERENCIA-GENERAL.md)**. Se conserva el documento por trazabilidad del proyecto.


## Jerarquía normativa
Prevalece [NORMA 01](../NORMA-01-integridad-exhaustividad.md): el sistema transforma, conserva y permite contrastar; no decide qué información omitir.

## Tres grupos independientes
1. **Hoja de cálculo:** captura, fila, celda, encabezado, valor visible, valor de origen, fórmula, enlace y formato; no se asume que una celda sin hipervínculo conduce a un PDF.
2. **PDF de convocatoria:** documento, fragmentos y texto íntegro obtenido, campos identificados, requisitos, actividades, documentos exigidos, criterios, notas y adendas cuando puedan estructurarse con evidencia.
3. **PDF de resultados:** documento, contenido y renglones originales, participantes, identificadores literales, valores por columna, puntuaciones, selección, elegibilidad, exclusión, observaciones y posibles rectificaciones.

No se fusionan fuentes disonantes; los vínculos a un expediente no reescriben sus contenidos.

## Modelo relacional (23 tablas)
`captura_hoja`, `caso_convocatoria`, `fila_hoja`, `celda_hoja`, `documento`, `pagina_pdf`, `fragmento_pdf`, `campo_documento`, `campo_fragmento`, `vinculo_caso`, `adenda`, `cambio_adenda`, `requisito`, `actividad`, `documento_exigido`, `criterio_evaluacion`, `publicacion_resultados`, `postulacion`, `dato_postulacion`, `calificacion`, `hallazgo`, `evento_revision`, `ejecucion_extraccion`.

La **capa fuente literal** es obligatoria; la **capa semántica** y la **capa de auditoría** se complementan sin sustituir la original. En la ejecución piloto hay tablas semánticas aún vacías porque requieren segmentación visual y cotejo de encabezados; esto se consigna como pendiente, nunca como validado.

## Identidad
- `caso_convocatoria.caso_id` identifica el expediente interno; **no sustituye** el número literal de la convocatoria.
- Dos filas con el mismo código no se fusionan automáticamente.
- Los códigos que aparecen en el nombre del archivo, Excel, y PDF interno se conservan separadamente para contrastar.
- `postulacion.identificacion_literal` almacena la identificación como figura en el documento; no crear alias que la reemplace.
- Un PDF puede estar vinculado a más de un caso o existir más de una versión de un documento, sujeto a verificación.

## Integridad y estados
- `leido`: el sistema obtuvo contenido textual.
- `transcrito_sin_cotejo_visual`: texto almacenado, visualización y fidelidad gráfica pendientes.
- `pendiente_de_localizar`: hay referencia de celda pero no URL PDF recuperable en la captura.
- `sin_url_pdf`: no asumir que el archivo no existe; únicamente falta vínculo comprobado.
- `verificado`: se cotejó la representación estructurada con el original visual, incluyendo tablas, casillas, páginas y firmas.

Conservamos `texto_extraido_integro` y **cada renglón original**; la paginación actual se infiere de cabeceras repetidas, no se ha validado contra binarios. El campo `campos_detectados` es un índice de ubicación auxiliar y puede tener falsas coincidencias; no se presenta como verdad documental sin cotejo.

## Construcción local reproducible
En una copia privada de este repositorio:

```bash
python scripts/verificar_base.py
python scripts/importar.py --db salidas/veeduria.sqlite
```

El importador desde JSON reconstruye la capa literal. Para reproducir la exportación SQL enriquecida con filas de resultados detectadas automáticamente:

```python
from pathlib import Path
import sqlite3
root = Path(".")
db = sqlite3.connect("salidas/veeduria_desde_sql.sqlite")
db.executescript((root/"db/schema.sql").read_text(encoding="utf-8"))
for n in range(1,5):
    db.executescript((root/"db"/f"seed_lote_0{n}.sql").read_text(encoding="utf-8"))
db.close()
```

La verificación comprueba que las celdas y los textos guardados en SQL coinciden exactamente con los JSON de cada lote. **No es una revisión gráfica ni una certificación de completitud semántica.**
