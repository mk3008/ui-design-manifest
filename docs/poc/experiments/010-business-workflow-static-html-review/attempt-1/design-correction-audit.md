---
type: PoC design correction audit
title: Business-workflow visual correction audit
status: corrected-and-human-reviewed
source: direct-observation-and-primary-guidance
baseline_commit: 3965737a2458e586507db92e31bb77eb0d2dd47c
---

# Outcome

The first fixed review artifacts were not accepted as sufficient business-app
examples. Record read was over-boxed and sparse, create/edit used an
unsupported generic two-column form, the theme page exercised only a light
palette instead of a full Light/Dark semantic color sample, and the transition page described one record-lifecycle happy path
instead of a reusable navigation contract.

The corrected artifacts use:

- one restrained read-only details surface with a summary-card-like treatment,
  compact left-caption rows at the exercised desktop width, and subordinate
  metadata grouped separately from the primary facts;
- a single-column create/edit baseline with equal-height single-line controls;
- persistent full-page finalizing actions in primary-then-cancellation order;
- a page Header action region for non-finalizing record actions;
- Light and Dark specimens with the same surface hierarchy, primary and muted
  text, selection, accent, visible focus, action treatments, and
  success/information/warning/error states;
- a later Color/theme supplement that makes all 21 concrete values editable
  manifest configuration and leaves theme-selection placement, caption, icon,
  and interaction to the Header or host shell;
- a cool Light focus ring (`#3B82F6`) separated from warning and error roles,
  while the Dark focus ring retains its high-visibility yellow (`#FFD54A`);
- a semantic hierarchical Breadcrumb below the global Header and above the page
  title; and
- an outside yellow review note shown after each product canvas, with the same
  five vertically stacked responsibility sections for settings, defaults,
  product variables, implementation choices, and not-exercised behavior;
- disabled native radio rows only where the pack already defines bounded
  alternatives, with factual `Shown` rows for other fixture decisions.
- a Wizard sequence that keeps input progress, review/final action, and the
  post-submission result distinct. `Review and submit` is the last numbered
  step; no pending `Complete` step predicts an outcome.

# Before evidence

| Artifact | Raw-byte SHA-256 | Direct observation |
| --- | --- | --- |
| [Record read before](audit-record-read-before.png) | `85CED1C0065C1814A08A8E39061F43D848C73D7E12E087BA23060B4CD34F328D` | Every field occupied a bordered cell with a 92px minimum height. Section cards and cell lines duplicated hierarchy already expressed by headings and type. A synthetic `Available` status was not supplied by the binding. |
| [Record read three-column revision](audit-record-read-three-column-before.png) | `78C235C2EFE4ADB8F02839F6D7F7897F96E8AA1ADF03412D6F5C3E189AE3B822` | Removing borders did not solve scanability: short label/value pairs were spread across three equal columns, related text was separated by large gutters, and ordinary values had almost the same visual weight. |
| [Record create before](audit-record-create-before.png) | `84D1B5DAAFFF98D2F83559B0B6DCDC1A69EB769ED6875771DA4D8C0D272FC377` | Unrelated fields were forced into two columns. Help text on only one peer created an unstable row, and the text input and native select did not present a common control height. |
| [Screen transition before](audit-screen-transition-before.png) | `6B14CEB4FA1857459D52A3B736C1145A43B1B05F69022C6D44F4AE91D80A74E3` | A fixed `Search results → Record details → Edit record` diagram made one product flow look universal and incorrectly labeled navigation into Edit as the mutation itself. |
| [Color/theme reduced before](audit-color-theme-reduced-before.png) | `4956B62391A46FA3536F3817FD4B37602B964CE66F13CFA26C4B6BD4BF99A85C` | Adding a Dark comparison retained selection, text, one validation error, and two buttons but removed the former explicit surface, action-accent, focus, success, warning, and supporting action examples. |
| [Color/theme Header order before](audit-color-theme-header-order-before.png) | `243C0564C3FB5064BEEEECC9DCA1153E9D6C4603374D44700F21E844782A0767` | The Light/Dark mode name occupied the leading title position while `Workspace` appeared at the trailing edge, reversing the identity/utility responsibility used by the other fixtures. |

