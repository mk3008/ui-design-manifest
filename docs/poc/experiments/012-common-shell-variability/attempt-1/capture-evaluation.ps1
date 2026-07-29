$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$viewport = '1280,720'

if (-not (Test-Path -LiteralPath $chrome)) { throw "Chrome is unavailable: $chrome" }

function Invoke-Capture([string]$source, [string]$destination, [string]$label) {
  $profile = Join-Path $env:TEMP ("ui-design-manifest-shell-" + [guid]::NewGuid().ToString('N'))
  try {
    $arguments = @(
      '--headless=new', '--disable-gpu', "--window-size=$viewport",
      "--user-data-dir=$profile", "--screenshot=$destination", $source
    )
    & $chrome @arguments 2>&1 | Out-String | Write-Verbose
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $destination)) {
      Remove-Item -LiteralPath $destination -Force -ErrorAction SilentlyContinue
      $arguments = @(
        '--headless=new', '--disable-gpu', '--use-angle=swiftshader', "--window-size=$viewport",
        "--user-data-dir=$profile", "--screenshot=$destination", $source
      )
      & $chrome @arguments 2>&1 | Out-String | Write-Verbose
      if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $destination)) { throw "Capture failed: $label" }
      return $true
    }
    return $false
  } finally {
    Remove-Item -LiteralPath $profile -Recurse -Force -ErrorAction SilentlyContinue
  }
}

$records = @()
foreach ($run in 1..3) {
  $runRoot = Join-Path $root "runs/run-$run"
  foreach ($state in @('open', 'hidden')) {
    $output = Join-Path $runRoot "drawer-$state.png"
    $fileUri = ([uri](Resolve-Path -LiteralPath (Join-Path $runRoot 'index.html')).Path).AbsoluteUri + "?drawer=$state"
    $fallback = Invoke-Capture $fileUri $output "run-$run/$state"
    Add-Type -AssemblyName System.Drawing
    $image = [System.Drawing.Image]::FromFile($output)
    try {
      $records += [ordered]@{
        run = $run; state = $state; png = "runs/run-$run/drawer-$state.png"; fallback_used = $fallback
        bytes = (Get-Item -LiteralPath $output).Length; width = $image.Width; height = $image.Height
        sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $output).Hash
      }
    } finally { $image.Dispose() }
  }
}

[ordered]@{
  chrome_path = $chrome
  chrome_version = (Get-Item -LiteralPath $chrome).VersionInfo.ProductVersion
  viewport = '1280x720'
  command_mode = 'headless=new, disable-gpu; SwiftShader once only after failure'
  command_template = 'chrome.exe --headless=new --disable-gpu --window-size=1280,720 --user-data-dir=<temporary-profile> --screenshot=<png> file:///.../index.html?drawer=<open|hidden>'
  captures = $records
} | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $root 'capture-record.json') -Encoding utf8
