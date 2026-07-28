$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$review = Join-Path $root 'docs/poc/experiments/010-business-workflow-static-html-review/attempt-1'
$manifestPath = Join-Path $review 'artifact-manifest.yaml'
$captureRecordPath = Join-Path $review 'capture-record.json'
$implementationRecordPath = Join-Path $review 'implementation-record.md'

$pages = @(
  'review',
  'record-read',
  'record-create',
  'record-edit',
  'record-delete',
  'screen-transition',
  'accessibility',
  'confirmation',
  'dialog',
  'wizard',
  'dashboard',
  'color-theme'
)

foreach ($name in $pages) {
  foreach ($extension in @('html', 'png')) {
    $path = Join-Path $review "$name.$extension"
    if (-not (Test-Path -LiteralPath $path)) { throw "Missing fixed review artifact: $name.$extension" }
  }
}
foreach ($name in @('styles.css', 'wizard-flow-review.html', 'wizard-flow-review.css', 'color-theme-token-review.html', 'color-theme-token-review.css', 'capture.ps1', 'capture-record.json', 'artifact-manifest.yaml', 'implementation-record.md', 'evaluation-sources.md', 'design-correction-audit.md', 'audit-record-read-before.png', 'audit-record-read-three-column-before.png', 'audit-record-read-density-comparison.png', 'audit-record-create-before.png', 'audit-screen-transition-before.png', 'audit-color-theme-reduced-before.png', 'audit-color-theme-restored-after.png', 'audit-color-theme-role-coverage-comparison.html', 'audit-color-theme-role-coverage-comparison.png', 'audit-color-theme-header-order-before.png', 'audit-color-theme-header-order-comparison.html', 'audit-color-theme-header-order-comparison.png', 'audit-applied-choices-horizontal-before.png', 'audit-applied-choices-horizontal-full-before.png', 'audit-applied-choices-vertical-full-after.png', 'audit-applied-choices-vertical-detail.png', 'audit-applied-choices-vertical-comparison.html', 'audit-applied-choices-vertical-comparison.png', 'screen-review.md', 'independent-review.md', 'verification-record.md')) {
  if (-not (Test-Path -LiteralPath (Join-Path $review $name))) { throw "Missing review support artifact: $name" }
}

function Get-CanonicalTextSha256([string]$path) {
  $text = [System.IO.File]::ReadAllText($path, [System.Text.UTF8Encoding]::new($false))
  $canonical = ($text -replace "`r`n", "`n") -replace "`r", "`n"
  $bytes = [System.Text.UTF8Encoding]::new($false).GetBytes($canonical)
  $sha256 = [System.Security.Cryptography.SHA256]::Create()
  try { return ([System.BitConverter]::ToString($sha256.ComputeHash($bytes))).Replace('-', '') } finally { $sha256.Dispose() }
}

$expectedText = @{
  'review.html' = '3DDC2722B46C1C1AC076A1DD557F1EB2A99EDE200E58AD52D4A6CE170BEEA28A'
  'record-read.html' = '5EE8F750BF4B60BB8FD9F398A51B09565605311AA86E967A7EAFCCCE0FB6721E'
  'record-create.html' = '67B005C6308343B9A055DB8FF66E1F61E2AE8108B4ABC018BB319F003A881550'
  'record-edit.html' = '61D36C0C3A45194916FD95F245542524645AB539FDAC53BE742A5E9E2F385030'
  'record-delete.html' = '3B6B042996807A4806273DB27A52ADECAF31365D120C519840F6BBAF646D5B3A'
  'screen-transition.html' = '8A2911416C73E45AEF0C3537A3F3DF4C0F33ED6FAB7F5785FDF054A230F7ACF5'
  'accessibility.html' = '0F2490D56FDE39E593E99F3AE3E3F8A5CF78FC14C574638E6F303C25906C7341'
  'confirmation.html' = '309374BEE519483DCF250902A7BC6A00452C68468954D5BCCB69AB9B79F3F01C'
  'dialog.html' = '15CD4BB1141B957BCC5C6415614DECC6B0912EB40C577C01054250CB3C1B2136'
  'wizard.html' = '6592B9C227C11095602C4DED2A4607DAB9A645CEA6BBDD3ED03AB3E5E80D0FD4'
  'dashboard.html' = '1A846CD50EE6553253407CFA82E43CF794561B2E98230178096648E7F31B52CD'
  'color-theme.html' = '4F56910721443F11CB6D72D87A18AD2BB99427EBA79FCC0E53BDCEA02F2805A7'
  'styles.css' = '66A1E0E451364E67B1BCCBF7B38364D2A88254BD3CF83E73DBCF7CA85EC06339'
}
foreach ($name in $expectedText.Keys) {
  if ((Get-CanonicalTextSha256 (Join-Path $review $name)) -ne $expectedText[$name]) { throw "Canonical text digest mismatch: $name" }
}
$expectedSupplementaryText = @{
  'wizard-flow-review.html' = 'B5DAF119C598FB655E0E4355FC622FF97B047A8E4FB312ADE3D307F85D8D8A91'
  'wizard-flow-review.css' = '769FEA5E108529B35E3DA4AF0C6276F03BDE44C59EF30597B4453FA8D585AF8C'
  'color-theme-token-review.html' = 'A0881B12C5DE439CD5BFD21AFA7DB59568E8931A65FDED4AED9F43FF84E63BE7'
  'color-theme-token-review.css' = '4090733A7F68A791CA61B781FFA001F3FB5EA7C51735C21B8D2C0185FCC751DF'
}
foreach ($name in $expectedSupplementaryText.Keys) {
  if ((Get-CanonicalTextSha256 (Join-Path $review $name)) -ne $expectedSupplementaryText[$name]) {
    throw "Supplementary review canonical text digest mismatch: $name"
  }
}
if ((Get-CanonicalTextSha256 (Join-Path $review 'audit-color-theme-role-coverage-comparison.html')) -ne '831C33CF27E41DC59DBD4D0681B45DCF019DE4D37BD537AA59E389DFF2FA544E') {
  throw 'Canonical text digest mismatch: audit-color-theme-role-coverage-comparison.html'
}
if ((Get-CanonicalTextSha256 (Join-Path $review 'audit-color-theme-header-order-comparison.html')) -ne '338FF7072743CDD2AD446AAE01BA587C11A2A970CFEF5481DAB29C2B56421D84') {
  throw 'Canonical text digest mismatch: audit-color-theme-header-order-comparison.html'
}
if ((Get-CanonicalTextSha256 (Join-Path $review 'audit-applied-choices-vertical-comparison.html')) -ne 'A3D81138C905B31508FF823FE5EC2D7CF19AD7220DB45906A98266DEEDF89406') {
  throw 'Canonical text digest mismatch: audit-applied-choices-vertical-comparison.html'
}

