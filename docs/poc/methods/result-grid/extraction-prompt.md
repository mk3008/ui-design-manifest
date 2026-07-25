---
type: Extraction Prompt
title: Result-grid extraction prompt
description: Bounded prompt for a source-blind result-grid handoff.
status: draft
source: authored
scope: Reusable method.
---

# Prompt

Given one bounded table surface, classify every observation-schema axis and name its knowledge ownership. Produce a Manifest, Application Input Contract, and compact apply instruction that retain only the visible table relationship, row-selection and header-selection responsibility, selectable-row state, active sort state, semantic alignment, density, header/body distinction, and width strategy. Keep evidence outside the handoff.

Use the authored default that an active sorted header has its direction icon at the right edge of the header control; inactive headers do not keep persistent icons. Observe whether the selection header is empty or contains a checkbox, but do not infer select-all behavior. Use neutral fixture slots only when the Contract provides them: a leading multi-select checkbox, optional header selection control, at least one selected and one unselected row, text and numeric data, and exactly one active sorted column.

Treat the grid surface as filling the container assigned by its host; do not invent page-level margins. Keep meaningful columns at role-appropriate widths. When residual width remains, add one trailing presentation-only filler column with an empty header and empty cells; do not give it data, selection, sorting, action, or responsive semantics. Do not create product meaning, pagination, bulk actions, activation, editing, focus, overflow, or narrow behavior. Mark all unshown behavior unresolved.
