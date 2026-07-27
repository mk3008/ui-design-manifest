$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$review = Join-Path $root 'docs/poc/experiments/009-standard-pack-static-html-review/attempt-1'
$manifest = Join-Path $review 'artifact-manifest.yaml'
$record = Join-Path $review 'implementation-record.md'
foreach ($path in @($manifest, $record, (Join-Path $review 'styles.css'), (Join-Path $review 'capture.ps1'))) { if (-not (Test-Path -LiteralPath $path)) { throw "Missing static review input: $path" } }

$manifestText = Get-Content -Raw $manifest
foreach ($id in @('review-index', 'drawer-comparison', 'search-grid', 'search-card')) { if ($manifestText -notmatch "(?m)^  - id: $id\r?$") { throw "Missing artifact ID: $id" } }
$expected = @{
  'review.html' = '5008C676F0798C805D2527521BF72A6C1DCBB69E4B6B48E93C07876D61115AB2'
  'drawer.html' = 'B758457E9BA513892AB08EC0D25B89D929BBED247CD96BE71D76CCE90FFF86A9'
  'search-grid.html' = '5417D2F12E71ECDFC5C7DA04AADB44C404626A2C600C18CAC9EA512C7DCE7B18'
  'search-card.html' = '28558E2826817BBF0A0361CE8E4383604AF2E11F55C834D3A5BA06491D70E3E0'
  'styles.css' = '44746FB04344E25335F048657D30A5C08D077A613E905B9A64A6AA163D917A31'
  'review.png' = '89FC29C1D223BE19B19D7A23332CFE5BA2FD2924A65DB3070E1BC497494E9F84'
  'drawer.png' = '206CE61007E4FED6D2FA7B6953969B1FD7DFF715C01E4D1D3460351F2F535FAA'
  'search-grid.png' = '290E1E7D91FEC246BE31147B7F2DB23FA399B18B8E9891708D4C312919F8772A'
  'search-card.png' = '02C487B37E22B80CED95F176899B3A6B41789AC833989D482EF8F6FBF241313E'
}
foreach ($name in $expected.Keys) {
  $path = Join-Path $review $name
  if (-not (Test-Path -LiteralPath $path)) { throw "Missing artifact file: $name" }
  if ((Get-FileHash -Algorithm SHA256 $path).Hash -ne $expected[$name]) { throw "Digest mismatch: $name" }
}

Add-Type -AssemblyName System.Drawing
foreach ($name in @('review.png', 'drawer.png', 'search-grid.png', 'search-card.png')) {
  $image = [System.Drawing.Image]::FromFile((Join-Path $review $name))
  try { if ($image.Width -ne 1440 -or $image.Height -ne 1000) { throw "Unexpected PNG dimensions: $name" } } finally { $image.Dispose() }
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

Write-Output 'Standard-pack static HTML review checks passed. HTML: 4. PNG: 4. Fixed digests: 9.'
