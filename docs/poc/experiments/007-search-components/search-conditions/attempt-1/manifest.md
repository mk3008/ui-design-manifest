---
type: UI Design Manifest
title: Compact condition-entry group
description: Source-blind structural guidance for a bounded set of search conditions.
status: draft
source: mixed
scope: One visible condition-entry region; excludes navigation, results, and all surrounding screen content.
requires:
  - application-input-contract
---

# Guidance

Present one compact condition-entry group with a clear local responsibility. Keep each control visibly paired with its label, including the boolean choice. Arrange controls in a stable reading sequence, with repeated rows using an economical spacing rhythm and the group boundary clearer than gaps within a row.

The primary action belongs to this group and follows its conditions. Treat the action as visually primary without adding secondary reset, save, result, or advanced-condition controls unless the Application Input Contract explicitly provides them.

# Unresolved

The group does not establish product meaning, allowed values, requiredness, validation, submission behavior, result update behavior, saved conditions, conditional dependencies, keyboard or focus behavior, motion, persistence, or narrow-layout transformation.

# Relationships

Application supplies the product-owned choices in the [Application Input Contract](application-input-contract.md). The implementation receives only this Manifest, that contract, and the compact apply instruction.
