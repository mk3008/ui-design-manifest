---
type: PoC implementation record
title: Business-workflow static HTML review attempt 1
status: human-review-complete
source: authored
baseline_commit: 3965737a2458e586507db92e31bb77eb0d2dd47c
---

# Scope

This source-blind PoC renders the pack's record read, create, edit, delete,
screen transition, accessibility, Confirmation, Dialog, Wizard, Dashboard, and
color/theme guidance as static HTML. It does not add a runtime, validator, DSL,
product route, product data model, generic token registry, or in-application
theme editor. It adds one bounded theme-color configuration with 21 fixed
semantic roles and editable concrete values for the required Light and Dark
modes.

The HTML, PNG, and review index in this experiment are maintained as PoC
evidence, not as the standard pack's normative surface. Future standard-pack
changes update the manifest, configuration, binding examples, and checks;
these review artifacts are retained or superseded only when they are needed
for a concrete human review or comparison.

`wizard-flow-review.html` supplements the original fixed Wizard artifact with
three comparison states: input, Review and submit, and confirmed result. It
does not replace or rewrite the original fixed HTML/PNG identity.

`color-theme-token-review.html` supplements the original fixed Color/theme
artifact with the current contract: all concrete values are visible, one
canonical palette or one local override is selectable by a manifest consumer,
and no Header theme-selection control is implied. It does not replace or
rewrite the original fixed HTML/PNG identity.

The Color/theme entry on `review.html` opens this current token review. The
older `color-theme.html` and `color-theme.png` remain historical evidence.

The canonical Light `focus_ring` is `#3B82F6`, a distinct blue rather than a
warning-like red or amber. The canonical Dark `focus_ring` remains
`#FFD54A`. Both values meet the `3:1` adjacent-surface requirement checked by
the limited standard-pack script.

# Standard-pack inputs

- `templates/business-app/design-manifest/variability.md`
- `templates/business-app/design-manifest/foundations/accessible-work-surface.md`
- `templates/business-app/design-manifest/foundations/color-and-theme.md`
- `templates/business-app/design-manifest/configuration/theme-colors.md`
- `templates/business-app/design-manifest/configuration/theme-colors.default.yaml`
- `templates/business-app/local-overrides/theme-colors.example.yaml`
- `templates/business-app/design-manifest/components/breadcrumb.md`
- `templates/business-app/design-manifest/components/record-fields.md`
- `templates/business-app/design-manifest/components/dialog.md`
- `templates/business-app/design-manifest/components/confirmation.md`
- `templates/business-app/design-manifest/components/step-indicator.md`
- `templates/business-app/design-manifest/components/dashboard-panel.md`
- `templates/business-app/design-manifest/policies/confirm-consequential-action.md`
- `templates/business-app/design-manifest/policies/confirm-destructive-action.md`
- `templates/business-app/design-manifest/screen-patterns/record-detail.md`
- `templates/business-app/design-manifest/screen-patterns/record-create.md`
- `templates/business-app/design-manifest/screen-patterns/record-edit.md`
- `templates/business-app/design-manifest/screen-patterns/record-delete.md`
- `templates/business-app/design-manifest/screen-patterns/wizard.md`
- `templates/business-app/design-manifest/screen-patterns/dashboard.md`
- `templates/business-app/design-manifest/flows/record-lifecycle.md`
- `templates/business-app/design-manifest/flows/screen-transition.md`
- `templates/business-app/design-manifest/flows/wizard-progress.md`

# Fixture boundary

All record names, values, dates, counts, categories, steps, consequences,
options, periods, and destinations are visibly identified as neutral fixtures
or product-supplied slots. They demonstrate an instructed semantic role and do
not assert product meaning.

Read-only detail uses one restrained details surface with a summary-card-like
treatment. It avoids internal field cards, keeps the primary facts in compact
left-caption rows, and lowers the emphasis of secondary metadata without
returning to an equal-width field grid. Narrow-width stacking remains
unexercised.
Record identity is visually strongest, while the fixture promotes no ordinary
fact beyond identity. Create uses empty or declared fixture defaults; Edit
preserves identity and current fixture values without a duplicate
information-style identity banner. Both use the single-column field default,
equal-height single-line controls, and a persistent footer whose source,
visual, and Tab order is primary then Cancel. Delete, consequential
confirmation, and general Dialog are separate review surfaces. Wizard and
Dashboard are separate screen patterns, not modes of a generic configurable
screen.

