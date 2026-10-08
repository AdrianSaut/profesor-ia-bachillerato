# 2 · Usarlo con Claude Code (la opción más completa)

Claude Code es una versión de Claude que trabaja **dentro de una carpeta de tu ordenador**: lee tus apuntes de `info/` directamente, crea hojas de ejercicios y resúmenes en `generado/` y guarda tu progreso sin que tengas que copiar nada.

## Qué necesitas
- Una cuenta de Claude con acceso a Claude Code (consulta los planes en claude.com).
- Claude Code instalado. Puedes usarlo de tres formas:
  - **App de escritorio de Claude** → pestaña *Code* → abre la carpeta de la asignatura.
  - **VS Code** con la extensión de Claude Code → abre la carpeta.
  - **Terminal**: instrucciones de instalación en la documentación oficial de Claude Code.

## Primer uso
1. Abre la **carpeta de la asignatura** (no la de la plantilla) con Claude Code.
2. Escribe:
   ```
   /empezar
   ```
   Claude te hará la entrevista y rellenará `ASIGNATURA.md`.
3. Si ya tienes material en `info/`:
   ```
   /indexar
   ```
   Claude revisará todo y creará `info/INDICE.md`.

Claude lee automáticamente `CLAUDE.md` al empezar cada conversación, que a su vez carga `AGENTS.md`, `ASIGNATURA.md` y `profesor/base.md`. No tienes que pegar instrucciones.

## Comandos

| Comando | Qué hace |
|---|---|
| `/empezar` | Configuración inicial |
| `/indexar` | Revisa `info/` y actualiza el índice (úsalo cada vez que añadas material) |
| `/estudiar derivadas` | Aprender un tema |
| `/ejercicios derivadas ★★` | Serie de ejercicios con pistas |
| `/examen temas 1-3 90min` | Simulacro con nota |
| `/corregir trabajo/hoja1-ej3.jpg` | Corrige lo que has hecho tú |
| `/repaso` | Preguntas rápidas de lo que peor llevas |
| `/plan` | Plan de estudio hasta el examen |
| `/feynman efecto Doppler` | Lo explicas tú |
| `/cerrar` | Resumen y guardado del progreso |

También puedes hablar normal: *"modo examinador"*, *"ponme 3 ejercicios más difíciles"*…

## Trucos
- **Fotos de tus ejercicios:** guárdalas en `trabajo/` y usa `/corregir trabajo/foto.jpg`, o arrástralas directamente al chat.
- **Fórmulas:** la terminal no muestra LaTeX bonito. Para desarrollos largos, pide *"escríbelo en un archivo"* y ábrelo con la vista previa de Markdown (en VS Code: `Ctrl+Shift+V`).
- **Sesiones largas:** usa `/cerrar` al terminar cada bloque de estudio; así la siguiente conversación empieza sabiendo dónde lo dejaste, aunque abras una nueva.
- **Permisos:** Claude te pedirá permiso para crear o editar archivos. Es normal: solo debería escribir en `progreso/`, `generado/`, `info/INDICE.md` y archivos `*-correccion.md`.
