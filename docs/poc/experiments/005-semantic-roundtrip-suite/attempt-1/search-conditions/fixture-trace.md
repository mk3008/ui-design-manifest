---
type: Fixture Trace
title: Neutral condition-entry fixtures
description: Declares the only neutral fixture slots permitted for the static relationship exercise.
status: draft
source: authored
scope: One source-blind static exercise.
requires:
  - application-input-contract
  - claim-matrix
---

# Declared fixtures

| Slot | Neutral synthetic value | Purpose | Provenance |
| --- | --- | --- | --- |
| field | `field-1` | Occupies the first selection slot without product meaning. | Explicit test fixture. |
| operator | `operator-1` | Occupies the second selection slot without asserting its source meaning. | Explicit test fixture. |
| value | `value-1` | Occupies the value-entry slot without product content. | Explicit test fixture. |
| selection | `false` | Shows an unselected optional selection slot. | Explicit test fixture. |
| submit | `submit-1` | Identifies the submit slot for static evidence only. | Explicit test fixture. |

# Boundary

These values are placeholders for already-declared slots. They do not provide labels, option sets, product data, predicates, destinations, behavior, or additional hierarchy.
