$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$pack = Join-Path $root 'templates/business-app/design-manifest'
$required = @(
  'components/drawer.md', 'components/result-grid.md', 'components/result-card.md',
  'screen-patterns/record-list.md', 'screen-patterns/search-with-cards.md',
  'flows/list-to-detail.md'
)
foreach ($relative in $required) {
  $path = Join-Path $pack $relative
  if (-not (Test-Path -LiteralPath $path)) { throw "Missing Drawer/search-pattern standard-pack file: $relative" }
  if ((Get-Content -Raw $path) -notmatch '(?s)^---\s*\r?\ntype:') { throw "Missing front matter: $relative" }
}

$componentsIndex = Get-Content -Raw (Join-Path $pack 'components/index.md')
foreach ($needle in @('[Drawer](drawer.md)', '[Result grid](result-grid.md)', '[Result card](result-card.md)')) {
  if (-not $componentsIndex.Contains($needle)) { throw "Components index is missing route: $needle" }
}
$patternsIndex = Get-Content -Raw (Join-Path $pack 'screen-patterns/index.md')
foreach ($needle in @('[Search with grid](record-list.md)', '[Search with cards](search-with-cards.md)')) {
  if (-not $patternsIndex.Contains($needle)) { throw "Screen-patterns index is missing route: $needle" }
}
$flowsIndex = Get-Content -Raw (Join-Path $pack 'flows/index.md')
if (-not $flowsIndex.Contains('[List/Card to detail](list-to-detail.md)')) { throw 'Flows index is missing List/Card to detail.' }

$drawer = Get-Content -Raw (Join-Path $pack 'components/drawer.md')
foreach ($needle in @('separate from the workspace', 'Do not confuse Drawer visibility with hierarchy disclosure', 'empty boundary', 'reserved space', 'The product binding owns whether a Drawer exists', 'no opening default', 'configuration value')) {
  if (-not $drawer.Contains($needle)) { throw "Drawer guidance boundary is missing: $needle" }
}
$card = Get-Content -Raw (Join-Path $pack 'components/result-card.md')
foreach ($needle in @('dense comparison of the same attributes', 'Do not merge selection', 'detail navigation', 'more than color alone', 'incomplete final row', 'The product binding owns', 'no card-specific configuration')) {
  if (-not $card.Contains($needle)) { throw "Result-card guidance boundary is missing: $needle" }
}
$gridPattern = Get-Content -Raw (Join-Path $pack 'screen-patterns/record-list.md')
$cardPattern = Get-Content -Raw (Join-Path $pack 'screen-patterns/search-with-cards.md')
if ($gridPattern -notmatch 'grid \| card' -or $cardPattern -notmatch 'no configuration\s+value changes a grid into cards') { throw 'Grid/card patterns must reject a configuration switch.' }
if ($cardPattern -notmatch 'components/search-conditions' -or $cardPattern -notmatch 'components/pagination' -or $cardPattern -notmatch 'components/result-card') { throw 'Search-with-cards must link shared concepts without duplicating them.' }

$configuration = Get-Content -Raw (Join-Path $pack 'configuration/record-list-options.md')
if ($configuration -match '(?m)^  - id: .*?(drawer|card)') { throw 'Drawer or card configuration was added to the finite record-list contract.' }

foreach ($relative in $required) {
  $path = Join-Path $pack $relative
  $text = Get-Content -Raw $path
  if ($text -match 'https?://|screenshot|source url|evidence register') { throw "Source-independence violation: $relative" }
}

foreach ($relative in @('components/index.md', 'screen-patterns/index.md', 'flows/index.md', 'manifest.md') + $required) {
  $path = Join-Path $pack $relative
  $text = Get-Content -Raw $path
  foreach ($match in [regex]::Matches($text, '\]\(([^)#]+\.md)(?:#[^)]+)?\)')) {
    if (-not (Test-Path -LiteralPath (Join-Path (Split-Path $path) $match.Groups[1].Value))) { throw "Broken local link: $relative -> $($match.Groups[1].Value)" }
  }
}

Write-Output 'Drawer/search-pattern standard-pack static checks passed. Components: 3. Screen patterns: 2. Flow: 1.'
