$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$method = Join-Path $root 'docs/poc/methods/header'
$bundle = Join-Path $root 'docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header'
$files = @(
  (Join-Path $method 'README.md'),
  (Join-Path $method 'header-observation-schema.md'),
  (Join-Path $method 'header-extraction-prompt.md'),
  (Join-Path $method 'header-extraction-template.md'),
  (Join-Path $method 'header-first-pass-rubric.md'),
  (Join-Path $bundle 'manifest.md'),
  (Join-Path $bundle 'application-input-contract.md'),
  (Join-Path $bundle 'extraction-evaluation-record.md'),
  (Join-Path $bundle 'claim-matrix.md'),
  (Join-Path $bundle 'implementer-apply-packet.md')
)

foreach ($file in $files) {
  if (-not (Test-Path -LiteralPath $file)) { throw "Missing required Header artifact: $file" }
  $text = Get-Content -Raw -LiteralPath $file
  if ($text -notmatch '(?s)^---\s*\r?\ntype:') { throw "Missing front matter: $file" }
}

$all = ($files | ForEach-Object { Get-Content -Raw -LiteralPath $_ }) -join "`n"
$requirements = @(
  'single static image', 'URL used', 'identityTitle', 'globalNavigation', 'globalSearch', 'utilities', 'accountActions',
  'observed`, `not observed`, `unresolved`, or `not applicable', 'observed`, `method-default`, or `product input required',
  'currentColor', 'accessible name', 'Drawer', 'closed representation', 'persistence', 'responsive', 'keyboard', 'motion', 'overflow',
  'semantic re-extraction', 'visibly nonblank'
)
foreach ($requirement in $requirements) {
  if (-not $all.Contains($requirement)) { throw "Missing Header method requirement: $requirement" }
}

$forbidden = @('http://','https://','oracle-007.png','C:\\tmp\\','Grafana','GitHub')
foreach ($term in $forbidden) {
  if ($all.Contains($term)) { throw "Source-boundary leak in Header artifacts: $term" }
}

Write-Output 'check-header-method: passed'
