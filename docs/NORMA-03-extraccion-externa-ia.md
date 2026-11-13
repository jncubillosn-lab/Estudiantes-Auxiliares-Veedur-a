# NORMA 03 — Extracción externa ejecutada por esta IA

**Precedencia:** [NORMA 00](NORMA-00-validacion-integral.md) > [NORMA 01](NORMA-01-integridad-exhaustividad.md) > [NORMA 02](NORMA-02-integracion-comparabilidad.md) > esta norma.  
**Contrato detallado:** [CONTRATO-V3-EXTRACCION-IA](CONTRATO-V3-EXTRACCION-IA.md). **Configuración vigente:** [config/contrato_ia_v3.json](../config/contrato_ia_v3.json).

## Responsabilidad exacta

**Esta IA efectúa externamente la lectura documental, interpretación, transcripción, reconstrucción de tablas/celdas, análisis de cobertura y cotejo visual.** El software almacena la evidencia y realiza controles de integridad y disciplina. **No se implementa un motor autónomo de extracción, clasificación de PDF u OCR en el programa.**

Los scripts de recepción, construcción, validación de manifiestos y exportación **no certifican que la IA haya observado efectivamente todos los elementos del PDF**. No confundir pruebas de estructura con auditorías documentales reales.

## Límites obligatorios

- **Máximo 50 convocatorias distintas por solicitud/interacción**, no 50 filas ni 50 PDF. Reducir el lote si su complejidad impide verificar íntegramente cada caso.
- Mantener un **manifiesto persistido** con códigos, fuentes, URL, versiones, regiones leídas, métricas de cobertura, incidencias y estado por convocatoria.
- **No repetir la extracción** de la misma `fuente + versión + región`. Los cotejos y reextracciones justificadas se documentan sin sustituir datos anteriores.
- **No eliminar repeticiones originales auténticas**: el mismo texto en dos celdas distintas son dos ocurrencias que deben permanecer en la base.
- No fabricar fechas, enlaces, tablas, participantes, puntajes, requisitos ni campos ausentes. Registrar faltantes, ilegibles y accesos fallidos.

## Secuencia obligatoria

1. **Inventariar fuentes y versiones.** Registrar las URLs verdaderas de Excel, convocatoria, resultados, adendas y anexos.
2. **Extraer y cotejar Excel completo**, con cada fila/celda, encabezado, nota y vínculo.
3. **Extraer y cotejar PDF de convocatoria completo**, incluyendo tablas/celdas/listas, páginas, notas, anexos y adendas disponibles.
4. **Comprobar la publicación de resultados** con URL del sitio consultado, fecha, método y alcance. Sin enlace en Excel no equivale a ausencia.
5. **Extraer y cotejar PDF de resultados si existe**, incluyendo todos los participantes y columnas; si no está disponible tras comprobación real, registrar `sin_pdf_verificado_al_corte` con evidencia.
6. **Integrar**, conservar cada literal original y registrar discrepancias sin imponer interpretaciones.
7. **Cotejar y persistir** la información, revisar cobertura y pendientes, y solicitar **acta final solo si** se satisfacen las puertas A+B+C+(D si corresponde)+E.

Si la extracción falla o no se puede completar, conservar el trabajo parcial y la incidencia **sin aumentar el número de convocatorias validadas**.

## Herramientas de control vigentes

| Instrumento | Función (no extracción) |
|---|---|
| `config/contrato_ia_v3.json` | Límite, estados, orden, fuentes y restricciones. |
| `scripts/validar_entrega_ia_v3.py` | Comprobar manifiesto de trabajo, duplicaciones y documentación de resultados. |
| `scripts/registrar_entrega_ia_v3.py` | Persistir manifiesto y fuentes de forma atómica, **sin crear cotejos ni actas**. |
| `db/estructura_v3.sql` | Guardar originales íntegros, evidencias por criterio, incidencias y acta. |
| `scripts/probar_control_ia_v3.py` | Probar disciplina y límites con datos **ficticios**. |

**El manifiesto no es el contenido documental.** La IA debe entregar además todos los originales estructurados y las evidencias requeridas por el contrato v3. La aceptación formal y el contador salen de las **vistas SQL v3**, no de la descripción textual de la IA.

Las operaciones de una interacción deben terminar con **estado verdaderamente persistido** y referencia de continuidad. La visibilidad de los datos es una decisión del responsable del proyecto.
