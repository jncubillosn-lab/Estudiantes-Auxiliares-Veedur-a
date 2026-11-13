# Norma 03 — Operación externa de extracción mediante IA

## Condición de aceptación de la extracción: NORMA 04

La actividad `persistir` dentro de una secuencia no significa por sí misma que la **convocatoria esté validada**. El cierre depende de [NORMA 04 — Validación por convocatoria](NORMA-04-validacion-convocatorias.md): Excel íntegro, PDF convocatoria íntegro y enlazado, comprobación real de resultados y, cuando estén disponibles, PDF resultados íntegro y enlazado, más acta final de evidencia y persistencia. Una comprobación de que no hay PDF de resultados debe incluir **URL de la publicación consultada, fecha y alcance**. Una celda sin enlace no equivale a comprobación.

**El contador es exclusivamente el número de actas aceptadas por la base**, no el número de manifiestos «cotejados» ni el de documentos recuperados. [Regla SQL y métrica](../db/estructura_v2.sql). El validador de manifiestos revisa coherencia declarada, pero **no certifica** automáticamente la lectura visual de un PDF.


**Prioridad:** subordinada a [Norma 01](NORMA-01-integridad-exhaustividad.md) y [Norma 02](NORMA-02-integracion-comparabilidad.md).  
**Decisión vigente:** el programa no realiza la interpretación documental ni necesita un motor autónomo de extracción. **La extracción, lectura visual, reconstrucción de tablas y transcripción estructurada las realiza el asistente de forma externa al programa** en cada interacción solicitada. Los scripts especializados son **herramientas auxiliares opcionales para comprobar evidencias**, nunca sustitutos de la lectura e interpretación de la IA.

## Alcance exacto de las tres tareas

1. **Base de datos:** estructura explícita para originales íntegros, vínculos entre las tres fuentes y derivados sintéticos separados.
2. **Interfaz:** comparador de convocatorias basado en esa estructura, con acceso a todas las tablas, celdas, requisitos, criterios, postulaciones y resultados originales.
3. **Extracción externa mediante IA:** proceso operativo humano/IA para obtener, comprobar, transformar y guardar la información en la estructura ya definida. El código de esta etapa **se limita a validadores, inventarios, control de avance, fidelidad, orden, cobertura, repetición de lecturas y consistencia**. No debe convertirse en un segundo programa que intente interpretar automáticamente los PDF.

Este orden se respeta también en las futuras mejoras. Antes de extraer nuevas convocatorias hay que tener claros los destinos de cada dato y cómo se consulta desde la interfaz.

## Límites de capacidad por interacción

- **Máximo duro: 50 convocatorias distintas por solicitud/interacción.** No son 50 filas de Excel ni 50 PDF. Si un código tiene dos filas, sigue siendo una convocatoria; sus dos filas se conservan.
- El tamaño efectivo del lote puede ser inferior según complejidad de páginas, resultados, adendas o capacidad de cotejo. Nunca se aumenta el lote sacrificando cobertura o integridad.
- Para avanzar se utiliza un **manifiesto de lote persistente**, con orden de convocatorias, fuentes efectivamente leídas, estados, documentos faltantes, comprobaciones, pendientes y evidencias.
- En una nueva interacción se continúa desde el último expediente/etapa **persistido y verificado**, sin volver a examinar documentos que ya se leyeron correctamente a menos que sea necesario un cotejo concreto.

## Secuencia operativa por convocatoria (orden obligatorio)

