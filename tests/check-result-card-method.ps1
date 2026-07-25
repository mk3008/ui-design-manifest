$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$failures = [System.Collections.Generic.List[string]]::new()
$method = 'docs/poc/methods/result-card'
$bundle = 'docs/poc/experiments/007-search-components/result-card/attempt-1'
$methodFiles = @('README.md','observation-schema.md','extraction-template.md','extraction-prompt.md','first-pass-rubric.md')
$bundleFiles = @('index.md','manifest.md','application-input-contract.md','apply-instruction.md','observation-record.md')
$bundleRoot = (Resolve-Path (Join-Path $root $bundle)).Path
function Add-Failure([string]$message) { $failures.Add($message) }
function Require-Text([string]$relativePath, [string]$pattern) { $path = Join-Path $root $relativePath; if (-not (Test-Path $path)) { Add-Failure "${relativePath}: missing file"; return }; if (-not (Select-String -Path $path -Pattern $pattern -Quiet)) { Add-Failure "${relativePath}: missing '$pattern'" } }
function Forbid-Text([string]$relativePath, [string]$pattern) { $path = Join-Path $root $relativePath; if ((Test-Path $path) -and (Select-String -Path $path -Pattern $pattern -Quiet)) { Add-Failure "${relativePath}: prohibited '$pattern'" } }
foreach ($name in $methodFiles) { Require-Text "$method/$name" '^---$'; Require-Text "$method/$name" '^type:' }
foreach ($name in $bundleFiles) { Require-Text "$bundle/$name" '^---$'; Require-Text "$bundle/$name" '^type:' }
foreach ($axis in @('Card-versus-table choice','Collection responsibility','Host width and outer spacing','Gallery packing','Collection Z/I traversal','Card anatomy and identity','Internal card Z/I flow','Typography hierarchy','Caption presence','Density and media','Selection and activation','Surface relation','Pagination and responsive behavior','Accessibility and state coverage','Application Input Contract needs')) { Require-Text "$method/observation-schema.md" ([regex]::Escape($axis)); Require-Text "$bundle/observation-record.md" ([regex]::Escape($axis)) }
Require-Text "$method/observation-schema.md" 'observed.*not observed.*unresolved.*not applicable'
Require-Text "$method/observation-schema.md" 'observed.*inferred.*authored default.*context pattern.*target-product input'
Require-Text "$bundle/manifest.md" 'dense repetitive text that is better scanned in a table/list'
Require-Text "$bundle/manifest.md" 'row-major Z order'
Require-Text "$bundle/manifest.md" 'vertical I-shaped'
Require-Text "$bundle/manifest.md" 'more than color alone'
Require-Text "$bundle/application-input-contract.md" 'at least six cards'
Require-Text "$bundle/application-input-contract.md" 'left-aligned incomplete final row'
Require-Text "$bundle/application-input-contract.md" 'placeholder-only labels'
foreach ($name in $bundleFiles) { Forbid-Text "$bundle/$name" 'https?://|patternfly|carbon|sap|gov\.uk|screenshot|capture|oracle|source url|card view' }
foreach ($file in Get-ChildItem (Join-Path $root $bundle) -Recurse -File) { $relative = $file.FullName.Substring($bundleRoot.Length).TrimStart('\','/').Replace('\','/'); if ($relative -notin $bundleFiles) { Add-Failure "invalid bundle path: $relative" } }
foreach ($file in Get-ChildItem (Join-Path $root $method) -Recurse -File) { if ($file.Name -notin $methodFiles) { Add-Failure "invalid method path: $($file.FullName)" } }
foreach ($file in Get-ChildItem (Join-Path $root $bundle) -Recurse -Filter *.md) { foreach ($match in [regex]::Matches((Get-Content -Raw $file.FullName), '\]\(([^)#]+\.md)(?:#[^)]+)?\)')) { if (-not (Test-Path (Join-Path $file.DirectoryName $match.Groups[1].Value))) { Add-Failure "broken local link: $($file.FullName) -> $($match.Groups[1].Value)" } } }
if ($failures.Count -gt 0) { $failures | ForEach-Object { Write-Error $_ }; exit 1 }
Write-Output 'Result-card method static checks passed.'
