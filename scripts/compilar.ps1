<#
.SYNOPSIS
  Junta ASIGNATURA.md, las reglas, el perfil y los modos en un único archivo:
  salida/profesor-completo.md  → para subirlo a Claude.ai, ChatGPT, Gemini…

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File scripts\compilar.ps1
#>
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

function Leer([string]$rel) {
    [System.IO.File]::ReadAllText((Join-Path $root $rel), [System.Text.Encoding]::UTF8).Trim()
}

$asignatura = Leer 'ASIGNATURA.md'
$perfil = 'POR_CONFIGURAR'
if ($asignatura -match '(?m)^perfil:[ \t]*([^\s#]+)') { $perfil = $Matches[1] }
$nombre = 'POR_CONFIGURAR'
if ($asignatura -match '(?m)^asignatura:[ \t]*([^#\r\n]+)') { $nombre = $Matches[1].Trim() }

$archivos = @('ASIGNATURA.md', 'profesor/base.md', 'profesor/configuracion-inicial.md')
$rutaPerfil = "profesor/asignaturas/$perfil.md"
if (Test-Path (Join-Path $root $rutaPerfil)) {
    $archivos += $rutaPerfil
} else {
    Write-Warning "No existe el perfil '$perfil' (campo 'perfil' de ASIGNATURA.md). Se compila sin perfil: la IA te lo pedira al configurar."
}
$archivos += Get-ChildItem (Join-Path $root 'profesor/modos') -Filter '*.md' |
    Where-Object { $_.Name -notlike '_*' } | Sort-Object Name |
    ForEach-Object { "profesor/modos/$($_.Name)" }
if (Test-Path (Join-Path $root 'info/INDICE.md')) { $archivos += 'info/INDICE.md' }

$fecha = Get-Date -Format 'yyyy-MM-dd'
$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine("# Profesor IA — instrucciones completas · $nombre")
[void]$sb.AppendLine()
[void]$sb.AppendLine("> Generado el $fecha con ``scripts/compilar``. No lo edites a mano: edita los archivos originales y vuelve a compilar.")
[void]$sb.AppendLine("> Contiene, en este orden: $($archivos -join ' · ').")
[void]$sb.AppendLine("> Para la IA: aquí están tu configuración y todas tus reglas. Cuando un texto mencione un archivo de esta lista, búscalo en su sección de este documento. El material de estudio y el progreso del alumno están en los demás archivos del proyecto.")

foreach ($rel in $archivos) {
    [void]$sb.AppendLine()
    [void]$sb.AppendLine('---')
    [void]$sb.AppendLine()
    [void]$sb.AppendLine("<!-- ===== ARCHIVO: $rel ===== -->")
    [void]$sb.AppendLine("# 📄 $rel")
    [void]$sb.AppendLine()
    [void]$sb.AppendLine((Leer $rel))
}

$salida = Join-Path $root 'salida'
New-Item -ItemType Directory -Force $salida | Out-Null
$destino = Join-Path $salida 'profesor-completo.md'
[System.IO.File]::WriteAllText($destino, $sb.ToString(), (New-Object System.Text.UTF8Encoding($false)))

Write-Host ""
Write-Host "Listo: salida\profesor-completo.md ($($sb.Length) caracteres, $($archivos.Count) archivos)" -ForegroundColor Green
Write-Host "Sube ese archivo a tu proyecto de Claude.ai / ChatGPT junto con tu material de info/ y progreso/."
Write-Host "Instrucciones para pegar: prompts\instrucciones-proyecto.md"
