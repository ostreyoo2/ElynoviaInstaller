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
$bundlePath = Join-Path $appRoot 'src-tauri\target\release\bundle\nsis'
$artifactsPath = Join-Path $repoRoot 'artifacts'

if (-not (Test-Path -LiteralPath $bundlePath)) {
  throw "NSIS directory not found: $bundlePath"
}

$installer = Get-ChildItem -LiteralPath $bundlePath -Filter 'TriRise_*_x64-setup.exe' -File |
  Sort-Object LastWriteTime -Descending |
  Select-Object -First 1

if (-not $installer) {
  throw "TriRise installer not found in: $bundlePath"
}

New-Item -ItemType Directory -Path $artifactsPath -Force | Out-Null
$destination = Join-Path $artifactsPath $installer.Name
Copy-Item -LiteralPath $installer.FullName -Destination $destination -Force

$copied = Get-Item -LiteralPath $destination
Write-Output "Copied: $($copied.FullName)"
Write-Output ("Size: {0:N2} MB ({1} bytes)" -f ($copied.Length / 1MB), $copied.Length)
