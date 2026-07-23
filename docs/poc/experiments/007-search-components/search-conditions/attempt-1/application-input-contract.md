---
type: Application Input Contract
title: Condition-entry application inputs
description: Product-owned inputs needed to render one accessible static condition-entry group.
status: draft
source: authored
scope: One bounded static condition-entry region.
requires:
  - manifest
---

# Control inventory

| ID | Label input | Control type | Allowed/value/default input | Required/optional | Visibility | Group membership | Help and validation owner |
| --- | --- | --- | --- | --- | --- | --- | --- |
| condition-kind | Required supplied label | Select | Supplied options and selected/default value | Supplied | Visible | Condition group | Application owner |
| comparison | Required supplied label | Select | Supplied options and selected/default value | Supplied | Visible | Condition group | Application owner |
| condition-value | Required supplied label | Text entry | Supplied allowed form and value/default | Supplied | Visible | Condition group | Application owner |
| related-content | Required supplied caption | Boolean choice | Supplied checked/default state | Supplied | Visible | Condition group | Application owner |

# Actions

| ID | Declaration | Ownership | Placement | Behavior |
| --- | --- | --- | --- | --- |
| apply-conditions | One required primary action with supplied accessible label | Condition group | After the condition controls | Application owner supplies any outcome and update trigger |

# Static fixture allowance

For a non-product static exercise only, neutral fixtures may populate the declared slots: `Criterion`, `Match rule`, `Value`, `Include related content`, and `Apply`. They demonstrate association and role only; they do not supply domain meaning, destinations, results, or behavior.

# Unresolved inputs

No source of truth, validation, conditional visibility, saved-condition policy, result relationship, narrow policy, focus behavior, keyboard behavior, motion, persistence, or product-specific copy is supplied. Omit dependent UI or stop for an application-owner decision.

# Relationships

Apply this Contract with the [Manifest](manifest.md) and [apply instruction](apply-instruction.md).
