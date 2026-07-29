$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$experiment = Join-Path $root 'docs/poc/experiments/013-customer-search-common-shell-variability/attempt-3'

foreach ($file in @('README.md', 'evaluation-contract.md', 'consumer-input/user-prompt-ja.md', 'capture-evaluation.ps1', 'comparison.html', 'comparison.css', 'evaluation.md', 'capture-record.json')) {
  if (-not (Test-Path -LiteralPath (Join-Path $experiment $file))) { throw "Missing customer-search common-shell experiment artifact: $file" }
}

$prompt = Get-Content -Raw (Join-Path $experiment 'consumer-input/user-prompt-ja.md')
foreach ($needle in @('common-shell-run-1/', '顧客検索', '氏名、生年月日、電話番号、メールアドレス', '顧客IDを詳細確認のリンクとして左端', '検索条件', '枠線、カード、パネル、追加の内側余白を作りません', '別行', '顧客を追加', '列ヘッダー', '行の区切り線', 'Previous、現在ページを表す `1`、Nextだけ', 'Current', '現在', '?drawer=open|hidden', '?theme=light|dark')) {
  if (-not $prompt.Contains($needle)) { throw "Fixed customer-search prompt is missing: $needle" }
}

$snapshot = Join-Path $experiment 'consumer-input/design-manifest'
$manifestFiles = Get-ChildItem -Recurse -File -LiteralPath $snapshot
if ($manifestFiles.Count -ne 44) { throw "Expected the frozen manifest snapshot to contain 44 files; found $($manifestFiles.Count)." }
foreach ($relative in @('manifest.md', 'components/header.md', 'components/drawer.md', 'components/result-grid.md', 'components/search-conditions.md', 'foundations/color-and-theme.md', 'configuration/theme-colors.default.yaml')) {
  if (-not (Test-Path -LiteralPath (Join-Path $snapshot $relative))) { throw "Manifest snapshot is missing: $relative" }
}

$shellInput = Join-Path $experiment 'consumer-input/common-shell-run-1'
foreach ($file in @('index.html', 'styles.css', 'app.js')) {
  if (-not (Test-Path -LiteralPath (Join-Path $shellInput $file))) { throw "Fixed common-shell input is missing: $file" }
}
$shellSource = Join-Path $root 'docs/poc/experiments/012-common-shell-variability/attempt-3/runs/run-1'
foreach ($file in @('index.html', 'styles.css', 'app.js')) {
  if ((Get-FileHash -Algorithm SHA256 -LiteralPath (Join-Path $shellInput $file)).Hash -ne (Get-FileHash -Algorithm SHA256 -LiteralPath (Join-Path $shellSource $file)).Hash) {
    throw "Fixed common-shell input drifted from experiment 012 Run 1: $file"
  }
}

