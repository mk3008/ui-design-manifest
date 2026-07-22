$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$failures = [System.Collections.Generic.List[string]]::new()

function Require-Text([string]$relativePath, [string]$pattern) {
  $path = Join-Path $root $relativePath
  if (-not (Select-String -Path $path -SimpleMatch -Pattern $pattern -Quiet)) {
    $failures.Add("${relativePath}: missing required policy pattern '$pattern'")
  }
}

$template = 'docs/poc/methods/drawer/drawer-extraction-template.md'
$prompt = 'docs/poc/methods/drawer/drawer-extraction-prompt.md'
$rubric = 'docs/poc/methods/drawer/drawer-first-pass-rubric.md'

# Provenance must retain all four classifications and deny observation status to a default.
Require-Text $template 'Provenance: observed / method-default / unresolved/not observed / product input required'
Require-Text $prompt 'Assign exactly one provenance classification'
Require-Text $rubric 'method-default is never presented as a source observation'

# Observation axes must remain specific to disclosure and current state.
Require-Text $template 'presence, placement, direction, synchronization, icon responsibility, controlled child list'
Require-Text $template 'accent presence, placement, shape/role, coexistence with fill/text/icon cues'
Require-Text $prompt 'presence, placement, direction, synchronization with expanded state, icon responsibility, and accessible state'
Require-Text $prompt 'accent presence, placement (including leading/left edge when observed), shape/role, and coexistence with fill, text, or icon cues'
Require-Text $rubric 'indicator presence, placement, direction, synchronization, parent-owned child group, icon responsibility, and accessible state'
Require-Text $rubric 'accent presence, placement, shape/role, coexistence with fill/text/icon cues'

# Guarded disclosure fallback and no-invention boundaries must remain explicit.
Require-Text $template 'contract-declared expandable parent requires a disclosure indicator and the source cannot establish indicator treatment'
Require-Text $prompt 'Application Input Contract declares an expandable parent and the source cannot establish indicator treatment'
Require-Text $rubric 'Contract-declared expandable parent with unestablished indicator treatment'
Require-Text $prompt 'Never invent a parent'
Require-Text $rubric 'captions and leaves never receive that fallback'

# Guarded current fallback and no-invention boundaries must remain explicit.
Require-Text $prompt 'Contract declares a current item but the source accent treatment is unobservable'
Require-Text $rubric 'Contract-declared current item with unobservable accent treatment'
Require-Text $prompt 'target product semantic accent token, a non-color current distinction, and programmatic current state'
Require-Text $prompt 'Never invent a current item'
Require-Text $rubric 'Never invent a parent or current item'

if ($failures.Count -gt 0) {
  $failures | ForEach-Object { Write-Error $_ }
  exit 1
}

Write-Output 'Drawer method static checks passed.'
