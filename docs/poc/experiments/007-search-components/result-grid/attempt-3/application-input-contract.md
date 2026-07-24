---
type: Application Input Contract
title: Result-grid application inputs
description: Product-owned and neutral-fixture inputs for one static result grid.
status: draft
source: authored
scope: One table surface with a header row and repeated records.
requires:
  - manifest
---

# Required ownership

The application owner supplies display intent, values, state model, and update behavior. The static calibration fixture below is permitted only to exercise already-declared slots; it supplies no product meaning.

| Slot | Required input | Unresolved behavior when absent |
| --- | --- | --- |
| Column labels | Permitted labels and display intent for selection, text, numeric, or icon columns | Omit the dependent column or stop for a decision. |
| Record collection | Allowed records, ordering source, display condition, and update trigger | Omit rows; do not invent a collection. |
| Selection model | Multi-select Boolean choice, selected values, source of truth, display condition, and update trigger | Render no selection control or selected state. |
| Header selection control | Select-all availability, checked or indeterminate state, accessible name, display condition, and update trigger | Keep the selection-column header empty. |
| Sort model | One active field, direction, allowed fields, source of truth, display condition, and update trigger | Render no sort control or direction state. |
| Text and numeric cells | Permitted text/numeric values, meanings, and display conditions | Omit the dependent cell value. |
| Icon slot | Meaningful icon purpose, accessible name, display condition, and update trigger | Omit the icon. |
| Host and container | Assigned inline width and host-owned outer spacing | Fill the assigned inline width; do not invent page-level top, left, or right margins. |
| Column sizing and overflow | Role-appropriate width for each meaningful column, trailing filler availability, and overflow/narrow policy | Keep meaningful columns content-appropriate and use one empty trailing presentation-only filler for residual width. |

# Neutral fixture contract

| Field | Required supplied value |
| --- | --- |
| Selection column | Leading multi-select row checkboxes with discernible accessible names; include one selected and one unselected row. |
| Header selection control | Present and unchecked with a discernible select-all name, exercising only the visible affordance; update behavior remains unresolved. |
| Text column | Placeholder-only labels and neutral text values at a restrained, readable width. |
| Numeric column | Placeholder-only label and neutral numeric values at a compact width. |
| Sorted column | Exactly one active sorted column with an ascending or descending direction; its direction icon appears at the header control right edge. |
| Assigned width | Fill the host-assigned width without arbitrary component margins. |
| Remaining space | Add one trailing empty presentation-only filler column. Its header and cells contain no label, value, control, sort state, or accessible data meaning. |

# Explicitly unresolved interaction

This Contract declares the header select-all affordance only, not its action or update behavior. It declares no row activation, bulk action, sorting update, pagination, editing, empty/loading/failure state, narrow transformation, focus, keyboard, announcements, or motion. Omit dependent behavior rather than infer it.

# Relationships

Use with the [Manifest](manifest.md) and [apply instruction](apply-instruction.md).
