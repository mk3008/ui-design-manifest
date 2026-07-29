$ErrorActionPreference = 'Stop'
$chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$root = Split-Path -Parent $PSCommandPath
$output = Join-Path $root 'search-default.png'
$url = (New-Object System.Uri((Join-Path $root 'index.html'))).AbsoluteUri
if (-not (Test-Path -LiteralPath $chrome)) { throw "Chrome was not found at the required path: $chrome" }
if (Test-Path -LiteralPath $output) { Remove-Item -LiteralPath $output -Force }

function Invoke-Capture([string[]]$extraArgs) {
  & $chrome '--headless=new' '--disable-gpu' '--window-size=1440,1200' "--screenshot=$output" @extraArgs $url | Out-Null
  return $LASTEXITCODE -eq 0 -and (Test-Path -LiteralPath $output) -and ((Get-Item -LiteralPath $output).Length -gt 0)
}

if (-not (Invoke-Capture @())) {
  if (Test-Path -LiteralPath $output) { Remove-Item -LiteralPath $output -Force }
  if (-not (Invoke-Capture @('--use-angle=swiftshader'))) { throw 'Chrome screenshot capture failed, including its one SwiftShader retry.' }
}
Get-Item -LiteralPath $output | Select-Object FullName, Length, LastWriteTime
