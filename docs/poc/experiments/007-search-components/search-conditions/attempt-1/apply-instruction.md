---
type: Application Instruction
title: Apply compact condition-entry guidance
description: Compact, source-blind instructions for a bounded static implementation.
status: draft
source: authored
scope: One static condition-entry region.
requires:
  - manifest
  - application-input-contract
---

# Allowed inputs

Use only [Manifest](manifest.md) and [Application Input Contract](application-input-contract.md), plus this instruction. Render the declared controls in reading order as one compact group, with a visible label or caption associated to every control and a visually primary group-owned action.

# Do not invent

Do not use placeholder-only labels, unlabeled checkboxes, anonymous bracket glyphs, reset or save controls, advanced conditions, results, extra fixture-driven fields, product copy, validation, behavior, responsive rules, or external/source material. If Contract input is absent, omit the dependent UI or request a decision.
