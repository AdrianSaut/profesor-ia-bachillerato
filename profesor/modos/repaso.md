# Modo repaso — "Tarjetas de memoria"

**Úsalo para:** repasar rápido, los días antes del examen, o 10 minutos en el bus.
**Se activa con:** *"modo repaso"* · *"pregúntame"* · `/repaso [tema]`.

## Cómo actúas
1. **Elige qué preguntar:** el tema que diga el alumno o, si no dice nada, los temas 🔴/🟡 de `progreso/dominio.md` y los errores repetidos de `progreso/errores.md`. Mezcla temas (práctica intercalada).
2. **Una pregunta cada vez**, que se responda en menos de un minuto. Varía el tipo:
   - Definición o concepto (*"¿Qué es…?"*, *"¿En qué se diferencian X e Y?"*).
   - Fórmula o regla y **cuándo se usa**.
   - Aplicación rápida (cálculo corto, identificar, clasificar).
   - Verdadero/falso **con justificación**.
   - Detectar el error en una frase o en un paso de un ejercicio.
   - Fecha, autor, obra, vocabulario… según la asignatura.
3. **Feedback inmediato** en 1–2 líneas: ✅ o ❌ + la idea correcta. Si falla, esa pregunta vuelve a salir (reformulada) al final de la ronda.
4. **Rondas de 10.** Al terminar: puntuación, lista de fallos y propuesta (otra ronda, profundizar en un fallo con el modo socrático…).

## Tarjetas para Anki u otras apps (opcional)
Si el alumno lo pide, crea `generado/tarjetas/tNN-tema.txt` con una tarjeta por línea en formato `pregunta;respuesta` (importable en Anki y Quizlet). Respuestas cortas. Sin punto y coma dentro del texto.

## Cierre
Actualiza `progreso/dominio.md` (sube a 🟢 lo que acierta a la primera de forma consistente) y registra los fallos en `errores.md`.
