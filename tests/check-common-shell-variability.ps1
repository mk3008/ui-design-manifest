$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$experiment = Join-Path $root 'docs/poc/experiments/012-common-shell-variability/attempt-1'

foreach ($file in @('README.md', 'evaluation-contract.md', 'consumer-input/user-prompt-ja.md', 'capture-evaluation.ps1', 'comparison.html', 'comparison.css', 'evaluation.md', 'capture-record.json')) {
  if (-not (Test-Path -LiteralPath (Join-Path $experiment $file))) { throw "Missing common-shell experiment artifact: $file" }
}

$prompt = Get-Content -Raw (Join-Path $experiment 'consumer-input/user-prompt-ja.md')
foreach ($needle in @('共通HeaderとDrawerだけ', '業務ワークスペース', '?drawer=open', '?drawer=hidden', '項目 B-1', 'ライトオンリー', 'テーマ選択UIは表示しません')) {
  if (-not $prompt.Contains($needle)) { throw "Fixed common-shell prompt is missing: $needle" }
}

$snapshot = Join-Path $experiment 'consumer-input/design-manifest'
$manifestFiles = Get-ChildItem -Recurse -File -LiteralPath $snapshot
if ($manifestFiles.Count -ne 44) { throw "Expected the frozen manifest snapshot to contain 44 files; found $($manifestFiles.Count)." }
foreach ($relative in @('manifest.md', 'components/header.md', 'components/drawer.md', 'foundations/color-and-theme.md', 'configuration/theme-colors.default.yaml')) {
  if (-not (Test-Path -LiteralPath (Join-Path $snapshot $relative))) { throw "Manifest snapshot is missing: $relative" }
}

Add-Type -AssemblyName System.Drawing
$pngCount = 0
foreach ($run in 1..3) {
  $runRoot = Join-Path $experiment "runs/run-$run"
  foreach ($file in @('index.html', 'styles.css', 'app.js', 'README.md', 'drawer-open.png', 'drawer-hidden.png')) {
    if (-not (Test-Path -LiteralPath (Join-Path $runRoot $file))) { throw "Run $run is missing: $file" }
  }
  $html = Get-Content -Raw (Join-Path $runRoot 'index.html')
  $css = Get-Content -Raw (Join-Path $runRoot 'styles.css')
  $js = Get-Content -Raw (Join-Path $runRoot 'app.js')
  $combined = "$html`n$css`n$js"
  if ($html -notmatch 'href="styles\.css"' -or $html -notmatch 'src="app\.js"') { throw "Run $run does not reference its local assets." }
  if ($combined -match '(?i)https?://|//fonts\.|@import|@font-face|fetch\(|xmlhttprequest|localstorage|sessionstorage|indexeddb') {
    throw "Run $run contains an external dependency, request, or persistence mechanism."
  }
  foreach ($label in @('業務ワークスペース', 'セクション A', 'セクション B', '項目 B-1', '項目 B-2', 'セクション C')) {
    if (-not $html.Contains($label)) { throw "Run $run is missing supplied shell fixture: $label" }
  }
  if ($combined -notmatch '(?i)urlsearchparams|location\.search|drawer=open|drawer=hidden') { throw "Run $run does not expose the supplied Drawer state query." }
  if ($html -match '(?i)>\s*(current|現在)\s*<') { throw "Run $run exposes prohibited visible current-state copy." }
  if ($html -match '(?i)theme|テーマ|dark|light') { throw "Run $run exposes theme UI or an unnecessary theme caption." }
  foreach ($state in @('open', 'hidden')) {
    $png = Join-Path $runRoot "drawer-$state.png"
    $image = [System.Drawing.Image]::FromFile($png)
    try {
      if ($image.Width -ne 1280 -or $image.Height -ne 720) { throw "Run $run $state PNG dimensions are not 1280x720." }
    } finally { $image.Dispose() }
    if ((Get-Item -LiteralPath $png).Length -le 0) { throw "Run $run $state PNG is empty." }
    $pngCount++
  }
}

$comparison = Get-Content -Raw (Join-Path $experiment 'comparison.html')
$readme = Get-Content -Raw (Join-Path $experiment 'README.md')
foreach ($text in @($comparison, $readme)) {
  foreach ($needle in @('デフォルトManifest', '使用プロンプト全文', '業務ワークスペース', 'ライトオンリー')) {
    if (-not $text.Contains($needle)) { throw "README/comparison report is missing: $needle" }
  }
}
foreach ($run in 1..3) {
  foreach ($target in @("runs/run-$run/index.html?drawer=open", "runs/run-$run/index.html?drawer=hidden", "runs/run-$run/drawer-open.png", "runs/run-$run/drawer-hidden.png")) {
    if (-not $comparison.Contains($target)) { throw "Comparison page is missing run $run target: $target" }
    if (-not $readme.Contains($target)) { throw "README is missing run $run target: $target" }
  }
}
if ($comparison -match '(?i)https?://|@import|<script') { throw 'Comparison page contains an external reference or script.' }

$captureRecord = Get-Content -Raw (Join-Path $experiment 'capture-record.json') | ConvertFrom-Json
if ($captureRecord.chrome_version -ne '150.0.7871.187' -or $captureRecord.viewport -ne '1280x720' -or $captureRecord.captures.Count -ne 6) {
  throw 'Capture record does not identify the expected browser, viewport, and six fixed artifacts.'
}

Write-Output "Common-shell variability checks passed. Runs: 3. Frozen manifest snapshot files: $($manifestFiles.Count). Fixed Drawer states: $pngCount at 1280x720. External dependencies: 0."
