# CONTRATO ÚNICO DE SALIDA V3 — Herramienta de visualización

**Versión:** 3.0 · **Norma superior:** [NORMA 00](NORMA-00-validacion-integral.md).  
**Estado:** contrato implementado por [scripts/exportar_base_v3.py](../scripts/exportar_base_v3.py); la página publicada hoy sigue utilizando v2 y **no debe presentarse como conectada a v3**.

## 1. Una única entrada: datos integrados por código

La visualización recibe **un único JSON**, producido desde SQLite v3:

\`\`\`bash
python scripts/construir_base_v3.py --salida salidas/convocatorias_v3.sqlite
python scripts/exportar_base_v3.py --db salidas/convocatorias_v3.sqlite --salida salidas/expedientes_v3.json
\`\`\`

El artefacto resultante, \`expedientes_v3.json\`, es **la única interfaz de entrada de datos para el futuro visualizador v3**. No debe leer datos dispersos de lotes originales para inventar una nueva conciliación. **GitHub Pages no ejecuta SQLite**; el JSON es una proyección que debe reconstruirse desde la base, nunca convertirse en fuente original.

### Objeto de raíz (contrato JSON)

\`\`\`json
{
  "version_contrato": "3.0",
  "tipo": "expedientes_integrados_sin_sintesis_sustitutiva",
  "norma_principal": "docs/NORMA-00-validacion-integral.md",
  "metricas": {
    "convocatorias_validadas": 0,
    "convocatorias_identificadas": 42
  },
  "advertencias": {
    "expediente_identificado_no_equivale_validado": true,
    "texto_pdf_historico_no_es_estructura_cotejada": true,
    "sin_resultados_requiere_consulta_documentada": true,
    "estado_validez_tomado_de_v3_convocatorias_validadas": true,
    "datos_sinteticos_son_adicionales": true
  },
  "capturas_originales": [],
  "convocatorias": []
}
\`\`\`

Los valores son **solo un ejemplo del corte histórico**; no se fijan como constantes universales. \`capturas_originales\` incluye ruta, SHA256, tamaño, URL, lote y corte, **no** duplica el JSON bruto (este permanece en SQLite y en los archivos originales).

## 2. Estructura por convocatoria

\`\`\`text
convocatorias[]:
  numero                 ID de integración (no reemplaza códigos literales de fuentes)
  estado_validacion      no_iniciada | en_curso | bloqueada | validada
  validada               booleano derivado de la vista SQL; NO editable
  fuentes_originales[]   URL y versión + contenido original y revisión de CADA fuente
  datos_originales[]     hechos completos con fuente y posición, sin resumen
  listas_originales[]    listas con todos sus ítems, en orden
  resultados_estructurados[] filas con todos sus valores literales
  indicadores_sinteticos[]  derivados separados con fórmula e insumos
  control_validacion:
    puertas[]               A/B/C/D/E con estado y criterios documentados
    comprobaciones_resultados[] consultas y evidencia de presencia/ausencia
    incidencias[]           problema + resolución independiente
    actas[]                 cierre(s) histórico(s), no validación editable
\`\`\`

### Fuentes originales (\`fuentes_originales[]\`)

Cada fuente incluye obligatoriamente:

- \`fuente_id\`, \`tipo\`, \`url_original\`, \`version_literal\`, \`resultado_acceso\`, \`codigo_interno_literal\` y \`nombre_literal\` cuando constan.
- \`sha256_pdf_nativo\` **solo si existen bytes del PDF original**. Nunca confundirlo con el hash de la transcripción.
- \`filas_excel[]\`: cada fila, pestaña, índice original y \`celdas[]\`, cada celda con encabezado, columna, valor visible/entrada, fórmula, nota, hipervínculo y formato.
- \`pdf_lectura_previa\`: \`null\` o respaldo íntegro de las lecturas anteriores, incluyendo **páginas textuales y campos detectados**, marcado \`texto_sin_cotejo\`; no equivale a PDF completo.
- \`paginas_pdf_estructuradas[]\`: cuando la IA lo registre, cada página contiene elementos originales, tablas originales y **todas sus celdas** con coordenadas, incluso vacíos e ilegibles documentados.
- \`revision_de_cobertura[]\`: revisiones de esa fuente y métricas individuales de \`filas\`, \`celdas\`, \`paginas\`, \`tablas\`, \`requisitos\`, \`participantes\`, \`puntajes\` y otras obligatorias, con esperados/cotejados, estado, evidencia, fecha, método y alcance.

Se conserva **cada fuente por separado** aunque varias tengan igual código, texto o contenido. La interfaz puede mostrar una única cabecera del expediente, pero **no puede borrar apariciones originales**.

### Originales semánticos y estructuras

- \`datos_originales[]\`: \`dato_id\`, \`numero\`, \`fuente_id\`, \`literal_completo\`, \`rotulo_literal\`, \`codigo_concepto\`, posición (\`pagina_id\`, \`celda_pdf_id\`, \`celda_excel_id\`), orden y notas. Es **una vista de indexación**, no una edición de la fuente.
- \`listas_originales[]\`: \`lista_id\`, fuente, concepto, página, orden, \`items[]\` con \`literal_completo\`, \`orden\`, \`item_padre_id\`, vínculos a datos/celdas y notas. **Nunca sustituir una lista por su cantidad**.
- \`resultados_estructurados[]\`: \`resultado_fila_id\`, tabla, índice de fila, nombre/identificación originales, \`valores[]\` con encabezado, celda, puntaje/valor y anotaciones. La tabla PDF íntegra se conserva además en la fuente.
- \`indicadores_sinteticos[]\`: \`nombre\`, \`valor\`, \`formula\`, \`version_formula\`, \`fecha_calculo\`, \`insumos_datos_originales[]\`. Es **otra capa**, identificada explícitamente; no aparece como dato documental original.

### Validación

\`estado_validacion\` y \`validada\` salen de \`v3_estado_por_convocatoria\` y \`v3_convocatorias_validadas\`. Los **únicos** valores de avance oficial salen de \`v3_metrica_principal\`.

**Una fuente sin PDF de resultados** es diferente de **resultados comprobados como no disponibles**. El visualizador lee \`control_validacion.comprobaciones_resultados\`: \`pdf_encontrado\`, \`sin_pdf_verificado_al_corte\` o \`indeterminado\`; una lista vacía de comprobaciones significa **no verificado**, nunca «no hay resultados».

El visualizador debe poder mostrar para cada puerta: criterio, evidencia URL, alcance, fecha, responsable, total observado/cotejado, pendientes e incidencias. Los enlaces a **PDF originales** se presentan junto a su información, no solo en el pie.

## 3. Contratos de fidelidad

1. **No modificar originales** en la interfaz; agrupar no elimina ocurrencias.
2. **No deducir valores que no existen**. \`null\`, ausencia de registros, \`pendiente\` y \`0\` son cosas diferentes.
3. **No mostrar «validada» por tener un PDF leído**, por campo booleano manual ni por un indicador sintético. Consultar solo la vista de validación.
4. **No mezclar evidencia y análisis:** los sintéticos se muestran en otra sección o con etiqueta inequívoca.
5. **No ocultar errores:** consultas sin resultado, PDF inaccesibles, versiones discrepantes, diferencias de código, celdas ilegibles e incidencias deben ser accesibles.
6. **No perder información al incorporar nuevos campos**: la interfaz debe poder inspeccionar los elementos sin clasificación en \`elementos_originales\`, aunque no tengan una etiqueta semántica.
7. La URL exacta en \`url_original\` es el medio de contrastación con el archivo; si está rota se indica \`fallo\`, pero **no se borra la referencia**.
8. Mostrar \`convocatorias_validadas\` como **métrica principal** y \`convocatorias_identificadas\` como inventario secundario.

## 4. Estado de integración

**Implementado:** estructura SQL, importación de capturas históricas, exportador de JSON, separación de originales/sintéticos/validación, y pruebas automatizadas.  
**No implementado todavía:** conexión de \`index.html\` a este contrato v3. **No modificar la interfaz en esta tarea.**

**Corte histórico importado:** 42 códigos, 43 filas Excel, 470 celdas, 7 PDF de convocatoria + 9 de resultados **en lectura textual previa**, 0 tablas PDF visualmente cotejadas, **0 convocatorias validadas**. Este estado es una limitación real y debe mostrarse.
