---
type: UI Design Manifest
title: Dense wide condition-entry panel
description: Source-blind structural guidance for a bounded, repeated condition-entry panel.
status: draft
source: mixed
scope: One visible condition-entry region in wide main content; excludes navigation and result content.
requires:
  - application-input-contract
---

# Guidance

Use the available main-content width for a single condition panel. Maintain a repeated horizontal row rhythm: each row owns a field choice, comparison choice, value entry, and enabled state. Keep those responsibilities aligned so a person can scan and adjust multiple conditions without treating each row as an independent card.

The panel owns adding another condition. Place the primary apply action after the condition work, and distinguish the supplied clear or reset action as secondary. Establish a clear regional boundary before any separately owned results content without prescribing the results themselves.

# Unresolved

The panel does not establish product terminology, an exact number of conditions, a per-row removal affordance, value formats, requiredness, validation, action outcomes, result updates, saved conditions, keyboard or focus behavior, motion, persistence, or narrow-layout transformation. At a narrow width, preserve the declared row responsibilities through a product-owned transformation; do not infer a particular wrapping, stacking, hiding, or overflow rule.

# Relationships

Application supplies the product-owned rows and actions in the [Application Input Contract](application-input-contract.md). The implementation receives only this Manifest, that contract, and the compact [apply instruction](apply-instruction.md).
