# Veeduría de convocatorias de estudiantes auxiliares — UNAL

**Versión:** diseño preliminar v0.1 (13 de noviembre de 2026).  
**Estado:** planificación técnica; no se han importado masivamente convocatorias ni resultados.

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

Los resultados pueden contener números de identificación personal y notas académicas. **No se deben subir datos completos de postulantes a un repositorio público**. Conservar la información íntegra en un almacenamiento privado autorizado y generar una vista pública redactada, sin números de documento ni claves reversibles. Los enlaces a documentos públicos no implican permiso irrestricto de republicación.

## Ruta propuesta

1. Congelar captura de la hoja: filas, celdas, valores literales, fórmulas e hipervínculos.
2. Hacer piloto de 15–30 casos con alta variabilidad, incluyendo adendas y resultados.
3. Ajustar diccionario y extracción con base en el piloto, manteniendo versionado.
4. Importar por lotes, registrar errores y revisar integridad documental.
5. Publicar dataset de consulta sin información personal y, aparte, un registro de contrastes verificables.

> La base no establece irregularidades por sí sola. Registra evidencias, diferencias, hipótesis y su estado de revisión.