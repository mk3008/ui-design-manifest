$ErrorActionPreference = 'Stop'
$chrome = 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe'
$output = Join-Path $PSScriptRoot 'search-default.png'
$source = (Join-Path $PSScriptRoot 'index.html') -replace '\\', '/'
$url = 'file:///' + [uri]::EscapeUriString($source)
if (-not (Test-Path -LiteralPath $chrome)) { throw "Chrome was not found at $chrome" }
function Invoke-Capture([bool]$swiftShader) {
  if (Test-Path -LiteralPath $output) { Remove-Item -LiteralPath $output -Force }
  $args = @('--headless=new','--disable-gpu','--hide-scrollbars','--window-size=1440,1200',"--screenshot=$output",$url)
  if ($swiftShader) { $args += '--use-angle=swiftshader' }
  & $chrome @args | Out-Host
  return (Test-Path -LiteralPath $output)
}
$captured = Invoke-Capture $false
if (-not $captured) { $captured = Invoke-Capture $true }
if (-not $captured) { throw 'Chrome capture failed after one SwiftShader retry.' }
Write-Output "Captured $output"
