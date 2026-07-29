$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$experiment = Join-Path $root 'docs/poc/experiments/011-customer-search-showcase-variability'
$chromePath = 'C:\Program Files\Google\Chrome\Application\chrome.exe'

foreach ($path in @('experiment-contract.md', 'comparison.html', 'comparison.css', 'comparison.md')) {
  if (-not (Test-Path -LiteralPath (Join-Path $experiment $path))) { throw "Missing experiment artifact: $path" }
}

$fixtureValues = @(
  'C-000101', '佐藤 花子', '1988-04-12', '東京都千代田区丸の内1-1-1', '03-5555-0101', 'hanako.sato@example.test', 'Initial inquiry recorded.',
  'C-000102', '鈴木 一郎', '1979-11-03', '神奈川県横浜市西区みなとみらい2-2-2', '045-555-0102', 'ichiro.suzuki@example.test', 'Preferred contact: email.',
  'C-000103', '高橋 美咲', '1992-07-19', '埼玉県さいたま市大宮区桜木町3-3-3', '048-555-0103', 'misaki.takahashi@example.test', 'Follow-up scheduled.',
  'C-000104', '田中 健', '1985-02-28', '千葉県千葉市中央区新町4-4-4', '043-555-0104', 'ken.tanaka@example.test', 'Address confirmed.',
  'C-000105', '伊藤 彩', '1990-09-08', '東京都新宿区西新宿5-5-5', '03-5555-0105', 'aya.ito@example.test', 'No additional notes.',
  'C-000106', '渡辺 大輔', '1976-05-24', '茨城県水戸市中央6-6-6', '029-555-0106', 'daisuke.watanabe@example.test', 'Phone confirmation requested.'
)

Add-Type -AssemblyName System.Drawing
$pngCount = 0
foreach ($run in 1..3) {
  $runRoot = Join-Path $experiment "runs/run-$run"
  foreach ($file in @('index.html', 'styles.css', 'app.js', 'README.md', 'capture.ps1', 'search-default.png')) {
    if (-not (Test-Path -LiteralPath (Join-Path $runRoot $file))) { throw "Run $run is missing: $file" }
  }

  $html = Get-Content -Raw (Join-Path $runRoot 'index.html')
  $css = Get-Content -Raw (Join-Path $runRoot 'styles.css')
  $js = Get-Content -Raw (Join-Path $runRoot 'app.js')
  $capture = Get-Content -Raw (Join-Path $runRoot 'capture.ps1')
  $combined = "$html`n$css`n$js"

  if ($html -notmatch 'href="styles\.css"' -or $html -notmatch 'src="app\.js"') { throw "Run $run does not reference its local HTML assets." }
  if ($combined -match '(?i)https?://|//fonts\.|@import|@font-face|fetch\(|xmlhttprequest|localstorage|sessionstorage|indexeddb') {
    throw "Run $run contains an external dependency, request, or client persistence mechanism."
  }
  foreach ($label in @('氏名', '生年月日', '電話番号', 'メールアドレス')) {
    if (-not $html.Contains($label)) { throw "Run $run is missing search condition: $label" }
  }
  foreach ($value in $fixtureValues) {
    if (-not $js.Contains($value)) { throw "Run $run is missing fixed fixture value: $value" }
  }
  if ($js -notmatch '保存されません|変更されません|実行されません') { throw "Run $run does not state its non-persistence boundary." }
  if ($capture -notmatch 'C:\\+Program Files\\+Google\\+Chrome\\+Application\\+chrome\.exe') {
    throw "Run $run capture script is missing the explicit Chrome executable path."
  }
  foreach ($needle in @('--headless=new', '--disable-gpu', '--use-angle=swiftshader')) {
    if (-not $capture.Contains($needle)) { throw "Run $run capture script is missing: $needle" }
  }
  if ($capture -match '(?i)msedge|edge\.exe') { throw "Run $run capture script must not fall back to Edge." }

  $png = Join-Path $runRoot 'search-default.png'
  $image = [System.Drawing.Image]::FromFile($png)
  try {
    if ($image.Width -ne 1440 -or $image.Height -ne 1200) { throw "Run $run PNG dimensions are not 1440x1200." }
  } finally { $image.Dispose() }
  if ((Get-Item -LiteralPath $png).Length -le 0) { throw "Run $run PNG is empty." }
  $pngCount++
}

$comparison = Get-Content -Raw (Join-Path $experiment 'comparison.html')
foreach ($run in 1..3) {
  foreach ($target in @("runs/run-$run/index.html", "runs/run-$run/search-default.png", "runs/run-$run/README.md")) {
    if (-not $comparison.Contains($target)) { throw "Comparison page is missing run $run target: $target" }
  }
}
if ($comparison -match '(?i)https?://|@import|<script') { throw 'Comparison page contains an external reference or script.' }

Write-Output "Customer-search showcase variability checks passed. Runs: 3. Fixed fixture values checked: $($fixtureValues.Count). Search conditions per run: 4. Fixed PNGs: $pngCount at 1440x1200. External dependencies: 0."
