$ErrorActionPreference = 'Stop'
$chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$edge = 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'
$root = $PSScriptRoot
$browser = if (Test-Path -LiteralPath $edge) { $edge } elseif (Test-Path -LiteralPath $chrome) { $chrome } else { throw 'No local Chromium browser found for capture.' }
foreach ($page in @('review', 'drawer', 'search-grid', 'search-card')) {
  $target = Join-Path $root "$page.png"
  if (Test-Path -LiteralPath $target) { Remove-Item -LiteralPath $target -Force }
  $normalizedRoot = $root -replace '\\', '/'
  $uri = "file:///$normalizedRoot/$page.html"
  $profile = Join-Path $env:TEMP ("ui-design-manifest-static-html-review-$page-" + [guid]::NewGuid().ToString('N'))
  & $browser --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=1440,1000 --no-first-run --no-default-browser-check "--user-data-dir=$profile" "--screenshot=$target" $uri
  for ($attempt = 0; $attempt -lt 20 -and (-not (Test-Path -LiteralPath $target) -or (Get-Item -LiteralPath $target).Length -lt 1000); $attempt++) { Start-Sleep -Milliseconds 250 }
  if (-not (Test-Path -LiteralPath $target) -or (Get-Item -LiteralPath $target).Length -lt 1000) { throw "Capture failed: $page" }
}
