---
type: Extraction Prompt
title: Result-grid extraction prompt
description: Bounded prompt for a source-blind result-grid handoff.
status: draft
source: authored
scope: Reusable method.
---

# Prompt

Given one bounded table surface, classify every observation-schema axis and name its knowledge ownership. Produce a Manifest, Application Input Contract, and compact apply instruction that retain only the visible table relationship, selectable-row state, active sort state, semantic alignment, density, header/body distinction, and width strategy. Keep evidence outside the handoff.

Use the authored default that an active sorted header has its direction icon at the right edge of the header control; inactive headers do not keep persistent icons. Use neutral fixture slots only when the Contract provides them: a leading multi-select checkbox, at least one selected and one unselected row, text and numeric data, and exactly one active sorted column. Do not create product meaning, a dummy data column, pagination, bulk actions, activation, editing, focus, overflow, or narrow behavior. Mark all unshown behavior unresolved.
