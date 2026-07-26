$ErrorActionPreference = 'Stop'
$chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$root = Split-Path -Parent $PSScriptRoot
foreach ($state in @('A-open', 'A-hidden')) {
  $target = Join-Path $PSScriptRoot "$state.png"
  $normalizedRoot = $PSScriptRoot -replace '\\', '/'
  $uri = "file:///$normalizedRoot/index.html?state=$state"
  $stateUserData = Join-Path $env:TEMP "ui-design-manifest-pattern-a-reconnection-attempt-2-$state"
  & $chrome --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=1280,720 --no-first-run --no-default-browser-check "--user-data-dir=$stateUserData" "--screenshot=$target" $uri
  if (-not (Test-Path -LiteralPath $target) -or (Get-Item -LiteralPath $target).Length -eq 0) { throw "Capture failed for $state" }
}