The screenshots support visible layout findings only. They do not prove
keyboard order, focus movement, scroll persistence, history restoration,
responsive reflow, or assistive-technology output.

The [Record read density comparison](audit-record-read-density-comparison.png)
places the rejected equal-width layout and the corrected bounded description
list in one visual review surface.

The [Color/theme role-coverage comparison](audit-color-theme-role-coverage-comparison.html)
places the reduced Light/Dark fixture and the corrected fixed artifact together.
The comparison PNG is fixed as
`E0F8EEE7B0FC8ACBA5DA683702FA62346188561CE046F18FAD06F44F7F955B9B`
(`1920x1200`, 205,930 bytes).

The [Color/theme Header responsibility comparison](audit-color-theme-header-order-comparison.html)
places the product-owner screenshot and the corrected fixed artifact together.
Its PNG is fixed as
`CBC71504C2FC2AAE1F5AA9CDED071537C91BC52670F3CBA84C74959A6516E7B6`
(`1920x1200`, 110,328 bytes).

The [Applied choices layout comparison](audit-applied-choices-vertical-comparison.html)
places the rejected horizontal note and the corrected vertical note together.
Its PNG is fixed as
`DD593BB3AF3778B4D9E4B25161CD60B41CDE219A7A051E2ED3AD5DCEECBEE7A0`
(`1920x1200`, 166,411 bytes). The
[full vertical choice detail](audit-applied-choices-vertical-detail.png)
fixes the complete Record read note at `1440x2000`; the ordinary fixed review
artifact remains `1440x1200`.

# Findings and resolutions

| ID | Severity | Finding | Resolution |
| --- | --- | --- | --- |
| DC-01 | P1 | Record read used decorative cards, repeated borders, oversized cells, and unsupported status copy. | Replaced the cell grid with unboxed semantic description groups. Removed the status and explanatory fixture copy. |
| DC-02 | P1 | Record read did not define whether labels sit above or beside values. | Separated read-only and editable guidance. Short-caption desktop details now default to compact left-caption rows; narrow panes, long captions, and long translations stack. Create/edit keep labels above controls. |
| DC-03 | P1 | Create/edit imposed a two-column Z-flow without supplied field relationships. | Made one vertical I-flow the default. A shared row is allowed only for explicitly related fields. Inputs and selects use the same 40px fixture height. |
| DC-04 | P1 | Full-page Create/Save actions could scroll away and the source order reached Cancel first. | Put finalizing actions in a persistent footer. The source, reading, visual, and Tab order is Create/Save then Cancel; initial focus is not moved to Cancel. |
| DC-05 | P1 | Edit repeated identity in a blue information-like strip that could be mistaken for outcome feedback. | Kept identity in the page title and adjacent record reference. Success feedback is reserved for a supplied post-save outcome. |
| DC-06 | P1 | The theme evidence exercised only one light palette. | Added equal Light and Dark application specimens using the same content, selection, text, validation, status palette, background/surface layers, accent, focus, and actions. |
| DC-07 | P1 | Screen transition was one record-lifecycle example and contained no real breadcrumb. | Added the Breadcrumb component and a generic hierarchy fixture. Breadcrumb hierarchy, Back/return context, step progress, navigation, and mutation are separate responsibilities. |
| DC-08 | P2 | A human could see the fixture but not the choices that produced it. | Added an outside yellow `Applied choices` note to every screen fixture and a key on the review index. |
| DC-09 | P2 | Several product canvases still contained evaluation, contract-boundary, or runtime-verification explanations. | Moved those facts to the outside review note or evidence record and retained only task identity, fixture data, field help, state, recovery, and concise actions inside the canvas. |
| DC-10 | P1 | The unboxed read-only revision still used a wide three-column field grid, producing weak hierarchy and excessive whitespace. | Replaced it with one bounded details surface, a summary-card-like hierarchy, one compact left-caption fact sequence, subordinate metadata, and no promoted ordinary fact without product-supplied priority. |
| DC-11 | P1 | The first Light/Dark revision reduced the visible semantic-role coverage that the former Light-only specimen had provided. | Kept the Light/Dark comparison and restored the same complete specimen to both: page and raised surfaces, primary and muted text, selection, action accent, visible focus, primary/secondary/text-link actions, and success/information/warning/error states with non-color cues; the title stays left and the theme selector sample sits in the header utility area at right. |
| DC-12 | P1 | The theme mode occupied the leading Header title position and moved `Workspace` to the trailing edge, contradicting every other fixture's identity/context order. | Restored `Workspace` to the leading identity region and placed a labeled Light/Dark selector sample in the trailing utility region. Actual switching, preference integration, and persistence remain unexercised. |
| DC-13 | P2 | The horizontal `Applied choices` strip forced unrelated categories and long values into narrow columns and did not present bounded alternatives as choices. | Stacked all five categories and supplied values vertically. Added disabled native radio rows for five choice groups already supported by the pack, marked the selected value, and kept all other decisions as non-interactive `Shown` facts. |
| DC-14 | P1 | The fixed Wizard artifact showed progress and Back/Continue, but its pending `Complete` step could be mistaken for a guaranteed transaction outcome; Review content, the final action, and the result were not visible. | Clarified the Contract as `input steps → Review and submit → explicit final action → separate result`. Added `wizard-flow-review.html` with fixed input, review, and confirmed-result states. Preview is omitted because no rendered or generated output is supplied. The earlier fixed PNG remains unchanged as historical intermediate-state evidence. |
| DC-15 | P1 | The Color/theme contract delegated concrete values to product binding and implementation, while its fixed HTML also owned a labeled Header selector. That left no useful manifest edit point and mixed Color/theme with Header responsibility. | Added a bounded 21-role Light/Dark palette with concrete `#RRGGBB` defaults, one local override example, contrast checks, and a supplementary value/specimen HTML. Removed concrete values from product binding and left Header selection UI out of the Color/theme contract. The earlier fixed HTML/PNG remains historical evidence. |

