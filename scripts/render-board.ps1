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

$originalConfigHome = $env:KICAD_CONFIG_HOME
try {
    # Show both SMD and through-hole models without changing personal settings.
    $versionOutput = & $KiCadCli --version
    if ($LASTEXITCODE -ne 0) { throw 'Could not read the KiCad version.' }
    $configVersion = [regex]::Match(($versionOutput -join ''), '\d+\.\d+').Value
    if (-not $configVersion) { throw 'Could not identify the KiCad configuration version.' }
    $configSourceRoot = if ($originalConfigHome) { $originalConfigHome } else { Join-Path $env:APPDATA 'kicad' }
    $viewerSource = Join-Path (Join-Path $configSourceRoot $configVersion) '3d_viewer.json'
    $viewerSettings = if (Test-Path -LiteralPath $viewerSource) {
        Get-Content -LiteralPath $viewerSource -Raw | ConvertFrom-Json
    } else {
        [pscustomobject]@{}
    }
    if (-not $viewerSettings.render) {
        $viewerSettings | Add-Member -NotePropertyName render -NotePropertyValue ([pscustomobject]@{})
    }
    foreach ($settingName in @('show_footprints_insert', 'show_footprints_normal')) {
        $viewerSettings.render | Add-Member -NotePropertyName $settingName -NotePropertyValue $true -Force
    }
    $renderConfigHome = Join-Path $repoRoot 'outputs\render-config'
    $renderConfigDir = Join-Path $renderConfigHome $configVersion
    New-Item -ItemType Directory -Path $renderConfigDir -Force | Out-Null
    $viewerSettings | ConvertTo-Json -Depth 30 | Set-Content -LiteralPath (Join-Path $renderConfigDir '3d_viewer.json') -Encoding UTF8
    $env:KICAD_CONFIG_HOME = $renderConfigHome
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    & $KiCadCli pcb render --output (Join-Path $outputDir 'board-3d.png') --width 2000 --height 1500 --quality high --background opaque --rotate '325,0,25' $boardPath
    if ($LASTEXITCODE -ne 0) { throw 'Angled board render failed.' }
    & $KiCadCli pcb render --output (Join-Path $outputDir 'board-top.png') --width 1800 --height 1500 --quality high --background opaque --side top $boardPath
    if ($LASTEXITCODE -ne 0) { throw 'Top board render failed.' }
    Write-Output "Board previews saved in $outputDir"
} finally {
    $env:KICAD_CONFIG_HOME = $originalConfigHome
}
