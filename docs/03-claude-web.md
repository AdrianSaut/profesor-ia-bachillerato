# 3 · Usarlo en Claude.ai (Proyectos)

No necesitas instalar nada: todo se hace en la web o en la app de Claude. Los **Proyectos** permiten guardar instrucciones y archivos que Claude tiene en cuenta en todas las conversaciones del proyecto.

## Preparar (una vez por asignatura)

1. **Genera el archivo de instrucciones completas** desde la carpeta de tu asignatura:
   - Windows: `powershell -ExecutionPolicy Bypass -File scripts\compilar.ps1`
   - Mac/Linux: `bash scripts/compilar.sh`

   Se crea `salida/profesor-completo.md` (une tu configuración, las reglas, el perfil y todos los modos).
   > ¿No puedes ejecutar scripts? Sube en su lugar `ASIGNATURA.md`, `profesor/base.md`, `profesor/configuracion-inicial.md`, tu perfil de `profesor/asignaturas/` y los archivos de `profesor/modos/`.

2. En Claude.ai: **Proyectos → Crear proyecto** → ponle el nombre de la asignatura.
3. **Instrucciones del proyecto:** copia el bloque de [`prompts/instrucciones-proyecto.md`](../prompts/instrucciones-proyecto.md) y pégalo.
4. **Conocimiento del proyecto** (archivos): sube
   - `salida/profesor-completo.md`
   - tu material de `info/` (apuntes, ejercicios, exámenes, criterios)
   - `progreso/diario.md`, `progreso/errores.md` y `progreso/dominio.md`
5. Abre una conversación en el proyecto y escribe: **"Configura mi asignatura"**.
6. Al final te dará el `ASIGNATURA.md` completo: guárdalo en tu carpeta, **vuelve a compilar** (paso 1) y sustituye `profesor-completo.md` en el proyecto.

## Uso diario
- Abre una **conversación nueva por sesión** de estudio dentro del proyecto (las conversaciones muy largas pierden precisión).
- Al terminar, escribe **"Terminamos, haz el resumen"**. Te dará bloques para pegar en `progreso/`. Pégalos en tus archivos y **vuelve a subirlos** al proyecto (sustituyendo los antiguos), para que la próxima sesión sepa por dónde vas.
- Cuando añadas material nuevo a `info/`, súbelo también al proyecto.

## Trucos
- Las fórmulas se ven bien (LaTeX). Puedes mandar **fotos** de tus ejercicios.
- Si Claude genera una hoja de ejercicios o un resumen largo, puede aparecer como *artefacto*: descárgalo a `generado/`.
- Para cambiar de tipo de profesor: *"modo examinador"*, *"modo repaso"*… (ver [`prompts/frases-utiles.md`](../prompts/frases-utiles.md)).
