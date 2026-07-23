$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$failures = [System.Collections.Generic.List[string]]::new()
$bundle = 'docs/poc/experiments/007-search-components/search-conditions/attempt-1'
$method = 'docs/poc/methods/search-conditions'
$allowedBundle = @('manifest.md','application-input-contract.md','apply-instruction.md','observation-record.md','index.md','evaluation-report.md')
$allowedImplementation = @('implementation/initial.html','implementation/initial.css','implementation/wide.png','implementation/narrow.png','implementation/implementation-report.md')
$allowedMethod = @('README.md','observation-schema.md','extraction-template.md','extraction-prompt.md','first-pass-rubric.md')

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

$concepts = @('manifest.md','application-input-contract.md','apply-instruction.md','observation-record.md','index.md')
foreach ($name in $concepts) { Require-Text "$bundle/$name" '^---$'; Require-Text "$bundle/$name" '^type:' }
foreach ($name in @('README.md','observation-schema.md','extraction-template.md','extraction-prompt.md','first-pass-rubric.md')) { Require-Text "$method/$name" '^---$'; Require-Text "$method/$name" '^type:' }
foreach ($file in Get-ChildItem (Join-Path $root $bundle) -Recurse -File) {
  $relativePath = $file.FullName.Substring((Join-Path $root $bundle).Length).TrimStart('\', '/') -replace '\\', '/'
  if ($relativePath -notin $allowedBundle -and $relativePath -notin $allowedImplementation) { Add-Failure "invalid allowlist path: $($file.FullName)" }
}
foreach ($file in Get-ChildItem (Join-Path $root $method) -Recurse -File) { if ($file.Name -notin $allowedMethod) { Add-Failure "invalid allowlist path: $($file.FullName)" } }
Require-Text "$bundle/manifest.md" 'label'
Require-Text "$bundle/application-input-contract.md" 'Boolean choice'
Require-Text "$bundle/application-input-contract.md" 'Required supplied caption'
foreach ($caption in @('Criterion','Match rule','Value','Include related content','Apply')) { Require-Text "$bundle/application-input-contract.md" $caption }
Require-Text "$bundle/apply-instruction.md" 'placeholder-only labels'
Require-Text "$bundle/observation-record.md" 'observed|not observed|unresolved|not applicable'
foreach ($axis in @('Region responsibility','Field inventory','Labels and association','Required indication','Grouping and boundaries','Reading order','Tab order','Density and rhythm','Primary/secondary actions','Default/state visibility','Inline help','Validation/error responsibility','Conditional dependencies','Collapsed/advanced conditions','Saved-filter responsibility','Results relationship','Narrow/responsive policy','Focus/keyboard/motion','Application Input Contract needs')) { Require-Text "$bundle/observation-record.md" ([regex]::Escape($axis)) }
foreach ($name in @('manifest.md','application-input-contract.md','apply-instruction.md','index.md')) { Forbid-Text "$bundle/$name" 'https?://|screenshot|oracle|OR-SC-01|bc74674|Bugzilla|Search comments' }
Require-Text "$bundle/evaluation-report.md" '^---$'
Require-Text "$bundle/evaluation-report.md" '^type: Evaluation Report$'
Require-Text "$bundle/evaluation-report.md" 'OR-SC-01'
Require-Text "$bundle/evaluation-report.md" 'bc74674f8ba3daa5a33344c8bd9dcb8ed519c743fe7ed56b4740a48ec1b41b3b'
Require-Text "$bundle/evaluation-report.md" 'human review required'
Forbid-Text "$bundle/evaluation-report.md" 'https?://|Bugzilla|Search comments|oracle-sc-01-full\.png|AppData'
foreach ($name in @('manifest.md','application-input-contract.md','apply-instruction.md','observation-record.md')) { Require-Text "$bundle/$name" '^---$' }
foreach ($link in @('manifest.md','application-input-contract.md','apply-instruction.md','observation-record.md')) { Require-Text "$bundle/$link" '\.md\)' }
foreach ($file in Get-ChildItem (Join-Path $root $bundle) -Recurse -Filter *.md) { foreach ($match in [regex]::Matches((Get-Content -Raw $file.FullName), '\]\(([^)#]+\.md)(?:#[^)]+)?\)')) { if (-not (Test-Path (Join-Path $file.DirectoryName $match.Groups[1].Value))) { Add-Failure "broken local link: $($file.FullName) -> $($match.Groups[1].Value)" } } }
foreach ($image in Get-ChildItem -Path (Join-Path $root 'docs/poc/experiments/007-search-components') -Recurse -File -Include *.png,*.jpg,*.jpeg,*.gif,*.webp -ErrorAction SilentlyContinue) {
  $relativePath = $image.FullName.Substring((Join-Path $root $bundle).Length).TrimStart('\', '/') -replace '\\', '/'
  if ($relativePath -notin @('implementation/wide.png','implementation/narrow.png','implementation-action-policy/wide.png','implementation-action-policy/narrow.png')) { Add-Failure "oracle or unapproved image file found: $($image.FullName)" }
}

if ($failures.Count -gt 0) { $failures | ForEach-Object { Write-Error $_ }; exit 1 }
Write-Output 'Search Conditions method static checks passed.'
