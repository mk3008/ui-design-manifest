---
type: UI Design Manifest
title: Condition-entry area
description: Source-blind structural guidance for a compact condition-entry group.
status: draft
source: observed
scope: One bounded static condition-entry area.
requires:
  - application-input-contract
  - claim-matrix
---

# Guidance

Present a compact condition-entry group in reading order. The group contains two selection slots followed by a value-entry slot, then an optional selection slot and a submit slot. Keep the slots visibly associated as one condition-entry responsibility rather than as unrelated controls.

The submit slot belongs to the condition-entry group. The static arrangement establishes grouping and order only; it does not establish any query, validation, update, population, default, error, or responsive behavior.

# Unresolved

- The product meaning and allowed values of every selection slot are product-owned.
- The relationship, if any, between the first and second selection slots is not established.
- The meaning of the optional selection slot is not established.
- Submission outcome and any result context are not established.

# Relationships

Application needs are defined in the [Application Input Contract](application-input-contract.md). The reviewable relationship is frozen in the [claim matrix](claim-matrix.md).
