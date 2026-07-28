[CmdletBinding()]
param(
  [string]$RecordPath = (Join-Path $PSScriptRoot 'capture-record.json')
)

$ErrorActionPreference = 'Stop'
$ChromePath = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$pages = @(
  'review',
  'record-read',
  'record-create',
  'record-edit',
  'record-delete',
  'screen-transition',
  'accessibility',
  'confirmation',
  'dialog',
  'wizard',
  'dashboard',
  'color-theme'
)

if (-not (Test-Path -LiteralPath $ChromePath)) { throw "Chrome executable not found: $ChromePath" }

function Get-PngFacts([string]$path) {
  Add-Type -AssemblyName System.Drawing
  $image = [System.Drawing.Image]::FromFile($path)
  try {
    return [pscustomobject]@{
      sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $path).Hash
      bytes = (Get-Item -LiteralPath $path).Length
      width = $image.Width
      height = $image.Height
    }
  } finally {
    $image.Dispose()
  }
}

function Invoke-HeadlessCapture([string]$page) {
  $html = Join-Path $PSScriptRoot "$page.html"
  if (-not (Test-Path -LiteralPath $html)) { throw "Missing review HTML: $html" }

  $uri = 'file:///' + ($html -replace '\\', '/')
  $temporaryRoot = Join-Path $env:TEMP ('ui-design-manifest-workflow-capture-' + $page + '-' + [guid]::NewGuid().ToString('N'))
  $temporaryPng = Join-Path $temporaryRoot "$page.png"
  $profile = Join-Path $temporaryRoot 'profile'
  $target = Join-Path $PSScriptRoot "$page.png"
  New-Item -ItemType Directory -Path $temporaryRoot | Out-Null

  try {
    $common = @(
      '--headless=new',
      '--hide-scrollbars',
      '--force-device-scale-factor=1',
      '--window-size=1440,1200',
      '--no-first-run',
      '--no-default-browser-check',
      "--user-data-dir=$profile",
      "--screenshot=$temporaryPng",
      $uri
    )
    $normalArguments = @('--disable-gpu') + $common
    $normalOutput = & $ChromePath @normalArguments 2>&1 | ForEach-Object { $_.ToString() }
    $normalExit = if ($null -eq $LASTEXITCODE) { 0 } else { $LASTEXITCODE }
    $normalSucceeded = $normalExit -eq 0 -and (Test-Path -LiteralPath $temporaryPng) -and (Get-Item -LiteralPath $temporaryPng).Length -gt 0
    $fallbackUsed = $false
    $fallbackArguments = $null
    $fallbackOutput = @()
    $fallbackExit = $null

    if (-not $normalSucceeded) {
      $fallbackUsed = $true
      if (Test-Path -LiteralPath $temporaryPng) { Remove-Item -LiteralPath $temporaryPng -Force }
      $fallbackArguments = @('--use-gl=angle', '--use-angle=swiftshader') + $common
      $fallbackOutput = & $ChromePath @fallbackArguments 2>&1 | ForEach-Object { $_.ToString() }
      $fallbackExit = if ($null -eq $LASTEXITCODE) { 0 } else { $LASTEXITCODE }
      if ($fallbackExit -ne 0 -or -not (Test-Path -LiteralPath $temporaryPng) -or (Get-Item -LiteralPath $temporaryPng).Length -eq 0) {
        throw "Capture failed for $page. normal_exit=$normalExit; fallback_exit=$fallbackExit; normal_output=$($normalOutput -join ' | '); fallback_output=$($fallbackOutput -join ' | ')"
      }
    }

    $facts = Get-PngFacts $temporaryPng
    if ($facts.width -ne 1440 -or $facts.height -ne 1200) { throw "Unexpected PNG dimensions for $($page): $($facts.width)x$($facts.height)" }
    [System.IO.File]::Copy($temporaryPng, $target, $true)
    return [pscustomobject]@{
      page = $page
      html = "$page.html"
      png = "$page.png"
      normal_command = @($ChromePath) + $normalArguments
      normal_exit_code = $normalExit
      normal_stdout_stderr = $normalOutput
      fallback_used = $fallbackUsed
      fallback_command = if ($fallbackUsed) { @($ChromePath) + $fallbackArguments } else { $null }
      fallback_exit_code = $fallbackExit
      fallback_stdout_stderr = $fallbackOutput
      png_sha256_raw_byte = $facts.sha256
      png_size_bytes = $facts.bytes
      png_width = $facts.width
      png_height = $facts.height
    }
  } finally {
    if (Test-Path -LiteralPath $temporaryRoot) { Remove-Item -LiteralPath $temporaryRoot -Recurse -Force }
  }
}

$captures = foreach ($page in $pages) { Invoke-HeadlessCapture $page }
$record = [ordered]@{
  experiment_id = 'business-workflow-static-html-review-attempt-1'
  browser = [ordered]@{
    executable = $ChromePath
    version = (Get-Item -LiteralPath $ChromePath).VersionInfo.ProductVersion
  }
  viewport = [ordered]@{ width = 1440; height = 1200 }
  normal_mode = '--headless=new --disable-gpu'
  fallback_mode = '--use-gl=angle --use-angle=swiftshader (one retry only after normal failure)'
  captures = $captures
}
$record | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $RecordPath -Encoding utf8
$record | ConvertTo-Json -Depth 6
