param(
  [switch]$RequireEvaluator
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$bundle = Join-Path $root 'docs/poc/experiments/006-header-drawer-composite/attempt-2'
$manifestPath = Join-Path $bundle 'artifact-manifest.yaml'
$contractPath = Join-Path $bundle 'experiment-contract.md'
$inputPath = Join-Path $bundle 'source-blind-implementation-input.md'
$packetPath = Join-Path $bundle 'human-review-packet.md'
$humanPagePath = Join-Path $bundle 'human-review.html'
$evaluatorPath = Join-Path $bundle 'evaluator-record.md'
$humanRecordPath = Join-Path $bundle 'human-review-record.md'
$reconciliationPath = Join-Path $bundle 'artifact-identity-reconciliation.md'
$closurePath = Join-Path $bundle 'final-closure.md'

foreach ($path in @($manifestPath, $contractPath, $inputPath, $packetPath, $humanPagePath)) {
  if (-not (Test-Path -LiteralPath $path)) { throw "Missing Pattern A reconnection artifact: $path" }
}

$manifest = Get-Content -Raw $manifestPath
$contract = Get-Content -Raw $contractPath
$input = Get-Content -Raw $inputPath
$packet = Get-Content -Raw $packetPath
$humanPage = Get-Content -Raw $humanPagePath

if ($manifest -notmatch '^experiment_id: header-drawer-pattern-a-reconnection-attempt-2') { throw 'Unexpected experiment identity' }
if ($manifest -notmatch 'baseline_commit: de00ec0f10c506e2aa74deae3c09b5d4c736406b') { throw 'Baseline identity mismatch' }
if ($manifest -notmatch 'original_ui_used_as_implementation_input: false') { throw 'Source-blind declaration missing' }

$artifacts = @(
  @{ Id='HDA2-A-OPEN-1280X720'; State='A-open'; Path='implementation/A-open.png'; Hash='FDA2661FAF07A0CD3F71177E6BE32F7036ADC45354C7136C74B776DC0FF96A7C' },
  @{ Id='HDA2-A-HIDDEN-1280X720'; State='A-hidden'; Path='implementation/A-hidden.png'; Hash='EBB960807FD73EEEEA6C953772A3306172B62075B6709BCBF13A5E0470C23161' }
)

$identityChecks = 0
$stateIds = @()
foreach ($artifact in $artifacts) {
  foreach ($required in @($artifact.Id, $artifact.State, $artifact.Path, $artifact.Hash, 'viewport: 1280x720')) {
    if (-not $manifest.Contains($required)) { throw "Artifact manifest reference missing: $required" }
  }
  $actualPath = Join-Path $bundle $artifact.Path
  if (-not (Test-Path -LiteralPath $actualPath)) { throw "Artifact is missing: $actualPath" }
  $actualHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $actualPath).Hash
  if ($actualHash -ne $artifact.Hash) { throw "Raw-byte artifact digest mismatch: $($artifact.Id)" }
  $image = [System.Drawing.Image]::FromFile($actualPath)
  try {
    if ($image.Width -ne 1280 -or $image.Height -ne 720) { throw "Viewport mismatch: $($artifact.Id)" }
  } finally { $image.Dispose() }
  $stateIds += $artifact.State
  $identityChecks += 4
}
if (($stateIds | Select-Object -Unique).Count -ne $stateIds.Count) { throw 'Duplicate state ID' }
$identityChecks++

foreach ($claim in @('PA-CTRL', 'PA-TITLE', 'PA-HIDDEN')) {
  if (-not $contract.Contains($claim)) { throw "Claim outside fixed three-claim scope: $claim" }
}
if (($contract | Select-String -Pattern 'Claim ID' -AllMatches).Count -ne 1) { throw 'Unexpected claim table shape' }
foreach ($unexercised in @('keyboard', 'focus', 'Escape', 'assistive technology', 'persistence', 'responsive')) {
  if (-not $contract.Contains($unexercised) -or -not $contract.Contains('not exercised')) { throw "Out-of-scope behavior is not explicitly retained as unexercised: $unexercised" }
}
$identityChecks += 2

foreach ($forbidden in @('http://', 'https://', 'original UI', 'external oracle')) {
  if ($input.Contains($forbidden)) { throw "Source-blind implementation input leaks prohibited material: $forbidden" }
}
$identityChecks++

foreach ($artifact in $artifacts) {
  foreach ($required in @($artifact.Id, $artifact.Hash, $artifact.Path, '1280x720')) {
    if (-not $packet.Contains($required)) { throw "Human-review packet identity mismatch: $required" }
  }
  foreach ($required in @($artifact.Path, $artifact.State)) {
    if (-not $humanPage.Contains($required)) { throw "Human-review HTML reference mismatch: $required" }
  }
}
$identityChecks += 2
foreach ($claim in @('PA-CTRL', 'PA-TITLE', 'PA-HIDDEN')) {
  if (-not $humanPage.Contains($claim)) { throw "Human-review HTML omitted claim: $claim" }
}
$identityChecks++

