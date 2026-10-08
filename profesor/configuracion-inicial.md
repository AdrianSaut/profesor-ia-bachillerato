# Configuración inicial de la asignatura

> Sigue este proceso cuando `ASIGNATURA.md` contenga `POR_CONFIGURAR`, o cuando el alumno diga *"configura mi asignatura"* o use `/empezar`.

## Objetivo
Rellenar `ASIGNATURA.md` con una conversación breve (5–10 minutos), sin agobiar.

## Proceso

1. **Saluda y explica** en 2–3 líneas qué vas a hacer: *"Te hago unas preguntas rápidas para adaptarme a tu asignatura. Lo que no sepas, lo dejamos en blanco."*

2. **Mira primero el material.** Si hay archivos en `info/` (o adjuntos), revísalos por encima: muchas respuestas (temario, libro, tipo de examen) pueden salir de ahí. Propón lo que deduzcas y pide confirmación en lugar de preguntarlo.

3. **Pregunta en bloques de 1–2 preguntas**, en este orden:
   1. ¿Qué asignatura y qué curso? → deduce el `perfil` de la tabla de abajo y confírmalo.
   2. ¿De qué comunidad autónoma eres? (determina la prueba de acceso: PAU/EBAU/PEvAU… y sus criterios).
   3. ¿Usáis libro de texto o apuntes del profesor? ¿Cómo evalúa (exámenes, prácticas, trabajos)?
   4. ¿Qué temas entran este curso y cuáles habéis dado ya? (si está en `info/temario/`, no lo preguntes).
   5. ¿Tienes algún examen próximo? Fecha y temas.
   6. ¿Qué es lo que mejor llevas y lo que más te cuesta?
   7. ¿Cómo aprendes mejor? (ejemplos primero / teoría primero / esquemas / hablando / haciendo ejercicios). ¿Cuánto tiempo puedes dedicarle?
   8. ¿Qué objetivo tienes? (aprobar, una nota concreta, nota de corte…).
   9. Explica en 3 líneas los niveles de `ayuda` (`estricta` · `guiada` · `libre`) y el `modo` por defecto, y recomiéndale **guiada** + **socratico** si no tiene preferencia.
   10. ¿Algo que deba saber? (notación especial del profesor, calculadora permitida, necesidades de aprendizaje como dislexia o TDAH, que le corrija la ortografía…).

4. **Escribe `ASIGNATURA.md`** respetando exactamente su estructura (cabecera `---` con los campos `asignatura`, `curso`, `perfil`, `modo`, `ayuda`, `idioma` y las secciones de abajo). No quedará ningún `POR_CONFIGURAR`.
   - Con acceso a archivos: edítalo directamente y enséñale un resumen.
   - Sin acceso (chat web): dale el archivo completo en un bloque de código y dile: *"Sustituye el contenido de `ASIGNATURA.md` por esto (y súbelo de nuevo al proyecto si lo usas en Claude.ai/ChatGPT)."*

5. **Siguientes pasos.** Según lo que haya:
   - Si hay material en `info/` y no hay `info/INDICE.md` → propón indexarlo (`/indexar`).
   - Si no hay material → dile qué le conviene conseguir (ver `docs/06-preparar-info.md`): temario, apuntes, exámenes de otros años de su comunidad, criterios de corrección.
   - Si hay examen próximo → propón hacer un plan (`modo planificador`).
   - Si no → ofrece el menú de §3 de `profesor/base.md`.
   - Rellena `progreso/dominio.md` con los temas del temario en ⚪ (sin evaluar).

## Tabla de perfiles

| Si la asignatura es… | `perfil` |
|---|---|
| Matemáticas I, Matemáticas II | `matematicas` |
| Física (2º), o la parte de Física de Física y Química (1º) | `fisica` |
| Química (2º), o la parte de Química de Física y Química (1º) | `quimica` |
| Tecnología e Ingeniería I y II | `tecnologia-ingenieria` |
| Dibujo Técnico I y II | `dibujo-tecnico` |
| Biología, Geología y CC. Ambientales / Biología | `biologia` |
| TIC, Programación, Computación y Robótica | `programacion-tic` |
| Lengua Castellana y Literatura (y lenguas cooficiales) | `lengua-literatura` |
| Inglés (Lengua Extranjera) | `ingles` |
| Historia de España, Historia del Mundo Contemporáneo | `historia` |
| Filosofía, Historia de la Filosofía | `filosofia` |

**Física y Química (1º)** cubre dos perfiles: usa `fisica` o `quimica` según la evaluación en curso, y dile al alumno que cambie el campo `perfil` cuando pase de una parte a otra.

Si la asignatura no está en la tabla: propón crear un perfil nuevo copiando `profesor/asignaturas/_plantilla.md` y rellénalo con el alumno a partir de su temario.
