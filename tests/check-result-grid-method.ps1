$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$failures = [System.Collections.Generic.List[string]]::new()
$method = 'docs/poc/methods/result-grid'
$bundle = 'docs/poc/experiments/007-search-components/result-grid/attempt-1'
$methodFiles = @('README.md','observation-schema.md','extraction-template.md','extraction-prompt.md','first-pass-rubric.md')
$bundleFiles = @('index.md','manifest.md','application-input-contract.md','apply-instruction.md','observation-record.md')

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
foreach ($axis in @('Sort affordance, state, and direction','Multi-selection','Selected and unselected row state','Selection versus activation','Horizontal alignment','Vertical alignment','Text, numeric, and icon treatment','Density and row rhythm','Header and body typography','Grid/container width and remaining space','Overflow','Empty and narrow states','Accessibility','Application Input Contract needs')) { Require-Text "$method/observation-schema.md" ([regex]::Escape($axis)) }
Require-Text "$method/observation-schema.md" 'observed.*not observed.*unresolved.*not applicable'
Require-Text "$method/observation-schema.md" 'observed.*inferred.*authored default.*context pattern.*target-product input'
Require-Text "$bundle/manifest.md" 'right edge of the header control'
Require-Text "$bundle/manifest.md" 'Do not make inactive sort icons persist'
Require-Text "$bundle/application-input-contract.md" 'leading multi-select checkbox'
Require-Text "$bundle/application-input-contract.md" 'selected and one unselected'
Require-Text "$bundle/application-input-contract.md" 'text and numeric'
Require-Text "$bundle/application-input-contract.md" 'semantic dummy data column'
Require-Text "$bundle/apply-instruction.md" 'placeholder-only labels'
foreach ($axis in @('Sort affordance, state, and direction','Multi-selection','Selected and unselected row state','Selection versus activation','Horizontal alignment','Vertical alignment','Text, numeric, and icon treatment','Density and row rhythm','Header and body typography','Grid/container width and remaining space','Overflow','Empty and narrow states','Accessibility','Application Input Contract needs')) { Require-Text "$bundle/observation-record.md" ([regex]::Escape($axis)) }
Require-Text "$bundle/observation-record.md" 'observed|not observed|unresolved|not applicable'
foreach ($name in $bundleFiles) { Forbid-Text "$bundle/$name" 'https?://|patternfly|carbon|sap|gov\.uk|screenshot|capture|oracle|evidence register|source url' }
foreach ($file in Get-ChildItem (Join-Path $root $bundle) -Recurse -File) { if ($file.Name -notin $bundleFiles) { Add-Failure "invalid bundle path: $($file.FullName)" } }
foreach ($file in Get-ChildItem (Join-Path $root $method) -Recurse -File) { if ($file.Name -notin $methodFiles) { Add-Failure "invalid method path: $($file.FullName)" } }
foreach ($file in Get-ChildItem (Join-Path $root $bundle) -Recurse -Filter *.md) { foreach ($match in [regex]::Matches((Get-Content -Raw $file.FullName), '\]\(([^)#]+\.md)(?:#[^)]+)?\)')) { if (-not (Test-Path (Join-Path $file.DirectoryName $match.Groups[1].Value))) { Add-Failure "broken local link: $($file.FullName) -> $($match.Groups[1].Value)" } } }
if ($failures.Count -gt 0) { $failures | ForEach-Object { Write-Error $_ }; exit 1 }
Write-Output 'Result-grid method static checks passed.'