The accessibility fixture removes synthetic `Selected` status copy: checked
control state plus a leading accent demonstrates selection without color alone.
The fixed theme fixture exercises both required theme modes with equal
structure and semantic content. It remains historical evidence for page and raised surfaces,
primary and muted text, selection, action accent, visible focus,
primary/secondary/text-link actions, validation, and
success/information/warning/error states. Its labeled Header selector is no
longer the current responsibility model.

The supplementary theme-token review fixes the current model. It lists all 21
semantic roles and their authored `#RRGGBB` defaults, applies the same meaning
to Light and Dark specimens, separates subtle from required interactive
borders, and shows no theme-selection control in either product Header.
Selection capability, selectable preferences, initial preference, persistence,
and brand policy remain product binding. Placement, caption, icon, and
interaction model remain Header or host-shell responsibility.
The transition fixture uses a semantic location Breadcrumb rather than a
record-lifecycle flow diagram. Breadcrumb hierarchy does not claim visit
history or exact return-context restoration.

The Wizard supplement keeps progress and Back/Continue on the pre-submit input
state. It makes `Review and submit` the final numbered step, shows supplied
answers and Change destinations, and replaces ordinary advance with the
consequence-specific `Submit setup` fixture action. The confirmed result is a
separate state without the pre-submit indicator or Back/Next actions. Preview
is not shown because the fixture supplies no rendered or generated output.

Every screen fixture shows a yellow, read-only `Applied choices` note outside
and after the product canvas. Product UI therefore remains the first fixed
review surface. The note uses the same five vertically stacked sections on
every page: formal settings, adopted pack defaults, product-supplied
variables, implementation choices in the fixture, and behavior not exercised.
Product-supplied values are label/value rows rather than a horizontal prose
summary. When the pack already defines a bounded alternative, a disabled
native radio group lists the options and marks the fixture selection. Other
implementation decisions use `Shown` rows and do not invent choices. This is
review evidence, not a runtime settings editor or new configuration contract.
The product canvas no longer carries contract, acceptance, or
runtime-verification explanations.

# Capture

The 12 HTML surfaces are captured at `1440x1200` with Chrome
`150.0.7871.187` from the explicit executable recorded in
`artifact-manifest.yaml`. Normal `--headless=new --disable-gpu` capture
is attempted first for every surface and SwiftShader is permitted for one
retry only after a normal failure.

The supplementary Wizard sequence and Color/theme token review are HTML-only
in this correction. The current browser-control environment rejected local
`file:` navigation, so no new capture was created or substituted through
another browser surface. The Wizard canonical identities are
`B5DAF119C598FB655E0E4355FC622FF97B047A8E4FB312ADE3D307F85D8D8A91`
for `wizard-flow-review.html` and
`769FEA5E108529B35E3DA4AF0C6276F03BDE44C59EF30597B4453FA8D585AF8C`
for `wizard-flow-review.css`. The Color/theme canonical identities are
`A0881B12C5DE439CD5BFD21AFA7DB59568E8931A65FDED4AED9F43FF84E63BE7`
for `color-theme-token-review.html` and
`4090733A7F68A791CA61B781FFA001F3FB5EA7C51735C21B8D2C0185FCC751DF`
for `color-theme-token-review.css`.

# Evidence limits

The fixed HTML and PNG can support review of content hierarchy, visible labels,
read-only presentation, action distinction, modal composition, progress
orientation, dashboard hierarchy, visible non-color cues, and theme roles.
They do not prove keyboard behavior, focus movement or containment, Escape,
background inertness, announcements, assistive-technology output, contrast
conformance, actual sticky behavior during scroll, narrow reflow,
pseudo-localized labels, persistence, return-context restoration, live
validation, or product integration.

The existing fixed `wizard.png` proves only the earlier intermediate state.
The new input/review/result comparison is structurally checked and was
accepted directly by the human reviewer. The fixed `color-theme.png` likewise
proves only the earlier role-coverage and Header-selector specimen. The new
token/value comparison is structurally and contrast checked and was accepted
directly by the human reviewer after the Light focus-ring correction.
