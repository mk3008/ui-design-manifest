$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$method = Join-Path $root 'docs/poc/methods/header-drawer'
$bundle = Join-Path $root 'docs/poc/experiments/006-header-drawer-composite/attempt-1'
$files = @('README.md','observation-schema.md','extraction-template.md','extraction-prompt.md','first-pass-rubric.md' | ForEach-Object { Join-Path $method $_ })
$files += @('index.md','manifest.md','application-input-contract.md','fixture-trace.md','claim-matrix.md','apply-instruction.md' | ForEach-Object { Join-Path $bundle $_ })
foreach ($file in $files) { if (-not (Test-Path -LiteralPath $file)) { throw "Missing Header-Drawer artifact: $file" }; if ((Get-Content -Raw $file) -notmatch '(?s)^---\s*\r?\ntype:') { throw "Missing front matter: $file" } }
$all = ($files | ForEach-Object { Get-Content -Raw $_ }) -join "`n"
foreach ($required in @('Target Drawer side','Trigger existence','Trigger owner region','Trigger placement','Trigger visibility by state','Open state','Closed representation','Presentation','Content displacement','Backdrop','Persistent remainder','Viewport-to-mode mapping','State synchronization','Accessible relationship','Focus, keyboard, motion','Persistence','Unresolved inputs','header-hidden','drawer-rail','fully-hidden','icon-rail','HD1','HD2','HD3','HD4','HD5','HD6','HD7','HD8','A-open','A-hidden','B-open','B-rail','currentColor','exactly one authoritative controller')) { if (-not $all.Contains($required)) { throw "Missing Header-Drawer requirement: $required" } }
foreach ($status in @('observed|required-pattern','optional-candidate','unresolved','not exercised','not applicable')) { if (-not $all.Contains($status)) { throw "Missing classification: $status" } }
$schema = Get-Content -Raw (Join-Path $method 'observation-schema.md')
foreach ($axis in @('Target Drawer side','Trigger existence','Trigger owner region','Trigger placement','Trigger visibility by state','Open state','Closed representation','Presentation','Content displacement','Backdrop','Persistent remainder','Viewport-to-mode mapping','State synchronization','Accessible relationship','Focus, keyboard, motion','Persistence','Unresolved inputs')) { if (-not $schema.Contains($axis)) { throw "Missing required observation axis: $axis" } }
$contract = Get-Content -Raw (Join-Path $bundle 'application-input-contract.md')
$apply = Get-Content -Raw (Join-Path $bundle 'apply-instruction.md')
foreach ($contractSlot in @('left Drawer','inline','content-displaced','no-backdrop','A-open','A-hidden','B-open','B-rail','leading position','interior top edge','aria-expanded','aria-controls','Parent A','Child A','Leaf A','Direct A','Home','Files')) { if (-not $contract.Contains($contractSlot)) { throw "Missing Contract fixture or state input: $contractSlot" } }
foreach ($fixtureNeedle in @('expanded parent','top-level leaf','independent direct item','current/non-current','no supplied leading semantic icon slots','must omit leading icons','trailing expanded disclosure affordance','simple downward chevron','corner rounding','currentColor')) { if (-not $contract.Contains($fixtureNeedle)) { throw "Fixture/Contract mismatch or missing fixture role: $fixtureNeedle" } }
foreach ($needle in @('Manifest','Application Input Contract','apply instruction','bracket glyphs','text-character icon substitutes','generic leading markers','square or checkbox-like icons','plus-sign substitutes','rounded navigation rows','omit leading icons','trailing expanded disclosure affordance','downward inline `currentColor` SVG chevron')) { if (-not $apply.Contains($needle)) { throw "Apply instruction missing: $needle" } }
foreach ($obsolete in @('implementer-apply-packet.md','implementer-prompt.md')) { if (Test-Path (Join-Path $bundle $obsolete)) { throw "Superseded Implementer file still exists: $obsolete" } }
$forbidden = @('https://','http://','Microsoft','Carbon','C:\\','pattern-evidence.md')
foreach ($term in $forbidden) { if ($all.Contains($term)) { throw "Source-boundary leak in source-blind Header-Drawer artifacts: $term" } }
$manifest = Get-Content -Raw (Join-Path $bundle 'manifest.md')
if (-not $manifest.Contains('single authoritative') -or -not $manifest.Contains('Do not add a second Drawer control') -or -not $manifest.Contains('Do not add a Header trigger')) { throw 'Duplicate-controller guard is missing' }
Write-Output 'check-header-drawer-method: passed'
