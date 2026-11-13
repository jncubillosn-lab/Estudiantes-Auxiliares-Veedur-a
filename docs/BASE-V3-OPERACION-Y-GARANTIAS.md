# BASE DE DATOS V3 — Implementación, operación y garantías

**Fecha:** 13 de noviembre de 2026 · **Objeto:** implementación de la base de datos, **sin modificar la herramienta de visualización ni automatizar la extracción documental**.  
**Mandato supremo:** [NORMA 00](NORMA-00-validacion-integral.md): ninguna convocatoria cuenta como validada sin Excel íntegro, PDF de convocatoria íntegro con enlace, comprobación real de resultados y PDF de resultados íntegro con enlace cuando exista, y acta final con todos los controles.

## 1. Qué se implementó en el repositorio

| Pieza | Archivo | Función |
|---|---|---|
| **Modelo relacional** | [\`db/estructura_v3.sql\`](../db/estructura_v3.sql) | Fuentes originales inmutables, relaciones, Excel, PDF estructurado, listas, resultados, entrega de IA, evidencias, puertas A–E, incidencias, actas y vistas. |
| **Construcción operativa** | [\`scripts/construir_base_v3.py\`](../scripts/construir_base_v3.py) | Genera un SQLite NUEVO desde las capturas originales existentes; conserva sus bytes, celdas, vínculos y texto previo PDF. **No ejecuta extracción PDF**. |
| **Exportación única** | [\`scripts/exportar_base_v3.py\`](../scripts/exportar_base_v3.py) | Genera **un JSON de expedientes integrados** para el futuro visualizador, con originales + controles + sintéticos en secciones independientes. |
| **Control de trabajo de IA** | [\`scripts/validar_entrega_ia_v3.py\`](../scripts/validar_entrega_ia_v3.py) y [\`config/contrato_ia_v3.json\`](../config/contrato_ia_v3.json) | Comprueba el manifiesto: ≤50 códigos por interacción, versiones, fuentes, páginas/posiciones y no repetir extracción. **No lee ni interpreta PDFs**. |
| **Pruebas** | [\`scripts/probar_estructura_v3.py\`](../scripts/probar_estructura_v3.py), [\`scripts/probar_construccion_v3.py\`](../scripts/probar_construccion_v3.py), [\`scripts/probar_exportacion_v3.py\`](../scripts/probar_exportacion_v3.py), [\`scripts/probar_control_ia_v3.py\`](../scripts/probar_control_ia_v3.py) | Casos ficticios de puertas A–E, cotejos, nuevos documentos y pruebas contra las capturas reales disponibles. |
| **CI / base descargable** | [\`.github/workflows/validar_v3.yml\`](../.github/workflows/validar_v3.yml) | Ejecuta pruebas, construye la base y genera un **artefacto de GitHub Actions** que contiene SQLite + JSON de consulta. |
| **Contrato para visualización** | [\`docs/CONTRATO-V3-VISUALIZACION.md\`](CONTRATO-V3-VISUALIZACION.md) | Especifica la **única entrada** que deberá recibir el visualizador en una fase posterior. |
| **Contrato para la IA** | [\`docs/CONTRATO-V3-EXTRACCION-IA.md\`](CONTRATO-V3-EXTRACCION-IA.md) | Especifica todo lo que la IA debe observar, entregar, documentar y cotejar. |

## 2. Cómo reproducir el sistema

Desde la raíz del repositorio, con **Python 3.12 o superior** y la biblioteca SQLite incluida en Python:

\`\`\`bash
# 1. Revisar esquema, puertas y rechazo de expedientes incompletos
python scripts/probar_estructura_v3.py

# 2. Comprobar que se importan todos los datos originales del corte histórico
python scripts/probar_construccion_v3.py

# 3. Comprobar que el JSON de salida no elimina datos ni mezcla originales con síntesis
python scripts/probar_exportacion_v3.py

# 4. Verificar los controles del trabajo externo de IA
python scripts/probar_control_ia_v3.py

# 5. Construir una base SQLite NUEVA sin sobrescribir otra existente
python scripts/construir_base_v3.py --salida salidas/convocatorias_v3.sqlite

# 6. Crear la salida única para el futuro visualizador
python scripts/exportar_base_v3.py \
  --db salidas/convocatorias_v3.sqlite \
  --salida salidas/expedientes_v3.json

# 7. Comprobar un manifiesto de IA (caso de prueba ficticio)
python scripts/validar_entrega_ia_v3.py tests/fixtures/entrega_ia_v3_ejemplo.json
\`\`\`

El constructor **rechaza sobrescrituras**. La base generada se puede volver a construir desde los cuatro lotes ya guardados; no requiere servicios externos para reproducir este corte. **Reproducir las capturas no equivale a cotejar los PDF originales**.

En [GitHub Actions](https://github.com/jncubillosn-lab/Estudiantes-Auxiliares-Veedur-a/actions), seleccionar «Validar arquitectura v3 sin fuentes reales» y descargar el artefacto \`base-v3-corte-historico\` del último trabajo completado satisfactoriamente. La base es un **artefacto reproducible**, no debe confundirse con archivos originales. El plazo de conservación del artefacto depende de GitHub; los scripts y capturas originales permanecen en el repositorio.

## 3. Qué trae actualmente el SQLite generado

A partir del material histórico existente se importan **sin inventar cotejos nuevos**:

- **4 capturas JSON completas**: cada una conserva su texto UTF-8 original y SHA256 verificable, incluida toda información no clasificada, observaciones y referencias.
- **42 códigos distintos de convocatoria**, **43 filas de Excel** y **470 celdas literales** con encabezados, valores de origen/visibles, hipervínculos, fórmulas, notas y formato disponibles. \`2026-C2324\` conserva sus **dos filas** originales.
- **16 referencias PDF**: **7 de convocatoria y 9 de resultados**; cada una conserva su URL real, código interno observado y el objeto JSON íntegro de la **lectura textual anterior** (texto, páginas de texto, campos detectados y metadatos).
- **0 páginas/tablas PDF cotejadas** bajo v3; no se convierte texto plano en celdas que no constan.
- **0 actas de validación reales y 0 convocatorias validadas.** Los códigos identificados son inventario, no métrica de éxito.

La copia del PDF **binario** no existe en estas capturas; \`v3_fuente.binario_original\` y \`sha256\` se mantienen sin valor hasta que se obtenga el archivo binario real. **No se atribuye al PDF el SHA del texto extraído.**

## 4. Entradas y salidas de la base

### Entrada de capturas ya existentes

\`data/lotes/lote_01.json\` a \`lote_04.json\` → constructor → \`v3_captura_lote\`, \`v3_fuente\`, \`v3_excel_fila\`, \`v3_excel_celda\`, \`v3_dato_original\`, \`v3_lectura_pdf_previa\`.

La captura histórica se conserva íntegra, además de su representación estructurada. Si aparece un campo no interpretado, permanece dentro de la captura original; nunca desaparece por no tener clasificación.

### Entrada posterior producida por la IA

La IA proporciona fuentes/versiones, contenidos estructurados y cotejos exigidos en [CONTRATO-V3-EXTRACCION-IA.md](CONTRATO-V3-EXTRACCION-IA.md). La base dispone de **tablas específicas** para guardar páginas, elementos, tablas, celdas, listas, resultados y verificaciones, además de la captura JSON de la entrega de IA. **El código no convierte ni interpreta automáticamente documentos; esa lectura corresponde a la IA externa.**

El control del manifiesto no valida expedientes: solo verifica límites y trazabilidad declarada. La validación real requiere criterios A–E y el cotejo documental. **No hay autoaprobación por cantidad de documentos o por éxito en CI.**

### Salida para visualización

\`SQLite v3 → scripts/exportar_base_v3.py → expedientes_v3.json\`.

La salida tiene **una convocatoria por código** y los siguientes bloques: \`fuentes_originales\`, \`datos_originales\`, \`listas_originales\`, \`resultados_estructurados\`, \`indicadores_sinteticos\`, \`control_validacion\`. Incluye las URL de verificación originales, las estructuras y transcripciones disponibles y el estado honesto de cada fuente.

**En esta tarea no se modificó el sitio publicado en GitHub Pages**. La herramienta actual recibe v2; este documento constituye el contrato exigible para adaptar la interfaz en su etapa correspondiente.

## 5. Garantías, comprobaciones y límites

**Garantías técnicas de la base:**

1. Claves foráneas y restricciones de tipo/URL/versión para fuentes.
2. **Inmutabilidad** de registros originales, capturas y evidencias con triggers que rechazan modificaciones y borrados.
3. Cierre A+B+C+(D si existe)+E **con evidencia y subcriterios individuales**, no con un campo booleano manual.
4. Comprobación individual de **filas, celdas, páginas, tablas, requisitos, participantes y puntajes** mediante \`v3_revision_metrica\`.
5. Bloqueo de métricas cotejadas cuyos **conteos no coinciden con elementos efectivamente guardados**.
6. Bloqueo de actas con fuentes adicionales pendientes, resultados sin verificar, incidencias críticas abiertas o Excel incompleto.
7. **Revalidación dinámica** cuando aparecen fuentes, consultas de resultados o incidencias nuevas.
8. Registros de regiones leídas e imposibilidad de repetir una extracción de la misma fuente, versión y ubicación sin justificar y versionar.
9. Reproducción y comparación de los datos capturados sin inventar documentos ni alterar fuentes.

**Límites que no deben ocultarse:** un trigger no puede saber si la IA omitió algo que nunca vio en una imagen. **Solo la lectura y el cotejo real del PDF** pueden acreditar que la captura representa todo lo publicado. El programa no certifica materialmente las afirmaciones de la IA.

## 6. Fases que NO forman parte de esta tarea

- No adaptar ni sustituir \`index.html\` o el comparador v2.
- No ejecutar extracción de nuevos PDF ni inferir sus tablas por código.
- No migrar registros históricos a validaciones; los **42 identificados siguen siendo 0 validados**.
- No crear nuevos indicadores sintéticos por conveniencia sin insumos rastreables.
- No tomar decisiones sobre visibilidad/publicación de datos originales.

**Criterio de cierre de esta fase:** base real que puede construirse y consultarse, un contrato único de salida, un contrato y control de recepción para IA, y pruebas automáticas que confirmen integridad de lo ya disponible. Las siguientes fases podrán trabajar sobre esa base **sin redefinir la estructura fundamental**.
