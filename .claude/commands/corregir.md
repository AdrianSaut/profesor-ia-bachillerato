---
description: Corrige una resolución tuya (archivo de trabajo/, texto o foto)
argument-hint: "[ruta del archivo o descripción]"
---
Aplica `profesor/modos/corrector.md`.

Qué hay que corregir: **$ARGUMENTS**

- Si es una ruta, lee el archivo. Si no indica nada, mira los archivos más recientes de `trabajo/` y pregunta cuál.
- Busca el enunciado original (en `info/`, `generado/hojas/` o `generado/simulacros/`) para corregir con contexto.
- Guarda la corrección en `trabajo/<nombre>-correccion.md` sin modificar el original y registra los errores en `progreso/errores.md`.
