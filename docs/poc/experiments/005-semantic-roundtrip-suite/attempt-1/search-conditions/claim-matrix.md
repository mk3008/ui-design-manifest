---
type: Semantic Claim Matrix
title: Condition-entry relationship matrix
description: Freezes the source-blind structural claim to exercise before implementation review.
status: draft
source: mixed
scope: Condition-entry area only.
requires:
  - manifest
  - application-input-contract
  - fixture-trace
---

# Claim matrix

| Matrix ID | Declared component scope | Observed intent and evidence limit | Manifest claim | Application Input Contract need | Fixture support | Generated static evidence | Source-blind re-extraction result | Review status and rationale |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| SC-01 | Condition-entry area | A bounded static view establishes an ordered, visually grouped set of selection, entry, optional-selection, and submit controls. It does not establish their meaning or behavior. | The ordered slots form one condition-entry group; the submit slot belongs to that group. | Ordered semantic slots for field, operator, value, selection, and submit; all product meaning remains owner-supplied. | `field-1`, `operator-1`, `value-1`, `false`, and `submit-1` from the [fixture trace](fixture-trace.md). | A single static rendering shows all five declared slots as one compact group in the declared order. | Pending independent re-extraction from generated static evidence. | unresolved — the source-blind reconstruction and independent review have not yet occurred. |

# Exercise boundary

SC-01 is material because it tests condition group-to-combination meaning beyond an empty boundary. It must be exercised and preserved before this component scope can be accepted.