$expectedPng = @{
  'review.png' = @{ hash = '72FA217F4137928AE01DEF6A45B3FA94E2000CA436418765EA7A68BDC49B4A44'; bytes = 64176 }
  'record-read.png' = @{ hash = '38DB06DBC82E50A175541F02C984881E8C0E49144BB27507F0BAECEDD46EAE11'; bytes = 71188 }
  'record-create.png' = @{ hash = 'F38BFD1D3CC01AE0DD70703E9F710F1B18B3733793DE3237BED70EF3EB1209AF'; bytes = 49872 }
  'record-edit.png' = @{ hash = 'CCBB083A3DDB4C96E835BDCFF9E44EAEC31449C455E5364601E349EC26C36C8A'; bytes = 54054 }
  'record-delete.png' = @{ hash = '279E283E16E909BF4BE810682AA49EB936B0DF1E4CAF8004076AF581FBD31C27'; bytes = 52687 }
  'screen-transition.png' = @{ hash = '5BD0D2CF99F330B720E3859BE291787F9BD2B2EE152E85440743FF14F7C2D08D'; bytes = 45864 }
  'accessibility.png' = @{ hash = 'BED10C7877C15A1686B356CA57DE233431E8A030DB6A4048BBFA8C95AFD45850'; bytes = 55242 }
  'confirmation.png' = @{ hash = '3214C0D03E6358F744DA3FEAEFB58275918606C9DD16B6674786DBFEFC38BD3E'; bytes = 52517 }
  'dialog.png' = @{ hash = 'E7B832E54A4DC3F971B06A8DD197FBF8FEC8FB0BA19F31BBC8D740AE7A463FD8'; bytes = 51944 }
  'wizard.png' = @{ hash = '00DF2974584D425416D510E9029E70804E27B920A20E14C977F5224B9893AC2B'; bytes = 51784 }
  'dashboard.png' = @{ hash = 'DAF0C6519C9008533895EB68C949131E44786C2DE77BD664B55B4CA6A801E80F'; bytes = 59868 }
  'color-theme.png' = @{ hash = 'D54B8883177D5A018F4A0D16F923FE4BC3EBF18A6474A5283E94A434FE820556'; bytes = 111288 }
}
Add-Type -AssemblyName System.Drawing
foreach ($name in $expectedPng.Keys) {
  $path = Join-Path $review $name
  if ((Get-FileHash -Algorithm SHA256 -LiteralPath $path).Hash -ne $expectedPng[$name].hash) { throw "Raw-byte PNG digest mismatch: $name" }
  if ((Get-Item -LiteralPath $path).Length -ne $expectedPng[$name].bytes) { throw "PNG size mismatch: $name" }
  $image = [System.Drawing.Image]::FromFile($path)
  try {
    if ($image.Width -ne 1440 -or $image.Height -ne 1200) { throw "PNG dimensions mismatch: $name" }
  } finally {
    $image.Dispose()
  }
}
$expectedThemeAuditPng = @{
  'audit-color-theme-reduced-before.png' = @{ hash = '4956B62391A46FA3536F3817FD4B37602B964CE66F13CFA26C4B6BD4BF99A85C'; bytes = 134845; width = 2273; height = 1429 }
  'audit-color-theme-restored-after.png' = @{ hash = '5F931671609A740E42557D22163648D47EAFA5B2241102350814608A2426DE2A'; bytes = 134580; width = 2274; height = 1430 }
  'audit-color-theme-role-coverage-comparison.png' = @{ hash = 'E0F8EEE7B0FC8ACBA5DA683702FA62346188561CE046F18FAD06F44F7F955B9B'; bytes = 205930; width = 1920; height = 1200 }
  'audit-color-theme-header-order-before.png' = @{ hash = '243C0564C3FB5064BEEEECC9DCA1153E9D6C4603374D44700F21E844782A0767'; bytes = 39040; width = 2256; height = 309 }
  'audit-color-theme-header-order-comparison.png' = @{ hash = 'CBC71504C2FC2AAE1F5AA9CDED071537C91BC52670F3CBA84C74959A6516E7B6'; bytes = 110328; width = 1920; height = 1200 }
}
foreach ($name in $expectedThemeAuditPng.Keys) {
  $path = Join-Path $review $name
  if ((Get-FileHash -Algorithm SHA256 -LiteralPath $path).Hash -ne $expectedThemeAuditPng[$name].hash) { throw "Raw-byte theme audit PNG digest mismatch: $name" }
  if ((Get-Item -LiteralPath $path).Length -ne $expectedThemeAuditPng[$name].bytes) { throw "Theme audit PNG size mismatch: $name" }
  $image = [System.Drawing.Image]::FromFile($path)
  try {
    if ($image.Width -ne $expectedThemeAuditPng[$name].width -or $image.Height -ne $expectedThemeAuditPng[$name].height) {
      throw "Theme audit PNG dimensions mismatch: $name"
    }
  } finally {
    $image.Dispose()
  }
}
$expectedAppliedChoiceAuditPng = @{
  'audit-applied-choices-horizontal-before.png' = @{ hash = '2EE5CB117B0BEEB6574C068944490CA98712B24C5C87D9FF7AE06D5ABEA004FC'; bytes = 38319; width = 2322; height = 278 }
  'audit-applied-choices-horizontal-full-before.png' = @{ hash = '27D22A0E91016FB65A5F7D85308EFFFD7FF2619F7332A8138CDFB1BE6396B10D'; bytes = 77549; width = 1440; height = 1200 }
  'audit-applied-choices-vertical-full-after.png' = @{ hash = '38DB06DBC82E50A175541F02C984881E8C0E49144BB27507F0BAECEDD46EAE11'; bytes = 71188; width = 1440; height = 1200 }
  'audit-applied-choices-vertical-detail.png' = @{ hash = '3A32453967F80EA062F473A4F4152A9DC30D27DD71BEEEB57B01751A566AC7D3'; bytes = 106315; width = 1440; height = 2000 }
  'audit-applied-choices-vertical-comparison.png' = @{ hash = 'DD593BB3AF3778B4D9E4B25161CD60B41CDE219A7A051E2ED3AD5DCEECBEE7A0'; bytes = 166411; width = 1920; height = 1200 }
}
foreach ($name in $expectedAppliedChoiceAuditPng.Keys) {
  $path = Join-Path $review $name
  if ((Get-FileHash -Algorithm SHA256 -LiteralPath $path).Hash -ne $expectedAppliedChoiceAuditPng[$name].hash) { throw "Raw-byte applied-choice audit PNG digest mismatch: $name" }
  if ((Get-Item -LiteralPath $path).Length -ne $expectedAppliedChoiceAuditPng[$name].bytes) { throw "Applied-choice audit PNG size mismatch: $name" }
  $image = [System.Drawing.Image]::FromFile($path)
  try {
    if ($image.Width -ne $expectedAppliedChoiceAuditPng[$name].width -or $image.Height -ne $expectedAppliedChoiceAuditPng[$name].height) {
      throw "Applied-choice audit PNG dimensions mismatch: $name"
    }
  } finally {
    $image.Dispose()
  }
}

