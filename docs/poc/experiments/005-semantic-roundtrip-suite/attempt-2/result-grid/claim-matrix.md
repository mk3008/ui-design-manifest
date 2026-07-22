---
type: Semantic Round-trip Claim Matrix
title: Result-grid claim matrix
description: Frozen source-independent claims for an authorized bounded static exercise.
status: draft
source: mixed
scope: Static result-grid region only
requires:
  - manifest
  - application-input-contract
  - fixture-trace
---

# Matrix

| Matrix ID | Declared component scope | Observed intent and evidence limit | Manifest claim | Application Input Contract need | Fixture support | Generated static evidence | Source-blind re-extraction result | Review status and rationale |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| RG-01 | Result grid | A static viewport establishes a result-region header preceding a repeated entry region; it does not establish result count, condition submission, or updates. | A region header introduces a result collection. | Region header and record collection. | `Header-I`; synthetic repeated entry structure only. | Authorized; not yet generated. | Not yet performed. | `authorized for static evidence` — no preservation claim is permitted before an independent source-blind re-extraction. |
| RG-02 | Result grid | A static viewport establishes a repeated entry with a primary reading target and associated lower-priority fields; it does not establish field semantics. | Each entry groups a record title with supporting metadata. | Record title and supporting metadata. | `Record-I` and `Metadata-I`. | Authorized; not yet generated. | Not yet performed. | `authorized for static evidence` — no preservation claim is permitted before an independent source-blind re-extraction. |
| RG-03 | Result grid | A static viewport establishes a visible entry-associated marker but not its state meaning or update behavior. | A marker may remain associated with an entry only when owner-defined. | Marker meaning and display condition. | `Marker-I` only for non-semantic structural exercise. | Authorized; not yet generated. | Not yet performed. | `authorized for static evidence` — a marker may demonstrate association only, never a state or status; no preservation claim is permitted before independent re-extraction. |

# Freeze boundary

These rows authorize only the declared neutral static exercise. They do not authorize a preservation claim, product values, record quantity, ordering, state, destination, or behavior. Preservation may be assessed only after a later independent source-blind re-extraction compares the generated static evidence with these frozen claims.
