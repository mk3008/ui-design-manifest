$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$pack = Join-Path $root 'templates/business-app/design-manifest'

$required = @(
  'variability.md',
  'foundations/accessible-work-surface.md',
  'foundations/color-and-theme.md',
  'configuration/theme-colors.md',
  'configuration/theme-colors.default.yaml',
  'components/breadcrumb.md',
  'components/header.md',
  'components/page-header.md',
  'components/environment-notice.md',
  'components/record-fields.md',
  'components/dialog.md',
  'components/confirmation.md',
  'components/step-indicator.md',
  'components/dashboard-panel.md',
  'policies/confirm-consequential-action.md',
  'policies/confirm-destructive-action.md',
  'screen-patterns/record-detail.md',
  'screen-patterns/record-create.md',
  'screen-patterns/record-edit.md',
  'screen-patterns/record-delete.md',
  'screen-patterns/wizard.md',
  'screen-patterns/dashboard.md',
  'flows/record-lifecycle.md',
  'flows/screen-transition.md',
  'flows/wizard-progress.md'
)

foreach ($relative in $required) {
  if (-not (Test-Path -LiteralPath (Join-Path $pack $relative))) {
    throw "Missing business-workflow concept: $relative"
  }
}

$indexContracts = [ordered]@{
  'foundations/index.md' = @('accessible-work-surface.md', 'color-and-theme.md')
  'components/index.md' = @('breadcrumb.md', 'header.md', 'page-header.md', 'environment-notice.md', 'record-fields.md', 'dialog.md', 'confirmation.md', 'step-indicator.md', 'dashboard-panel.md')
  'policies/index.md' = @('confirm-consequential-action.md', 'confirm-destructive-action.md')
  'screen-patterns/index.md' = @('record-detail.md', 'record-create.md', 'record-edit.md', 'record-delete.md', 'wizard.md', 'dashboard.md')
  'flows/index.md' = @('record-lifecycle.md', 'screen-transition.md', 'wizard-progress.md')
}

$indexLinks = 0
foreach ($index in $indexContracts.Keys) {
  $text = Get-Content -Raw (Join-Path $pack $index)
  foreach ($target in $indexContracts[$index]) {
    if (-not $text.Contains("($target)")) { throw "$index does not link to $target" }
    $indexLinks += 1
  }
}
$componentIndex = Get-Content -Raw (Join-Path $pack 'components/index.md')
if (-not $componentIndex.Contains('Name a consequential action and its supplied consequence with a safe alternative.')) {
  throw 'Confirmation index summary must describe the pre-action consequence and safe alternative.'
}
if ($componentIndex -match '(?i)Confirmation.*outcome') {
  throw 'Confirmation index summary must not own the post-action outcome.'
}

$detail = (Get-Content -Raw (Join-Path $pack 'screen-patterns/record-detail.md')) -replace '\s+', ' '
foreach ($needle in @(
  'readable content',
  'not disabled edit controls',
  'bounded, compact, one-column description list',
  'short and stable captions may sit to the left',
  'Stack captions above values',
  'Do not distribute unrelated fields across equal-width cells',
  'One restrained details surface',
  'without internal field cards',
  'non-finalizing actions such as Edit or Delete in the page header',
  'keep the title and available global actions reachable while the content scrolls',
  'Editing and deletion are not implied'
)) {
  if (-not $detail.Contains($needle)) { throw "Read-only record contract is missing: $needle" }
}

$compact = (Get-Content -Raw (Join-Path $pack 'foundations/compact-work-surface.md')) -replace '\s+', ' '
foreach ($needle in @('supplied importance through a restrained type hierarchy', 'Do not put every field in its own card', 'bounded reading measure', 'equal-width cells simply to consume available space', 'one consistent single-line control height', 'one consistent heading group', 'supporting description on the next line', 'count or status that directly qualifies the heading')) {
  if (-not $compact.Contains($needle)) { throw "Compact work-surface contract is missing: $needle" }
}

