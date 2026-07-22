---
type: Semantic Round-Trip Claim Matrix
title: Global Header claim matrix
description: Separates retained Header relationships from application inputs and later evaluation evidence.
status: draft
source: mixed
scope: Static Global Header semantic round-trip review.
requires:
  - manifest
  - application-input-contract
  - fixture-trace
---

# Matrix

| Matrix ID | Declared component scope | Observed intent and evidence limit | Manifest claim | Application Input Contract need | Fixture support | Generated static evidence | Source-blind re-extraction result | Review status and rationale |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `H-01` | Header | A bounded static view establishes that a global query role and utility-action group coexist within the Header. It establishes no action behavior or destination. | Keep the global query role structurally distinct from the utility-action group inside the Header. | Permission to render the two declared roles statically. | `F-QUERY-1`, `F-UTILITY-1`. | Pending: one static Header state showing the two declared roles as separate members of the same Header. | Pending independent re-extraction from generated evidence only. | `not exercised` — the source-blind implementation and independent re-extraction have not yet been run. |
| `H-02` | Header | A bounded static view establishes an identity context before the other global roles. It does not establish its value or destination. | Retain an optional identity-context slot before the global roles when product-owned input permits it. | Authorized identity value and optional destination. | none | Not generated; omit unless the input is supplied. | Not run. | `unresolved` — identity content cannot be safely fabricated. |

# Material relationship selected for exercise

`H-01` is the material Header relationship selected for the next exercise. It is beyond a blank boundary: the review must identify the global-query-to-utility-group distinction within one Header. It cannot be reported as preserved until a source-blind static application and independent re-extraction are completed.
