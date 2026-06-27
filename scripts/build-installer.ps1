[CmdletBinding()]
param(
  [string]$AppProjectPath
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path $PSScriptRoot -Parent
if (-not $AppProjectPath) {
  $AppProjectPath = Join-Path $repoRoot '..\PortfelPilot'
}
$appRoot = [System.IO.Path]::GetFullPath($AppProjectPath)
$copyScript = Join-Path $PSScriptRoot 'copy-release-artifacts.ps1'

if (-not (Test-Path -LiteralPath (Join-Path $appRoot 'package.json'))) {
  throw "App project not found: $appRoot"
}

Push-Location $appRoot
try {
  & npm.cmd run tauri build
  if ($LASTEXITCODE -ne 0) {
    throw "Tauri build failed with exit code $LASTEXITCODE."
  }
} finally {
  Pop-Location
}

& $copyScript -AppProjectPath $appRoot
