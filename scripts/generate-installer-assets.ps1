[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

$repoRoot = Split-Path $PSScriptRoot -Parent
$installerDir = Join-Path $repoRoot 'branding\installer'
$headerSourcePath = Join-Path $installerDir 'tririse-installer-header-source.png'
$sidebarSourcePath = Join-Path $installerDir 'tririse-installer-sidebar-source.png'
$logoPath = Join-Path $repoRoot 'branding\icons\tririse-app-icon-source.png'

foreach ($path in @($headerSourcePath, $sidebarSourcePath, $logoPath)) {
  if (-not (Test-Path -LiteralPath $path)) {
    throw "Required source image not found: $path"
  }
}

function New-Canvas([int]$Width, [int]$Height) {
  $pixelFormat = [System.Drawing.Imaging.PixelFormat]::Format24bppRgb
  return New-Object System.Drawing.Bitmap -ArgumentList $Width, $Height, $pixelFormat
}

function Set-HighQuality([System.Drawing.Graphics]$Graphics) {
  $Graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
  $Graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $Graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
  $Graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
}

function Draw-Cover(
  [System.Drawing.Graphics]$Graphics,
  [System.Drawing.Image]$Image,
  [int]$Width,
  [int]$Height
) {
  $scale = [Math]::Max($Width / $Image.Width, $Height / $Image.Height)
  $drawWidth = [int][Math]::Ceiling($Image.Width * $scale)
  $drawHeight = [int][Math]::Ceiling($Image.Height * $scale)
  $x = [int](($Width - $drawWidth) / 2)
  $y = [int](($Height - $drawHeight) / 2)
  $Graphics.DrawImage($Image, $x, $y, $drawWidth, $drawHeight)
}

function Save-Png([System.Drawing.Bitmap]$Bitmap, [string]$Path) {
  $Bitmap.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
  Write-Output "Created: $Path ($($Bitmap.Width)x$($Bitmap.Height))"
}

function Save-Bmp([System.Drawing.Bitmap]$Bitmap, [string]$Path) {
  $Bitmap.Save($Path, [System.Drawing.Imaging.ImageFormat]::Bmp)
  Write-Output "Created: $Path ($($Bitmap.Width)x$($Bitmap.Height))"
}

$headerSource = [System.Drawing.Image]::FromFile($headerSourcePath)
$sidebarSource = [System.Drawing.Image]::FromFile($sidebarSourcePath)
$logo = [System.Drawing.Image]::FromFile($logoPath)

try {
  $headerPreview = New-Canvas 600 228
  $headerGraphics = [System.Drawing.Graphics]::FromImage($headerPreview)
  try {
    Set-HighQuality $headerGraphics
    Draw-Cover $headerGraphics $headerSource 600 228
    $overlay = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(155, 2, 8, 18))
    $white = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(245, 241, 250, 255))
    $muted = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(230, 151, 218, 238))
    $titleFont = New-Object System.Drawing.Font 'Segoe UI', 38, ([System.Drawing.FontStyle]::Bold), ([System.Drawing.GraphicsUnit]::Pixel)
    $taglineFont = New-Object System.Drawing.Font 'Segoe UI', 18, ([System.Drawing.FontStyle]::Regular), ([System.Drawing.GraphicsUnit]::Pixel)
    try {
      $headerGraphics.FillRectangle($overlay, 0, 0, 360, 228)
      $headerGraphics.DrawImage($logo, 24, 42, 144, 144)
      $headerGraphics.DrawString('TriRise', $titleFont, $white, 184, 58)
      $headerGraphics.DrawString(('Finance ' + [char]0x2022 + ' Fitness ' + [char]0x2022 + ' Diet'), $taglineFont, $muted, 186, 112)
    } finally {
      $overlay.Dispose()
      $white.Dispose()
      $muted.Dispose()
      $titleFont.Dispose()
      $taglineFont.Dispose()
    }
  } finally {
    $headerGraphics.Dispose()
  }

  Save-Png $headerPreview (Join-Path $installerDir 'tririse-installer-banner.png')

  $headerFinal = New-Canvas 150 57
  $headerFinalGraphics = [System.Drawing.Graphics]::FromImage($headerFinal)
  try {
    Set-HighQuality $headerFinalGraphics
    $headerFinalGraphics.DrawImage($headerPreview, 0, 0, 150, 57)
  } finally {
    $headerFinalGraphics.Dispose()
  }
  Save-Png $headerFinal (Join-Path $installerDir 'tririse-installer-header.png')
  Save-Bmp $headerFinal (Join-Path $installerDir 'tririse-installer-header.bmp')

  $sidebarPreview = New-Canvas 656 1256
  $sidebarGraphics = [System.Drawing.Graphics]::FromImage($sidebarPreview)
  try {
    Set-HighQuality $sidebarGraphics
    Draw-Cover $sidebarGraphics $sidebarSource 656 1256
    $topOverlay = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(135, 1, 6, 14))
    $bottomOverlay = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(105, 2, 6, 18))
    $white = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(250, 241, 250, 255))
    $muted = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(235, 159, 226, 242))
    $titleFont = New-Object System.Drawing.Font 'Segoe UI', 58, ([System.Drawing.FontStyle]::Bold), ([System.Drawing.GraphicsUnit]::Pixel)
    $taglineFont = New-Object System.Drawing.Font 'Segoe UI', 25, ([System.Drawing.FontStyle]::Regular), ([System.Drawing.GraphicsUnit]::Pixel)
    $center = New-Object System.Drawing.StringFormat
    $center.Alignment = [System.Drawing.StringAlignment]::Center
    try {
      $sidebarGraphics.FillRectangle($topOverlay, 0, 0, 656, 530)
      $sidebarGraphics.FillRectangle($bottomOverlay, 0, 1030, 656, 226)
      $sidebarGraphics.DrawImage($logo, 188, 88, 280, 280)
      $titleRect = New-Object System.Drawing.RectangleF 0, 374, 656, 82
      $taglineRect = New-Object System.Drawing.RectangleF 0, 458, 656, 52
      $sidebarGraphics.DrawString('TriRise', $titleFont, $white, $titleRect, $center)
      $sidebarGraphics.DrawString(('Finance ' + [char]0x2022 + ' Fitness ' + [char]0x2022 + ' Diet'), $taglineFont, $muted, $taglineRect, $center)
    } finally {
      $topOverlay.Dispose()
      $bottomOverlay.Dispose()
      $white.Dispose()
      $muted.Dispose()
      $titleFont.Dispose()
      $taglineFont.Dispose()
      $center.Dispose()
    }
  } finally {
    $sidebarGraphics.Dispose()
  }

  Save-Png $sidebarPreview (Join-Path $installerDir 'tririse-installer-welcome.png')

  $sidebarFinal = New-Canvas 164 314
  $sidebarFinalGraphics = [System.Drawing.Graphics]::FromImage($sidebarFinal)
  try {
    Set-HighQuality $sidebarFinalGraphics
    $sidebarFinalGraphics.DrawImage($sidebarPreview, 0, 0, 164, 314)
  } finally {
    $sidebarFinalGraphics.Dispose()
  }
  Save-Png $sidebarFinal (Join-Path $installerDir 'tririse-installer-sidebar.png')
  Save-Bmp $sidebarFinal (Join-Path $installerDir 'tririse-installer-sidebar.bmp')

  $headerFinal.Dispose()
  $sidebarFinal.Dispose()
  $headerPreview.Dispose()
  $sidebarPreview.Dispose()
} finally {
  $headerSource.Dispose()
  $sidebarSource.Dispose()
  $logo.Dispose()
}
