$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$experiment = Join-Path $root 'docs/poc/experiments/012-common-shell-variability/attempt-3'
$snapshot = Join-Path $experiment 'consumer-input/design-manifest'
$themeFile = Join-Path $snapshot 'configuration/theme-colors.default.yaml'

foreach ($file in @('README.md', 'evaluation-contract.md', 'consumer-input/user-prompt-ja.md', 'capture-evaluation.ps1', 'comparison.html', 'comparison.css', 'evaluation.md', 'capture-record.json')) {
  if (-not (Test-Path -LiteralPath (Join-Path $experiment $file))) { throw "Missing themed common-shell experiment artifact: $file" }
}

$prompt = Get-Content -Raw (Join-Path $experiment 'consumer-input/user-prompt-ja.md')
foreach ($needle in @('ライトとダークを切り替え可能', '?theme=light', '?theme=dark', 'Headerの末尾側', 'theme-colors.default.yaml', '独自のHeader色')) {
  if (-not $prompt.Contains($needle)) { throw "Fixed themed common-shell prompt is missing: $needle" }
}

$manifestFiles = Get-ChildItem -Recurse -File -LiteralPath $snapshot
if ($manifestFiles.Count -ne 44) { throw "Expected the historical manifest snapshot to contain 44 files; found $($manifestFiles.Count)." }
foreach ($relative in @('manifest.md', 'components/header.md', 'components/drawer.md', 'foundations/color-and-theme.md', 'configuration/theme-colors.default.yaml')) {
  if (-not (Test-Path -LiteralPath (Join-Path $snapshot $relative))) { throw "Historical manifest snapshot is missing: $relative" }
}

$allowedColors = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
$canonicalColorMatches = [regex]::Matches((Get-Content -Raw $themeFile), '#[0-9A-F]{6}')
foreach ($match in $canonicalColorMatches) { [void]$allowedColors.Add($match.Value.ToUpperInvariant()) }
if ($canonicalColorMatches.Count -ne 42) { throw "Expected 42 canonical theme values; found $($canonicalColorMatches.Count)." }

function Normalize-Hex([string]$color) {
  $value = $color.ToUpperInvariant()
  if ($value.Length -eq 4) { return '#' + ($value[1].ToString() * 2) + ($value[2].ToString() * 2) + ($value[3].ToString() * 2) }
  return $value
}

Add-Type -AssemblyName System.Drawing
$pngCount = 0
foreach ($run in 1..3) {
  $runRoot = Join-Path $experiment "runs/run-$run"
  foreach ($file in @('index.html', 'styles.css', 'app.js', 'README.md')) {
    if (-not (Test-Path -LiteralPath (Join-Path $runRoot $file))) { throw "Run $run is missing: $file" }
  }
  foreach ($theme in @('light', 'dark')) {
    foreach ($drawer in @('open', 'hidden')) {
      $png = Join-Path $runRoot "drawer-$drawer-$theme.png"
      if (-not (Test-Path -LiteralPath $png)) { throw "Run $run is missing: drawer-$drawer-$theme.png" }
      $image = [System.Drawing.Image]::FromFile($png)
      try {
        if ($image.Width -ne 1280 -or $image.Height -ne 720) { throw "Run $run $drawer/$theme PNG dimensions are not 1280x720." }
      } finally { $image.Dispose() }
      if ((Get-Item -LiteralPath $png).Length -le 0) { throw "Run $run $drawer/$theme PNG is empty." }
      $pngCount++
    }
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
  if ($combined -notmatch '(?i)urlsearchparams|location\.search|theme=light|theme=dark') { throw "Run $run does not expose the supplied theme-state query." }
  if ($combined -notmatch '(?i)urlsearchparams|location\.search|drawer=open|drawer=hidden') { throw "Run $run does not expose the supplied Drawer-state query." }
  if ($html -match '(?i)>\s*(current|現在|theme|テーマ)\s*<') { throw "Run $run exposes prohibited visible state/theme copy." }
  if ($combined -match '(?i)rgba?\(|hsla?\(|color-mix\(') { throw "Run $run introduces a non-canonical literal color expression." }
  foreach ($color in [regex]::Matches($combined, '#[0-9A-Fa-f]{3,6}')) {
    $normalized = Normalize-Hex $color.Value
    if (-not $allowedColors.Contains($normalized)) { throw "Run $run introduces a non-canonical literal color: $($color.Value)" }
  }
  if ($css -notmatch '(?s)\.(?:app-)?header\s*\{[^}]*background\s*:\s*var\(--surface[_-]background\)' -or $css -notmatch '(?s)\.(?:app-)?header\s*\{[^}]*color\s*:\s*var\(--text[_-]primary\)' -or $css -notmatch '(?s)\.(?:app-)?header\s*\{[^}]*border[^;]*:\s*[^;]*var\(--border[_-]subtle\)') {
    throw "Run $run Header does not consume the required surface/text semantic roles."
  }
}

$readme = Get-Content -Raw (Join-Path $experiment 'README.md')
$comparison = Get-Content -Raw (Join-Path $experiment 'comparison.html')
foreach ($text in @($readme, $comparison)) {
  foreach ($needle in @('デフォルトManifest', '使用プロンプト全文', 'gpt-5.6-terra', 'medium')) {
    if (-not $text.Contains($needle)) { throw "README/comparison report is missing: $needle" }
  }
}
foreach ($run in 1..3) {
  foreach ($theme in @('light', 'dark')) {
    foreach ($drawer in @('open', 'hidden')) {
      $target = "runs/run-$run/index.html?drawer=$drawer&theme=$theme"
      $png = "runs/run-$run/drawer-$drawer-$theme.png"
      if (-not $readme.Contains($target) -or -not $readme.Contains($png)) { throw "README is missing run $run $drawer/$theme artifact." }
      $htmlTarget = $target.Replace('&', '&amp;')
      if (-not $comparison.Contains($htmlTarget) -or -not $comparison.Contains($png)) { throw "Comparison is missing run $run $drawer/$theme artifact." }
    }
  }
}
if ($comparison -match '(?i)https?://|@import|<script') { throw 'Comparison page contains an external reference or script.' }

$captureRecord = Get-Content -Raw (Join-Path $experiment 'capture-record.json') | ConvertFrom-Json
if ($captureRecord.chrome_version -ne '150.0.7871.187' -or $captureRecord.viewport -ne '1280x720' -or $captureRecord.captures.Count -ne 12) {
  throw 'Capture record does not identify the expected browser, viewport, and twelve fixed artifacts.'
}

Write-Output "Themed common-shell variability checks passed. Runs: 3. Manifest snapshot files: $($manifestFiles.Count). Fixed Drawer/theme states: $pngCount at 1280x720. Canonical theme values: $($canonicalColorMatches.Count). External dependencies: 0."
