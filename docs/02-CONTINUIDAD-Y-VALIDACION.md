# Continuidad operativa — Base v3 y extracción externa mediante IA

**Fuente suprema:** [NORMA 00](NORMA-00-validacion-integral.md).  
**Contratos vigentes:** [base v3](BASE-V3-OPERACION-Y-GARANTIAS.md) · [extracción de IA](CONTRATO-V3-EXTRACCION-IA.md) · [visualizador](CONTRATO-V3-VISUALIZACION.md) · [configuración v3](../config/contrato_ia_v3.json).

## 1. Punto de partida inalterable

Los lotes `data/lotes/lote_01.json` a `lote_04.json` permanecen originales. La base SQLite v3 puede reproducirse con **42 códigos, 43 filas, 470 celdas y 16 lecturas PDF textuales previas**, todos **sin cotejo visual de PDF**. **Convocatorias validadas: 0.**

El visor de Pages es **v2**, no el contrato de salida v3. No hay que rehacer la base ni reescribir sus fuentes para comenzar nuevas lecturas por IA.

## 2. Orden por solicitud y por convocatoria

1. Verificar el último estado **persistido** de GitHub y los lotes/manifiestos existentes. No dar por hecho trabajo previo por mensajes de chat.
2. Seleccionar **máximo 50 convocatorias distintas por interacción**; menos cuando el número de páginas/formatos impida un cotejo íntegro.
3. Para cada convocatoria, **inventariar** Excel, PDF de convocatoria, PDF de resultados, adendas, anexos, versiones, códigos internos y URL reales.
4. **Leer Excel** completo: cada fila, celda, encabezado y enlace.
5. **Leer PDF de convocatoria**, todas sus páginas, tablas, requisitos, criterios, notas y versiones, mediante **esta IA**, no un motor automático del programa.
6. **Comprobar disponibilidad de resultados** con URL de la publicación examinada, fecha, alcance y resultado. Sin enlace en la hoja **no es ausencia verificada**.
7. **Leer PDF de resultados cuando existe**, completo: todas las filas, participantes, identificaciones, criterios, puntajes, decisiones y anotaciones.
8. **Integrar** la documentación manteniendo cada ocurrencia original; **cotejar visualmente** con las fuentes y registrar toda incertidumbre.
9. **Persistir** datos, cotejos, incidencias y enlaces. Intentar acta **solo** si pasan A+B+C+(D si corresponde)+E, sin faltantes críticos.
10. Guardar el resultado verificable, el punto exacto de continuación y los documentos no completados. **No llamar validado al lote procesado**.

## 3. Prevención de duplicaciones y omisiones

La unidad de lectura es `URL de fuente + versión + región`. No repetir `extraer` dos veces para esa combinación. Un `cotejar` documentado o `reextraer_justificado` puede volver a examinarla, sin perder versiones anteriores.

**Repeticiones auténticas:** dos textos iguales ubicados en celdas o páginas distintas son **dos datos originales** y se conservan.

**Faltantes:** página ilegible, PDF inaccesible, código discordante, enlace inexistente, documento o tabla adicional se registra como incidencia/pendiente; no se rellena por inferencia y **no se certifica** mientras afecte la integridad.

## 4. Instrumentos existentes de base (no extractores)

```bash
python scripts/probar_estructura_v3.py
python scripts/probar_construccion_v3.py
python scripts/probar_exportacion_v3.py
python scripts/probar_control_ia_v3.py
python scripts/probar_registro_ia_v3.py

python scripts/construir_base_v3.py --salida salidas/convocatorias_v3.sqlite
python scripts/exportar_base_v3.py --db salidas/convocatorias_v3.sqlite --salida salidas/expedientes_v3.json

# EJEMPLO FICTICIO: demuestra disciplina de manifiestos, no cotejo de PDF real.
python scripts/validar_entrega_ia_v3.py tests/fixtures/entrega_ia_v3_ejemplo.json
```

[Guía técnica de reproducción](BASE-V3-OPERACION-Y-GARANTIAS.md). La recepción de un manifiesto con `registrar_entrega_ia_v3.py` **no extrae PDF ni crea actas**. Las tablas de fuentes, elementos, listas y resultados se alimentarán con el contenido que esta IA haya leído y cotejado realmente.

## 5. Puertas y métrica que deben cumplirse

| Puerta | Evidencia exigible |
|---|---|
| A | Excel completo, todas las filas/celdas y su vínculo a fuente. |
| B | PDF convocatoria completo y cotejado, URL real persistida, adendas/anexos disponibles revisados. |
| C | Comprobación documentada de disponibilidad de resultados, con fecha/URL/alcance. |
| D | PDF resultados completo y URL persistida **si existe**; si no, ausencia comprobada al corte. |
| E | Revisión de persistencia/consulta de originales, incidencias cerradas, acta final. |

La **métrica principal** es `v3_metrica_principal.convocatorias_validadas`, basada en `v3_acta_validacion` y las fuentes vigentes. `v3_convocatoria` cuenta **identificadas**, una cifra auxiliar. Un PDF nuevo o una incidencia crítica puede impedir que un acta histórica siga contando.

**Límite técnico:** la base comprueba estructura y cantidades declaradas, pero no detecta contenido que la IA jamás observó. El cotejo real con el PDF sigue siendo indispensable.

## 6. Entrega de cierre de una interacción

Registrar **qué códigos se trabajaron**, fuentes y enlaces reales, qué páginas/tablas/celdas se cotejaron, incidencias pendientes, archivos y commits realmente persistidos, estados de puertas, actas aceptadas si las hay y cifra actual de **convocatorias validadas**. Una solicitud interrumpida se reanuda desde el último estado guardado, no desde una suposición.

**No proponer nuevas funciones de interfaz ni volver a la arquitectura v2 para completar vacíos.** Las especificaciones anteriores están en el [archivo histórico](historico/INDICE.md), sin precedencia sobre v3.
