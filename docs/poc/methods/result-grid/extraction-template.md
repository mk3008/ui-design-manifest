---
type: Extraction Template
title: Result-grid extraction template
description: Source-blind handoff shape for one bounded business result grid.
status: draft
source: authored
scope: Reusable method.
---

# Handoff shape

- **Manifest:** table-surface responsibility, header-to-column relationship, selected/unselected state relationship, one active sort relationship, semantic alignment, density, and width strategy.
- **Application Input Contract:** neutral records; declared selection state; one active sort field and direction; text, numeric, and icon slots; column labels; accessibility names; width and overflow owner; and an omission rule for all missing behavior.
- **Apply instruction:** use only the Manifest and Contract; make no product data or interaction decisions.

# Information-loss rule

Retain relationships and bounded presentation roles. Exclude original labels, values, names, counts, destinations, product taxonomy, exact dimensions, capture details, and implementation mechanics. Do not add a semantic dummy column merely to consume remaining width; use trailing table-surface whitespace, an explicit Contract stretch field, or a Contract overflow rule.
