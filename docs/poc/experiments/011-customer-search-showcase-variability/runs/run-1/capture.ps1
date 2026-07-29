$ErrorActionPreference = 'Stop'
$chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$output = Join-Path $here 'search-default.png'
$uri = [System.Uri]::new((Join-Path $here 'index.html')).AbsoluteUri
$profile = Join-Path ([System.IO.Path]::GetTempPath()) ('customer-search-showcase-run-1-' + [guid]::NewGuid())
if (-not (Test-Path -LiteralPath $chrome)) { throw "Chrome not found: $chrome" }
New-Item -ItemType Directory -Path $profile | Out-Null

& $chrome '--headless=new' '--disable-gpu' "--user-data-dir=$profile" '--window-size=1440,1200' '--hide-scrollbars' "--screenshot=$output" $uri
Start-Sleep -Milliseconds 500
if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $output)) {
  Remove-Item -LiteralPath $output -Force -ErrorAction SilentlyContinue
  & $chrome '--headless=new' '--disable-gpu' '--use-angle=swiftshader' "--user-data-dir=$profile" '--window-size=1440,1200' '--hide-scrollbars' "--screenshot=$output" $uri
  Start-Sleep -Milliseconds 500
  if (-not (Test-Path -LiteralPath $output)) { throw 'Chrome screenshot failed after the one permitted SwiftShader retry.' }
}
Get-Item -LiteralPath $output | Select-Object FullName, Length, LastWriteTime
