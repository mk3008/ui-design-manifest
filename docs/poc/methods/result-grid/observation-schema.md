---
type: Observation Schema
title: Result-grid observation schema
description: Required axes and ownership classifications for a bounded result-grid observation.
status: draft
source: authored
scope: Reusable method.
---

# Required axes

Complete every row. `Observed` means visibly established in the declared state; `not observed` means absent from that state; `unresolved` needs owner input or a smaller additional observation; `not applicable` is outside the grid boundary. Ownership is one of `observed`, `inferred`, `authored default`, `context pattern`, or `target-product input`.

| Axis | Record | Static-evidence limit |
| --- | --- | --- |
| Sort affordance, state, and direction | Sortable header treatment; active column; direction; inactive treatment | Do not infer sort results or toggling behavior |
| Multi-selection | Leading selection control and whether multiple rows may be selected | Do not infer bulk actions or select-all behavior |
| Header selection control | Whether the selection-column header is empty or contains select-all/indeterminate state | Presence does not establish update behavior |
| Selected and unselected row state | Visible distinction and which records show each state | No persistence or update trigger |
| Selection versus activation | Separate control, row activation, or neither | A selectable row is not thereby activatable |
| Horizontal alignment | Header/body alignment by text, numeric, selection, and icon role | Do not convert relative alignment to fixed dimensions |
| Vertical alignment | Cell and row alignment | Do not infer multi-line behavior |
| Text, numeric, and icon treatment | Content roles and their alignment | Do not assign business meanings |
| Density and row rhythm | Repetition, row height impression, separators, and padding relationship | No measurements |
| Header and body typography | Independent hierarchy, contrast, and emphasis | Do not infer identical weight |
| Grid/container width and remaining space | Assigned container relation, surface fill, content-column sizing, trailing presentation-only filler, and host-owned outer spacing | Do not infer a breakpoint or page margin |
| Overflow | Visible clipping, wrapping, scrolling, or absence of evidence | One width cannot establish a policy |
| Empty and narrow states | Visible empty or narrow treatment | Unshown states remain unresolved |
| Accessibility | Visible labels, sort state, and selection state | Focus, keyboard, and announcements remain unresolved unless shown |
| Application Input Contract needs | Required product values, state model, and omission rule | Never fill missing meaning from the observation |

# Authored defaults

When target-product inputs and observations do not decide otherwise, an active sorted header places its direction icon at the right edge of the header control. Do not persist inactive sort icons. Headers follow their content; text, identifiers, and status values align left; numbers align right; selection controls and standalone icons center. Use single-line vertical centering unless evidence or the Contract says otherwise. A restrained header distinction may be authored without forcing a matching font weight.

The grid surface fills the inline size assigned by its host; the host owns page-level top, left, and right spacing. Keep meaningful data columns at role-appropriate widths rather than stretching them merely to fill the surface. When the assigned width exceeds those columns, use one trailing presentation-only filler column with an empty header and empty body cells. The filler carries no data meaning, label, selection, sort, action, or responsive behavior. Do not invent arbitrary component margins. Leave the selection header empty unless the Contract declares a select-all control; when declared, render a checkbox with its checked or indeterminate state and accessible name.
