# Continuidad — Primer corte de IA bajo NORMA 00

**Estado vigente:** 2026-11-13. La base v3 se reconstruye únicamente desde `data/ia_v3/`: 96 códigos (36 abiertas, 60 cerradas), 97 filas, 1.031 celdas, 121 PDF binarios (97 publicaciones, 24 resultados), 397 páginas con extracción textual preliminar. **Cero actas y cero convocatorias validadas.**

## Procedimiento por interacción

1. Leer los expedientes y manifiestos registrados en GitHub; no repetir extracciones previas sin justificación/versionado.
2. Seleccionar máximo **50 códigos distintos** por solicitud. Para cerradas, seguir [NORMA 05](NORMA-05-ORDEN-EXTRACCION-CERRADAS.md), descendiendo por el código más alto y las filas de la hoja.
3. Inventariar las tres fuentes originales (Excel completo, PDF publicación y PDF resultados si existe), más adendas/versiones. Conservar URL real y contexto de cada aparición.
4. **La IA extrae** todo el contenido sin perder campos, filas, textos ni posiciones. El programa **no interpreta documentos**, solo almacena y controla.
5. Comprobar por código disponibilidad de resultados con URL, fecha y alcance; una celda sin enlace no confirma inexistencia.
6. Cotejar cada página, tabla, fila, casilla, nota, puntaje y versión contra su documento real; no confundir texto legible con reconstrucción de tablas.
7. Registrar discrepancias y pendientes. Intentar acta solo cuando las cinco puertas A+B+C+(D cuando corresponda)+E acrediten todas sus evidencias.
8. Guardar avance, lecturas, incidencias, versiones y último código para continuidad.

**Próxima cerrada:** `2026-C2285`, fila 63. Las condiciones pendientes en `2026-C2381`, `2026-C2312`, `2026-C2308`, `2026-C2309`, `2026-C2324` y demás incidencias son **advertencias, no conclusiones**.

## Comprobación

```bash
python scripts/probar_fuentes_pdf_v3.py
python scripts/probar_construccion_v3.py
python scripts/probar_exportacion_v3.py
python scripts/construir_base_v3.py --salida salidas/convocatorias_v3.sqlite
python scripts/exportar_base_v3.py --db salidas/convocatorias_v3.sqlite --salida salidas/expedientes_v3.json
```

La base posee 121 PDF binarios originales con hashes comprobables, pero sus tablas y selecciones no han sido cotejadas visualmente. **Métrica principal:** `v3_metrica_principal.convocatorias_validadas = 0`. [Estado técnico del corte](CORTE-IA-V3-2026-11-13.md).