[CmdletBinding()]
param(
    [string]$KiCadCli
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$boardPath = Join-Path $repoRoot 'hardware\kicad\robko01_retrofit_mb.kicad_pcb'
$outputDir = Join-Path $repoRoot 'outputs\renders'

if (-not $KiCadCli) {
    $cliCommand = Get-Command kicad-cli -ErrorAction SilentlyContinue
    if ($cliCommand) {
        $KiCadCli = $cliCommand.Source
    } else {
        $installRoot = Join-Path $env:ProgramFiles 'KiCad'
        $installation = Get-ChildItem -LiteralPath $installRoot -Directory -ErrorAction SilentlyContinue |
            Where-Object { $_.Name -match '^\d+\.\d+$' } |
            Sort-Object { [version]$_.Name } -Descending |
            Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'bin\kicad-cli.exe') } |
            Select-Object -First 1
        if ($installation) {
            $KiCadCli = Join-Path $installation.FullName 'bin\kicad-cli.exe'
        }
    }
}

if (-not $KiCadCli -or -not (Test-Path -LiteralPath $KiCadCli -PathType Leaf)) {
    throw 'KiCad CLI was not found. Install KiCad 9 or later, or pass -KiCadCli with its full path.'
}
if (-not (Test-Path -LiteralPath $boardPath -PathType Leaf)) {
    throw "Board was not found: $boardPath"
}

& $KiCadCli pcb render --help | Out-Null
if ($LASTEXITCODE -ne 0) {
    throw 'This KiCad installation does not support PCB rendering. Use KiCad 9 or later.'
}

# This KiCad 8 project uses KICAD8_3DMODEL_DIR for its model references.
$originalModelDir = $env:KICAD8_3DMODEL_DIR
$modelDir = Join-Path (Split-Path -Parent (Split-Path -Parent $KiCadCli)) 'share\kicad\3dmodels'
try {
    if (-not $originalModelDir -and (Test-Path -LiteralPath $modelDir -PathType Container)) {
        $env:KICAD8_3DMODEL_DIR = $modelDir
    }
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    & $KiCadCli pcb render --output (Join-Path $outputDir 'board-3d.png') --width 2000 --height 1500 --quality high --background opaque --rotate '325,0,25' $boardPath
    if ($LASTEXITCODE -ne 0) { throw 'Angled board render failed.' }
    & $KiCadCli pcb render --output (Join-Path $outputDir 'board-top.png') --width 1800 --height 1500 --quality high --background opaque --side top $boardPath
    if ($LASTEXITCODE -ne 0) { throw 'Top board render failed.' }
    Write-Output "Board previews saved in $outputDir"
} finally {
    $env:KICAD8_3DMODEL_DIR = $originalModelDir
}