$recordFields = (Get-Content -Raw (Join-Path $pack 'components/record-fields.md')) -replace '\s+', ' '
foreach ($needle in @('foundations/compact-work-surface', 'read-only operational detail at desktop width', 'captions are short', 'Return to labels above values', 'not a per-field choice or local setting', 'For create and edit controls, place the label above', 'I-shaped single-column reading path', 'explicitly groups them as a related value set', 'one shared height for text inputs, select controls')) {
  if (-not $recordFields.Contains($needle)) { throw "Record-field layout contract is missing: $needle" }
}

$create = (Get-Content -Raw (Join-Path $pack 'screen-patterns/record-create.md')) -replace '\s+', ' '
foreach ($needle in @('single-column default', 'persistent footer action region', 'must not obscure the last field', 'put Create before Cancel in source', 'Do not move initial focus to Cancel', 'not local configuration')) {
  if (-not $create.Contains($needle)) { throw "Record-create action or layout contract is missing: $needle" }
}

$edit = (Get-Content -Raw (Join-Path $pack 'screen-patterns/record-edit.md')) -replace '\s+', ' '
foreach ($needle in @('ambiguous information or success banner', 'single-column default', 'persistent footer action region', 'put Save before Cancel in source', 'Do not move initial focus to Cancel', 'not local configuration', 'save-success message is an outcome after Save')) {
  if (-not $edit.Contains($needle)) { throw "Record-edit action or identity contract is missing: $needle" }
}

$breadcrumb = (Get-Content -Raw (Join-Path $pack 'components/breadcrumb.md')) -replace '\s+', ' '
foreach ($needle in @('below the global Header', 'above the page title', 'stable multi-level application hierarchy', 'Each ancestor is a link', 'mark it current, and do not make it a link', 'one product-wide policy', 'not visit history', 'Do not show Breadcrumb and Back together by default', 'navigation landmark and an ordered list')) {
  if (-not $breadcrumb.Contains($needle)) { throw "Breadcrumb contract is missing: $needle" }
}

$pageHeader = (Get-Content -Raw (Join-Path $pack 'components/page-header.md')) -replace '\s+', ' '
foreach ($needle in @('one page title', 'global Header identifies the product or workspace', 'optional description', 'Do not invent an uppercase category, kicker, eyebrow, or overline', 'product supplies its meaning')) {
  if (-not $pageHeader.Contains($needle)) { throw "Page-header contract is missing: $needle" }
}

$header = (Get-Content -Raw (Join-Path $pack 'components/header.md')) -replace '\s+', ' '
foreach ($needle in @('default common-shell region', 'Header identifies the application or workspace', 'available Drawer', 'leading Header area', 'does not make the Drawer', 'not a duplicate page header', 'theme-selection control here only when the product binding declares', 'Use `surface_background` for its background', 'Do not introduce a separate brand, dark, or literal Header color', 'Apply the resolved `text_primary` foreground to the Header itself', 'shared-shell root that contains the page and Header', 'logical end of the Header', 'do not add a visible `Theme` caption')) {
  if (-not $header.Contains($needle)) { throw "Header contract is missing: $needle" }
}

$environmentNotice = (Get-Content -Raw (Join-Path $pack 'components/environment-notice.md')) -replace '\s+', ' '
foreach ($needle in @('current environment changes user expectations', 'This is not a generic watermark', 'PoC provenance belongs outside the product canvas', 'discernible text label', 'cannot rely on color, opacity, or a background image alone')) {
  if (-not $environmentNotice.Contains($needle)) { throw "Environment-notice contract is missing: $needle" }
}

$searchConditions = (Get-Content -Raw (Join-Path $pack 'components/search-conditions.md')) -replace '\s+', ' '
foreach ($needle in @('resolves a search action region', 'complete action group', 'dedicated condition-action toolbar directly', 'separate structural row', 'default `end` region', 'right edge with the condition region''s right edge', '`justify-content: flex-end`', '`align-items` only for vertical alignment', 'source/tab order and visual order', 'render Search followed by Clear', 'not a new setting', 'concise group caption', 'group description is optional', 'does not require a fieldset border')) {
  if (-not $searchConditions.Contains($needle)) { throw "Search-action placement contract is missing: $needle" }
}

