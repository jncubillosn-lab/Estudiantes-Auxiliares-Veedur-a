# 04 — Aprendizajes y errores del primer intento

**Carácter:** memoria crítica; no constituye instrucciones para reproducir la implementación descartada.

## Hallazgo principal

**Capturar muchos datos no equivale a comprenderlos, y comprender fragmentos no equivale a producir una representación comparable y útil.**

Se construyó una infraestructura capaz de conservar archivos y referencias, pero el proceso no demostró de extremo a extremo que el contenido de una convocatoria pudiera interpretarse, organizarse, relacionarse y consultarse correctamente.

## Fallos observados

### 1. Infraestructura antes del significado

Se intentó ampliar el inventario de expedientes y construir sus componentes de almacenamiento y pantalla antes de definir y probar un **modelo semántico estable** con convocatorias completas.

**Aprendizaje:** comenzar por una convocatoria real, representar toda su información y contrastar la estructura con otros tipos documentales antes de multiplicar registros.

### 2. Clasificaciones no equivalentes a información organizada

Se generaron miles de etiquetas o facetas con referencias, pero muchas no compartían un vocabulario consistente de conceptos y valores. Había fragmentos clasificados sin vínculos suficientemente explícitos entre condiciones, criterios y resultados.

**Aprendizaje:** priorizar concepto, rol, operador, valor, unidad, contexto y relaciones, no la cantidad de etiquetas.

### 3. Desconexión entre lo producido y lo mostrado

La interfaz anterior reconocía nombres y versiones de categorías que no correspondían con la entrega semántica más reciente. Una parte relevante de los datos almacenados era invisible o se presentaba como «Sin dato».

**Aprendizaje:** demostrar la correspondencia entre una observación real, su interpretación, su persistencia y su aparición en consulta. Los contratos de información deben ser comprensibles y comprobables, no asumidos.

### 4. Resultados sin reconstrucción tabular

Existían documentos de resultados y textos preliminares, pero no sus filas y celdas cotejadas. Por eso la pantalla podía mostrar una tabla vacía pese a existir información en el documento.

**Aprendizaje:** para evaluar una selección se necesita la **estructura completa**: criterio ↔ columna ↔ participante ↔ puntaje ↔ total ↔ decisión ↔ observación.

### 5. Pruebas de existencia confundidas con pruebas de utilidad

Las verificaciones demostraban almacenamiento, cantidad de registros e integridad de archivos, pero no que una persona pudiera encontrar y comparar correctamente los datos que esos documentos contenían.

**Aprendizaje:** evaluar resultados desde el punto de vista de la persona usuaria, con preguntas y respuestas verificables, además de cualquier control de consistencia interna.

### 6. Ambigüedades ocultadas por categorías generales

Un porcentaje sin comparador explícito, un requisito que actúa también como criterio, una fecha contradictoria o una adenda pueden cambiar el sentido de un dato. Reducirlos a un valor único genera información aparentemente limpia, pero falsa.

**Aprendizaje:** conservar variantes, operadores, límites, versiones, dudas e incidencias; no completar silenciosamente.

### 7. Demasiada escala antes de validar el procedimiento

El primer corte reunió **96 convocatorias**, **97 filas**, **1.031 celdas** y **121 documentos PDF**. Se produjeron **3.155 facetas** interpretadas, pero la reconstrucción integral de las tablas y el cotejo visual seguían pendientes. **No había convocatorias validadas A–E.**

**Aprendizaje:** las métricas de volumen no son indicadores de cumplimiento del objetivo. Una muestra pequeña, representativa y correctamente resuelta vale más para diseñar el proyecto.

## Hallazgos documentales útiles, sin conclusiones anticipadas

- Un código puede tener varias filas y fuentes: caso **2026-C2324**.
- Las fechas de cierre pueden diferir entre fuentes: casos **2026-C2381**, **2026-C2361** y **2026-C2295**.
- Una modificación puede aparecer dentro de los apartados habituales: caso **2026-C2286** y su dedicación.
- Una referencia a resultados puede contener un código documental diferente: **2026-C2312 / 2026-C2302**.
- Las lecturas textuales pueden ser insuficientes para reconstruir resultados: casos **2026-C2308** y **2026-C2309**.

Estos ejemplos son **casos de prueba y advertencias de revisión**, no afirmaciones sobre irregularidades.

## Decisiones que sí demostraron valor

1. Dar precedencia a **integridad y validación** frente a facilidad de visualización.
2. Mantener **originales y derivados separados**, con procedencia.
3. Rechazar la equivalencia entre «documento leído» y «documento cotejado».
4. Conservar **todos los límites, excepciones y contradicciones**.
5. Mantener espacios visuales para categorías sin datos estructurados, con estados explícitos.
6. Considerar la **comparación transversal** una función principal y no un extra.
7. Exigir que la base sea independiente de la implementación de lectura y de la interfaz.

## Regla de reinicio

No reutilizar por inercia el código, el vocabulario de etiquetas, la interfaz ni las instrucciones técnicas del primer intento. Los aprendizajes deben servir para **formular mejores pruebas de comprensión documental**, no para restaurar la misma solución con otro aspecto.