$manifest = Get-Content -Raw $manifestPath
foreach ($id in @('review-index', 'record-read', 'record-create', 'record-edit', 'record-delete', 'screen-transition', 'accessibility', 'confirmation', 'dialog', 'wizard', 'dashboard', 'color-theme')) {
  if ($manifest -notmatch "(?m)^  - id: $id\r?$") { throw "Artifact manifest is missing ID: $id" }
}
foreach ($needle in @('pack_version: 0.2.0', 'capture_status: fixed', 'fallback_used: false', 'SHA-256 canonical UTF-8 text with LF line endings', 'SHA-256 raw-byte')) {
  if (-not $manifest.Contains($needle)) { throw "Artifact manifest is missing fixed identity: $needle" }
}
if ($manifest -notmatch '(?ms)^viewport:\s+width: 1440\s+height: 1200\s*$' -or $manifest -notmatch '(?ms)^png_dimensions:\s+width: 1440\s+height: 1200\s*$') {
  throw 'Artifact manifest viewport or PNG dimensions are not fixed at 1440x1200.'
}
foreach ($hash in $expectedText.Values) {
  if (-not $manifest.Contains($hash)) { throw "Artifact manifest is missing canonical text digest: $hash" }
}
foreach ($entry in $expectedPng.GetEnumerator()) {
  if (-not $manifest.Contains($entry.Value.hash) -or -not $manifest.Contains("png_size_bytes: $($entry.Value.bytes)")) {
    throw "Artifact manifest is missing raw PNG identity: $($entry.Key)"
  }
}