$resultGrid = (Get-Content -Raw (Join-Path $pack 'components/result-grid.md')) -replace '\s+', ' '
foreach ($needle in @('one compact summary immediately above the grid', 'immediately after the result title on the same heading line', 'Do not show a query or filter summary by default', 'binding supplies an applied-query summary', 'one product-declared attribute in each ordinary grid cell', 'composite cell only when it supplies the constituent attributes', 'stable, human-recognizable primary identifier or title', 'leading identity cell as the record-opening link', 'second trailing `Details` link', 'tone-distinct header row', 'apply those exact values to the header row', '`surface_background` and `text_primary`', 'every ordinary body cell as an opaque data surface', '`background-color: var(--surface-background)`', '`color: var(--text-primary)`', 'each `tbody td`', '`background-color: var(--table-header-background)`', 'each `thead th`', 'horizontal row separator', 'Keep ordinary grid cells free of vertical dividers by default', 'Place the grid directly in its assigned content region', 'acts on the visible result collection', 'result grid''s adjacent toolbar or action zone', 'logical end of that result-summary action zone', 'page-level scope', 'lower-emphasis outlined or tertiary button treatment')) {
  if (-not $resultGrid.Contains($needle)) { throw "Result-grid hierarchy or open-record contract is missing: $needle" }
}

$pagination = (Get-Content -Raw (Join-Path $pack 'components/pagination.md')) -replace '\s+', ' '
foreach ($needle in @('plain page number together with Previous and Next controls', 'Do not prefix that number with `Current`, `現在`', 'neighboring page-number buttons', 'random-access page model', 'pagination_region')) {
  if (-not $pagination.Contains($needle)) { throw "Pagination default contract is missing: $needle" }
}

$screenTransition = (Get-Content -Raw (Join-Path $pack 'flows/screen-transition.md')) -replace '\s+', ' '
foreach ($needle in @('application hierarchy, visit history, task progression, and mutation', 'An origin may be absent for direct entry', 'linked ancestors', 'they are not a list of visited screens', 'preserve a supplied draft or apply the abandonment confirmation contract', 'Browser Back must not repeat')) {
  if (-not $screenTransition.Contains($needle)) { throw "Screen-transition contract is missing: $needle" }
}

$dialog = (Get-Content -Raw (Join-Path $pack 'components/dialog.md')) -replace '\s+', ' '
foreach ($needle in @('background inert', 'keyboard focus within the dialog', 'support Escape', 'return focus')) {
  if (-not $dialog.Contains($needle)) { throw "Dialog interaction contract is missing: $needle" }
}

$accessible = (Get-Content -Raw (Join-Path $pack 'foundations/accessible-work-surface.md')) -replace '\s+', ' '
foreach ($needle in @('keyboard reachable', 'focus indicator', 'color alone', 'A screenshot cannot prove')) {
  if (-not $accessible.Contains($needle)) { throw "Accessibility boundary is missing: $needle" }
}

$theme = (Get-Content -Raw (Join-Path $pack 'foundations/color-and-theme.md')) -replace '\s+', ' '
foreach ($needle in @('semantic role', 'page and raised surfaces', 'result-grid header surface and foreground', 'result grid''s ordinary body uses `surface_background`', 'workspace uses `page_background`', 'action foreground and background', 'selection foreground, background, and indicator', 'visible focus', 'success', 'information', 'warning', 'error', 'color as the only cue', 'brand color separate', 'requires both `light` and `dark` modes', '`light-only`, `dark-only`, or `selectable`', 'use `light` as the initial mode', 'editable concrete values', 'Header or host-shell contract', 'does not decide whether a theme-selection control appears', '`system` resolves to one of the two required palettes', 'manifest-owned configuration', 'does not own or override the concrete role values', 'product binding')) {
  if (-not $theme.Contains($needle)) { throw "Color and theme boundary is missing: $needle" }
}

