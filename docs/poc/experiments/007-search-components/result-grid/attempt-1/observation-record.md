---
type: Observation Record
title: Result-grid calibration observation record
description: Source-blind classification of one bounded static result-grid state.
status: draft
source: mixed
scope: One visible table surface.
---

# Classification

`Observed` describes the bounded visible state only. `Authored default` is a fallback and not a source observation. `Unresolved` requires product input or a further bounded observation.

| Axis | Classification | Knowledge ownership | Retained result or limit |
| --- | --- | --- | --- |
| Sort affordance, state, and direction | observed | observed | A header sort affordance is visible. Active field and direction are not observed; the static fixture exercises them only as an authored default. |
| Multi-selection | observed | observed | A leading checkbox column and repeated row controls are visible; actual simultaneous selection, select-all behavior, and bulk actions remain unresolved. |
| Selected and unselected row state | not observed | authored default | The bounded observation shows unselected rows only. The neutral fixture exercises paired states as an authored default, not as a source claim. |
| Selection versus activation | unresolved | target-product input | No activation relationship is retained from selection. |
| Horizontal alignment | observed | observed | Text alignment and centered selection controls are visible. Numeric alignment is not observed and comes from the authored default. |
| Vertical alignment | observed | observed | Single-line content is vertically centered. |
| Text, numeric, and icon treatment | observed | observed | Text and sort/selection controls are distinct. Numeric treatment is not observed and is supplied only by the neutral fixture. |
| Density and row rhythm | observed | observed | Compact, repeated rows share a consistent rhythm. |
| Header and body typography | observed | observed | Header and body are distinct; exact weight relationship is unresolved. |
| Grid/container width and remaining space | not observed | authored default | The bounded observation does not establish narrower-than-container behavior. The fixture exercises non-semantic trailing table-surface space as an authored default. |
| Overflow | unresolved | target-product input | The bounded state does not establish clipping, wrapping, scrolling, or a rule. |
| Empty and narrow states | not observed | target-product input | No empty or narrow state is retained. |
| Accessibility | observed | observed | Selection and active sort state have visible semantic cues; focus, keyboard, and announcements are unresolved. |
| Application Input Contract needs | observed | target-product input | Selection, sorting, values, labels, meanings, width, and update behavior require owner input. |

# Authored defaults

When an active sort state is Contract-declared, place its direction icon at the header control right edge. Do not force inactive sort icons to persist. Use headers that follow column content: text, identifiers, and status left; numbers right; selection controls and standalone icons centered. Use single-line vertical centering and a restrained header distinction unless a higher-precedence input differs.
