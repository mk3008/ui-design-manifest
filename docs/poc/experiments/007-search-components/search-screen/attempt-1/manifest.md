---
type: Search Screen Manifest
title: Dense search screen composite
description: Source-blind guidance for composing conditions, a result grid, and unknown-total pagination in one main-content screen.
status: draft
source: authored
scope: One static main-content search screen; excludes global navigation and interaction behavior.
requires:
  - application-input-contract
---

# Guidance

Place one restrained screen title above the full-width condition-entry region. Keep the condition region and result region visibly bounded, while letting the result grid immediately own the result surface beneath conditions. Attach the unknown-total pagination control to the grid footer and align it to that footer's right edge.

The screen owns only the ordering and compact spacing between these regions. The condition-entry panel, result grid, and pagination control retain their respective internal responsibilities. Use the available main-content width for the dense workspace; do not introduce a global header, drawer, or individual-row cards.

# Unresolved

Search, clear, selection, select-all, sorting, and pagination behavior remain application-owned. Narrow transformation, data values, totals, direct navigation, page size, row activation, and all global navigation remain unresolved.

# Relationships

Apply this composite with its [Application Input Contract](application-input-contract.md) and [apply instruction](apply-instruction.md).
