$ErrorActionPreference = 'Stop'
$chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$root = Split-Path -Parent $PSCommandPath
if (-not (Test-Path -LiteralPath $chrome)) { throw "Chrome was not found at the required path: $chrome" }

$captures = @()
foreach ($run in 1..3) {
  $runRoot = Join-Path $root "runs/run-$run"
  $html = Join-Path $runRoot 'index.html'
  $output = Join-Path $runRoot 'default.png'
  if (-not (Test-Path -LiteralPath $html)) { throw "Run $run is missing index.html" }
  if (Test-Path -LiteralPath $output) { Remove-Item -LiteralPath $output -Force }
  $profile = Join-Path ([System.IO.Path]::GetTempPath()) ("manifest-clean-room-run-$run-" + [guid]::NewGuid())
  New-Item -ItemType Directory -Path $profile | Out-Null
  $url = [System.Uri]::new($html).AbsoluteUri
  try {
    & $chrome '--headless=new' '--disable-gpu' '--hide-scrollbars' '--window-size=1440,1200' "--user-data-dir=$profile" "--screenshot=$output" $url | Out-Null
    $normalExitCode = $LASTEXITCODE
    $fallbackUsed = $false
    if ($normalExitCode -ne 0 -or -not (Test-Path -LiteralPath $output)) {
      if (Test-Path -LiteralPath $output) { Remove-Item -LiteralPath $output -Force }
      & $chrome '--headless=new' '--disable-gpu' '--use-angle=swiftshader' '--hide-scrollbars' '--window-size=1440,1200' "--user-data-dir=$profile" "--screenshot=$output" $url | Out-Null
      if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $output)) { throw "Run $run capture failed after one SwiftShader retry." }
      $fallbackUsed = $true
    }
  } finally {
    if (Test-Path -LiteralPath $profile) { Remove-Item -LiteralPath $profile -Recurse -Force }
  }
  Add-Type -AssemblyName System.Drawing
  $image = [System.Drawing.Image]::FromFile($output)
  try {
    if ($image.Width -ne 1440 -or $image.Height -ne 1200) { throw "Run $run capture dimensions mismatch." }
    $captures += [ordered]@{
      run = $run
      html = "runs/run-$run/index.html"
      png = "runs/run-$run/default.png"
      normal_exit_code = $normalExitCode
      fallback_used = $fallbackUsed
      width = $image.Width
      height = $image.Height
      png_sha256_raw_byte = (Get-FileHash -Algorithm SHA256 -LiteralPath $output).Hash
      png_size_bytes = (Get-Item -LiteralPath $output).Length
    }
  } finally { $image.Dispose() }
}

$record = [ordered]@{
  chrome_executable = $chrome
  chrome_version = (Get-Item $chrome).VersionInfo.FileVersion
  viewport = [ordered]@{ width = 1440; height = 1200 }
  captures = $captures
}
$record | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $root 'capture-record.json') -Encoding utf8
Write-Output "Captured $($captures.Count) clean-room runs at 1440x1200."
