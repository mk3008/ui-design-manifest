$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$failures = [System.Collections.Generic.List[string]]::new()

function Add-Failure([string]$message) { $failures.Add($message) }
function Require-Text([string]$relativePath, [string]$pattern) {
  $path = Join-Path $root $relativePath
  if (-not (Select-String -Path $path -Pattern $pattern -Quiet)) { Add-Failure "${relativePath}: missing required pattern '$pattern'" }
}
function Forbid-Text([string]$relativePath, [string]$pattern) {
  $path = Join-Path $root $relativePath
  $matches = Select-String -Path $path -Pattern $pattern -AllMatches
  foreach ($match in $matches) { Add-Failure "${relativePath}:$($match.LineNumber): prohibited application input or authority: $($match.Line.Trim())" }
}

# Canonical application precedence: target product, requirements, manifest, starter defaults.
foreach ($relativePath in @('README.md', 'profile/ui-profile.md', 'profile/manifest-authority.md', 'templates/blank/design-manifest/manifest.md', 'templates/business-app/design-manifest/manifest.md')) {
  Require-Text $relativePath 'target-product|target product'
  Require-Text $relativePath 'requirements'
  Require-Text $relativePath 'manifest'
}

# Standard application accepts no original/reference input.
Require-Text 'prompts/apply-manifest.md' 'Do not accept an original UI'
Forbid-Text 'prompts/apply-manifest.md' 'reference_ui|nominated reference'

# Every current PoC declares an application packet.
foreach ($relativePath in @(
  'docs/poc/experiments/001-workspace-shell/apply-packet.md',
  'docs/poc/experiments/002-drawer-distillation/apply-packet.md',
  'docs/poc/experiments/003-header-distillation/apply-packet.md',
  'docs/poc/experiments/004-result-table-distillation/apply-packet.md'
)) {
  Require-Text $relativePath 'Source-blind application packet'
}

# Known source-blind artifacts must not identify or link to the historical original UI.
$sourceBlind = @(Get-ChildItem -Path (Join-Path $root 'docs/poc/experiments/001-workspace-shell/extracted/design-manifest') -Recurse -Filter *.md | ForEach-Object { $_.FullName.Substring($root.Length + 1) })
$sourceBlind += 'docs/poc/experiments/002-drawer-distillation/apply-packet.md'
$sourceBlind += 'docs/poc/experiments/003-header-distillation/apply-packet.md'
$sourceBlind += 'docs/poc/experiments/004-result-table-distillation/apply-packet.md'
$forbidden = 'github|gitlab|grafana|https?://|source url|screenshot|evidence register|nominated reference|reference ui|^# Evidence$|E-00[12]|1280x720|UI Contract Editor|サイドバー|\bOverview\b|\bJP\b'
foreach ($relativePath in $sourceBlind) { Forbid-Text $relativePath $forbidden }

# The source-blind workspace manifest must not provide a path to extraction evidence.
Forbid-Text 'docs/poc/experiments/001-workspace-shell/extracted/design-manifest/manifest.md' '\.\./\.\./evidence-register\.md'

if ($failures.Count -gt 0) {
  $failures | ForEach-Object { Write-Error $_ }
  exit 1
}

Write-Output 'Source-boundary static checks passed.'
