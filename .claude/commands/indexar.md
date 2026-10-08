---
description: Revisa el material de info/ y crea o actualiza info/INDICE.md
---
Crea o actualiza `info/INDICE.md`, el índice del material de estudio, para poder encontrar rápido cada cosa en las próximas sesiones.

1. Lista todos los archivos de `info/` y sus subcarpetas (ignora los `README.md` y `.gitkeep`). Si ya existe `info/INDICE.md`, procesa solo los archivos nuevos o modificados y conserva lo demás.
2. Abre cada archivo nuevo (PDF, imagen, documento, texto). En PDFs largos, lee lo suficiente para identificar su estructura (índice, títulos, páginas de cada tema).
3. Escribe `info/INDICE.md` con este formato:

   ```markdown
   # Índice del material
   _Actualizado: AAAA-MM-DD_

   ## Por archivo
   | Archivo | Tipo | Temas | Contenido | Notas |
   |---|---|---|---|---|
   | `apuntes/t03-derivadas.pdf` | Apuntes del profesor | T3 | Definición, reglas, aplicaciones (pp. 1–12); 20 ejercicios resueltos (pp. 13–18) | Usa la notación f'(x) |

   ## Por tema
   ### T3 · Derivadas
   - Teoría: `apuntes/t03-derivadas.pdf` pp. 1–12
   - Ejercicios: `ejercicios/hoja3.pdf` (15, sin soluciones)
   - En exámenes: `examenes/2024-junio.pdf` ej. 2 · `examenes/2023-julio.pdf` ej. 3

   ## Observaciones
   - Lo que falte o convenga conseguir (p. ej., "no hay criterios de corrección", "el PDF X es un escaneo poco legible").
   ```

4. Si algún archivo es ilegible, está repetido o parece de otro curso/asignatura, indícalo en Observaciones.
5. Si el temario no estaba en `ASIGNATURA.md` y lo has encontrado, propón añadirlo.
6. Termina con un resumen de 3–5 líneas para el alumno: qué material hay, qué falta, y una propuesta para empezar.

Indicaciones extra del alumno (puede estar vacío): $ARGUMENTS
