---
type: Application Input Contract
title: Search screen composite application inputs
description: Composition inputs and fixture limits for one static main-content search screen.
status: draft
source: authored
scope: One dense search screen combining conditions, a result grid, and a grid-footer pagination control.
requires:
  - manifest
---

# Composition responsibility

The host supplies the available main-content width and the screen title slot. The composite orders the condition panel before the result grid, and attaches pagination in the grid footer. The screen does not own global navigation, application behavior, data fetching, or narrow transformation.

# Static fixture allowance

For this non-product static exercise, the title slot may use the neutral fixture `Search`. The composition may use only the predeclared neutral fixture slots from the applicable condition-entry, result-grid, and pagination contracts: four condition rows; Search and Clear; placeholder text and numeric cells; selected and unselected checkboxes; one active sort direction; a local cursor position; enabled navigation; and one disabled boundary example.

# Unresolved inputs

No product copy, identities, statuses, totals, page count, destinations, state source of truth, update trigger, or responsive transformation is supplied. Do not infer dependent UI or behavior.

# Relationships

Use with the [Manifest](manifest.md) and [apply instruction](apply-instruction.md).
