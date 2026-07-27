$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$review = Join-Path $root 'docs/poc/experiments/009-standard-pack-static-html-review/attempt-1'
$manifest = Join-Path $review 'artifact-manifest.yaml'
$record = Join-Path $review 'implementation-record.md'
$screenReview = Join-Path $review 'screen-review.md'
$captureScript = Join-Path $review 'capture.ps1'
$captureRecordPath = Join-Path $review 'capture-record.json'
foreach ($path in @($manifest, $record, $screenReview, $captureScript, $captureRecordPath, (Join-Path $review 'styles.css'))) { if (-not (Test-Path -LiteralPath $path)) { throw "Missing static review input: $path" } }

$manifestText = Get-Content -Raw $manifest
foreach ($id in @('review-index', 'drawer-comparison', 'search-grid', 'search-card')) { if ($manifestText -notmatch "(?m)^  - id: $id\r?$") { throw "Missing artifact ID: $id" } }
if ($manifestText -notmatch '(?m)^review_mode: html-and-png\r?$') { throw 'Static review manifest must declare HTML-and-PNG review mode.' }
if ($manifestText -notmatch '(?m)^capture_status: fixed\r?$') { throw 'Static review manifest must declare fixed capture.' }
if ($manifestText -notmatch '(?m)^digest_algorithm_html_css: SHA-256 canonical UTF-8 text with LF line endings\r?$') { throw 'Static review manifest must declare canonical HTML and CSS digests.' }
if ($manifestText -notmatch '(?m)^digest_algorithm_png: SHA-256 raw-byte\r?$') { throw 'Static review manifest must declare raw-byte PNG digests.' }
if ($manifestText -notmatch '(?m)^  browser_executable: C:\\Program Files\\Google\\Chrome\\Application\\chrome\.exe\r?$') { throw 'Static review manifest must declare the explicit Chrome executable.' }
if ($manifestText -match '(?i)msedge|edge\.exe') { throw 'Static review manifest must not declare an Edge fallback.' }
$expected = @{
  'review.html' = '5008C676F0798C805D2527521BF72A6C1DCBB69E4B6B48E93C07876D61115AB2'
  'drawer.html' = '0524BC10606FBBEB1D1DFBFA566FF1EDB54F444134FB33B9532893857D33468B'
  'search-grid.html' = 'CB1770EECB953C9BD2761E18AA485582647A7F9031A114E3C25134E4602FDEC4'
  'search-card.html' = 'C4F586A311BB559EE6C350F8C61CEE47A782910F9C13FA742E16319CCBCF289B'
  'styles.css' = '0D612F9B06FD3AC431D947117FB0730F8A95E38BA2DC0A637D2B056ED87FE405'
}

function Get-CanonicalTextSha256([string]$path) {
  $text = [System.IO.File]::ReadAllText($path, [System.Text.UTF8Encoding]::new($false))
  $canonical = ($text -replace "`r`n", "`n") -replace "`r", "`n"
  $bytes = [System.Text.UTF8Encoding]::new($false).GetBytes($canonical)
  $sha256 = [System.Security.Cryptography.SHA256]::Create()
  try { return ([System.BitConverter]::ToString($sha256.ComputeHash($bytes))).Replace('-', '') } finally { $sha256.Dispose() }
}
foreach ($name in $expected.Keys) {
  $path = Join-Path $review $name
  if (-not (Test-Path -LiteralPath $path)) { throw "Missing artifact file: $name" }
  if ((Get-CanonicalTextSha256 $path) -ne $expected[$name]) { throw "Canonical text digest mismatch: $name" }
}

