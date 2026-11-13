# Veeduría de convocatorias de estudiantes auxiliares — UNAL

**Versión:** diseño preliminar v0.1 (13 de noviembre de 2026).  
**Estado:** planificación técnica; no se han importado masivamente convocatorias ni resultados.

## Norma superior del proyecto

**[NORMA 01 — Integridad, exhaustividad y visibilidad de las fuentes](docs/NORMA-01-integridad-exhaustividad.md)**. La tarea es transformar, nunca escoger qué datos conservar. Todo el contenido original de Excel, convocatorias y resultados debe permanecer completo y consultable en estructuras explícitas, sin alias sustitutos, omisiones, anonimización en la base fiel ni normalizaciones que sobrescriban lo literal. Toda extracción debe conservar referencia a su fuente y ubicación original.

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