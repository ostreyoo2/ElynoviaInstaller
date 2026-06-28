[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

$repoRoot = Split-Path $PSScriptRoot -Parent
$installerDir = Join-Path $repoRoot 'branding\installer'
$logoPath = Join-Path $repoRoot 'branding\icons\tririse-app-icon-source.png'

if (-not (Test-Path -LiteralPath $logoPath)) {
  throw "Required logo not found: $logoPath"
}

function New-Canvas([int]$Width, [int]$Height) {
  $pixelFormat = [System.Drawing.Imaging.PixelFormat]::Format24bppRgb
  return New-Object System.Drawing.Bitmap -ArgumentList $Width, $Height, $pixelFormat
}

function Set-CrispQuality([System.Drawing.Graphics]$Graphics) {
  $Graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
  $Graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $Graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $Graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
  $Graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
}

function Save-Asset([System.Drawing.Bitmap]$Bitmap, [string]$BaseName) {
  $pngPath = Join-Path $installerDir ($BaseName + '.png')
  $bmpPath = Join-Path $installerDir ($BaseName + '.bmp')
  $Bitmap.Save($pngPath, [System.Drawing.Imaging.ImageFormat]::Png)
  $Bitmap.Save($bmpPath, [System.Drawing.Imaging.ImageFormat]::Bmp)
  Write-Output "Created: $pngPath ($($Bitmap.Width)x$($Bitmap.Height))"
  Write-Output "Created: $bmpPath ($($Bitmap.Width)x$($Bitmap.Height))"
}

function Save-Preview(
  [System.Drawing.Bitmap]$Source,
  [int]$Width,
  [int]$Height,
  [string]$FileName
) {
  $preview = New-Canvas $Width $Height
  $graphics = [System.Drawing.Graphics]::FromImage($preview)
  try {
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
    $graphics.DrawImage($Source, 0, 0, $Width, $Height)
    $path = Join-Path $installerDir $FileName
    $preview.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Output "Created preview: $path ($Width x $Height)"
  } finally {
    $graphics.Dispose()
    $preview.Dispose()
  }
}

$logo = [System.Drawing.Image]::FromFile($logoPath)

try {
  # Draw directly at the final NSIS size to avoid a second destructive downscale.
  $header = New-Canvas 150 57
  $headerGraphics = [System.Drawing.Graphics]::FromImage($header)
  try {
    Set-CrispQuality $headerGraphics
    $rect = New-Object System.Drawing.Rectangle 0, 0, 150, 57
    $background = New-Object System.Drawing.Drawing2D.LinearGradientBrush $rect, ([System.Drawing.Color]::FromArgb(2, 8, 18)), ([System.Drawing.Color]::FromArgb(8, 18, 42)), 0
    $cyanPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(135, 32, 220, 255)), 1
    $bluePen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(105, 47, 116, 255)), 1
    $violetPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(95, 139, 67, 255)), 1
    $white = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(246, 250, 255))
    $titleFont = New-Object System.Drawing.Font 'Segoe UI', 18, ([System.Drawing.FontStyle]::Bold), ([System.Drawing.GraphicsUnit]::Pixel)
    try {
      $headerGraphics.FillRectangle($background, $rect)
      $headerGraphics.DrawLine($cyanPen, 92, 56, 112, 26)
      $headerGraphics.DrawLine($bluePen, 112, 56, 130, 18)
      $headerGraphics.DrawLine($violetPen, 130, 56, 148, 31)
      $headerGraphics.DrawLine($cyanPen, 57, 43, 122, 43)
      $headerGraphics.DrawImage($logo, 7, 6, 45, 45)
      $headerGraphics.DrawString('TriRise', $titleFont, $white, 57, 10)
    } finally {
      $background.Dispose()
      $cyanPen.Dispose()
      $bluePen.Dispose()
      $violetPen.Dispose()
      $white.Dispose()
      $titleFont.Dispose()
    }
  } finally {
    $headerGraphics.Dispose()
  }

  Save-Asset $header 'tririse-installer-header'
  Save-Preview $header 600 228 'tririse-installer-banner.png'

  $sidebar = New-Canvas 164 314
  $sidebarGraphics = [System.Drawing.Graphics]::FromImage($sidebar)
  try {
    Set-CrispQuality $sidebarGraphics
    $rect = New-Object System.Drawing.Rectangle 0, 0, 164, 314
    $background = New-Object System.Drawing.Drawing2D.LinearGradientBrush $rect, ([System.Drawing.Color]::FromArgb(2, 7, 16)), ([System.Drawing.Color]::FromArgb(9, 13, 39)), 90
    $cyanPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(175, 26, 220, 255)), 1
    $bluePen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(145, 40, 118, 255)), 1
    $greenPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(120, 42, 228, 175)), 1
    $violetPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(130, 145, 70, 255)), 1
    $white = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(247, 251, 255))
    $titleFont = New-Object System.Drawing.Font 'Segoe UI', 25, ([System.Drawing.FontStyle]::Bold), ([System.Drawing.GraphicsUnit]::Pixel)
    $center = New-Object System.Drawing.StringFormat
    $center.Alignment = [System.Drawing.StringAlignment]::Center
    try {
      $sidebarGraphics.FillRectangle($background, $rect)
      $sidebarGraphics.DrawImage($logo, 30, 20, 104, 104)
      $titleRect = New-Object System.Drawing.RectangleF 0, 130, 164, 36
      $sidebarGraphics.DrawString('TriRise', $titleFont, $white, $titleRect, $center)
      $sidebarGraphics.DrawLine($cyanPen, 37, 174, 127, 174)

      $sidebarGraphics.DrawLine($greenPen, 0, 304, 32, 258)
      $sidebarGraphics.DrawLine($cyanPen, 18, 314, 65, 235)
      $sidebarGraphics.DrawLine($bluePen, 58, 314, 104, 207)
      $sidebarGraphics.DrawLine($violetPen, 106, 314, 163, 230)
      $sidebarGraphics.DrawLine($cyanPen, 65, 235, 65, 281)
      $sidebarGraphics.DrawLine($bluePen, 104, 207, 104, 268)
      $sidebarGraphics.DrawLine($violetPen, 137, 269, 137, 297)

      $sidebarGraphics.FillEllipse([System.Drawing.Brushes]::Cyan, 62, 232, 6, 6)
      $sidebarGraphics.FillEllipse([System.Drawing.Brushes]::DodgerBlue, 101, 204, 6, 6)
      $sidebarGraphics.FillEllipse([System.Drawing.Brushes]::MediumPurple, 134, 266, 6, 6)
    } finally {
      $background.Dispose()
      $cyanPen.Dispose()
      $bluePen.Dispose()
      $greenPen.Dispose()
      $violetPen.Dispose()
      $white.Dispose()
      $titleFont.Dispose()
      $center.Dispose()
    }
  } finally {
    $sidebarGraphics.Dispose()
  }

  Save-Asset $sidebar 'tririse-installer-sidebar'
  Save-Preview $sidebar 656 1256 'tririse-installer-welcome.png'

  $header.Dispose()
  $sidebar.Dispose()
} finally {
  $logo.Dispose()
}
