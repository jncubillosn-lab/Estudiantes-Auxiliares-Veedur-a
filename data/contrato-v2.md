# Contrato de consulta del comparador v2

El comparador lee los JSON de los cuatro lotes ya existentes (`data/lotes/lote_01.json` ... `lote_04.json`) como **fuente literal de Excel**. Si existe `data/exportacion_v2.json`, complementa la información con la extracción estructural y cotejo de PDF. No modifica archivos originales.

## Archivo `data/exportacion_v2.json`

Contenedor versionado, generado desde la nueva base; esta ruta puede estar ausente hasta que haya PDFs estructurados. Estructura prevista:

```json
{
  "version": "2.0",
  "generado_en": "ISO 8601",
  "convocatorias": [
    {
      "numero": "TEST-001",
      "fuentes": [
        {"fuente_id": 1, "tipo": "convocatoria_pdf", "url": "https://example.invalid/1.pdf",
         "estado": "elementos_extraidos"}
      ],
      "campos_originales": [
        {"campo_id": 1, "concepto": "dependencia_convocante", "rotulo_literal": "Dependencia",
         "valor_literal": "Departamento de prueba", "fuente_id": 1,
         "pagina": 1, "tabla_id": 1, "celda_id": 2, "estado": "pendiente"}
      ],
      "listas_originales": [
        {"lista_id": 1, "concepto": "requisitos", "fuente_id": 1,
         "items": [
           {"item_id": 1, "orden": 1, "literal_completo": "Condición original A", "pagina": 2, "celda_id": 20},
           {"item_id": 2, "orden": 2, "literal_completo": "Condición original B", "pagina": 2, "celda_id": 21}
         ]}
      ],
      "sinteticos": [
        {"nombre": "cantidad_requisitos", "valor": 2,
         "regla": "COUNT(items)", "version_regla": "0.1",
         "insumos": [{"item_id": 1}, {"item_id": 2}]}
      ]
    }
  ]
}
```

**Ejemplo exclusivamente ilustrativo, no es información real de convocatoria.**

## Reglas del consumidor

1. Cada celda de comparación conserva `literal`, `concepto`, `rotulo_literal`, `fuente_id`, `pagina` y `celda_id` cuando estén disponibles.
2. Cada lista se muestra con **todos sus elementos en orden**, jamás como un simple conteo.
3. Un dato sintético lleva etiqueta visible `SINTÉTICO`, regla y trazabilidad. No reemplaza su lista o tabla original.
4. `no_disponible`, `sin_enlace`, `no_extraido`, `sin_cotejo` y `verificado` son estados distintos. Una celda vacía no equivale a valor cero.
5. Si se desconoce el origen exacto de un campo, se conserva su literal y se marca `pendiente`; no se inventan página o celda.
6. Las discrepancias entre Excel, convocatoria y resultados son **múltiples observaciones originales** del mismo concepto. La interfaz no decide cuáles son correctas.
7. El usuario determina interpretación y visibilidad. La página no reescribe ningún dato original.
8. La exportación de los originales PDF requiere reconstruir tablas, filas, columnas y elementos visuales con referencia a binario y páginas, con validación manual explícita.