$expectedPng = @{
  'review.png' = @{ hash = '89FC29C1D223BE19B19D7A23332CFE5BA2FD2924A65DB3070E1BC497494E9F84'; bytes = 68799 }
  'drawer.png' = @{ hash = '75A4CA1805618CF4A3FD51692FB47A005FE3E18D8291FF757FAE6A2CF2E05DCE'; bytes = 32420 }
  'search-grid.png' = @{ hash = 'B93499946BD9A637E565422504F7002200B96AF5227D53F061F8DF024663CD0F'; bytes = 38998 }
  'search-card.png' = @{ hash = '8AD7861D6150B5AE8341EB2504699B13FA4C94DCDF6591BEE633502E789C72A8'; bytes = 42570 }
}
Add-Type -AssemblyName System.Drawing
foreach ($name in $expectedPng.Keys) {
  $path = Join-Path $review $name
  if (-not (Test-Path -LiteralPath $path)) { throw "Missing fixed PNG: $name" }
  if ((Get-FileHash -Algorithm SHA256 -LiteralPath $path).Hash -ne $expectedPng[$name].hash) { throw "Raw-byte PNG digest mismatch: $name" }
  if ((Get-Item -LiteralPath $path).Length -ne $expectedPng[$name].bytes) { throw "PNG size mismatch: $name" }
  $image = [System.Drawing.Image]::FromFile($path)
  try { if ($image.Width -ne 1440 -or $image.Height -ne 1000) { throw "PNG dimensions mismatch: $name" } } finally { $image.Dispose() }
}

$htmlNames = @('review.html', 'drawer.html', 'search-grid.html', 'search-card.html')
foreach ($name in $htmlNames) {
  $text = Get-Content -Raw (Join-Path $review $name)
  if ($text -notmatch '<link rel="stylesheet" href="styles\.css">') { throw "Missing local stylesheet: $name" }
  if ($text -match '(?i)https?://|<script|@import|fonts\.google') { throw "External reference or script found: $name" }
}
$css = Get-Content -Raw (Join-Path $review 'styles.css')
if ($css -match '(?i)https?://|@import|@font-face') { throw 'External CSS reference found.' }

$index = Get-Content -Raw (Join-Path $review 'review.html')
foreach ($page in @('drawer.html', 'search-grid.html', 'search-card.html')) { if ($index -notmatch [regex]::Escape(('href="' + $page + '"'))) { throw "Review index missing page link: $page" } }
$drawer = Get-Content -Raw (Join-Path $review 'drawer.html')
foreach ($needle in @('drawer-open-window', 'drawer-hidden-window', 'fixture-drawer', 'Workspace', 'nav-parent', 'nav-child', 'nav-disclosure', 'aria-expanded="true"')) { if ($drawer -notmatch [regex]::Escape($needle)) { throw "Drawer review relationship missing: $needle" } }
if ([regex]::Matches($drawer, 'fixture-drawer').Count -ne 1) { throw 'Hidden Drawer state retained a Drawer region.' }
if ($drawer -match '>Current<|fixture-footnote') { throw 'Drawer review adds visible current-state copy or instructional chrome.' }
$css = Get-Content -Raw (Join-Path $review 'styles.css')
if ($css -notmatch 'border-left: 4px solid' -or $css -notmatch 'border-radius: 0') { throw 'Drawer current-state accent or square-row treatment is missing.' }
$grid = Get-Content -Raw (Join-Path $review 'search-grid.html')
foreach ($needle in @('Search', 'Clear', 'result-grid', 'grid-sort', 'filler-column', 'Fixture attribute A', 'fixture results', 'pagination', '>Open<')) { if ($grid -notmatch [regex]::Escape($needle)) { throw "Grid review relationship missing: $needle" } }
if ($grid -match 'sort-control|>Select<|>Selected<') { throw 'Grid review adds detached sorting or synthetic selection copy.' }
if ([regex]::Matches($grid, 'class="check-label check-only"').Count -ne 7) { throw 'Grid fixture must have one header and six row checkbox controls.' }
if ($grid -notmatch '(?s)<th scope="col" class="sortable">\s*<button type="button" class="grid-sort">') { throw 'Grid active sort state must be in its column header.' }
$card = Get-Content -Raw (Join-Path $review 'search-card.html')
foreach ($needle in @('Search', 'Clear', 'card-gallery', 'card-summary', 'detail-link', 'pagination')) { if ($card -notmatch [regex]::Escape($needle)) { throw "Card review relationship missing: $needle" } }
if ($card -match '<img|status|count') { throw 'Card review displays an unsupported product slot.' }
if ($card -match '>Select<|>Selected<|>Open<') { throw 'Card review adds synthetic selection copy or an extra destination action.' }
if ([regex]::Matches($card, 'class="result-card"').Count -ne 6 -or [regex]::Matches($card, 'class="result-card is-selected"').Count -ne 1) { throw 'Card fixture must have seven cards with one selected state.' }
if ([regex]::Matches($card, 'class="detail-link"').Count -ne 7) { throw 'Each card title must own the separate detail link.' }

