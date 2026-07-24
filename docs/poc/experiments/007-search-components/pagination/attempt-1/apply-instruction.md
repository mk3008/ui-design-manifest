---
type: Implementer Apply Instruction
title: Pagination static reconstruction instruction
description: Compact source-blind instruction for bounded result-grid pagination.
status: draft
source: authored
scope: One static result-grid footer control.
requires:
  - manifest
  - application-input-contract
---

# Build

Using only this instruction, the [Manifest](manifest.md), and the [Application Input Contract](application-input-contract.md), create one result-grid footer pagination control. Use the neutral fixture only: an unknown-total cursor-oriented mode, a supplied placeholder local position or range, enabled Previous and Next, and one separate boundary state with an explicitly disabled unavailable direction. Right-align the control after the grid.

Do not add total or page count, page input, arbitrary jump, first/last control, page-size selector, product copy, record identity, data-access mechanics, loading, empty/error state, focus, keyboard handling, announcements, persistence, motion, responsive transformation, or sticky/duplicate placement.
