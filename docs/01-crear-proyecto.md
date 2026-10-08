# 1 · Crear el proyecto de una asignatura

La idea: **esta plantilla se queda limpia** y, por cada asignatura, creas una copia con su propio material y su progreso.

```
profesor-ia-bachillerato/   ← la plantilla (no estudies aquí)
mates-ii/                   ← copia para Matemáticas II
fisica/                     ← copia para Física
historia-espana/            ← copia para Historia de España
```

Elige una de las siguientes formas.

## Clonar la plantilla directamente

Si tienes Git instalado, puedes descargar una copia para estudiar sin crear antes otro repositorio:

```bash
git clone https://github.com/AdrianSaut/profesor-ia-bachillerato.git mi-asignatura
cd mi-asignatura
```

Pon tus apuntes en `info/` y sigue [la guía de ChatGPT](04-chatgpt.md) o la de tu IA preferida. El nombre `mi-asignatura` es la carpeta local: puedes sustituirlo por `mates-ii`, `fisica`, etc.

Esta copia conserva `origin` apuntando a la plantilla. Para guardar cambios en un repositorio tuyo, usa la opción A: crea tu repositorio privado con **Use this template** y clona ese repositorio.

---

## Opción A · Con GitHub (recomendada si usas GitHub)

**Una sola vez — preparar la plantilla:**
La plantilla está en [AdrianSaut/profesor-ia-bachillerato](https://github.com/AdrianSaut/profesor-ia-bachillerato). Si publicas tu propia versión, sigue [Subir la plantilla a GitHub](#subir-la-plantilla-a-github) y marca **Settings → General → Template repository**.

**Cada asignatura nueva:**
1. En la página de la plantilla, botón verde **Use this template → Create a new repository**.
2. Nombre: por ejemplo `mates-ii`. Marca **Private** ⚠️ (tu material y tu progreso son tuyos).
3. Clónalo en tu ordenador:
   ```bash
   git clone https://github.com/TU-USUARIO/mates-ii.git
   ```
4. Sigue con [Después de crear el proyecto](#después-de-crear-el-proyecto).

> Si el repositorio es **privado**, puedes subir también tu material de `info/` quitando las líneas indicadas en `.gitignore`. Si es **público**, no lo hagas (ver `docs/07-uso-responsable.md`).

---

## Opción B · Con el script (sin GitHub, o para crear varias de golpe)

Desde la carpeta de la plantilla:

**Windows (PowerShell):**
```powershell
powershell -ExecutionPolicy Bypass -File scripts\nueva-asignatura.ps1 -Nombre "Matemáticas II"
```

**Mac / Linux / Git Bash:**
```bash
bash scripts/nueva-asignatura.sh "Matemáticas II"
```

Crea la carpeta `../matematicas-ii` al lado de la plantilla, sin material, con `asignatura`, `curso` y `perfil` ya rellenos en `ASIGNATURA.md` (los deduce del nombre).

Opciones:

| PowerShell | Bash | Para qué |
|---|---|---|
| `-Curso "2º Bachillerato"` | `--curso "2º Bachillerato"` | Indicar el curso si no lo deduce |
| `-Perfil fisica` | `--perfil fisica` | Forzar un perfil de `profesor/asignaturas/` |
| `-Destino "C:\Estudio\fisica"` | `--destino ~/estudio/fisica` | Elegir dónde se crea |

---

## Opción C · A mano (sin instalar nada)

1. Descarga la plantilla (en GitHub: **Code → Download ZIP**) y descomprímela.
2. Renombra la carpeta con el nombre de la asignatura.
3. Abre `ASIGNATURA.md` y cambia `asignatura`, `curso` y `perfil` (o deja que la IA lo haga en la configuración inicial).

---

## Después de crear el proyecto

1. **Mete tu material** en `info/` → [docs/06-preparar-info.md](06-preparar-info.md).
2. **Elige la IA** y sigue su guía:
   - Claude Code → [02-claude-code.md](02-claude-code.md)
   - Claude.ai → [03-claude-web.md](03-claude-web.md)
   - ChatGPT → [04-chatgpt.md](04-chatgpt.md)
   - Otras → [05-otras-ias.md](05-otras-ias.md)
3. **Configura** la asignatura: en Claude Code `/empezar`; en web, escribe *"Configura mi asignatura"*.

---

## Subir la plantilla a GitHub

> Si usas el mismo ordenador para otras cosas (por ejemplo, el del trabajo), configura **en este repositorio** tu identidad personal para que los commits no salgan con otra cuenta.

```bash
cd ruta/a/la/plantilla
git init -b main
git config user.name "Tu Nombre"
git config user.email "tu-correo-personal@ejemplo.com"
git add .
git commit -m "Plantilla Profesor IA para Bachillerato"
```

Después crea un repositorio vacío en GitHub (sin README) y:

```bash
git remote add origin https://github.com/TU-USUARIO/profesor-ia-bachillerato.git
git push -u origin main
```

Con [GitHub CLI](https://cli.github.com/) puedes hacer los dos pasos de una vez:

```bash
gh repo create profesor-ia-bachillerato --public --source . --push
```

Y marca **Settings → Template repository**.
