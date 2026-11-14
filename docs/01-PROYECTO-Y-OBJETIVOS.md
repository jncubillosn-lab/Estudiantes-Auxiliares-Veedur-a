# 01 — Planteamiento del proyecto

## Naturaleza y ámbito

Sistema especializado de información documental y apoyo a la veeduría de convocatorias de estudiantes auxiliares de la Universidad Nacional de Colombia, inicialmente **Sede Bogotá**.

No se propone ser un catálogo de anuncios ni un lector de archivos. Su utilidad depende de que una persona pueda **entender las condiciones de una convocatoria, encontrar alternativas comparables y revisar documentalmente cómo se evaluó a sus participantes**, sin reconstruir cada relación a mano.

## Problema

La información del proceso suele repartirse entre una hoja general, documentos de convocatoria, documentos de resultados y eventuales anexos, adendas o correcciones. Distintas fuentes cumplen funciones diferentes, pueden contradecirse y pueden registrar varias apariciones del mismo dato.

Las condiciones no tienen una redacción uniforme. Requisitos y perfiles se extienden entre apartados y páginas; las tablas pueden relacionarse con criterios ubicados en otras partes; los resultados pueden usar columnas numéricas que solo se comprenden con la tabla de ponderaciones. Leer palabras no basta para comprender esos vínculos.

Las dificultades principales son:

- **Consulta dispersa:** abrir documentos y buscar manualmente cada dato.
- **Comparabilidad limitada:** volver a interpretar expresiones equivalentes o diferentes.
- **Verificación difícil:** contrastar reglas publicadas, modificaciones y evaluaciones reales.
- **Pérdida de contexto:** extraer palabras, números o totales sin su condición, su papel documental o su evidencia.
- **Falsa completitud:** tomar un archivo descargado, una transcripción o un registro almacenado como prueba de integridad.

## Objetivo general

**Desarrollar un sistema especializado para la integración, estructuración, estandarización semántica, consulta, comparación y validación documental de convocatorias de estudiantes auxiliares, que permita analizar sus condiciones de participación, procesos de selección y resultados mediante información íntegra, relacionada y verificable.**

## Objetivos específicos

1. Reunir por convocatoria sus fuentes, versiones y apariciones originales, manteniendo cada fuente identificable.
2. Preservar íntegramente los contenidos y estructuras observables: textos, listas, tablas, celdas, marcas, condiciones, notas, anexos y resultados.
3. Interpretar y estandarizar **significados**, no solo palabras, conservando límites, excepciones, negaciones, conjunciones, unidades y contexto.
4. Representar explícitamente relaciones entre requisitos, perfiles, actividades, criterios, ponderaciones, participantes, puntajes y decisiones.
5. Organizar la información alrededor de una **base central** independiente de sus medios de lectura y de presentación.
6. Ofrecer búsqueda, filtros y comparación transversal entre convocatorias.
7. Facilitar el cotejo documental de lo anunciado y lo publicado en resultados, sin inferir automáticamente irregularidades.
8. Distinguir el inventario documental del avance de extracción, cotejo y validación real.
9. Permitir la incorporación futura de nuevos documentos, categorías y variantes sin borrar diferencias ni reemplazar originales.

## Resultados deseados

- Expedientes integrados, fieles y trazables.
- Categorías y relaciones que permitan consulta y filtros reales.
- Criterios y tablas de resultados interpretables de manera conjunta.
- Comparación por conceptos equivalentes entre convocatorias diferentes.
- Estados documentales transparentes, con evidencias y pendientes.
- Una experiencia en la que el usuario **no necesite entrar y salir de cada documento** para entender y contrastar procesos.

## Límites

El sistema apoya la revisión documental; no recibe postulaciones, no decide selecciones, no reemplaza procedimientos institucionales y no determina por sí mismo irregularidades o responsabilidades. Las decisiones sobre publicación y acceso a información personal son distintas de la obligación de preservar fielmente las fuentes.

## Enfoque de reinicio

El objetivo y las reglas de calidad son el punto de partida. **Ningún diseño anterior ni elección de herramienta constituye una obligación del nuevo proyecto.** Primero se prueba el modelo de información en casos reales; después se eligen medios de implementación.
