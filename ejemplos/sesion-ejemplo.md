# Ejemplo de sesión (modo entrenador · Matemáticas II)

> Conversación ficticia para que veas cómo se comporta el profesor IA con esta plantilla. Configuración: [`ASIGNATURA-matematicas-ii.md`](ASIGNATURA-matematicas-ii.md).

---

**🧑 Alumno:** /ejercicios sistemas con parámetro

**🤖 IA:** La última vez (5 oct) dejaste anotado que te lías con los casos al discutir sistemas con parámetro, así que vamos a por ello. Tienes examen de los temas 1–3 el **12 de noviembre**.

Serie de 5 ejercicios, empezando en ★★. El primero está adaptado de `info/examenes/pau-2024-junio.pdf`, ejercicio 1:

> Discute el siguiente sistema según los valores de *a*:
> x + y + z = 1
> x + a·y + z = 2
> x + y + a·z = 3

Antes de calcular nada: ¿cuál es el primer paso para discutirlo?

---

**🧑 Alumno:** ni idea, dame la solución

**🤖 IA:** Mejor una pista, que el día 12 tendrás que hacerlo solo. 😉
**Pista 1:** Para discutir un sistema comparamos dos rangos. ¿Cuáles? (Está en tus apuntes del tema 3, p. 2: el teorema de Rouché-Frobenius.)

---

**🧑 Alumno:** el de A y el de A*

**🤖 IA:** ✅ Exacto. Y para saber cuándo puede bajar el rango de A, ¿qué calcularías primero?

---

**🧑 Alumno:** el determinante de A. me da (a−1)², así que se anula para a = 1

**🤖 IA:** ✅ Correcto (lo he comprobado también restando la fila 1 a las otras dos). Primer caso resuelto: si a ≠ 1, rg(A) = rg(A*) = 3 = nº de incógnitas → **SCD**. Escríbelo así, justificado, que en tu examen puntúa.
Ahora el caso crítico: con a = 1, ¿cuánto valen rg(A) y rg(A*)?

---

**🧑 Alumno:** rg(A) = 1 y rg(A*) = 3, así que incompatible

**🤖 IA:** rg(A) = 1 ✅ y la conclusión (incompatible) también, pero rg(A*) no es 3 (error **P**: no compruebas los menores de orden 3). Con a = 1, mira las columnas 1 y 2 de A*: ¿qué tienen en común? ¿Qué le pasa entonces a cualquier menor de orden 3 que las contenga a las dos?

---

*(…la sesión continúa con los otros 4 ejercicios…)*

---

**🧑 Alumno:** /cerrar

**🤖 IA:** **Resumen:** 5 ejercicios de discusión de sistemas: 2 a la primera, 2 con una pista y 1 con dos pistas. Ya aplicas bien Rouché-Frobenius; lo que te falta es **calcular el rango de A* en el caso crítico** (2 fallos, tipo **P**). Siguiente paso: el miércoles, 3 ejercicios ★★★ centrados en ese caso.

He actualizado `progreso/diario.md`, `progreso/errores.md` (rango de A* en el caso crítico, ×2) y `progreso/dominio.md` (Sistemas: 🔴 → 🟡). ¡Buen trabajo!

---

### Fíjate en que la IA…
- Retoma lo de la sesión anterior y recuerda el examen.
- Usa los exámenes de `info/` y cita de dónde salen.
- No da la solución sin intento: sube por la escalera de pistas.
- Clasifica los errores (K, P…).
- **Verifica los cálculos** (por otra vía) antes de darlos por buenos.
- Separa lo que está bien de lo que está mal, en lugar de dar un "casi" genérico.
- Guarda el progreso al cerrar.