$recordLifecycle = (Get-Content -Raw (Join-Path $pack 'flows/record-lifecycle.md')) -replace '\s+', ' '
foreach ($needle in @('read', 'create', 'edit', 'delete', 'product binding')) {
  if (-not $recordLifecycle.Contains($needle)) { throw "Record lifecycle contract is missing: $needle" }
}

$wizard = (Get-Content -Raw (Join-Path $pack 'screen-patterns/wizard.md')) -replace '\s+', ' '
foreach ($needle in @('three or more', 'Back and ordinary advance actions', 'review step', 'consequence-specific final action', 'do not use generic `OK`', 'Completion feedback is separate', 'Failure must not be presented as completion', 'nonlinear')) {
  if (-not $wizard.Contains($needle)) { throw "Wizard contract is missing: $needle" }
}
$stepIndicator = (Get-Content -Raw (Join-Path $pack 'components/step-indicator.md')) -replace '\s+', ' '
foreach ($needle in @('final numbered step before submission', 'Do not add `Complete`, `Success`, or `Result` as a pending numbered step', 'show the supplied success, pending, partial, or failure outcome as a separate state')) {
  if (-not $stepIndicator.Contains($needle)) { throw "Step-indicator outcome boundary is missing: $needle" }
}
$wizardProgress = (Get-Content -Raw (Join-Path $pack 'flows/wizard-progress.md')) -replace '\s+', ' '
foreach ($needle in @('review, final submission, and result separate', 'not another numbered step', 'rather than generic `OK`', 'prevent duplicate execution', 'Only a confirmed success', 'does not keep the pre-submit step indicator or Back/Next actions')) {
  if (-not $wizardProgress.Contains($needle)) { throw "Wizard progress contract is missing: $needle" }
}

$dashboard = (Get-Content -Raw (Join-Path $pack 'screen-patterns/dashboard.md')) -replace '\s+', ' '
foreach ($needle in @('time scope', 'freshness', 'metrics, queues, and trends', 'smallest useful')) {
  if (-not $dashboard.Contains($needle)) { throw "Dashboard contract is missing: $needle" }
}

$manifest = Get-Content -Raw (Join-Path $pack 'manifest.md')
if ($manifest -notmatch '(?m)^pack_version: 0\.2\.0\r?$') { throw 'Manifest must identify pack version 0.2.0.' }
if (-not $manifest.Contains('[fixed and variable responsibility map](variability.md)')) { throw 'Manifest must link the fixed and variable responsibility map.' }
$readme = (Get-Content -Raw (Join-Path $root 'templates/business-app/README.md')) -replace '\s+', ' '
foreach ($needle in @('Version 0.2.0 adoption', 'five record-list setting IDs, defaults, allowed values, and', 'editable Light and Dark semantic color values', 'Existing record-list setting values require no conversion', 'one explicit theme-color override')) {
  if (-not $readme.Contains($needle)) { throw "Pack adoption guidance is missing: $needle" }
}

$variability = (Get-Content -Raw (Join-Path $pack 'variability.md')) -replace '\s+', ' '
foreach ($needle in @('five IDs', 'separate bounded configuration', 'Both light and dark modes are required', 'result-grid header', 'success, information, warning, and error roles', 'concrete `#RRGGBB` defaults are locally editable', 'user-selection capability', '`light-only`, `dark-only`, and `selectable`', 'logical end without a visible `Theme` caption', 'Use one page title for the current task/destination', 'persistent textual environment indication', 'do not use a decorative watermark as the only cue', 'Read-only desktop details use compact left-caption rows', 'create/edit labels sit above controls', 'without spreading unrelated fields across equal-width cells', 'use left captions for short-caption desktop scanning', 'importance, promoted facts', 'Create then safe cancellation', 'Save then cancellation', 'concise unboxed group caption', 'separate action row', 'tone-distinct header with horizontal row separators', 'plain current-page number plus Previous and Next controls', '| Breadcrumb |', '| Page header |', '| Environment notice |', '| Record read |', '| Record create |', '| Record edit |', '| Record delete |', '| Wizard |', '| Dashboard |', '| Color and theme |', 'local overrides cannot perform that move')) {
  if (-not $variability.Contains($needle)) { throw "Variability map is missing a responsibility boundary: $needle" }
}

