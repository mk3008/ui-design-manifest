$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$experiment = Join-Path $root 'docs/poc/experiments/014-customer-create-common-shell-variability/attempt-7'

foreach ($file in @('README.md', 'evaluation-contract.md', 'evaluation.md', 'comparison.html', 'comparison.css', 'capture-evaluation.ps1', 'capture-record.json', 'consumer-input/user-prompt-ja.md')) {
  if (-not (Test-Path -LiteralPath (Join-Path $experiment $file))) { throw "Missing customer-create artifact: $file" }
}

$prompt = Get-Content -Raw (Join-Path $experiment 'consumer-input/user-prompt-ja.md')
foreach ($needle in @('顧客追加', '顧客IDは内部管理用の連番', '画面に入力欄を表示しません', '氏名、生年月日、住所、電話番号、メールアドレス、備考', '氏名、生年月日、住所、電話番号、メールアドレスは必須', '備考は任意', '必須入力、日付形式、電話番号形式、メールアドレス形式', '保存、データ接続、画面遷移、権限判定は実装しません')) {
  if (-not $prompt.Contains($needle)) { throw "Fixed prompt is missing a supplied product fact: $needle" }
}
foreach ($forbidden in @('グループキャプション', '枠線', 'カード', 'パネル', '余白', '論理末尾', 'ヘッダー', '区切り線', '外枠', 'Theme', 'テーマ', 'ライト', 'ダーク', '?drawer=', '?theme=')) {
  if ($prompt.Contains($forbidden)) { throw "Fixed prompt leaks manifest-owned presentation guidance: $forbidden" }
}

$manifestFiles = Get-ChildItem -Recurse -File -LiteralPath (Join-Path $experiment 'consumer-input/design-manifest')
if ($manifestFiles.Count -ne 44) { throw "Expected 44 frozen manifest files; found $($manifestFiles.Count)." }

Add-Type -AssemblyName System.Drawing
$captures = Get-Content -Raw (Join-Path $experiment 'capture-record.json') | ConvertFrom-Json
if ($captures.chrome_version -ne '150.0.7871.187' -or $captures.viewport -ne '1440x1200' -or $captures.captures.Count -ne 12) {
  throw 'Capture record does not identify the expected Chrome version, viewport, and twelve images.'
}

$pngCount = 0
foreach ($run in 1..3) {
  $runRoot = Join-Path $experiment "runs/run-$run"
  foreach ($file in @('index.html', 'styles.css', 'app.js', 'README.md')) {
    if (-not (Test-Path -LiteralPath (Join-Path $runRoot $file))) { throw "Run $run is missing: $file" }
  }
  $html = Get-Content -Raw (Join-Path $runRoot 'index.html')
  $css = Get-Content -Raw (Join-Path $runRoot 'styles.css')
  $script = Get-Content -Raw (Join-Path $runRoot 'app.js')
  $combined = "$html`n$css`n$script"
  if ($html -notmatch 'href="styles\.css"' -or $html -notmatch 'src="app\.js"') { throw "Run $run does not reference local assets." }
  if ($combined -match '(?i)https?://|//fonts\.|@import|@font-face|fetch\(|xmlhttprequest|localstorage|sessionstorage|indexeddb') { throw "Run $run has an external dependency, request, or persistence mechanism." }
  foreach ($label in @('顧客追加', '氏名', '生年月日', '住所', '電話番号', 'メールアドレス', '備考', '保存')) {
    if (-not $html.Contains($label)) { throw "Run $run is missing supplied content: $label" }
  }
  if ($html -match '(?is)<(?:input|select|textarea)\b[^>]*(?:id|name)=["''][^"'']*(?:customer[-_]?id|顧客ID)[^"'']*["''][^>]*>') { throw "Run $run exposes Customer ID as an input control." }
  foreach ($field in @('氏名', '生年月日', '住所', '電話番号', 'メールアドレス')) {
    if ($html -notmatch "(?is)<label[^>]*>\s*$field.*?(?:必須|required)") { throw "Run $run does not visibly mark $field as required." }
  }
  if ($combined -match '使用できます') { throw "Run $run uses a capability statement instead of the manifest's action-oriented format help." }
  if ($combined -match '\*\s*は\s*必須') { throw "Run $run adds an asterisk legend alongside the per-label required token." }
  if ($css -match '(?is)(?:form|field|group|section)[^{]*\{[^}]*background(?:-color)?\s*:') { throw "Run $run adds a filled background to a form or field group." }
  if ($css -match '(?is)(?:form|field|group|section)[^{]*\{[^}]*border-bottom\s*:') { throw "Run $run adds a horizontal rule to a form or field group." }
  if ($css -notmatch '(?is)\.required[^\{]*\{[^}]*color\s*:\s*var\(--(?:error|danger)') { throw "Run $run does not use the error foreground for the required token." }
  if ($css -notmatch '(?i)justify-content\s*:\s*flex-end') { throw "Run $run does not align its dedicated form-action row to logical end." }
  foreach ($rule in @('date|birth', 'phone|tel', 'email')) {
    if ($script -notmatch "(?i)$rule") { throw "Run $run is missing a validation implementation for: $rule" }
  }
  if ($script -notmatch '(?is)addEventListener\s*\(\s*[^\r\n]{0,32}blur') { throw "Run $run does not validate a field on blur." }
  if ($script -notmatch '(?is)addEventListener\s*\(\s*[^\r\n]{0,32}input') { throw "Run $run does not re-evaluate a displayed field error while correcting input." }
  if ($combined -notmatch '(?is)aria-(?:describedby|live)|role=["'']alert["'']') { throw "Run $run does not associate validation feedback with the field or an alert region." }
  foreach ($theme in @('light', 'dark')) {
    foreach ($drawer in @('open', 'hidden')) {
      $png = Join-Path $runRoot "customer-create-$drawer-$theme.png"
      if (-not (Test-Path -LiteralPath $png)) { throw "Run $run is missing capture: $drawer/$theme" }
      $image = [System.Drawing.Image]::FromFile($png)
      try { if ($image.Width -ne 1440 -or $image.Height -ne 1200) { throw "Run $run capture has unexpected dimensions: $drawer/$theme" } } finally { $image.Dispose() }
      if ((Get-Item -LiteralPath $png).Length -le 0) { throw "Run $run capture is empty: $drawer/$theme" }
      $pngCount++
    }
  }
}

$comparison = Get-Content -Raw (Join-Path $experiment 'comparison.html')
foreach ($run in 1..3) {
  foreach ($theme in @('light', 'dark')) {
    foreach ($drawer in @('open', 'hidden')) {
      $target = "runs/run-$run/index.html?drawer=$drawer&theme=$theme"
      $png = "runs/run-$run/customer-create-$drawer-$theme.png"
      if (-not $comparison.Contains($target.Replace('&', '&amp;')) -or -not $comparison.Contains($png)) { throw "Comparison is missing Run $run $drawer/$theme." }
    }
  }
}
if ($comparison -match '(?i)https?://|@import|<script') { throw 'Comparison page has an external reference or script.' }

Write-Output "Customer-create attempt-7 artifact checks passed. Runs: 3. Manifest snapshot files: $($manifestFiles.Count). Captures: $pngCount at 1440x1200. External dependencies: 0."
