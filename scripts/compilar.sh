#!/usr/bin/env bash
# Junta ASIGNATURA.md, las reglas, el perfil y los modos en un único archivo:
#   salida/profesor-completo.md  → para subirlo a Claude.ai, ChatGPT, Gemini…
# Uso:  bash scripts/compilar.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

perfil="$(sed -n 's/^perfil:[[:space:]]*\([^[:space:]#]*\).*/\1/p' ASIGNATURA.md | head -n 1)"
nombre="$(sed -n 's/^asignatura:[[:space:]]*\([^#]*\).*/\1/p' ASIGNATURA.md | head -n 1 | tr -d '\r' | sed 's/[[:space:]]*$//')"
: "${perfil:=POR_CONFIGURAR}"
: "${nombre:=POR_CONFIGURAR}"

archivos=(ASIGNATURA.md profesor/base.md profesor/configuracion-inicial.md)
if [ -f "profesor/asignaturas/$perfil.md" ]; then
  archivos+=("profesor/asignaturas/$perfil.md")
else
  echo "AVISO: no existe el perfil '$perfil' (campo 'perfil' de ASIGNATURA.md). Se compila sin perfil." >&2
fi
for f in profesor/modos/*.md; do
  case "$(basename "$f")" in _*) continue ;; esac
  archivos+=("$f")
done
[ -f info/INDICE.md ] && archivos+=(info/INDICE.md)

mkdir -p salida
destino="salida/profesor-completo.md"
lista="$(printf '%s · ' "${archivos[@]}")"; lista="${lista% · }"

{
  echo "# Profesor IA — instrucciones completas · $nombre"
  echo
  echo "> Generado el $(date +%Y-%m-%d) con \`scripts/compilar\`. No lo edites a mano: edita los archivos originales y vuelve a compilar."
  echo "> Contiene, en este orden: $lista."
  echo "> Para la IA: aquí están tu configuración y todas tus reglas. Cuando un texto mencione un archivo de esta lista, búscalo en su sección de este documento. El material de estudio y el progreso del alumno están en los demás archivos del proyecto."
  for rel in "${archivos[@]}"; do
    echo
    echo "---"
    echo
    echo "<!-- ===== ARCHIVO: $rel ===== -->"
    echo "# 📄 $rel"
    echo
    tr -d '\r' < "$rel"
    echo
  done
} > "$destino"

echo
echo "Listo: $destino ($(wc -c < "$destino" | tr -d ' ') bytes, ${#archivos[@]} archivos)"
echo "Sube ese archivo a tu proyecto de Claude.ai / ChatGPT junto con tu material de info/ y progreso/."
echo "Instrucciones para pegar: prompts/instrucciones-proyecto.md"
