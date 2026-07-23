---
type: Application Input Contract
title: Dense condition-entry application inputs
description: Product-owned inputs needed to render a wide static panel of repeated conditions.
status: draft
source: authored
scope: One bounded condition-entry region in wide main content.
requires:
  - manifest
---

# Layout responsibility

Render the declared condition rows in the available main-content width as a repeated horizontal sequence. The product owns any narrow-width transformation and any results content beyond the panel boundary.

# Condition-row inventory

Each row has a visible label or caption associated with every interactive control. `Enabled` is a Boolean choice with a visible caption, and `Remove condition` is the row-owned removal responsibility.

| Row ID | Required supplied field label | Required supplied operator label | Required supplied value label | Enabled caption and state | Remove responsibility |
| --- | --- | --- | --- | --- | --- |
| condition-a | Required supplied label and selected value | Required supplied label and selected value | Required supplied label and text value | Required supplied caption and Boolean state | Required supplied accessible label |
| condition-b | Required supplied label and selected value | Required supplied label and selected value | Required supplied label and selected or text value | Required supplied caption and Boolean state | Required supplied accessible label |
| condition-c | Required supplied label and selected value | Required supplied label and selected value | Required supplied label and selected or text value | Required supplied caption and Boolean state | Required supplied accessible label |
| condition-d | Required supplied label and selected value | Required supplied label and selected value | Required supplied label and selected or text value | Required supplied caption and Boolean state | Required supplied accessible label |

# Panel actions

| ID | Declaration | Ownership | Visual role | Behavior owner |
| --- | --- | --- | --- | --- |
| add-condition | One supplied action that adds a declared row | Condition panel | Secondary | Application owner |
| apply-conditions | One supplied Apply action | Condition panel | Primary | Application owner supplies outcome and update trigger |
| clear-conditions | One supplied Clear or reset action | Condition panel | Secondary | Application owner supplies reset scope and update trigger |

# Static fixture allowance

For a non-product static exercise only, neutral fixtures may fill the already declared semantic slots: `Attribute`, `Comparison`, `Text value`, `Enabled`, `Remove condition`, `Add condition`, `Apply`, and `Clear`. They demonstrate row responsibility and association only; they do not supply domain meaning, destinations, results, or behavior.

# Unresolved inputs

No source of truth, validation, conditional visibility, result update, saved-condition policy, narrow transformation, focus behavior, keyboard behavior, motion, persistence, or product-specific copy is supplied. Omit dependent UI or stop for an application-owner decision.

# Relationships

Apply this Contract with the [Manifest](manifest.md) and [apply instruction](apply-instruction.md).
