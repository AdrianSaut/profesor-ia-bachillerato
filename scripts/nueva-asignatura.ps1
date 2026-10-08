<#
.SYNOPSIS
  Crea el proyecto de una asignatura nueva a partir de esta plantilla.

.DESCRIPTION
  Copia la plantilla (sin .git, sin salida/ y sin el contenido de info/, trabajo/ y generado/)
  en una carpeta nueva y rellena en ASIGNATURA.md el nombre, el curso y el perfil.
  Ejecútalo desde la PLANTILLA limpia, no desde otra asignatura.

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File scripts\nueva-asignatura.ps1 -Nombre "Matemáticas II"

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File scripts\nueva-asignatura.ps1 -Nombre "Física" -Curso "2º Bachillerato" -Perfil fisica -Destino "C:\Estudio\fisica"
#>
param(
    [Parameter(Mandatory = $true)] [string]$Nombre,
    [string]$Curso = '',
    [string]$Perfil = '',
    [string]$Destino = ''
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

function Sin-Tildes([string]$s) {
    $n = $s.Normalize([System.Text.NormalizationForm]::FormD)
    -join ($n.ToCharArray() | Where-Object {
        [System.Globalization.CharUnicodeInfo]::GetUnicodeCategory($_) -ne [System.Globalization.UnicodeCategory]::NonSpacingMark
    })
}
$plano = (Sin-Tildes $Nombre).ToLowerInvariant()
$slug = ($plano -replace '[^a-z0-9]+', '-').Trim('-')

# --- Perfil: el indicado, o deducido del nombre ---
if (-not $Perfil) {
    $reglas = [ordered]@{
        'filosof'                                   = 'filosofia'
        'matem'                                     = 'matematicas'
        'quimic'                                    = 'quimica'
        'fisic'                                     = 'fisica'
        'tecnolog|ingenier'                         = 'tecnologia-ingenieria'
        'dibujo'                                    = 'dibujo-tecnico'
        'biolog|geolog'                             = 'biologia'
        'program|\btic\b|comput|robot|informat'     = 'programacion-tic'
        'lengua|literatura|catala|valencia|galleg|euske' = 'lengua-literatura'
        'ingles|english'                            = 'ingles'
        'historia'                                  = 'historia'
    }
    if ($plano -match 'fisica y quimica') { $Perfil = 'fisica' }
    else {
        foreach ($k in $reglas.Keys) { if ($plano -match $k) { $Perfil = $reglas[$k]; break } }
    }
}
if ($Perfil -and -not (Test-Path (Join-Path $root "profesor/asignaturas/$Perfil.md"))) {
    $disponibles = (Get-ChildItem (Join-Path $root 'profesor/asignaturas') -Filter '*.md' |
        Where-Object { $_.Name -notlike '_*' } | ForEach-Object { $_.BaseName }) -join ', '
    Write-Warning "El perfil '$Perfil' no existe. Disponibles: $disponibles. Se dejara POR_CONFIGURAR."
    $Perfil = ''
}

# --- Curso: el indicado, o deducido de "I" / "II" al final del nombre ---
if (-not $Curso) {
    if ($Nombre -match '(\bII|\b2|2º)\s*$') { $Curso = '2º Bachillerato' }
    elseif ($Nombre -match '(\bI|\b1|1º)\s*$') { $Curso = '1º Bachillerato' }
}

# --- Destino ---
if (-not $Destino) { $Destino = Join-Path (Split-Path -Parent $root) $slug }
if ((Test-Path $Destino) -and (Get-ChildItem -Force $Destino | Select-Object -First 1)) {
    throw "La carpeta '$Destino' ya existe y no esta vacia. Elige otro -Destino."
}
New-Item -ItemType Directory -Force $Destino | Out-Null

# --- Copia ---
Get-ChildItem -Force $root | Where-Object { $_.Name -notin @('.git', 'salida') } |
    ForEach-Object { Copy-Item $_.FullName -Destination $Destino -Recurse -Force }

foreach ($dir in 'info', 'trabajo', 'generado') {
    $p = Join-Path $Destino $dir
    if (Test-Path $p) {
        Get-ChildItem $p -Recurse -File -Force |
            Where-Object { $_.Name -notin @('README.md', '.gitkeep') } |
            Remove-Item -Force
    }
}

# --- Rellenar ASIGNATURA.md ---
$asigPath = Join-Path $Destino 'ASIGNATURA.md'
$texto = [System.IO.File]::ReadAllText($asigPath, [System.Text.Encoding]::UTF8)
function Poner-Campo([string]$t, [string]$campo, [string]$valor) {
    if (-not $valor) { return $t }
    $re = New-Object System.Text.RegularExpressions.Regex("(?m)^($campo\:[ \t]*)[^#\r\n]*?([ \t]*#|[ \t]*\r?$)")
    $re.Replace($t, [System.Text.RegularExpressions.MatchEvaluator]{
        param($m) $m.Groups[1].Value + $valor + $m.Groups[2].Value
    }, 1)
}
$texto = Poner-Campo $texto 'asignatura' $Nombre
$texto = Poner-Campo $texto 'curso' $Curso
$texto = Poner-Campo $texto 'perfil' $Perfil
[System.IO.File]::WriteAllText($asigPath, $texto, (New-Object System.Text.UTF8Encoding($false)))

Write-Host ""
Write-Host "Asignatura creada en: $Destino" -ForegroundColor Green
Write-Host ("  asignatura: {0}" -f $Nombre)
Write-Host ("  curso:      {0}" -f $(if ($Curso) { $Curso } else { 'POR_CONFIGURAR' }))
Write-Host ("  perfil:     {0}" -f $(if ($Perfil) { $Perfil } else { 'POR_CONFIGURAR' }))
Write-Host ""
Write-Host "Siguientes pasos:"
Write-Host "  1. Mete tu material en info\  (apuntes, ejercicios, examenes, criterios)"
Write-Host "  2. Abre la carpeta con Claude Code y escribe /empezar"
Write-Host "     (o ejecuta scripts\compilar.ps1 y sigue docs\03-claude-web.md / docs\04-chatgpt.md)"
