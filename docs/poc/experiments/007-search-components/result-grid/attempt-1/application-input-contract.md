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
| Sort model | One active field, direction, allowed fields, source of truth, display condition, and update trigger | Render no sort control or direction state. |
| Text and numeric cells | Permitted text/numeric values, meanings, and display conditions | Omit the dependent cell value. |
| Icon slot | Meaningful icon purpose, accessible name, display condition, and update trigger | Omit the icon. |
| Width and overflow | Container width, remaining-space strategy, and overflow/narrow policy | Retain content-width table surface; do not add a filler column or responsive behavior. |

# Neutral fixture contract

Use only these abstract slots for a non-product static reconstruction:

| Field | Required supplied value |
| --- | --- |
| Selection column | Leading multi-select checkbox with a discernible accessible name; include one selected and one unselected row. |
| Text column | Placeholder-only labels and neutral text values. |
| Numeric column | Placeholder-only label and neutral numeric values. |
| Sorted column | Exactly one active sorted column with an ascending or descending direction; its direction icon appears at the header control right edge. |
| Remaining space | Trailing table-surface whitespace, explicit stretch, or explicit overflow rule; never a semantic dummy data column. |

# Explicitly unresolved interaction

This Contract declares no row activation, bulk action, select-all action, sorting update, pagination, editing, empty/loading/failure state, narrow transformation, focus, keyboard, announcements, or motion. Omit dependent behavior rather than infer it.

# Relationships

Use with the [Manifest](manifest.md) and [apply instruction](apply-instruction.md).
