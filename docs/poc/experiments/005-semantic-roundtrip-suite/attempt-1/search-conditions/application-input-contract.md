---
type: Application Input Contract
title: Condition-entry inputs
description: Product-owned semantic inputs required to render and exercise the condition-entry structure.
status: draft
source: authored
scope: Static reconstruction of one condition-entry area.
requires:
  - manifest
  - fixture-trace
---

# Structural controls

The application must provide semantic slots for two ordered selection controls, one value-entry control, one optional selection control, and one submit control. Their product labels, values, default states, and behavior are not supplied by this contract.

# Product-owned decisions

| Need | Owner | Safe treatment when absent |
| --- | --- | --- |
| Meaning and options for the first selection slot | Application owner | Use only a declared neutral fixture for a static exercise; otherwise omit its product content. |
| Meaning and options for the second selection slot | Application owner | Use only a declared neutral fixture for a static exercise; otherwise omit its product content. |
| Meaning and allowed form of the value-entry slot | Application owner | Use only a declared neutral fixture for a static exercise; otherwise leave content unresolved. |
| Meaning and state model of the optional selection slot | Application owner | Render only a declared neutral selection state for a static exercise. |
| Submit behavior, validation, and post-submit state | Application owner | Do not implement or claim behavior. |

# State model

No state source, allowed state, display condition, or update trigger is established. The permitted static exercise exposes only the declared slot arrangement and a neutral, non-product-bearing fixture state.

# Unresolved

No product identity, user identity, record, aggregate, destination, or result context is supplied. Dependent UI must be omitted unless an application owner supplies it.
