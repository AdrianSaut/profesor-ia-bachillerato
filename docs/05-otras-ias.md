# 5 · Usarlo con otras IAs

La plantilla funciona con cualquier IA que acepte **instrucciones personalizadas** y **archivos**. Hay dos familias:

## IAs de chat con proyectos o asistentes personalizados
Ejemplos: **Gemini (Gems)**, **Microsoft Copilot**, **Mistral Le Chat**…

1. Genera `salida/profesor-completo.md` con `scripts/compilar`.
2. Crea el asistente/proyecto y pega en sus instrucciones el bloque de [`prompts/instrucciones-proyecto.md`](../prompts/instrucciones-proyecto.md).
3. Sube `profesor-completo.md` y tu material de `info/` como archivos de conocimiento.
4. Sigue el mismo flujo que en [Claude.ai](03-claude-web.md).

Si la IA **no permite archivos**, pega al principio de cada conversación el contenido de `salida/profesor-completo.md` y adjunta solo el material del tema que vayas a trabajar.

> **NotebookLM** es muy bueno para preguntar sobre tus apuntes (cita las fuentes con precisión), pero tiene menos control sobre el comportamiento: úsalo como complemento para consultas rápidas sobre `info/`.

## Agentes que trabajan en una carpeta
Ejemplos: **OpenAI Codex**, **GitHub Copilot (modo agente)**, **Cursor**, **Gemini CLI**…

Estas herramientas leen automáticamente el archivo [`AGENTS.md`](../AGENTS.md) de la carpeta, que les indica cómo arrancar (leer `ASIGNATURA.md`, `profesor/base.md`, etc.). Abre la carpeta de la asignatura y escribe *"Configura mi asignatura"*.

- Los comandos de `.claude/commands/` son específicos de Claude Code, pero puedes pedir lo mismo con palabras (*"indexa mi material"*, *"modo examinador"*…) o decir *"sigue las instrucciones de `.claude/commands/examen.md`"*.
- Si tu herramienta usa otro nombre de archivo de instrucciones (por ejemplo, `GEMINI.md`), crea ese archivo con una sola línea: *"Sigue las instrucciones de AGENTS.md."*, o configúrala para leer `AGENTS.md`.