if ($RequireEvaluator) {
  if (-not (Test-Path -LiteralPath $evaluatorPath)) { throw 'Evaluator record is missing' }
  $evaluator = Get-Content -Raw $evaluatorPath
  foreach ($artifact in $artifacts) {
    foreach ($required in @($artifact.Id, $artifact.Hash, $artifact.Path, '1280x720')) {
      if (-not $evaluator.Contains($required)) { throw "Evaluator identity mismatch: $required" }
    }
  }
  foreach ($claim in @('PA-CTRL', 'PA-TITLE', 'PA-HIDDEN')) {
    if (-not $evaluator.Contains($claim)) { throw "Evaluator omitted claim: $claim" }
  }
  $identityChecks += 5
}

if (Test-Path -LiteralPath $humanRecordPath) {
  $humanRecord = Get-Content -Raw $humanRecordPath
  foreach ($required in @(
    'header-drawer-pattern-a-reconnection-attempt-2',
    'de00ec0f10c506e2aa74deae3c09b5d4c736406b',
    'Reviewer type: `human`',
    'Decision source: explicit user decision in this task',
    'Detailed reason was not recorded.',
    'Keyboard, focus, Escape, ARIA, assistive',
    'does not amend, replace, or',
    'override the evaluator record.'
  )) {
    if (-not $humanRecord.Contains($required)) { throw "Human-review record requirement missing: $required" }
  }
  foreach ($artifact in $artifacts) {
    foreach ($required in @($artifact.Id, $artifact.State, $artifact.Path, $artifact.Hash, '1280x720')) {
      if (-not $humanRecord.Contains($required)) { throw "Human-review record identity mismatch: $required" }
    }
  }
  foreach ($claim in @('PA-CTRL', 'PA-TITLE', 'PA-HIDDEN')) {
    $marker = '| `' + $claim + '` |'
    if (-not $humanRecord.Contains($marker)) { throw "Human-review record omitted claim: $claim" }
  }
  if (($humanRecord | Select-String -Pattern '\| `PA-CTRL` .*\| `accept` \|' -AllMatches).Count -ne 1) { throw 'PA-CTRL human decision is not the supplied accept value' }
  if (($humanRecord | Select-String -Pattern '\| `PA-TITLE` .*\| `accept` \|' -AllMatches).Count -ne 1) { throw 'PA-TITLE human decision is not the supplied accept value' }
  if (($humanRecord | Select-String -Pattern '\| `PA-HIDDEN` .*\| `accept` \|' -AllMatches).Count -ne 1) { throw 'PA-HIDDEN human decision is not the supplied accept value' }
  if ($humanRecord -notmatch '\| `PA-HIDDEN` \| `HDA2-A-HIDDEN-1280X720` \| `accept`') { throw 'PA-HIDDEN does not exclusively reference the hidden artifact' }
  if ($RequireEvaluator) {
    $evaluator = Get-Content -Raw $evaluatorPath
    foreach ($result in @('`PA-CTRL`.*\| `failure`', '`PA-TITLE`.*\| `failure`', '`PA-HIDDEN`.*\| `preserved`')) {
      if ($evaluator -notmatch $result) { throw "Evaluator result was changed or missing: $result" }
    }
  }
  $identityChecks += 8
}

if (Test-Path -LiteralPath $reconciliationPath) {
  $reconciliation = Get-Content -Raw $reconciliationPath
  foreach ($artifact in $artifacts) {
    foreach ($required in @($artifact.Id, $artifact.State, $artifact.Path, $artifact.Hash, '1280x720')) {
      if (-not $reconciliation.Contains($required)) { throw "Four-party reconciliation identity mismatch: $required" }
    }
  }
  foreach ($required in @('Complete matches: `2`', 'Mismatches: `0`', 'does not', 'turn evaluator `failure` into human `accept`')) {
    if (-not $reconciliation.Contains($required)) { throw "Four-party reconciliation result missing: $required" }
  }
  $identityChecks += 3
}

if (Test-Path -LiteralPath $closurePath) {
  $closure = Get-Content -Raw $closurePath
  foreach ($required in @(
    'The **Phase status** is `done`',
    'The **Experiment result** is `rejected`',
    '`PA-CTRL` or `PA-TITLE` is `failure`',
    'Neither replaces,',
    'hides, or normalizes the other.',
    'does not permit a Drawer fixed-guidance draft'
  )) {
    if (-not $closure.Contains($required)) { throw "Final-closure decision rule missing: $required" }
  }
  $identityChecks += 2
}

Write-Output "check-header-drawer-pattern-a-reconnection: passed; static_identity_checks=$identityChecks; evaluator_required=$RequireEvaluator"
