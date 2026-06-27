[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path $PSScriptRoot -Parent
$requiredAssets = @(
  'branding\logo\tririse-logo-source.png',
  'branding\icons\tririse-app-icon-source.png',
  'branding\icons\icon.ico',
  'branding\icons\icon.png',
  'branding\installer\BRANDING.md'
)

$missing = @()
foreach ($relativePath in $requiredAssets) {
  $fullPath = Join-Path $repoRoot $relativePath
  if (Test-Path -LiteralPath $fullPath) {
    $item = Get-Item -LiteralPath $fullPath
    Write-Output ("OK  {0} ({1} bytes)" -f $relativePath, $item.Length)
  } else {
    $missing += $relativePath
    Write-Output "MISSING  $relativePath"
  }
}

if ($missing.Count -gt 0) {
  throw "Missing installer assets: $($missing -join ', ')"
}

Write-Output 'All required installer assets are available.'
