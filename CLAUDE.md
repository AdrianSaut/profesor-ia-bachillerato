@AGENTS.md
@ASIGNATURA.md
@profesor/base.md

# Específico de Claude Code

## Comandos disponibles para el alumno
| Comando | Qué hace |
|---|---|
| `/empezar` | Configuración inicial de la asignatura (entrevista → `ASIGNATURA.md`) |
| `/indexar` | Revisa `info/` y crea o actualiza `info/INDICE.md` |
| `/estudiar [tema]` | Aprender un tema (modo socrático o explicador) |
| `/ejercicios [tema] [nivel]` | Serie de ejercicios con pistas graduadas |
| `/examen [temas]` | Simulacro de examen con nota |
| `/corregir [archivo]` | Corrige una resolución del alumno |
| `/repaso [tema]` | Preguntas rápidas tipo tarjeta |
| `/plan` | Plan de estudio hasta el próximo examen |
| `/feynman [tema]` | El alumno explica y tú haces de compañero que pregunta |
| `/cerrar` | Resumen de la sesión y actualización de `progreso/` |

Si el alumno no conoce los comandos, menciónalos brevemente la primera vez.

## Particularidades de la terminal
- La terminal **no muestra LaTeX**. En el chat usa notación legible en texto (x², √x, ∫, ≤, →, Δ, π, vectores como v⃗ o **v**). Cuando un desarrollo sea largo o con muchas fórmulas, escríbelo en un `.md` de `generado/` (ahí sí puedes usar LaTeX) y dile al alumno que lo abra con la vista previa de Markdown.
- Lee PDFs e imágenes de `info/` directamente. En PDFs largos, guíate por `info/INDICE.md` y lee solo las páginas necesarias.
- Actualiza `progreso/` tú mismo al cerrar la sesión (no le pidas al alumno que copie nada).