# Primary guidance used

The references below are evaluation inputs, not application authorities.

- [GOV.UK Summary list](https://design-system.service.gov.uk/components/summary-list/)
  supports semantic left-key/right-value facts. Its summary-card variant is
  aimed at multiple same-type lists or groups with their own actions, not an
  automatic wrapper for every single record.
- [PatternFly Description list](https://www.patternfly.org/components/description-list/design-guidelines/)
  provides stacked, horizontal, compact, and column variants for detail pages;
  the horizontal relationship is appropriate for this short-caption desktop
  fixture.
- [SAP Fiori Form](https://www.sap.com/design-system/fiori-design-web/v1-145/ui-elements/form/usage)
  permits horizontal label/value display when space is sufficient, requires
  stacking where width or label length makes the relationship fragile, and
  warns against excessive whitespace.
- [SAP Fiori Object page](https://experience.sap.com/fiori-design-web/object-page/)
  keeps record identity and global actions in the object header and groups
  detail content into sections below it.
- [Carbon Forms pattern](https://carbondesignsystem.com/patterns/forms-pattern/)
  and [PatternFly Form](https://www.patternfly.org/components/forms/form/design-guidelines/)
  support a single-column baseline and restrict shared rows to related fields.
- [Carbon Form usage](https://carbondesignsystem.com/components/form/usage/)
  requires paired rows to grow together when help or errors change one item.
- [SAP Fiori Action placement](https://www.sap.com/design-system/fiori-design-web/v1-148/foundations/best-practices/global-patterns/action-placement)
  separates object actions in a persistent Header from workflow/finalizing
  actions in a footer.
- [PatternFly Action list](https://www.patternfly.org/components/action-list/)
  demonstrates Save then Cancel for forms; [Carbon Button](https://carbondesignsystem.com/components/button/usage/)
  places the primary before the secondary action on full-page designs while
  keeping dialog ordering as a separate pattern.
- [USWDS Breadcrumb](https://designsystem.digital.gov/components/breadcrumb/),
  [GOV.UK Breadcrumbs](https://design-system.service.gov.uk/components/breadcrumbs/),
  and [PatternFly Breadcrumb](https://www.patternfly.org/components/breadcrumb/design-guidelines/)
  define Breadcrumb as hierarchy rather than visit history and place it below
  global navigation and above the page title.
- [Carbon Color](https://carbondesignsystem.com/elements/color/overview/)
  and [Carbon Themes](https://carbondesignsystem.com/elements/themes/overview/)
  preserve semantic token roles while concrete theme values and surface layers
  change.
- [Fluent Design tokens](https://fluent2.microsoft.design/design-tokens),
  [Material Web Color](https://material-web.dev/theming/color/), and
  [USWDS Theme color tokens](https://designsystem.digital.gov/design-tokens/color/theme-tokens/)
  use stable semantic roles with concrete values that a theme or product
  configuration can replace.
- [Carbon's theming tutorial](https://carbondesignsystem.com/developing/web-components-tutorial/step-1/)
  treats a one-button cycle as impractical for Light/System/Dark and moves the
  explicit alternatives into a shell-owned user panel. This supports keeping
  the selection UI out of the Color/theme value contract.
- [Carbon UI shell header](https://carbondesignsystem.com/components/UI-shell-header/usage/)
  orders the Header from product-level identity at the leading side toward
  global utilities at the trailing side.
- [SAP Fiori Launchpad shell bar](https://experience.sap.com/fiori-design-web/shell-bar/)
  keeps the application title in the shell identity area and exposes
  user-specific settings and global functions from the utility side.
- [PatternFly Wizard](https://www.patternfly.org/components/wizard/design-guidelines/),
  [SAP Fiori Wizard](https://experience.sap.com/fiori-design-web/wizard/),
  [USWDS Step indicator](https://designsystem.digital.gov/components/step-indicator/),
  and [GOV.UK Check answers](https://design-system.service.gov.uk/patterns/check-answers/)
  support progress and backward/forward movement before an explicit review
  and final action. [GOV.UK Confirmation pages](https://design-system.service.gov.uk/patterns/confirmation-pages/)
  and [Carbon Create flows](https://carbondesignsystem.com/community/patterns/create-flows/)
  treat the post-submission outcome as separate feedback rather than a pending
  numbered step. Review is not universal, so the binding still owns whether
  it is supplied.

# History classification

The compact-work-surface rule already warned against a decorative container for
every field, but its committed scope covered record-list content only. Earlier
record-detail PoC material also separated weighted hierarchy, density, wide
grouping, narrow I-flow, and readable content from disabled controls. Its
implementation used left captions on desktop and stacked them when narrow, but
that was evidence rather than a committed universal rule. The rejected
three-column top-label revision was new uncommitted work, not a lost historical
contract.

Create/edit I-flow, common control sizing, Light/Dark as required modes,
Breadcrumb as a distributable component, and full-page primary-before-Cancel
order were not established pack contracts in reachable history. They are new
fixed guidance derived from current product-owner direction and the primary
guidance above, not recovered source truth.

The former Light-only theme specimen remains identifiable in the local Git
object snapshot `2ccfac0ef5ecf90a9fa3dbd1e3f18c7b2f08cd4d`. It explicitly exercised
page and raised surfaces, primary and muted text, selection, action accent,
visible focus, success, warning, error, and primary/secondary/link actions.
The current correction preserves those roles while adding Dark parity.
`Information` was not an independent role in that former fixture; it is now
made explicit without treating the brand/action accent or selection color as
an information status.

The other ten product fixtures in this experiment consistently place
`Workspace` at the leading edge of their application Header and contextual
content at the trailing edge. The reversed inner theme Header was a new local
inconsistency, not a recovered historical rule.

The subsequent request clarified that even a correctly ordered selector is not
owned by Color/theme. Whether a control appears in the Header is a Header or
host-shell decision; a visible `Theme` caption is not a Color/theme invariant.
The fixed selector specimen and its prior review result are therefore retained
as historical intermediate evidence, while
`color-theme-token-review.html` is the current review target.

# Evidence limits

The corrected fixed viewport can confirm visible hierarchy, alignment, action
placement, theme parity, breadcrumb placement, and the separation of review
notes from product UI. The supplementary theme-token page has source and
structural evidence but no PNG; it was later accepted through direct human
review. Narrow reflow,
pseudo-localized labels, actual Tab order,
sticky behavior during scroll, unsaved-change guarding, browser history,
return-context restoration, focus, Escape, announcements, contrast ratios,
assistive technology, and product integration remain unconfirmed by static
HTML and PNG. The supplementary Wizard sequence and Color/theme token/value
page have source and structural evidence but no new PNG; their visual
composition was accepted through direct human review.
