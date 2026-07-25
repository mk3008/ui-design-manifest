---
type: Implementer Apply Instruction
title: Result-grid static reconstruction instruction
description: Compact source-blind instruction for a bounded result-grid exercise.
status: draft
source: authored
scope: One static table surface.
requires:
  - manifest
  - application-input-contract
---

# Build

Using only this instruction, the [Manifest](manifest.md), and the [Application Input Contract](application-input-contract.md), create one static table surface. Use the Contract's neutral fixture only: a leading multi-select checkbox, at least one selected and one unselected row, placeholder-only labels, text and numeric values, and one active sorted column. Put that active direction icon at the right edge of the header control; do not persist inactive icons.

Align headers with their column content. Keep text, identifiers, and status values left; numeric values right; selection controls and standalone icons centered. Keep single-line content vertically centered. Preserve a compact repeated row rhythm and a restrained header/body distinction. Leave remaining surface width as whitespace, use explicit stretch, or apply an explicit Contract overflow rule; never add a semantic dummy data column.

Do not add product copy, meanings, identities, statuses, counts, destinations, row activation, bulk actions, select-all behavior, sorting behavior, editing, pagination, empty/loading/failure states, narrow transformation, focus, keyboard handling, announcements, motion, or an overflow policy not supplied by the Contract.