1. `identificar_fuentes`: registrar código, filas originales de Excel, vínculo real de PDF de convocatoria, vínculo real de PDF de resultados, adendas y versiones. No inferir URL faltantes.
2. `leer_excel`: conservar todas las celdas originales, incluidas repetidas, vacías, hipervínculos, encabezados y estados.
3. `leer_convocatoria`: leer visualmente el documento, página por página, y reconstruir toda su estructura **en filas/celdas/listas**. Conservar contenido íntegro, notas, normas, adendas y excepciones.
4. `leer_resultados`: leer y reconstruir todas las páginas, columnas, participantes, identificaciones, calificaciones, notas, estados y anexos. Si no está publicado/enlazado, registrar el estado real sin declararlo inexistente.
5. `integrar`: asociar **sin reemplazar ni resumir** los originales por código común, comparando valores coincidentes o disonantes.
6. `verificar`: control de completitud de página, cobertura de tablas/celdas/listas, trazabilidad al original y comparación visual puntual. No declarar validación si hay elementos por cotejar.
7. `persistir`: escritura y verificación de las tablas correspondientes, manifiesto de lote y punto de continuación. No marcar como cerrado antes de confirmar persistencia.

### Evitar lecturas repetidas sin eliminar información repetida

**Son cosas completamente distintas.**

- **No repetir trabajo:** si la misma fuente, versión, página y región ya fue extraída, no volver a leerla para generarla otra vez. El manifiesto registra una identidad única de lectura; un segundo paso de validación es una acción diferente, justificada y registrada.
- **No eliminar repeticiones auténticas:** si el mismo requisito, aviso o párrafo está impreso en dos lugares, o aparece en dos versiones/documentos, **ambas ocurrencias originales se conservan** con sus ubicaciones. Igual para tablas de resultados, encabezados repetidos y anexos.
- La identidad de un elemento es su **procedencia + versión + ubicación**, no únicamente su texto. Un mismo texto en dos celdas distintas no autoriza deduplicarlo.
- Distinguir **extracción** de **cotejo**: el segundo puede revisar evidencia ya capturada sin crear una ocurrencia ficticia de contenido original.

## Comprobaciones mínimas obligatorias

**Antes de empezar:** código, número y orden de convocatorias (máximo 50), ubicación/corte de la hoja, lista real de archivos, punto de continuación y versión de estructura.  
**Durante la lectura:** control de posición, páginas previstas/procesadas, tablas/celdas previstas/procesadas, listas/ítems completos, documentos no accesibles, adendas y observaciones fuera de esquema.  
**Antes de persistir:** originales y sintéticos separados; no hay información reemplazada por sumas; toda celda se conecta a su fuente; discrepancias permanecen paralelas; la ausencia es un estado explícito.  
**Después de persistir:** comprobar las mismas cantidades, vínculos y valores en la base, escribir manifiesto y estado de cada convocatoria.

Un validador automático **no puede certificar por sí solo que un PDF real se interpretó correctamente**. Controla consistencia del proceso y cobertura declarada; el cotejo visual de información y tablas corresponde a la IA durante la extracción y puede requerir una revisión adicional.

## Instrumentos permitidos

- Lectores y renderizadores PDF, visores de página y herramientas de extracción de texto con posición: **opcionales**, usados para ayudar a la lectura visual o contrastar valores.
- Validador de lotes `scripts/validar_lote_ia.py` y parámetros `config/operacion_ia.json`: control de tamaño, orden, lecturas repetidas, cobertura declarada y persistencia.
- Registro de progreso que permite reanudar, sin reanalizar todo lo anterior.
- Pruebas de integridad de base de datos y rastreabilidad a página/celda original.

**Fuera del alcance del programa:** motor autónomo de OCR, heurísticas de interpretación de requisitos, selección de filas o decisión automática de cuáles campos importan. La IA transforma externamente; el programa **guarda, presenta, compara y valida las condiciones de integridad**.

## Criterio de cierre por lote

Un lote puede cerrarse **como procesado** solo cuando todas las convocatorias tienen su progreso registrado, se han persistido sus datos y se distinguen los elementos cotejados de los pendientes. **Un lote procesado no equivale a que todos sus PDF estén disponibles ni a un lote íntegramente cotejado.** No avanzar silenciosamente dejando documentos o elementos sin estado.

El protocolo de procesamiento no debe modificar las fuentes originales ni decidir su visibilidad.