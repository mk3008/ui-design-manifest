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
| Sort affordance, state, and direction | observed | observed | One active sortable header has a direction state; sort update is unresolved. |
| Multi-selection | observed | observed | Leading checkbox selection permits more than one record; select-all and bulk action are unresolved. |
| Selected and unselected row state | observed | observed | Both selected and unselected row presentations are visible; persistence is unresolved. |
| Selection versus activation | unresolved | target-product input | No activation relationship is retained from selection. |
| Horizontal alignment | observed | observed | Text roles, numeric roles, selection controls, and standalone icons use distinct alignment. |
| Vertical alignment | observed | observed | Single-line content is vertically centered. |
| Text, numeric, and icon treatment | observed | observed | Text, numeric, and icon roles are distinct; meaning is unresolved. |
| Density and row rhythm | observed | observed | Compact, repeated rows share a consistent rhythm. |
| Header and body typography | observed | observed | Header and body are distinct; exact weight relationship is unresolved. |
| Grid/container width and remaining space | observed | context pattern | The table surface leaves remaining width without a semantic filler column. |
| Overflow | unresolved | target-product input | The bounded state does not establish clipping, wrapping, scrolling, or a rule. |
| Empty and narrow states | not observed | target-product input | No empty or narrow state is retained. |
| Accessibility | observed | observed | Selection and active sort state have visible semantic cues; focus, keyboard, and announcements are unresolved. |
| Application Input Contract needs | observed | target-product input | Selection, sorting, values, labels, meanings, width, and update behavior require owner input. |

# Authored defaults

When an active sort state is Contract-declared, place its direction icon at the header control right edge. Do not force inactive sort icons to persist. Use headers that follow column content: text, identifiers, and status left; numbers right; selection controls and standalone icons centered. Use single-line vertical centering and a restrained header distinction unless a higher-precedence input differs.
