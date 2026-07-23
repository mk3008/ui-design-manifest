$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$record = Join-Path $root 'docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header/extraction-evaluation-record.md'
if (-not (Test-Path -LiteralPath $record)) { throw "Missing Header extraction record: $record" }

$text = Get-Content -Raw -LiteralPath $record
if ($text -notmatch '(?s)^---\s*\r?\ntype:') { throw "Missing front matter: $record" }

$requirements = @(
  'Opaque Header oracle ID', 'Input type: single static image', 'Digest:', 'URL used: `false`',
  'Viewport and state:', 'Observation summary', 'does not establish', 'Result'
)
foreach ($requirement in $requirements) {
  if (-not $text.Contains($requirement)) { throw "Missing source-aware record requirement: $requirement" }
}

$forbidden = @('http://','https://','oracle-007.png','ui-design-manifest-oracles','C:\\tmp\\','C:\\Users\\','Grafana','GitHub','YouTube')
foreach ($term in $forbidden) {
  if ($text.Contains($term)) { throw "Source-boundary leak in Header extraction record: $term" }
}

Write-Output 'check-header-source-aware-record: passed'
