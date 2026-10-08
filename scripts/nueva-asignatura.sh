#!/usr/bin/env bash
# Crea el proyecto de una asignatura nueva a partir de esta plantilla.
# Copia la plantilla (sin .git, sin salida/ y sin el contenido de info/, trabajo/ y generado/)
# en una carpeta nueva y rellena en ASIGNATURA.md el nombre, el curso y el perfil.
# Ejecútalo desde la PLANTILLA limpia, no desde otra asignatura.
#
# Uso:
#   bash scripts/nueva-asignatura.sh "Matemáticas II"
#   bash scripts/nueva-asignatura.sh "Física" --curso "2º Bachillerato" --perfil fisica --destino ~/estudio/fisica
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if [ $# -lt 1 ] || [ "${1:0:1}" = "-" ]; then
  echo "Uso: bash scripts/nueva-asignatura.sh \"Nombre de la asignatura\" [--curso \"2º Bachillerato\"] [--perfil matematicas] [--destino carpeta]" >&2
  exit 1
fi
NOMBRE="$1"; shift
CURSO=""; PERFIL=""; DESTINO=""
while [ $# -gt 0 ]; do
  case "$1" in
    --curso)   CURSO="$2"; shift 2 ;;
    --perfil)  PERFIL="$2"; shift 2 ;;
    --destino) DESTINO="$2"; shift 2 ;;
    *) echo "Opción desconocida: $1" >&2; exit 1 ;;
  esac
done

sin_tildes() {
  sed -e 's/á/a/g' -e 's/é/e/g' -e 's/í/i/g' -e 's/ó/o/g' -e 's/ú/u/g' -e 's/ü/u/g' -e 's/ñ/n/g' \
      -e 's/Á/A/g' -e 's/É/E/g' -e 's/Í/I/g' -e 's/Ó/O/g' -e 's/Ú/U/g' -e 's/Ü/U/g' -e 's/Ñ/N/g' \
      -e 's/º/o/g' -e 's/ª/a/g' -e 's/ç/c/g' -e 's/Ç/C/g' -e 's/à/a/g' -e 's/è/e/g' -e 's/ò/o/g' \
      -e 's/À/A/g' -e 's/È/E/g' -e 's/Ò/O/g' -e 's/ï/i/g' -e 's/Ï/I/g'
}
PLANO="$(printf '%s' "$NOMBRE" | sin_tildes | tr '[:upper:]' '[:lower:]')"
SLUG="$(printf '%s' "$PLANO" | sed -e 's/[^a-z0-9][^a-z0-9]*/-/g' -e 's/^-//' -e 's/-$//')"

# --- Perfil: el indicado, o deducido del nombre ---
if [ -z "$PERFIL" ]; then
  case "$PLANO" in
    *"fisica y quimica"*)                                   PERFIL=fisica ;;
    *filosof*)                                              PERFIL=filosofia ;;
    *matem*)                                                PERFIL=matematicas ;;
    *quimic*)                                               PERFIL=quimica ;;
    *fisic*)                                                PERFIL=fisica ;;
    *tecnolog*|*ingenier*)                                  PERFIL=tecnologia-ingenieria ;;
    *dibujo*)                                               PERFIL=dibujo-tecnico ;;
    *biolog*|*geolog*)                                      PERFIL=biologia ;;
    *program*|tic|"tic "*|*" tic"|*" tic "*|*comput*|*robot*|*informat*) PERFIL=programacion-tic ;;
    *lengua*|*literatura*|*catala*|*valencia*|*galleg*|*euske*) PERFIL=lengua-literatura ;;
    *ingles*|*english*)                                     PERFIL=ingles ;;
    *historia*)                                             PERFIL=historia ;;
  esac
fi
if [ -n "$PERFIL" ] && [ ! -f "$ROOT/profesor/asignaturas/$PERFIL.md" ]; then
  echo "AVISO: el perfil '$PERFIL' no existe. Se dejará POR_CONFIGURAR." >&2
  PERFIL=""
fi

# --- Curso: el indicado, o deducido de "I" / "II" al final del nombre ---
if [ -z "$CURSO" ]; then
  case "$PLANO" in
    *" ii"|*" 2"|*" 2o") CURSO="2º Bachillerato" ;;
    *" i"|*" 1"|*" 1o")  CURSO="1º Bachillerato" ;;
  esac
fi

# --- Destino ---
[ -z "$DESTINO" ] && DESTINO="$(dirname "$ROOT")/$SLUG"
if [ -d "$DESTINO" ] && [ -n "$(ls -A "$DESTINO" 2>/dev/null)" ]; then
  echo "ERROR: la carpeta '$DESTINO' ya existe y no está vacía. Usa otro --destino." >&2
  exit 1
fi
mkdir -p "$DESTINO"

# --- Copia ---
tar -C "$ROOT" --exclude=.git --exclude=salida -cf - . | tar -C "$DESTINO" -xf -
for dir in info trabajo generado; do
  [ -d "$DESTINO/$dir" ] && find "$DESTINO/$dir" -type f ! -name README.md ! -name .gitkeep -exec rm -f {} +
done

# --- Rellenar ASIGNATURA.md ---
poner_campo() {  # $1 campo, $2 valor
  [ -z "$2" ] && return 0
  local f="$DESTINO/ASIGNATURA.md" tmp valor
  tmp="$(mktemp)"
  valor="$(printf '%s' "$2" | sed -e 's/[\/&|]/\\&/g')"
  sed -e "s|^\($1:[[:space:]]*\)[^#]*[^#[:space:]]\([[:space:]]*#\)|\1$valor\2|" \
      -e "t" \
      -e "s|^\($1:[[:space:]]*\)[^#[:space:]].*$|\1$valor|" "$f" > "$tmp"
  mv "$tmp" "$f"
}
poner_campo asignatura "$NOMBRE"
poner_campo curso "$CURSO"
poner_campo perfil "$PERFIL"

echo
echo "Asignatura creada en: $DESTINO"
echo "  asignatura: $NOMBRE"
echo "  curso:      ${CURSO:-POR_CONFIGURAR}"
echo "  perfil:     ${PERFIL:-POR_CONFIGURAR}"
echo
echo "Siguientes pasos:"
echo "  1. Mete tu material en info/  (apuntes, ejercicios, exámenes, criterios)"
echo "  2. Abre la carpeta con Claude Code y escribe /empezar"
echo "     (o ejecuta scripts/compilar.sh y sigue docs/03-claude-web.md / docs/04-chatgpt.md)"
