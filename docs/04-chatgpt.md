# 4 · Clonar la plantilla y usarla en ChatGPT

Crea un **proyecto de ChatGPT por asignatura** para reunir sus chats, instrucciones y material. La carpeta de tu ordenador será tu copia de los archivos; los archivos añadidos a ChatGPT serán las fuentes del proyecto. [Documentación oficial de proyectos](https://learn.chatgpt.com/docs/projects).

## 1. Descargar la plantilla

Con [Git](https://git-scm.com/) instalado, abre PowerShell (Windows) o una terminal (macOS/Linux) en la carpeta donde quieras guardar tus estudios:

```bash
git clone https://github.com/AdrianSaut/profesor-ia-bachillerato.git mi-asignatura
cd mi-asignatura
```

Puedes cambiar `mi-asignatura` por el nombre que prefieras. Si Git no está instalado, abre [el repositorio](https://github.com/AdrianSaut/profesor-ia-bachillerato), elige **Code → Download ZIP** y descomprímelo.

Si quieres un repositorio propio, pulsa **Use this template → Create a new repository**, elige **Private** y clona la URL de esa copia. [Más opciones de creación](01-crear-proyecto.md).

## 2. Generar las instrucciones completas

Desde la carpeta descargada, ejecuta:

**Windows (PowerShell):**

```powershell
powershell -ExecutionPolicy Bypass -File scripts\compilar.ps1
```

**macOS / Linux:**

```bash
bash scripts/compilar.sh
```

Se crea `salida/profesor-completo.md`, que reúne la configuración, las reglas y los modos. En la primera ejecución es normal que avise de que el perfil está `POR_CONFIGURAR`: lo elegirás durante la entrevista y se incluirá al compilar de nuevo.

## 3. Crear el proyecto en ChatGPT

1. Abre [ChatGPT](https://chatgpt.com/) y crea un **nuevo proyecto**, por ejemplo «Matemáticas II».
2. Abre las opciones del proyecto y busca **Instrucciones del proyecto**. Copia únicamente el texto dentro del bloque de [prompts/instrucciones-proyecto.md](../prompts/instrucciones-proyecto.md) y pégalo ahí.
3. En **Añadir archivos** o **Fuentes**, añade:
   - `salida/profesor-completo.md`.
   - `progreso/diario.md`, `progreso/errores.md` y `progreso/dominio.md`.
   - Los apuntes, temario, ejercicios y criterios que quieras estudiar (los archivos concretos de `info/`, no sus `.gitkeep`).
4. Abre una conversación **dentro del proyecto** y escribe:

   ```text
   Configura mi asignatura. Lee profesor-completo.md y hazme la entrevista inicial, con una o dos preguntas cada vez.
   ```

Los nombres de los controles pueden variar según la interfaz. Las instrucciones y fuentes del proyecto se comparten entre sus chats. [Documentación oficial](https://learn.chatgpt.com/docs/projects).

## 4. Guardar tu configuración

Al terminar la entrevista, ChatGPT te dará el contenido de `ASIGNATURA.md`:

1. Sustituye el contenido de tu archivo local por el bloque que te dé, sin las marcas de bloque de código.
2. Vuelve a ejecutar `scripts/compilar.ps1` o `scripts/compilar.sh`.
3. Quita del proyecto el antiguo `profesor-completo.md` y añade el nuevo. Así tendrá tu configuración y el perfil elegido.
4. En el siguiente chat escribe, por ejemplo: **«Modo entrenador: vamos a practicar el tema 1»**.

Clonar GitHub no crea el proyecto de ChatGPT ni le da acceso automático a tu carpeta. Para este método de archivos subidos, vuelve a añadir las versiones actualizadas cuando cambien. [Documentación oficial](https://learn.chatgpt.com/docs/projects).

## 5. Estudiar y conservar el progreso

- Abre una conversación nueva por sesión, siempre dentro del proyecto.
- Cambia el modo diciendo «modo explicador», «modo examinador», «modo repaso», etc.
- Al terminar escribe **«Terminamos, haz el resumen y dame las actualizaciones de diario.md, errores.md y dominio.md»**.
- Copia las actualizaciones a los tres archivos locales de `progreso/` y sustituye sus versiones en el proyecto. Añade las entradas del diario arriba y conserva las anteriores.
- Si cambias la configuración, las reglas o el perfil, vuelve a compilar y sustituye `profesor-completo.md`.

Guarda tus apuntes y datos personales en tu copia de estudio. La plantilla pública debe mantenerse vacía de ese material. [Uso responsable](07-uso-responsable.md).