$definition = Get-Content -Raw (Join-Path $pack 'configuration/record-list-options.md')
$settingIds = [regex]::Matches($definition, '(?m)^  - id: ([a-z0-9_]+)\r?$')
if ($settingIds.Count -ne 5) { throw "Expected the existing five record-list configuration IDs; found $($settingIds.Count)." }
$configurationIndex = (Get-Content -Raw (Join-Path $pack 'configuration/index.md')) -replace '\s+', ' '
foreach ($needle in @('Theme colors', 'Theme color defaults', 'separate definitions', 'bounded role-value configuration', 'product binding', 'Header/host-shell and implementation decisions')) {
  if (-not $configurationIndex.Contains($needle)) { throw "Configuration boundary is missing: $needle" }
}

$themeRoleIds = @(
  'page_background',
  'surface_background',
  'table_header_background',
  'table_header_foreground',
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

function Read-ThemeColorLines([string[]]$lines, [string]$rootKey, [string]$label) {
  $result = [ordered]@{
    light = [ordered]@{}
    dark = [ordered]@{}
  }
  $inside = $false
  $currentMode = $null
  foreach ($line in $lines) {
    if ($line -eq "${rootKey}:") {
      if ($inside) { throw "Duplicate theme-color root in $label" }
      $inside = $true
      continue
    }
    if (-not $inside) { continue }
    if ($line -match '^  (light|dark):$') {
      $currentMode = $Matches[1]
      continue
    }
    if ($line -match '^    ([a-z0-9_]+): "([^"]*)"$') {
      if ($null -eq $currentMode) { throw "Theme-color value appears before a mode in $label" }
      $role = $Matches[1]
      $value = $Matches[2]
      if ($result[$currentMode].Contains($role)) { throw "Duplicate theme-color role '$role' in $label" }
      $result[$currentMode][$role] = $value
      continue
    }
    if (-not [string]::IsNullOrWhiteSpace($line)) {
      throw "Unsupported theme-color syntax after ${rootKey}: '$line' in $label"
    }
  }
  if (-not $inside) { throw "Missing ${rootKey}: in $label" }
  return $result
}

function Read-ThemeColorMap([string]$path, [string]$rootKey) {
  return Read-ThemeColorLines (Get-Content -LiteralPath $path) $rootKey $path
}

function Assert-ThemeColorMap(
  [System.Collections.IDictionary]$map,
  [bool]$requireComplete,
  [string]$label
) {
  $valueCount = 0
  foreach ($mode in @('light', 'dark')) {
    if ($requireComplete -and $map[$mode].Count -ne $themeRoleIds.Count) {
      throw "$label mode '$mode' must define exactly $($themeRoleIds.Count) roles."
    }
    foreach ($role in $themeRoleIds) {
      if ($requireComplete -and -not $map[$mode].Contains($role)) {
        throw "$label '$mode' is missing role: $role"
      }
    }
    foreach ($role in $map[$mode].Keys) {
      if ($role -notin $themeRoleIds) { throw "$label '$mode' contains unknown role: $role" }
      if ($map[$mode][$role] -cnotmatch '^#[0-9A-F]{6}$') {
        throw "$label '$mode.$role' must use uppercase opaque #RRGGBB."
      }
      $valueCount += 1
    }
  }
  if (-not $requireComplete -and $valueCount -eq 0) {
    throw "$label must replace at least one concrete value."
  }
  return $valueCount
}

function Assert-SingleThemeOverrideSelection([string[]]$selectedPaths) {
  if ($selectedPaths.Count -gt 1) {
    throw 'Multiple selected theme-color overrides conflict.'
  }
}

function Assert-Rejected([scriptblock]$action, [string]$label) {
  $rejected = $false
  try {
    & $action | Out-Null
  } catch {
    $rejected = $true
  }
  if (-not $rejected) { throw "Theme negative case was not rejected: $label" }
}

function Convert-HexToRelativeLuminance([string]$hex) {
  if ($hex -cnotmatch '^#[0-9A-F]{6}$') { throw "Theme color must use uppercase opaque #RRGGBB: $hex" }
  $channels = @(
    ([Convert]::ToInt32($hex.Substring(1, 2), 16) / 255.0)
    ([Convert]::ToInt32($hex.Substring(3, 2), 16) / 255.0)
    ([Convert]::ToInt32($hex.Substring(5, 2), 16) / 255.0)
  )
  $linear = foreach ($channel in $channels) {
    if ($channel -le 0.04045) { $channel / 12.92 }
    else { [Math]::Pow((($channel + 0.055) / 1.055), 2.4) }
  }
  return 0.2126 * $linear[0] + 0.7152 * $linear[1] + 0.0722 * $linear[2]
}

function Get-ContrastRatio([string]$first, [string]$second) {
  $firstLuminance = Convert-HexToRelativeLuminance $first
  $secondLuminance = Convert-HexToRelativeLuminance $second
  $lighter = [Math]::Max($firstLuminance, $secondLuminance)
  $darker = [Math]::Min($firstLuminance, $secondLuminance)
  return ($lighter + 0.05) / ($darker + 0.05)
}

function Assert-ThemeContrast([System.Collections.IDictionary]$palette, [string]$label) {
  $checks = @(
    @('text_primary', 'page_background', 4.5),
    @('text_primary', 'surface_background', 4.5),
    @('table_header_foreground', 'table_header_background', 4.5),
    @('text_muted', 'page_background', 4.5),
    @('text_muted', 'surface_background', 4.5),
    @('action_foreground', 'action_background', 4.5),
    @('link', 'page_background', 4.5),
    @('link', 'surface_background', 4.5),
    @('selection_foreground', 'selection_background', 4.5),
    @('success_foreground', 'success_background', 4.5),
    @('information_foreground', 'information_background', 4.5),
    @('warning_foreground', 'warning_background', 4.5),
    @('error_foreground', 'error_background', 4.5),
    @('border_interactive', 'page_background', 3.0),
    @('border_interactive', 'surface_background', 3.0),
    @('selection_indicator', 'selection_background', 3.0),
    @('focus_ring', 'page_background', 3.0),
    @('focus_ring', 'surface_background', 3.0)
  )
  foreach ($check in $checks) {
    $ratio = Get-ContrastRatio $palette[$check[0]] $palette[$check[1]]
    if ($ratio -lt [double]$check[2]) {
      throw "$label contrast failed for $($check[0]) / $($check[1]): $([Math]::Round($ratio, 2)):1"
    }
  }
  return $checks.Count
}

$themeDefinitionPath = Join-Path $pack 'configuration/theme-colors.md'
$themeDefaultPath = Join-Path $pack 'configuration/theme-colors.default.yaml'
$themeOverridePath = Join-Path $root 'templates/business-app/local-overrides/theme-colors.example.yaml'
foreach ($path in @($themeDefinitionPath, $themeDefaultPath, $themeOverridePath)) {
  if (-not (Test-Path -LiteralPath $path)) { throw "Missing theme-color contract file: $path" }
}

$themeDefinition = (Get-Content -Raw $themeDefinitionPath) -replace '\s+', ' '
foreach ($needle in @('canonical default palette', 'intentionally editable by a manifest consumer', 'zero or one selected theme-color override', 'replaces one complete scalar value', 'unknown mode or role', 'value outside `#RRGGBB`', 'record-list override and one theme-color override may coexist', 'Header or host shell owns', 'distinct from giving every application user an arbitrary color picker')) {
  if (-not $themeDefinition.Contains($needle)) { throw "Theme-color configuration contract is missing: $needle" }
}
foreach ($role in $themeRoleIds) {
  if (-not $themeDefinition.Contains("``$role``")) { throw "Theme-color definition is missing role: $role" }
}

$themeDefaultText = Get-Content -Raw $themeDefaultPath
$themeOverrideText = Get-Content -Raw $themeOverridePath
foreach ($text in @($themeDefaultText, $themeOverrideText)) {
  foreach ($needle in @('pack_id: example-business-app-standard-pack', 'pack_version: 0.2.0', 'theme_color_contract_version: 2')) {
    if (-not $text.Contains($needle)) { throw "Theme-color file is missing identity: $needle" }
  }
}

$themeDefaults = Read-ThemeColorMap $themeDefaultPath 'theme_colors'
$themeOverrides = Read-ThemeColorMap $themeOverridePath 'theme_color_overrides'
$themeDefaultValueCount = Assert-ThemeColorMap $themeDefaults $true 'Theme default'
$themeOverrideValueCount = Assert-ThemeColorMap $themeOverrides $false 'Theme override'
Assert-SingleThemeOverrideSelection @($themeOverridePath)
$themeContrastChecks = 0
foreach ($mode in @('light', 'dark')) {
  $themeContrastChecks += Assert-ThemeContrast $themeDefaults[$mode] "default $mode"
  $resolved = [ordered]@{}
  foreach ($role in $themeRoleIds) { $resolved[$role] = $themeDefaults[$mode][$role] }
  foreach ($role in $themeOverrides[$mode].Keys) { $resolved[$role] = $themeOverrides[$mode][$role] }
  $themeContrastChecks += Assert-ThemeContrast $resolved "resolved override $mode"
}
if ($themeDefaultValueCount -ne 46) { throw "Expected 46 canonical theme values; found $themeDefaultValueCount." }
if ($themeOverrideValueCount -ne 10) { throw "Expected 10 bounded theme override values; found $themeOverrideValueCount." }

$themeNegativeCases = @(
  @{
    Label = 'unknown mode'
    Action = {
      Read-ThemeColorLines @(
        'theme_color_overrides:',
        '  sepia:',
        '    link: "#000000"'
      ) 'theme_color_overrides' 'unknown-mode fixture'
    }
  },
  @{
    Label = 'unknown role'
    Action = {
      $candidate = Read-ThemeColorLines @(
        'theme_color_overrides:',
        '  light:',
        '    unknown_role: "#000000"'
      ) 'theme_color_overrides' 'unknown-role fixture'
      Assert-ThemeColorMap $candidate $false 'Unknown-role fixture'
    }
  },
  @{
    Label = 'null value'
    Action = {
      Read-ThemeColorLines @(
        'theme_color_overrides:',
        '  light:',
        '    link: null'
      ) 'theme_color_overrides' 'null fixture'
    }
  },
  @{
    Label = 'empty value'
    Action = {
      $candidate = Read-ThemeColorLines @(
        'theme_color_overrides:',
        '  light:',
        '    link: ""'
      ) 'theme_color_overrides' 'empty fixture'
      Assert-ThemeColorMap $candidate $false 'Empty fixture'
    }
  },
  @{
    Label = 'invalid color notation'
    Action = {
      $candidate = Read-ThemeColorLines @(
        'theme_color_overrides:',
        '  light:',
        '    link: "#abcdef"'
      ) 'theme_color_overrides' 'invalid-value fixture'
      Assert-ThemeColorMap $candidate $false 'Invalid-value fixture'
    }
  },
  @{
    Label = 'duplicate role'
    Action = {
      Read-ThemeColorLines @(
        'theme_color_overrides:',
        '  light:',
        '    link: "#000000"',
        '    link: "#FFFFFF"'
      ) 'theme_color_overrides' 'duplicate-role fixture'
    }
  },
  @{
    Label = 'missing canonical roles'
    Action = {
      $candidate = Read-ThemeColorLines @(
        'theme_colors:',
        '  light:',
        '    page_background: "#FFFFFF"',
        '  dark:',
        '    page_background: "#000000"'
      ) 'theme_colors' 'missing-role fixture'
      Assert-ThemeColorMap $candidate $true 'Missing-role fixture'
    }
  },
  @{
    Label = 'multiple selected overrides'
    Action = {
      Assert-SingleThemeOverrideSelection @('first.yaml', 'second.yaml')
    }
  }
)
foreach ($case in $themeNegativeCases) {
  Assert-Rejected $case.Action $case.Label
}

$fullBindingPath = Join-Path $root 'templates/business-app/product-bindings/business-workflows.example.yaml'
$limitedBindingPath = Join-Path $root 'templates/business-app/product-bindings/business-workflows-limited.example.yaml'
foreach ($path in @($fullBindingPath, $limitedBindingPath)) {
  if (-not (Test-Path -LiteralPath $path)) { throw "Missing product binding: $path" }
  $text = Get-Content -Raw $path
  foreach ($needle in @('pack_id: example-business-app-standard-pack', 'pack_version: 0.2.0', 'display_language: product_owned')) {
    if (-not $text.Contains($needle)) { throw "$path is missing binding identity: $needle" }
  }
  if ($text -match 'https?://|/api/|/records/|permission: (admin|user)|\b[A-Z][a-z]+ Street\b') {
    throw "Binding contains invented product data: $path"
  }
  foreach ($needle in @(
    'hierarchy_reference:',
    'return_context_reference:',
    'history_policy_reference:',
    'field_priority_reference:',
    'available_modes:',
    '    - light',
    '    - dark',
    'initial_preference_reference:',
    'preference_source_reference:',
    'persistence_reference:',
    'user_selection_available:',
    'brand_constraint_reference:',
    'contrast_requirement_reference:'
  )) {
    if (-not $text.Contains($needle)) { throw "$path is missing required light/dark theme responsibility: $needle" }
  }
  if ($text -match 'semantic_color_role_reference:|#[0-9A-Fa-f]{6}') {
    throw "Product binding must not own or override concrete theme values: $path"
  }
}

$fullBinding = Get-Content -Raw $fullBindingPath
foreach ($needle in @(
  'field_schema_reference:',
  'success_destination_reference:',
  'cancel_destination_reference:',
  'consequence_reference:',
  'focus_contract_reference:',
  'step_model_reference:',
  'review_step_reference:',
  'review_change_destination_reference:',
  'submission_action_reference:',
  'outcome_reference:',
  'failure_recovery_reference:',
  'completion_destination_reference:',
  'panel_model_reference:',
  'requirements_reference:',
  'user_selection_available: true',
  'selectable_preferences:',
  '    - system'
)) {
  if (-not $fullBinding.Contains($needle)) { throw "Full binding is missing responsibility: $needle" }
}

$limitedBinding = Get-Content -Raw $limitedBindingPath
if ($limitedBinding -notmatch '(?ms)read:\s+available: true.*create:\s+available: false.*edit:\s+available: false.*delete:\s+available: false') {
  throw 'Limited binding must exercise read-only capability without create, edit, or delete.'
}
foreach ($capability in @('dialog', 'wizard', 'dashboard')) {
  if ($limitedBinding -notmatch "(?ms)^${capability}:\s+available: false") {
    throw "Limited binding must omit $capability."
  }
}
if (-not $limitedBinding.Contains('user_selection_available: false') -or $limitedBinding.Contains('selectable_preferences:')) {
  throw 'Limited binding must disable user theme selection without inventing selectable preferences.'
}

Write-Output "Business-workflow standard-pack checks passed. Concepts: $($required.Count). Index links: $indexLinks. Record-list configuration IDs: $($settingIds.Count). Theme roles: $($themeRoleIds.Count). Theme modes: 2. Theme override values: $themeOverrideValueCount. Theme negative cases: $($themeNegativeCases.Count). Theme contrast assertions: $themeContrastChecks. Product-binding fixtures: 2."
