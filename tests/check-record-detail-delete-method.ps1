$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$failures = [System.Collections.Generic.List[string]]::new()
$method = 'docs/poc/methods/record-detail-delete'
$bundle = 'docs/poc/experiments/008-record-detail-delete/attempt-1'
$methodFiles = @('README.md','observation-schema.md','first-pass-rubric.md','extraction-template.md','extraction-prompt.md')
$bundleFiles = @('index.md','observation-record.md','manifest.md','application-input-contract.md','apply-instruction.md')
function Add-Failure([string]$message) { $failures.Add($message) }
function Require-Text([string]$relativePath, [string]$pattern) { $path = Join-Path $root $relativePath; if (-not (Test-Path $path)) { Add-Failure "${relativePath}: missing file"; return }; if (-not (Select-String -Path $path -Pattern $pattern -Quiet)) { Add-Failure "${relativePath}: missing '$pattern'" } }
function Forbid-Text([string]$relativePath, [string]$pattern) { $path = Join-Path $root $relativePath; if ((Test-Path $path) -and (Select-String -Path $path -Pattern $pattern -Quiet)) { Add-Failure "${relativePath}: prohibited '$pattern'" } }
foreach ($name in $methodFiles) { Require-Text "$method/$name" '^---$'; Require-Text "$method/$name" '^type:' }
foreach ($name in $bundleFiles) { Require-Text "$bundle/$name" '^---$'; Require-Text "$bundle/$name" '^type:' }
foreach ($axis in @('Record identity, title, and status','Summary versus full attributes; label/value captions','Hierarchy, weighting, section grouping, density, and host-width use','Wide multi-column versus narrow I-flow','Long, empty, and multi-value handling; copyable values','Read-only semantics versus disabled form controls','Action ownership and return/close affordance','Trigger placement, initial emphasis, and impact classification','Digest versus full-record confirmation; identity and consequences','Reversibility, undo/recovery, confirmation strength, and typed confirmation','Pending, double-submit prevention, failure, success, and post-delete destination','Audit, retention, permission, lock, dependency, and irreversible constraints','Unavailable-action explanation and omission policy','Full page, modal, and side/drawer presentation','Result-to-detail, creation, edit, and delete paths','Required values, state sources, display conditions, and update triggers')) { Require-Text "$method/observation-schema.md" ([regex]::Escape($axis)); Require-Text "$bundle/observation-record.md" ([regex]::Escape($axis)) }
Require-Text "$method/observation-schema.md" 'observed.*not observed.*unresolved.*not applicable'
Require-Text "$method/observation-schema.md" 'observed.*inferred.*authored default.*context pattern.*target-product input'
Require-Text "$method/first-pass-rubric.md" 'weighted section headings'
Require-Text "$method/first-pass-rubric.md" 'without boxing every field'
Require-Text "$method/first-pass-rubric.md" 'Wide grouped columns'
Require-Text "$method/first-pass-rubric.md" 'vertical I-flow'
Require-Text "$bundle/manifest.md" 'purpose-built readable label/value information view'
Require-Text "$bundle/manifest.md" 'medium impact'
Require-Text "$bundle/manifest.md" 'typed confirmation'
Require-Text "$bundle/manifest.md" 'Back to results'
Require-Text "$bundle/application-input-contract.md" 'Record A'
foreach ($name in $bundleFiles) { Forbid-Text "$bundle/$name" 'https?://|carbon|patternfly|screenshot|capture|oracle|source url|structured list' }
foreach ($file in Get-ChildItem (Join-Path $root $bundle) -Recurse -Filter *.md) { foreach ($match in [regex]::Matches((Get-Content -Raw $file.FullName), '\]\(([^)#]+\.md)(?:#[^)]+)?\)')) { if (-not (Test-Path (Join-Path $file.DirectoryName $match.Groups[1].Value))) { Add-Failure "broken local link: $($file.FullName) -> $($match.Groups[1].Value)" } } }
if ($failures.Count -gt 0) { $failures | ForEach-Object { Write-Error $_ }; exit 1 }
Write-Output 'Record-detail/delete method static checks passed.'
