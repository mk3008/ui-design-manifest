$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$failures = [System.Collections.Generic.List[string]]::new()
$method = 'docs/poc/methods/pagination'
$bundle = 'docs/poc/experiments/007-search-components/pagination/attempt-1'
$methodFiles = @('README.md','observation-schema.md','extraction-template.md','extraction-prompt.md','first-pass-rubric.md')
$bundleFiles = @('index.md','manifest.md','application-input-contract.md','apply-instruction.md','observation-record.md')
$bundleRoot = (Resolve-Path (Join-Path $root $bundle)).Path

function Add-Failure([string]$message) { $failures.Add($message) }
function Require-Text([string]$relativePath, [string]$pattern) {
  $path = Join-Path $root $relativePath
  if (-not (Test-Path $path)) { Add-Failure "${relativePath}: missing file"; return }
  if (-not (Select-String -Path $path -Pattern $pattern -Quiet)) { Add-Failure "${relativePath}: missing '$pattern'" }
}
function Forbid-Text([string]$relativePath, [string]$pattern) {
  $path = Join-Path $root $relativePath
  if ((Test-Path $path) -and (Select-String -Path $path -Pattern $pattern -Quiet)) { Add-Failure "${relativePath}: prohibited '$pattern'" }
}

foreach ($name in $methodFiles) { Require-Text "$method/$name" '^---$'; Require-Text "$method/$name" '^type:' }
foreach ($name in $bundleFiles) { Require-Text "$bundle/$name" '^---$'; Require-Text "$bundle/$name" '^type:' }
foreach ($axis in @('Mode and data certainty','Total count and pages','Visible range','Current page or local position','Previous/next and disabled states','First/last controls','Arbitrary navigation','Page size','Placement and alignment','Attachment','Top/bottom/sticky duplication','Compact and responsive behavior','Loading, error, and empty states','Focus, keyboard, and accessibility','Stable geometry','Ordering and cursor invalidation','Contract inputs')) { Require-Text "$method/observation-schema.md" ([regex]::Escape($axis)); Require-Text "$bundle/observation-record.md" ([regex]::Escape($axis)) }
Require-Text "$method/observation-schema.md" 'observed.*not observed.*unresolved.*not applicable'
Require-Text "$method/observation-schema.md" 'observed.*inferred.*authored default.*context pattern.*target-product input'
Require-Text "$bundle/manifest.md" 'unknown-total cursor-oriented'
Require-Text "$bundle/manifest.md" 'right-align'
Require-Text "$bundle/manifest.md" 'Previous'
Require-Text "$bundle/manifest.md" 'Next'
Require-Text "$bundle/application-input-contract.md" 'Stable unique ordering'
Require-Text "$bundle/application-input-contract.md" 'Cross-page selection'
Require-Text "$bundle/application-input-contract.md" 'Boundary state'
Require-Text "$bundle/apply-instruction.md" 'enabled Previous and Next'
Require-Text "$bundle/apply-instruction.md" 'boundary state'
foreach ($name in $bundleFiles) { Forbid-Text "$bundle/$name" 'https?://|patternfly|screenshot|capture|oracle|evidence register|source url|\bSELECT\b|\bOFFSET\b|cursor key' }
foreach ($file in Get-ChildItem (Join-Path $root $bundle) -Recurse -File) {
  $relative = $file.FullName.Substring($bundleRoot.Length).TrimStart([char]92,[char]47).Replace([char]92,[char]47)
  if ($relative -notin $bundleFiles) { Add-Failure "invalid bundle path: $relative" }
}
foreach ($file in Get-ChildItem (Join-Path $root $method) -Recurse -File) { if ($file.Name -notin $methodFiles) { Add-Failure "invalid method path: $($file.FullName)" } }
foreach ($file in Get-ChildItem (Join-Path $root $bundle) -Recurse -Filter *.md) { foreach ($match in [regex]::Matches((Get-Content -Raw $file.FullName), '\]\(([^)#]+\.md)(?:#[^)]+)?\)')) { if (-not (Test-Path (Join-Path $file.DirectoryName $match.Groups[1].Value))) { Add-Failure "broken local link: $($file.FullName) -> $($match.Groups[1].Value)" } } }
if ($failures.Count -gt 0) { $failures | ForEach-Object { Write-Error $_ }; exit 1 }
Write-Output 'Pagination method static checks passed.'
