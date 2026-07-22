---
type: Semantic Round-trip Claim Matrix
title: Result-grid claim matrix
description: Frozen source-independent claims for a future bounded static exercise.
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
| RG-01 | Result grid | A static viewport establishes a result-region header preceding a repeated entry region; it does not establish result count, condition submission, or updates. | A region header introduces a result collection. | Region header and record collection. | `Header-I`; synthetic repeated entry structure only. | Not yet generated. | Not exercised. | `not exercised` — no permitted rendered evidence exists in this pre-implementation bundle. |
| RG-02 | Result grid | A static viewport establishes a repeated entry with a primary reading target and associated lower-priority fields; it does not establish field semantics. | Each entry groups a record title with supporting metadata. | Record title and supporting metadata. | `Record-I` and `Metadata-I`. | Not yet generated. | Not exercised. | `not exercised` — no permitted rendered evidence exists in this pre-implementation bundle. |
| RG-03 | Result grid | A static viewport establishes a visible entry-associated marker but not its state meaning or update behavior. | A marker may remain associated with an entry only when owner-defined. | Marker meaning and display condition. | `Marker-I` only for non-semantic structural exercise. | Not yet generated. | Not exercised. | `not exercised` — the contract withholds marker meaning and no rendered evidence exists. |

# Freeze boundary

These rows do not authorize additional claims. A future exercise may compare only the declared region-to-entry and entry-to-field relationships. It must not convert an unresolved behavior or product value into a fixture.
