---
type: Implementer Apply Instruction
title: Apply dense search screen composition
description: Source-blind instructions for one static, grid-based search screen.
status: draft
source: authored
scope: One main-content-only static evidence screen.
requires:
  - manifest
  - application-input-contract
---

# Build

Render one dense main-content screen using the [Manifest](manifest.md) and [Application Input Contract](application-input-contract.md). Show a restrained title, then four repeated horizontal condition rows with visible labels for Field, Comparison, Value, and Enabled. Place Search before Clear in a left-aligned action group. Mark a compact boundary before the full-width result grid.

Render the grid with a leading header checkbox, selected and unselected rows, one active sort icon at the right edge of its text header, left-aligned text, right-aligned numeric values, and one empty trailing filler column. Attach a right-aligned footer control containing a supplied local position, enabled Previous and Next, and a visible disabled-direction boundary example.

Render narrow evidence as the same dense workspace. Controlled horizontal cropping or overflow is diagnostic evidence; do not invent a reflow. Do not add product copy, cards, totals, page count, jump controls, first/last controls, page-size selection, global navigation, or behavior.
