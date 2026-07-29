$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$viewport = '1440,1200'

if (-not (Test-Path -LiteralPath $chrome)) { throw "Chrome is unavailable: $chrome" }

function Invoke-Capture([string]$source, [string]$destination, [string]$label) {
  $profile = Join-Path $env:TEMP ("ui-design-manifest-customer-create-" + [guid]::NewGuid().ToString('N'))
  try {
    $arguments = @('--headless=new', '--disable-gpu', "--window-size=$viewport", "--user-data-dir=$profile", "--screenshot=$destination", $source)
    & $chrome @arguments 2>&1 | Out-String | Write-Verbose
    if (-not (Test-Path -LiteralPath $destination)) {
      $arguments = @('--headless=new', '--disable-gpu', '--use-angle=swiftshader', "--window-size=$viewport", "--user-data-dir=$profile", "--screenshot=$destination", $source)
      & $chrome @arguments 2>&1 | Out-String | Write-Verbose
      if (-not (Test-Path -LiteralPath $destination)) { throw "Capture failed: $label" }
      return $true
    }
    return $false
  } finally {
    Remove-Item -LiteralPath $profile -Recurse -Force -ErrorAction SilentlyContinue
  }
}

Add-Type -AssemblyName System.Drawing
$records = @()
foreach ($run in 1..3) {
  $runRoot = Join-Path $root "runs/run-$run"
  foreach ($theme in @('light', 'dark')) {
    foreach ($drawer in @('open', 'hidden')) {
      $output = Join-Path $runRoot "customer-create-$drawer-$theme.png"
      $fileUri = ([uri](Resolve-Path -LiteralPath (Join-Path $runRoot 'index.html')).Path).AbsoluteUri + "?drawer=$drawer&theme=$theme"
      $fallback = Invoke-Capture $fileUri $output "run-$run/$drawer/$theme"
      $image = [System.Drawing.Image]::FromFile($output)
      try {
        $records += [ordered]@{
          run = $run; drawer = $drawer; theme = $theme; png = "runs/run-$run/customer-create-$drawer-$theme.png"; fallback_used = $fallback
          bytes = (Get-Item -LiteralPath $output).Length; width = $image.Width; height = $image.Height
          sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $output).Hash
        }
      } finally { $image.Dispose() }
    }
  }
}

[ordered]@{
  chrome_path = $chrome
  chrome_version = (Get-Item -LiteralPath $chrome).VersionInfo.ProductVersion
  viewport = '1440x1200'
  command_mode = 'headless=new, disable-gpu; SwiftShader once only after capture-file absence'
  command_template = 'chrome.exe --headless=new --disable-gpu --window-size=1440,1200 --user-data-dir=<temporary-profile> --screenshot=<png> file:///.../index.html?drawer=<open|hidden>&theme=<light|dark>'
  captures = $records
} | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $root 'capture-record.json') -Encoding utf8
