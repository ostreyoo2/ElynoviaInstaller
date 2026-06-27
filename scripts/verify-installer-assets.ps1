[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path $PSScriptRoot -Parent
$requiredAssets = @(
  'branding\logo\tririse-logo-source.png',
  'branding\icons\tririse-app-icon-source.png',
  'branding\icons\icon.ico',
  'branding\icons\icon.png',
  'branding\installer\BRANDING.md',
  'branding\installer\tririse-installer-header-source.png',
  'branding\installer\tririse-installer-sidebar-source.png',
  'branding\installer\tririse-installer-banner.png',
  'branding\installer\tririse-installer-welcome.png'
)

$sizedAssets = @(
  @{ Path = 'branding\installer\tririse-installer-header.png'; Width = 150; Height = 57 },
  @{ Path = 'branding\installer\tririse-installer-header.bmp'; Width = 150; Height = 57 },
  @{ Path = 'branding\installer\tririse-installer-sidebar.png'; Width = 164; Height = 314 },
  @{ Path = 'branding\installer\tririse-installer-sidebar.bmp'; Width = 164; Height = 314 }
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

Add-Type -AssemblyName System.Drawing
foreach ($asset in $sizedAssets) {
  $fullPath = Join-Path $repoRoot $asset.Path
  if (-not (Test-Path -LiteralPath $fullPath)) {
    throw "Missing installer asset: $($asset.Path)"
  }

  $item = Get-Item -LiteralPath $fullPath
  if ($item.Length -le 0) {
    throw "Installer asset is empty: $($asset.Path)"
  }

  $image = [System.Drawing.Image]::FromFile($fullPath)
  try {
    if ($image.Width -ne $asset.Width -or $image.Height -ne $asset.Height) {
      throw "Invalid dimensions for $($asset.Path): $($image.Width)x$($image.Height)"
    }
    Write-Output ("OK  {0} ({1}x{2}, {3} bytes)" -f $asset.Path, $image.Width, $image.Height, $item.Length)
  } finally {
    $image.Dispose()
  }
}

& git -C $repoRoot check-ignore -q artifacts/test-installer.exe
if ($LASTEXITCODE -ne 0) {
  throw 'artifacts/ is not ignored by Git.'
}
Write-Output 'OK  artifacts/ is ignored by Git.'

Write-Output 'All required installer assets are available.'