$themeFile = Join-Path $snapshot 'configuration/theme-colors.default.yaml'
$allowedColors = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
$canonicalColorMatches = [regex]::Matches((Get-Content -Raw $themeFile), '#[0-9A-F]{6}')
foreach ($match in $canonicalColorMatches) { [void]$allowedColors.Add($match.Value.ToUpperInvariant()) }
if ($canonicalColorMatches.Count -ne 46) { throw "Expected 46 canonical theme values; found $($canonicalColorMatches.Count)." }

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
  $html = Get-Content -Raw (Join-Path $runRoot 'index.html')
  $css = Get-Content -Raw (Join-Path $runRoot 'styles.css')
  $js = Get-Content -Raw (Join-Path $runRoot 'app.js')
  $combined = "$html`n$css`n$js"
  if ($html -notmatch 'href="styles\.css"' -or $html -notmatch 'src="app\.js"') { throw "Run $run does not reference its local assets." }
  if ($combined -match '(?i)https?://|//fonts\.|@import|@font-face|fetch\(|xmlhttprequest|localstorage|sessionstorage|indexeddb') { throw "Run $run contains an external dependency, request, or persistence mechanism." }
  foreach ($label in @('業務ワークスペース', 'セクション A', 'セクション B', '項目 B-2', 'セクション C', '顧客検索', '登録済みの顧客情報を検索・確認します。', '検索条件', '氏名', '生年月日', '電話番号', 'メールアドレス', '検索結果', '顧客を追加', '顧客ID', '住所', '備考', 'Previous', 'Next')) {
    if (-not $html.Contains($label)) { throw "Run $run is missing required common-shell or customer-search content: $label" }
  }
  if ($html -notmatch '(?:検索|Search)' -or $html -notmatch '(?:クリア|Clear)') { throw "Run $run is missing the supplied Search/Clear operation pair." }
  $tableBody = [regex]::Match($html, '(?s)<tbody[^>]*>(.*?)</tbody>')
  if (-not $tableBody.Success -or [regex]::Matches($tableBody.Groups[1].Value, '<tr\b').Count -ne 6) { throw "Run $run does not contain six customer fixture rows." }
  if ($html -notmatch '(?s)<tbody[^>]*>\s*<tr[^>]*>\s*<td[^>]*>\s*<a\b') { throw "Run $run does not place the customer-ID link in the first result cell." }
  if ($html -notmatch '(?is)<(?:h[1-6]|p|div|span|legend)[^>]*>\s*検索条件\s*</') { throw "Run $run does not show the required search-conditions group caption." }
  if ($html -notmatch '(?is)<button[^>]*>\s*顧客を追加\s*</button>') { throw "Run $run does not show the display-only customer-create button." }
  $pagination = [regex]::Match($html, '(?is)<(?:nav|div|section)[^>]*(?:pagination|pager)[^>]*>(.*?)</(?:nav|div|section)>')
  if (-not $pagination.Success -or $pagination.Groups[1].Value -notmatch 'Previous' -or $pagination.Groups[1].Value -notmatch 'Next') { throw "Run $run is missing the default Previous/Next pagination controls." }
  if ($pagination.Groups[1].Value -match '(?is)>\s*[2-9]\s*<') { throw "Run $run exposes direct page-number pagination outside the supplied default." }
  $paginationVisibleText = ($pagination.Groups[1].Value -replace '(?is)<[^>]+>', ' ')
  if ($paginationVisibleText -match '(?i)current|現在') { throw "Run $run exposes prohibited current-page state copy." }
  if ($pagination.Groups[1].Value -notmatch '>\s*1\s*<') { throw "Run $run does not show the supplied plain current page number." }
  if ($html -match '(?i)>\s*(current|現在|theme|テーマ)\s*<') { throw "Run $run exposes prohibited visible state/theme copy." }
  if ($combined -notmatch '(?i)urlsearchparams|location\.search|theme=light|theme=dark') { throw "Run $run does not expose the supplied theme-state query." }
  if ($combined -notmatch '(?i)urlsearchparams|location\.search|drawer=open|drawer=hidden') { throw "Run $run does not expose the supplied Drawer-state query." }
  if ($combined -match '(?i)rgba?\(|hsla?\(|color-mix\(') { throw "Run $run introduces a non-canonical literal color expression." }
  foreach ($color in [regex]::Matches($combined, '#[0-9A-Fa-f]{3,6}')) {
    $normalized = Normalize-Hex $color.Value
    if (-not $allowedColors.Contains($normalized)) { throw "Run $run introduces a non-canonical literal color: $($color.Value)" }
  }
  if ($css -notmatch '(?s)\.(?:app-)?header\s*\{[^}]*background\s*:\s*var\(--surface[_-]background\)' -or $css -notmatch '(?s)\.(?:app-)?header\s*\{[^}]*color\s*:\s*var\(--text[_-]primary\)' -or $css -notmatch '(?s)\.(?:app-)?header\s*\{[^}]*border[^;]*:\s*[^;]*var\(--border[_-]subtle\)') { throw "Run $run Header does not consume the required surface/text semantic roles." }
  if ($css -notmatch '(?is)(?:th|\.table-header|\.grid-header)[^{]*\{[^}]*background\s*:\s*var\(--table[_-]header[_-]background\)' -or $css -notmatch '(?is)(?:th|\.table-header|\.grid-header)[^{]*\{[^}]*color\s*:\s*var\(--table[_-]header[_-]foreground\)') { throw "Run $run result-grid header does not consume both table-header semantic roles." }
  if ($css -match '(?is)(?:th\s*,\s*td|td\s*,\s*th|\.result-grid\s+td)[^{]*\{[^}]*border-(?:left|right)') { throw "Run $run draws result-grid vertical cell dividers despite the default guidance." }
  foreach ($theme in @('light', 'dark')) {
    foreach ($drawer in @('open', 'hidden')) {
      $png = Join-Path $runRoot "customer-search-$drawer-$theme.png"
      if (-not (Test-Path -LiteralPath $png)) { throw "Run $run is missing: customer-search-$drawer-$theme.png" }
      $image = [System.Drawing.Image]::FromFile($png)
      try { if ($image.Width -ne 1440 -or $image.Height -ne 1200) { throw "Run $run $drawer/$theme PNG dimensions are not 1440x1200." } } finally { $image.Dispose() }
      if ((Get-Item -LiteralPath $png).Length -le 0) { throw "Run $run $drawer/$theme PNG is empty." }
      $pngCount++
    }
  }
}

$readme = Get-Content -Raw (Join-Path $experiment 'README.md')
$comparison = Get-Content -Raw (Join-Path $experiment 'comparison.html')
foreach ($text in @($readme, $comparison)) {
  foreach ($needle in @('デフォルトManifest', '使用プロンプト全文', 'gpt-5.6-terra', 'medium', '固定共通シェル')) {
    if (-not $text.Contains($needle)) { throw "README/comparison report is missing: $needle" }
  }
}
foreach ($run in 1..3) {
  foreach ($theme in @('light', 'dark')) {
    foreach ($drawer in @('open', 'hidden')) {
      $target = "runs/run-$run/index.html?drawer=$drawer&theme=$theme"
      $png = "runs/run-$run/customer-search-$drawer-$theme.png"
      if (-not $readme.Contains($target) -or -not $readme.Contains($png)) { throw "README is missing run $run $drawer/$theme artifact." }
      if (-not $comparison.Contains($target.Replace('&', '&amp;')) -or -not $comparison.Contains($png)) { throw "Comparison is missing run $run $drawer/$theme artifact." }
    }
  }
}
if ($comparison -match '(?i)https?://|@import|<script') { throw 'Comparison page contains an external reference or script.' }

$captureRecord = Get-Content -Raw (Join-Path $experiment 'capture-record.json') | ConvertFrom-Json
if ($captureRecord.chrome_version -ne '150.0.7871.187' -or $captureRecord.viewport -ne '1440x1200' -or $captureRecord.captures.Count -ne 12) { throw 'Capture record does not identify the expected browser, viewport, and twelve fixed artifacts.' }

Write-Output "Customer-search common-shell variability retest checks passed. Runs: 3. Frozen manifest snapshot files: $($manifestFiles.Count). Fixed common-shell input files: 3. Fixed Drawer/theme states: $pngCount at 1440x1200. Canonical theme values: $($canonicalColorMatches.Count). External dependencies: 0."
