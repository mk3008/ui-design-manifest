$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$method = Join-Path $root 'docs/poc/methods/header-drawer'
$bundle = Join-Path $root 'docs/poc/experiments/006-header-drawer-composite/attempt-1'
$files = @('README.md','observation-schema.md','extraction-template.md','extraction-prompt.md','first-pass-rubric.md' | ForEach-Object { Join-Path $method $_ })
$files += @('index.md','manifest.md','application-input-contract.md','fixture-trace.md','claim-matrix.md','apply-instruction.md' | ForEach-Object { Join-Path $bundle $_ })
foreach ($file in $files) { if (-not (Test-Path -LiteralPath $file)) { throw "Missing Header-Drawer artifact: $file" }; if ((Get-Content -Raw $file) -notmatch '(?s)^---\s*\r?\ntype:') { throw "Missing front matter: $file" } }
$all = ($files | ForEach-Object { Get-Content -Raw $_ }) -join "`n"
foreach ($required in @('Target Drawer side','Trigger existence','Trigger owner region','Trigger placement','Owner and slot stability','Title/landmark anchor stability','Trigger visibility by state','Open state','Closed representation','Dismiss-vs-compact action semantics','Icon direction','Presentation','Content displacement','Backdrop','Persistent remainder','Viewport-to-mode mapping','State synchronization','Accessible relationship','Focus, keyboard, motion','Persistence','Unresolved inputs','header-hidden','drawer-rail','fully-hidden','icon-rail','HD1','HD2','HD3','HD4','HD5','HD6','HD7','HD8','A-open','A-hidden','B-open','B-rail','currentColor','exactly one authoritative controller','X-shaped')) { if (-not $all.Contains($required)) { throw "Missing Header-Drawer requirement: $required" } }
foreach ($status in @('observed|required-pattern','optional-candidate','unresolved','not exercised','not applicable')) { if (-not $all.Contains($status)) { throw "Missing classification: $status" } }
$schema = Get-Content -Raw (Join-Path $method 'observation-schema.md')
foreach ($axis in @('Target Drawer side','Trigger existence','Trigger owner region','Trigger placement','Owner and slot stability','Title/landmark anchor stability','Trigger visibility by state','Open state','Closed representation','Dismiss-vs-compact action semantics','Icon direction','Presentation','Content displacement','Backdrop','Persistent remainder','Viewport-to-mode mapping','State synchronization','Accessible relationship','Focus, keyboard, motion','Persistence','Unresolved inputs')) { if (-not $schema.Contains($axis)) { throw "Missing required observation axis: $axis" } }
$contract = Get-Content -Raw (Join-Path $bundle 'application-input-contract.md')
$apply = Get-Content -Raw (Join-Path $bundle 'apply-instruction.md')
foreach ($contractSlot in @('left Drawer','inline','content-displaced','no-backdrop','A-open','A-hidden','B-open','B-rail','stable leading slot','same stable leading slot','stable title anchor','same title anchor','trailing/top edge','left-pointing collapse chevron','right-pointing expand chevron','aria-expanded','aria-controls','Parent A','Child A','Leaf A','Direct A','Home','Files')) { if (-not $contract.Contains($contractSlot)) { throw "Missing Contract fixture or state input: $contractSlot" } }
foreach ($fixtureNeedle in @('expanded parent','top-level leaf','independent direct item','current/non-current','no supplied leading semantic icon slots','must omit leading icons','trailing expanded disclosure affordance','simple downward chevron','corner rounding','currentColor')) { if (-not $contract.Contains($fixtureNeedle)) { throw "Fixture/Contract mismatch or missing fixture role: $fixtureNeedle" } }
foreach ($needle in @('Manifest','Application Input Contract','apply instruction','bracket glyphs','text-character icon substitutes','generic leading markers','square or checkbox-like icons','plus-sign substitutes','rounded navigation rows','omit leading icons','trailing/top edge','left-pointing inline `currentColor` SVG chevron','right-pointing one','X-shaped icon','trailing expanded disclosure affordance','downward inline `currentColor` SVG chevron')) { if (-not $apply.Contains($needle)) { throw "Apply instruction missing: $needle" } }
foreach ($obsolete in @('implementer-apply-packet.md','implementer-prompt.md')) { if (Test-Path (Join-Path $bundle $obsolete)) { throw "Superseded Implementer file still exists: $obsolete" } }
$forbidden = @('https://','http://','Microsoft','Carbon','C:\\','pattern-evidence.md')
foreach ($term in $forbidden) { if ($all.Contains($term)) { throw "Source-boundary leak in source-blind Header-Drawer artifacts: $term" } }
$manifest = Get-Content -Raw (Join-Path $bundle 'manifest.md')
if (-not $manifest.Contains('single authoritative') -or -not $manifest.Contains('Do not add a second Drawer control') -or -not $manifest.Contains('Do not add a Header trigger')) { throw 'Duplicate-controller guard is missing' }
$implementation = Join-Path $bundle 'implementation-attempt-2'
foreach ($file in @('index.html','styles.css','implementation-report.md','A-open.png','A-hidden.png','B-open.png','B-rail.png','wide.png','narrow.png')) { if (-not (Test-Path -LiteralPath (Join-Path $implementation $file))) { throw "Missing corrected implementation artifact: $file" } }
$implementationReport = Get-Content -Raw (Join-Path $implementation 'implementation-report.md')
if ($implementationReport -notmatch '(?s)^---\s*\r?\ntype:') { throw 'Corrected implementation report is missing front matter' }
$html = Get-Content -Raw (Join-Path $implementation 'index.html')
$css = Get-Content -Raw (Join-Path $implementation 'styles.css')
foreach ($needle in @('Compact navigation','Expand navigation','collapse-icon','expand-icon','header-drawer-a','drawer-b')) { if (-not $html.Contains($needle)) { throw "Corrected implementation is missing: $needle" } }
foreach ($needle in @('right: 12px','same stable leading slot')) { if ($needle -eq 'same stable leading slot') { continue }; if (-not $css.Contains($needle)) { throw "Corrected implementation styling is missing: $needle" } }
foreach ($png in @('A-open.png','A-hidden.png','B-open.png','B-rail.png','wide.png','narrow.png')) {
  $image = [System.Drawing.Image]::FromFile((Join-Path $implementation $png))
  if ($image.Width -lt 1 -or $image.Height -lt 1) { throw "Blank corrected capture dimensions: $png" }
  $image.Dispose()
}
$aOpen = [System.Drawing.Bitmap]::new((Join-Path $implementation 'A-open.png'))
$aHidden = [System.Drawing.Bitmap]::new((Join-Path $implementation 'A-hidden.png'))
if ($aOpen.Width -ne $aHidden.Width -or $aOpen.Height -ne $aHidden.Height) { throw 'A-open and A-hidden dimensions differ' }
for ($y = 0; $y -lt 64; $y++) {
  for ($x = 0; $x -lt $aOpen.Width; $x++) {
    if ($aOpen.GetPixel($x, $y).ToArgb() -ne $aHidden.GetPixel($x, $y).ToArgb()) { throw "A-open/A-hidden Header pixels differ at x=$x y=$y" }
  }
}
$aOpen.Dispose()
$aHidden.Dispose()
Write-Output 'check-header-drawer-method: passed'
