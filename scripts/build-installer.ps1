[CmdletBinding()]
param(
  [Parameter(Mandatory = $true)]
  [string]$AppProjectPath
)

$ErrorActionPreference = 'Stop'
$appRoot = [System.IO.Path]::GetFullPath($AppProjectPath)
$copyScript = Join-Path $PSScriptRoot 'copy-release-artifacts.ps1'

if (-not (Test-Path -LiteralPath (Join-Path $appRoot 'package.json'))) {
  throw "Elynovia project not found: $appRoot"
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
