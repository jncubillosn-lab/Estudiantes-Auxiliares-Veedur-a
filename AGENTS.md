# Instrucciones vigentes de trabajo

El único punto de partida documental es `README.md` y `docs/01-PROYECTO-Y-OBJETIVOS.md`, `docs/02-PRINCIPIOS-Y-NORMAS.md`, `docs/03-MODELO-CONCEPTUAL.md`, `docs/05-EXPERIENCIA-Y-ACEPTACION.md`.

**Prohibición de consulta por defecto:** no abrir, buscar ni inferir obligaciones a partir del historial Git, las ramas `archivo/*`, documentos eliminados, etapas previas ni implementaciones anteriores. Solo acceder a ellos si el usuario lo solicita expresamente para una revisión histórica.

NORMA 00 gobierna. La integridad de fuentes y la validación por puertas A–E prevalecen sobre cantidad de datos, infraestructura o interfaz. No inventar información, fusionar apariciones, dar por validados datos incompletos, ni seleccionar tecnologías antes de la aceptación conceptual. Contrastar la interpretación con fuentes y evidencias actuales.

Si un documento vigente contradice otro, señalar la contradicción y resolverla con evidencia nueva, no recuperando decisiones descartadas.

## ARCHIVO HISTÓRICO — NO CONSULTAR NI HEREDAR

**Etiqueta obligatoria:** `HISTÓRICO | NO CONSULTAR | NO VIGENTE`.

**Destino de nuevos registros históricos:** rama `archivo/no-consulta-2026-11-18`, carpeta `registros/no-consulta/AAAA-MM-DD/`. Conservar allí cada documento íntegro, identificado por fecha y ruta de procedencia. Los registros retirados anteriormente se recuperan en esa misma rama, en sus rutas originales.

**Protocolo de envío:** cuando una corrección, informe, explicación de fallos, plan descartado o registro de un proceso deje de ser vigente, primero copiar el documento completo a ese destino y comprobar que puede recuperarse; después retirarlo de la documentación de consulta de `main`, actualizando los enlaces. No archivar código operativo, pruebas de regresión, contratos o evidencia aún necesaria para decisiones vigentes. Nunca fusionar la rama de archivo con `main`.

**Prohibición de lectura por defecto:** no buscar, recorrer, indexar como contexto, citar ni aplicar documentos con esa etiqueta, ramas `archivo/*` o commits anteriores para desarrollar o corregir el proyecto. Solo consultarlos ante una petición explícita de investigación histórica. La información histórica nunca prevalece sobre el contrato, código, pruebas y documentación actuales de `main`.

Esta es una **política documental para colaboradores y agentes**, no un bloqueo de permisos de GitHub: los archivos pueden abrirse deliberadamente desde el historial público.
