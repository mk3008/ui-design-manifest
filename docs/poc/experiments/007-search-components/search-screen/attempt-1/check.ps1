$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$implementation = Join-Path $root 'implementation'
$required = @(
  'manifest.md', 'application-input-contract.md', 'apply-instruction.md',
  'implementation/initial.html', 'implementation/initial.css',
  'implementation/wide.png', 'implementation/narrow.png', 'implementation/implementation-report.md'
)
foreach ($relative in $required) {
  if (-not (Test-Path (Join-Path $root $relative))) { throw "Missing required output: $relative" }
}
Add-Type -AssemblyName System.Drawing
$dimensions = @{ 'wide.png' = @(1440, 900); 'narrow.png' = @(390, 844) }
foreach ($name in $dimensions.Keys) {
  $image = [System.Drawing.Image]::FromFile((Join-Path $implementation $name))
  try {
    if ($image.Width -ne $dimensions[$name][0] -or $image.Height -ne $dimensions[$name][1]) { throw "Unexpected dimensions for $name" }
    if ((Get-Item (Join-Path $implementation $name)).Length -le 1000) { throw "Blank or implausibly small render: $name" }
  } finally { $image.Dispose() }
}
$html = Get-Content -Raw (Join-Path $implementation 'initial.html')
$css = Get-Content -Raw (Join-Path $implementation 'initial.css')
foreach ($requiredText in @('Search', 'Clear', 'Select all', 'Previous', 'Next', 'type="checkbox"', 'sort', 'grid-footer')) {
  if ($html -notmatch [regex]::Escape($requiredText)) { throw "Required screen relationship missing: $requiredText" }
}
if ([regex]::Matches($html, 'class="pagination"').Count -ne 1) { throw 'Expected exactly one pagination group.' }
if ([regex]::Matches($html, '>Previous<').Count -ne 1 -or [regex]::Matches($html, '>Next<').Count -ne 1) { throw 'Expected exactly one Previous/Next pair.' }
if ($html -match 'boundary|disabled') { throw 'Boundary-state fixture must not appear in the composite.' }
if ($html -match '(?i)https?://|<script|@import' -or $css -match '(?i)https?://|@import') { throw 'External asset, script, or import found.' }
foreach ($banned in @('Total', 'Page size', 'First', 'Last', 'jump', 'card')) {
  if ($html -match [regex]::Escape($banned)) { throw "Unsupported invention found: $banned" }
}
foreach ($document in @('manifest.md', 'application-input-contract.md', 'apply-instruction.md')) {
  $content = Get-Content -Raw (Join-Path $root $document)
  if ($content -notmatch '(?ms)^---\r?\n.*?^---\r?\n' -or $content -notmatch '(?m)^type:\s*\S+') { throw "Invalid front matter: $document" }
  foreach ($link in [regex]::Matches($content, '\]\(([^)#]+\.md)\)')) {
    if (-not (Test-Path (Join-Path $root $link.Groups[1].Value))) { throw "Missing local link in $document" }
  }
}
Write-Output 'search-screen-composite-check=passed'