$recordText = Get-Content -Raw $record
if ($recordText -notmatch '(?s)^---\s*\r?\n.*?\r?\n---\s*\r?\n') { throw 'Implementation record front matter is invalid.' }
foreach ($path in @('templates/business-app/design-manifest/components/drawer.md', 'templates/business-app/design-manifest/components/result-grid.md', 'templates/business-app/design-manifest/components/result-card.md', 'templates/business-app/design-manifest/screen-patterns/record-list.md', 'templates/business-app/design-manifest/screen-patterns/search-with-cards.md')) { if (-not $recordText.Contains($path)) { throw "Missing standard-pack source reference: $path" } }
foreach ($needle in @('trailing expanded-disclosure icon', 'leading accent', 'square row shape', 'not configuration')) { if (-not $recordText.Contains($needle)) { throw "Missing bounded Drawer fixture declaration: $needle" } }
foreach ($needle in @('four fixed', 'There is no Edge fallback')) { if (-not $recordText.Contains($needle)) { throw "Implementation record must state the fixed capture boundary: $needle" } }
if ($recordText -notmatch 'not\s+substantiated') { throw 'Implementation record must state the historical evidence limit.' }
$screenReviewText = Get-Content -Raw $screenReview
if ($screenReviewText -notmatch '(?s)^---\s*\r?\n.*?\r?\n---\s*\r?\n') { throw 'Screen review front matter is invalid.' }
foreach ($needle in @('Chrome `150.0.7871.187`', '`1440x1000`', 'previous GPU-failure explanation')) { if (-not $screenReviewText.Contains($needle)) { throw "Screen review must state the fixed capture evidence: $needle" } }

$captureScriptText = Get-Content -Raw $captureScript
foreach ($needle in @("C:\Program Files\Google\Chrome\Application\chrome.exe", "'--disable-gpu'", "'--use-angle=swiftshader'")) { if (-not $captureScriptText.Contains($needle)) { throw "Capture script is missing required Chrome capture option: $needle" } }
if ($captureScriptText -match '(?i)msedge|edge\.exe') { throw 'Capture script must not use Edge.' }
if ($captureScriptText -match '(?m)^\s*\[string\]\$ChromePath') { throw 'Capture script must not permit a browser executable override.' }
$captureRecord = Get-Content -Raw $captureRecordPath | ConvertFrom-Json
if ($captureRecord.browser.executable -ne 'C:\Program Files\Google\Chrome\Application\chrome.exe') { throw 'Capture record Chrome executable mismatch.' }
if ($captureRecord.browser.version -ne '150.0.7871.187') { throw 'Capture record Chrome version mismatch.' }
if ($captureRecord.viewport.width -ne 1440 -or $captureRecord.viewport.height -ne 1000) { throw 'Capture record viewport mismatch.' }
if ($captureRecord.captures.Count -ne 4) { throw 'Capture record must have four surfaces.' }
foreach ($page in @('review', 'drawer', 'search-grid', 'search-card')) {
  $capture = @($captureRecord.captures | Where-Object { $_.page -eq $page })
  if ($capture.Count -ne 1) { throw "Capture record missing surface: $page" }
  $capture = $capture[0]
  if ($capture.normal_exit_code -ne 0 -or $capture.fallback_used -ne $false) { throw "Capture result is not a successful normal-only capture: $page" }
  if ($capture.normal_command -notcontains '--disable-gpu' -or $capture.normal_command -match '(?i)msedge|edge\.exe') { throw "Capture command is not Chrome normal mode: $page" }
  if ($capture.normal_stdout_stderr -notmatch 'bytes written to file') { throw "Capture command did not record browser output: $page" }
  if ($capture.png_width -ne 1440 -or $capture.png_height -ne 1000) { throw "Capture record dimensions mismatch: $page" }
}

Write-Output 'Standard-pack static HTML review checks passed. HTML: 4. PNG: 4. Canonical text digests: 5. Raw-byte PNG digests: 4.'