foreach ($name in $pages) {
  $text = Get-Content -Raw (Join-Path $review "$name.html")
  if ($text -notmatch '<link rel="stylesheet" href="styles\.css">') { throw "Missing local stylesheet: $name.html" }
  if ($text -match '(?i)https?://|<script|@import|fonts\.google|<img') { throw "External reference, script, or unsupported image found: $name.html" }
}
$wizardFlowReview = Get-Content -Raw (Join-Path $review 'wizard-flow-review.html')
foreach ($stylesheet in @('styles.css', 'wizard-flow-review.css')) {
  if ($wizardFlowReview -notmatch [regex]::Escape("<link rel=`"stylesheet`" href=`"$stylesheet`">")) {
    throw "Wizard flow review is missing local stylesheet: $stylesheet"
  }
}
if ($wizardFlowReview -match '(?i)https?://|<script|@import|fonts\.google|<img|style=') {
  throw 'Wizard flow review contains an external reference, script, unsupported image, or inline style.'
}
$css = Get-Content -Raw (Join-Path $review 'styles.css')
if ($css -match '(?i)https?://|@import|@font-face') { throw 'External CSS reference found.' }
$wizardFlowCss = Get-Content -Raw (Join-Path $review 'wizard-flow-review.css')
if ($wizardFlowCss -match '(?i)https?://|@import|@font-face') { throw 'External Wizard flow CSS reference found.' }
$themeTokenReview = Get-Content -Raw (Join-Path $review 'color-theme-token-review.html')
foreach ($stylesheet in @('styles.css', 'color-theme-token-review.css')) {
  if ($themeTokenReview -notmatch [regex]::Escape("<link rel=`"stylesheet`" href=`"$stylesheet`">")) {
    throw "Color/theme token review is missing local stylesheet: $stylesheet"
  }
}
if ($themeTokenReview -match '(?i)https?://|<script|@import|fonts\.google|<img|style=') {
  throw 'Color/theme token review contains an external reference, script, unsupported image, or inline style.'
}
foreach ($target in [regex]::Matches($themeTokenReview, 'href="([^"]+)"') | ForEach-Object { $_.Groups[1].Value }) {
  if ($target.StartsWith('#')) { continue }
  $resolvedTarget = Join-Path $review ($target -replace '/', [IO.Path]::DirectorySeparatorChar)
  if (-not (Test-Path -LiteralPath $resolvedTarget)) {
    throw "Color/theme token review contains a broken local link: $target"
  }
}
$themeTokenCss = Get-Content -Raw (Join-Path $review 'color-theme-token-review.css')
if ($themeTokenCss -match '(?i)https?://|@import|@font-face') { throw 'External Color/theme token CSS reference found.' }

$index = Get-Content -Raw (Join-Path $review 'review.html')
foreach ($name in $pages | Where-Object { $_ -notin @('review', 'color-theme') }) {
  if ($index -notmatch [regex]::Escape("href=`"$name.html`"")) { throw "Review index is missing page link: $name.html" }
}
if ($index -notmatch [regex]::Escape('href="color-theme-token-review.html"')) {
  throw 'Review index must link Color/theme to the current token review.'
}
$choiceGroupCountByPage = @{
  'record-read' = 2
  'record-create' = 1
  'record-edit' = 1
  'record-delete' = 0
  'screen-transition' = 0
  'accessibility' = 0
  'confirmation' = 0
  'dialog' = 0
  'wizard' = 0
  'dashboard' = 0
  'color-theme' = 1
}
if (-not $index.Contains('Its sections are stacked vertically.') -or -not $index.Contains('disabled radio rows show the available options and the value selected for the fixture')) {
  throw 'Review index does not explain the vertical applied-choice notes.'
}
foreach ($name in $pages | Where-Object { $_ -ne 'review' }) {
  $text = Get-Content -Raw (Join-Path $review "$name.html")
  if (-not $text.Contains('id="applied-choices" class="review-choices"') -or -not $text.Contains('Read-only review note outside the product UI')) {
    throw "Review page is missing an outside applied-choice note: $name.html"
  }
  $choices = [regex]::Match($text, '(?s)<aside id="applied-choices" class="review-choices".*?</aside>').Value
  foreach ($heading in @('Formal settings used', 'Pack defaults adopted', 'Product-supplied variables', 'Implementation choices in this fixture', 'Not exercised here')) {
    if (-not $choices.Contains("<h2>$heading</h2>")) { throw "Review page is missing the applied-choice category '$heading': $name.html" }
  }
  if (([regex]::Matches($choices, '<section class="review-choice-section">')).Count -ne 5) {
    throw "Review page must show the five applied-choice categories exactly once: $name.html"
  }
  if ($text -notmatch '(?s)</section>\s*<aside id="applied-choices" class="review-choices"') {
    throw "Applied choices must remain a sibling outside the product canvas: $name.html"
  }
  if (-not $choices.Contains('class="review-values"') -or -not $choices.Contains('class="review-fact-list"') -or -not $choices.Contains('class="review-treatment-list"')) {
    throw "Applied choices must separate supplied values, facts, and shown treatments: $name.html"
  }
  $choiceGroups = [regex]::Matches($choices, '(?s)<fieldset class="review-choice-group" disabled>.*?</fieldset>')
  if ($choiceGroups.Count -ne $choiceGroupCountByPage[$name]) {
    throw "Unexpected bounded choice-group count: $name.html"
  }
  foreach ($choiceGroup in $choiceGroups) {
    if (([regex]::Matches($choiceGroup.Value, '<input type="radio"')).Count -lt 2) {
      throw "A bounded choice group must show at least two options: $name.html"
    }
    if (([regex]::Matches($choiceGroup.Value, '<input type="radio"[^>]* checked>')).Count -ne 1 -or
        ([regex]::Matches($choiceGroup.Value, 'class="review-selected-label">Selected</strong>')).Count -ne 1) {
      throw "A bounded choice group must identify exactly one selected option: $name.html"
    }
  }
  if ($choiceGroups.Count -eq 0 -and $choices.Contains('<input type="radio"')) {
    throw "A review page without defined alternatives must not invent radio options: $name.html"
  }
  if ($text.Contains('class="fixture-strip"')) {
    throw "Review page contains evaluation or contract copy inside the product canvas: $name.html"
  }
  foreach ($prohibitedCopy in @(
    'Standard-pack application',
    'Focus behavior requires runtime verification',
    'This fixture demonstrates what a static review can observe',
    'The background is visually suppressed',
    'Options and their meaning are supplied by the product',
    'supplied as stable and linear by the product binding',
    'Prioritized product-supplied fixture records',
    'Same supplied unit and period across the series',
    'The supplied fixture consequence is shown before execution',
    'Read-only record detail remains identifiable behind the modal task',
    'A form with product-supplied changed values.',
    'Complete or cancel this bounded task'
  )) {
    if ($text.Contains($prohibitedCopy)) { throw "Review page contains prohibited evaluation copy '$prohibitedCopy': $name.html" }
  }
}

$read = Get-Content -Raw (Join-Path $review 'record-read.html')
$readCanvas = [regex]::Match($read, '(?s)<section class="canvas record-read-canvas".*(?=<aside id="applied-choices")').Value
if ($readCanvas -match '<input|<select|<textarea') { throw 'Read-only product UI must use readable label/value content, not form controls.' }
foreach ($needle in @('class="canvas record-read-canvas"', 'class="object-title-bar"', 'class="object-title-content"', 'class="object-reference"', 'class="record-detail-layout"', '<nav class="breadcrumb-nav" aria-label="Breadcrumb">', 'aria-current="page">Fixture record 01', '<dl class="read-description-list">', '<dl class="read-meta-list">', 'Pack defaults adopted', 'Unrelated fields do not fill equal-width cells', '<dt>Field priority</dt><dd>Identity only</dd>', 'One restrained grouped surface', 'Left of values', 'Secondary metadata uses a quieter inline group', '>Edit<', '>Delete<')) { if (-not $read.Contains($needle)) { throw "Read-only review is missing: $needle" } }
foreach ($prohibited in @('<dl class="description-list">', 'class="description-wide"', 'class="section-card"', 'class="read-grid"', 'class="read-item"', 'class="status"', '>Available<', 'Record identity and supplied attributes are readable content')) {
  if ($read.Contains($prohibited)) { throw "Read-only review reintroduced decorative or synthetic UI: $prohibited" }
}

$create = Get-Content -Raw (Join-Path $review 'record-create.html')
$edit = Get-Content -Raw (Join-Path $review 'record-edit.html')
foreach ($needle in @('Create record', '<nav class="breadcrumb-nav" aria-label="Breadcrumb">', 'class="single-column-form"', 'class="page-footer-actions"', '>Create<', 'Cancel', 'Example format: ABC-123.', 'Pack defaults adopted', 'Create appears before Cancel in source and Tab order', 'One shared height for single-line controls')) { if (-not $create.Contains($needle)) { throw "Create review is missing: $needle" } }
foreach ($needle in @('Edit Fixture record 01', '<nav class="breadcrumb-nav" aria-label="Breadcrumb">', 'Record ID: FIX-0001', 'class="single-column-form"', 'class="page-footer-actions"', '>Save<', 'Cancel', 'Pack defaults adopted', 'Save appears before Cancel in source and Tab order', 'Current identity in the page heading')) { if (-not $edit.Contains($needle)) { throw "Edit review is missing: $needle" } }
if ($create.IndexOf('>Create<') -gt $create.IndexOf('>Cancel<')) { throw 'Create must precede Cancel in source and Tab order.' }
if ($edit.IndexOf('>Save<') -gt $edit.IndexOf('>Cancel<')) { throw 'Save must precede Cancel in source and Tab order.' }
foreach ($prohibited in @('class="form-grid"', 'class="section-card"', 'class="fixture-strip"')) {
  if ($create.Contains($prohibited)) { throw "Create review reintroduced the rejected generic layout: $prohibited" }
  if ($edit.Contains($prohibited)) { throw "Edit review reintroduced the rejected generic layout: $prohibited" }
}
if ($edit -match 'class="identity-bar"|Change the supplied editable values') { throw 'Edit review reintroduced the ambiguous identity banner or explanatory UI copy.' }

$css = Get-Content -Raw (Join-Path $review 'styles.css')
foreach ($needle in @(
  '.object-title-bar { position: sticky;',
  '.object-title-content { display: flex;',
  '.record-read-canvas { min-height: 0;',
  '.record-read-canvas .screen-scroll { height: auto;',
  '.record-read-canvas .object-title-content { max-width: 760px;',
  '.record-detail-layout { max-width: 760px;',
  '.read-description-list > div { display: grid; grid-template-columns: 152px minmax(0, 1fr);',
  '.read-meta-list { display: flex; flex-wrap: wrap;',
  '.form-screen { display: flex; flex-direction: column; height: 818px;',
  '.page-footer-actions',
  '.single-column-form { display: grid;',
  '.field input, .field select, .field textarea { width: 100%; height: 40px;',
  '.review-choices',
  '.review-choice-sections { display: grid;',
  '.review-choice-options { display: grid;',
  '.review-option input[type="radio"]',
  '.page > .canvas { order: 1;',
  '.page > .review-choices { order: 2;',
  'background: #fff6cf;'
)) {
  if (-not $css.Contains($needle)) { throw "Review CSS is missing fixed density or action behavior: $needle" }
}

$delete = Get-Content -Raw (Join-Path $review 'record-delete.html')
$confirmation = Get-Content -Raw (Join-Path $review 'confirmation.html')
$dialog = Get-Content -Raw (Join-Path $review 'dialog.html')
foreach ($needle in @('aria-modal="true"', 'Delete Fixture record 01?', 'Delete record', 'Cancel')) { if (-not $delete.Contains($needle)) { throw "Delete review is missing: $needle" } }
if ($confirmation -notmatch 'Discard unsaved changes\?' -or $confirmation -match 'Delete record') { throw 'Consequential confirmation must be distinct from destructive deletion.' }
foreach ($needle in @('Choose a fixture value', 'Apply value', 'Cancel', 'aria-modal="true"')) { if (-not $dialog.Contains($needle)) { throw "Dialog review is missing: $needle" } }

$transition = Get-Content -Raw (Join-Path $review 'screen-transition.html')
foreach ($needle in @('<nav class="breadcrumb-nav" aria-label="Breadcrumb">', '<ol>', 'aria-current="page">Fixture item', 'Current destination', 'Related destinations', 'Pack defaults adopted', 'Breadcrumb hierarchy appears below the Header and above the page title', 'Not exercised here')) { if (-not $transition.Contains($needle)) { throw "Transition review is missing: $needle" } }
if ($transition -match 'Search results|Record details|Edit record|class="flow-line"|class="flow-node"|class="flow-arrow"') { throw 'Transition review reintroduced the record-lifecycle-specific flow diagram.' }

$accessibility = Get-Content -Raw (Join-Path $review 'accessibility.html')
foreach ($needle in @('(required)', '☑ Fixture record 01', 'There is one error', 'demonstrated-focus')) { if (-not $accessibility.Contains($needle)) { throw "Accessibility review is missing: $needle" } }
if ($accessibility -match '>Selected<|✓ Selected') { throw 'Accessibility review reintroduced synthetic Selected status copy.' }
if ($accessibility.IndexOf('>Save<') -gt $accessibility.IndexOf('>Cancel<')) { throw 'Accessibility page-action example must place Save before Cancel in source and Tab order.' }
if (-not $accessibility.Contains('Pack defaults adopted') -or -not $accessibility.Contains('Save before Cancel')) { throw 'Accessibility review must identify the applied page action order.' }

$wizard = Get-Content -Raw (Join-Path $review 'wizard.html')
foreach ($needle in @('<nav class="breadcrumb-nav" aria-label="Breadcrumb">', 'Step 2 of 4', 'aria-current="step"', 'class="single-column-form"', '>Back<', '>Continue<', '>Review<', '>Complete<')) { if (-not $wizard.Contains($needle)) { throw "Wizard review is missing: $needle" } }

$wizardInputState = [regex]::Match($wizardFlowReview, '(?s)<article class="state-specimen" aria-labelledby="input-state-title">.*?(?=<article class="state-specimen" aria-labelledby="review-state-title">)').Value
$wizardReviewState = [regex]::Match($wizardFlowReview, '(?s)<article class="state-specimen" aria-labelledby="review-state-title">.*?(?=<article class="state-specimen" aria-labelledby="result-state-title">)').Value
$wizardResultState = [regex]::Match($wizardFlowReview, '(?s)<article class="state-specimen" aria-labelledby="result-state-title">.*?</article>').Value
foreach ($state in @($wizardInputState, $wizardReviewState, $wizardResultState)) {
  if ([string]::IsNullOrWhiteSpace($state)) { throw 'Wizard flow review is missing one of the three fixed states.' }
}
foreach ($needle in @('Step 2 of 3', 'Basic information', 'Details', 'Review and submit', 'aria-current="step"', '>Back<', '>Continue<')) {
  if (-not $wizardInputState.Contains($needle)) { throw "Wizard input state is missing: $needle" }
}
foreach ($needle in @('Step 3 of 3', 'Review and submit', 'aria-current="step"', 'aria-label="Change basic information"', 'aria-label="Change details"', '>Change<', '>Back<', '>Submit setup<')) {
  if (-not $wizardReviewState.Contains($needle)) { throw "Wizard review-and-submit state is missing: $needle" }
}
if ($wizardReviewState -match '>Continue<' -or $wizardFlowReview -match '>OK<' -or $wizardFlowReview -match '<strong>Complete</strong>') {
  throw 'Wizard flow review uses an ordinary advance, generic OK, or predicted Complete step where a final action is required.'
}
foreach ($needle in @('State 3 · After submission', 'Fixture setup submitted', 'Reference', 'FIX-WZ-0001', 'What happens next', 'Return to guided tasks')) {
  if (-not $wizardResultState.Contains($needle)) { throw "Wizard result state is missing: $needle" }
}
if ($wizardResultState -match 'wizard-review-steps|>Back<|>Continue<|>Next<|>Submit<|>Submit setup<') {
  throw 'Wizard result state must not retain the pre-submit indicator or Back/advance/final-submit actions.'
}
foreach ($needle in @('Review and submit as the final numbered step', 'Submission result outside the pre-submit step indicator', 'Preview because no rendered or generated output is supplied', 'pending, partial, and failure states')) {
  if (-not $wizardFlowReview.Contains($needle)) { throw "Wizard flow review note is missing a decision or evidence limit: $needle" }
}
foreach ($needle in @('.wizard-flow-review', '.wizard-review-steps', '.review-summary', '.result-summary', '.wizard-state-actions')) {
  if (-not $wizardFlowCss.Contains($needle)) { throw "Wizard flow review CSS is missing: $needle" }
}

$dashboard = Get-Content -Raw (Join-Path $review 'dashboard.html')
foreach ($needle in @('Attention queue', 'Completed trend', 'fixture timestamp', 'Items in current period')) { if (-not $dashboard.Contains($needle)) { throw "Dashboard review is missing: $needle" } }

$theme = Get-Content -Raw (Join-Path $review 'color-theme.html')
$themeCanvas = [regex]::Match($theme, '(?s)<section class="canvas".*(?=<aside id="applied-choices")').Value
foreach ($needle in @('Light and dark application modes', 'class="theme-specimen light-mode"', 'class="theme-specimen dark-mode"', 'Pack defaults adopted', 'Both Light and Dark modes are required', 'Success, information, warning, error, background, accent, focus, selection, and text roles remain visible')) { if (-not $theme.Contains($needle)) { throw "Fixed historical theme review is missing: $needle" } }
foreach ($needle in @('Fixture item A', 'Primary text', 'Muted text', 'Validation error', 'Focus sample', 'Secondary', 'Success', 'Information', 'Warning', 'Completed', 'New note', 'Review soon', 'Fix now', 'Page layer', 'Card layer', 'Keyboard target', 'Text link')) {
  if (([regex]::Matches($themeCanvas, [regex]::Escape($needle))).Count -ne 2) { throw "Light and dark specimens must exercise the same semantic content: $needle" }
}
foreach ($needle in @('class="theme-hero"', 'class="theme-summary"', 'class="theme-palette"', 'class="theme-swatch success"', 'class="theme-swatch info"', 'class="theme-swatch warning"', 'class="theme-swatch error"', 'class="theme-swatch background"', 'class="theme-swatch surface"', 'class="theme-swatch accent"', 'class="theme-swatch focus"', 'class="theme-error"', 'demonstrated-focus', 'class="theme-selected-row"', 'class="theme-text-link"')) {
  if (([regex]::Matches($themeCanvas, [regex]::Escape($needle))).Count -ne 2) { throw "Light and dark specimens must each exercise the semantic palette or focus cue: $needle" }
}
foreach ($needle in @('--theme-success:', '--theme-info:', '--theme-warning:', '--theme-error:', '--theme-focus:', '.theme-palette', '.theme-actions .demonstrated-focus', '.dark-mode .theme-swatch.accent')) {
  if (-not $css.Contains($needle)) { throw "Theme CSS is missing a required semantic role or visible-state treatment: $needle" }
}
if ($theme -match '(?s)<header>\s*<span>Light</span>\s*<strong[^>]*>Workspace</strong>|<header>\s*<span>Dark</span>\s*<strong[^>]*>Workspace</strong>') {
  throw 'Theme specimen reintroduced the reversed theme-left/title-right Header.'
}
if ($theme -match 'one restrained light-theme|class="swatches"|class="theme-state"') { throw 'Theme review reintroduced the rejected light-only swatch fixture.' }
if ($theme -match '>Selected item<') { throw 'Theme review reintroduced synthetic Selected copy.' }

$themeRoles = @(
  'page_background',
  'surface_background',
  'text_primary',
  'text_muted',
  'border_subtle',
  'border_interactive',
  'action_background',
  'action_foreground',
  'link',
  'selection_background',
  'selection_foreground',
  'selection_indicator',
  'focus_ring',
  'success_foreground',
  'success_background',
  'information_foreground',
  'information_background',
  'warning_foreground',
  'warning_background',
  'error_foreground',
  'error_background'
)
$themeDefaultPath = Join-Path $root 'templates/business-app/design-manifest/configuration/theme-colors.default.yaml'
$themeDefault = Get-Content -Raw $themeDefaultPath
if (([regex]::Matches($themeTokenReview, '<tr><th scope="row">')).Count -ne $themeRoles.Count) {
  throw "Color/theme token review must list exactly $($themeRoles.Count) semantic roles."
}
foreach ($mode in @('light', 'dark')) {
  $modeBlock = [regex]::Match($themeDefault, "(?ms)^  ${mode}:\r?\n(.*?)(?=^  (?:light|dark):|\z)").Groups[1].Value
  if ([string]::IsNullOrWhiteSpace($modeBlock)) { throw "Theme default is missing mode: $mode" }
  foreach ($role in $themeRoles) {
    $valueMatch = [regex]::Match($modeBlock, "(?m)^    ${role}: `"(?<value>#[0-9A-F]{6})`"\r?$")
    if (-not $valueMatch.Success) { throw "Theme default is missing strict value: $mode.$role" }
    $value = $valueMatch.Groups['value'].Value
    $tablePattern = '<span class="token-swatch ' + $mode + '-' + ($role -replace '_', '-') + '" aria-hidden="true"></span><code>' + $value + '</code>'
    if (-not $themeTokenReview.Contains($tablePattern)) {
      throw "Color/theme token table does not match default: $mode.$role"
    }
    $cssRole = $role -replace '_', '-'
    if (-not $themeTokenCss.Contains("--theme-${cssRole}: $value;")) {
      throw "Color/theme specimen CSS does not match default: $mode.$role"
    }
  }
}
foreach ($needle in @('Fixed roles, editable concrete values', 'theme_colors.light', 'theme_colors.dark', 'Canonical pack defaults', 'One local theme-color override', 'Header or host-shell placement, caption, icon, and interaction model', 'Arbitrary in-application color editing', 'These are fixed comparisons, not theme-selection controls.')) {
  if (-not $themeTokenReview.Contains($needle)) { throw "Color/theme token review is missing contract evidence: $needle" }
}
foreach ($needle in @('class="token-theme light-token-theme"', 'class="token-theme dark-token-theme"', 'class="token-selected-item"', 'class="token-status success"', 'class="token-status information"', 'class="token-status warning"', 'class="token-status error"')) {
  $expectedCount = if ($needle -match 'light-token-theme|dark-token-theme') { 1 } else { 2 }
  if (([regex]::Matches($themeTokenReview, [regex]::Escape($needle))).Count -ne $expectedCount) {
    throw "Color/theme token review has an unexpected applied-role count: $needle"
  }
}
if (([regex]::Matches($themeTokenReview, 'token-focus-sample')).Count -ne 2) {
  throw 'Color/theme token review must show one visible focus sample in each mode.'
}
if ($themeTokenReview -match 'class="theme-mode-picker"|class="theme-mode-options"|<span>Theme</span>|aria-label="Theme"|<button[^>]*>\s*(Light|Dark|Theme)\s*</button>') {
  throw 'Color/theme token review must not own a Header theme-selection control or visible Theme caption.'
}
foreach ($prohibitedCopy in @('Semantic roles in context', 'Supporting content remains readable', '>Primary action<', '>Focus sample<', '>Text link<')) {
  if ($themeTokenReview.Contains($prohibitedCopy)) {
    throw "Color/theme product specimen contains review or demonstration copy: $prohibitedCopy"
  }
}
foreach ($header in [regex]::Matches($themeTokenReview, '(?s)<header class="token-product-header">.*?</header>')) {
  if ($header.Value -match '<button|<input|<select|Theme|Light|Dark') {
    throw 'Color/theme product specimen Header contains a theme-selection control.'
  }
}
foreach ($needle in @('.light-token-theme', '.dark-token-theme', '.token-table', '.token-product-header', '.token-selected-item', '.token-focus-sample', '.token-status.success', '.token-status.information', '.token-status.warning', '.token-status.error')) {
  if (-not $themeTokenCss.Contains($needle)) { throw "Color/theme token CSS is missing: $needle" }
}

$captureScript = Get-Content -Raw (Join-Path $review 'capture.ps1')
foreach ($needle in @('C:\Program Files\Google\Chrome\Application\chrome.exe', "'--disable-gpu'", "'--use-angle=swiftshader'")) {
  if (-not $captureScript.Contains($needle)) { throw "Capture script is missing required Chrome option: $needle" }
}
if ($captureScript -match '(?i)msedge|edge\.exe') { throw 'Capture script must not use Edge.' }

$captureRecord = Get-Content -Raw $captureRecordPath | ConvertFrom-Json
if ($captureRecord.browser.executable -ne 'C:\Program Files\Google\Chrome\Application\chrome.exe') { throw 'Capture record Chrome executable mismatch.' }
if ($captureRecord.browser.version -ne '150.0.7871.187') { throw 'Capture record Chrome version mismatch.' }
if ($captureRecord.viewport.width -ne 1440 -or $captureRecord.viewport.height -ne 1200) { throw 'Capture record viewport mismatch.' }
if ($captureRecord.captures.Count -ne 12) { throw 'Capture record must contain 12 surfaces.' }
foreach ($capture in $captureRecord.captures) {
  if ($capture.normal_exit_code -ne 0 -or $capture.fallback_used -ne $false) { throw "Capture was not a successful normal-only run: $($capture.page)" }
  if ($capture.normal_command -notcontains '--disable-gpu') { throw "Capture command is missing --disable-gpu: $($capture.page)" }
  if ($capture.png_width -ne 1440 -or $capture.png_height -ne 1200) { throw "Capture record dimensions mismatch: $($capture.page)" }
  $expectedCapture = $expectedPng["$($capture.page).png"]
  if ($null -eq $expectedCapture -or $capture.png_sha256_raw_byte -ne $expectedCapture.hash -or $capture.png_size_bytes -ne $expectedCapture.bytes) {
    throw "Capture record raw PNG identity mismatch: $($capture.page)"
  }
}

$implementationRecord = Get-Content -Raw $implementationRecordPath
if ($implementationRecord -notmatch '(?s)^---\s*\r?\n.*?\r?\n---\s*\r?\n') { throw 'Implementation record front matter is invalid.' }
foreach ($needle in @('does not add a runtime, validator, DSL', 'single-column', 'persistent footer', 'both required theme modes', 'do not prove keyboard behavior')) {
  if (-not $implementationRecord.Contains($needle)) { throw "Implementation record is missing boundary: $needle" }
}

$screenReview = Get-Content -Raw (Join-Path $review 'screen-review.md')
foreach ($needle in @('Direct visual review used all 12 fixed PNGs', 'No unresolved P0 or P1', 'remain `UNCONFIRMED`')) {
  if (-not $screenReview.Contains($needle)) { throw "Screen review is missing finding or evidence limit: $needle" }
}

$independentReview = Get-Content -Raw (Join-Path $review 'independent-review.md')
foreach ($needle in @('One P2 finding remained', 'A different reviewer task', 'no P0, P1, P2, or P3 finding')) {
  if (-not $independentReview.Contains($needle)) { throw "Independent review record is missing history or result: $needle" }
}

Write-Output 'Business-workflow static HTML review checks passed. Fixed HTML: 12. Fixed PNG: 12. Supplementary Wizard state HTML: 1. Supplementary Color/theme token HTML: 1. Canonical text digests: 17. Raw-byte PNG digests: 12. Manifest/capture identities: 12. Theme roles rendered: 21 per mode. Theme audit PNGs: 5. Applied-choice audit PNGs: 5. External references in HTML/CSS: 0.'
