---
type: Fixture Trace
title: Neutral result-grid fixture trace
description: Declares the only neutral semantic slots available for a bounded static exercise.
status: draft
source: authored
scope: Static result-grid relationship exercise
requires:
  - application-input-contract
---

# Permitted neutral fixtures

The following synthetic tokens are permitted only in a non-product static exercise. They demonstrate already-declared slots and have no business, identity, status, aggregate, or destination meaning.

| Contract slot | Neutral fixture form | Constraint |
| --- | --- | --- |
| Region header | `Header-I` | A structural token only; not product copy. |
| Record title | `Record-I` | A structural token only; not a record identity. |
| Supporting metadata | `Metadata-I` | A structural token only; not a product field or value. |
| Marker | `Marker-I` | A structural token only; not a state or status. |
| Optional destination | absent | No destination is invented or implied. |

`I` denotes an arbitrary fixture instance, not a source-derived identifier or an expected item quantity. A fixture set may only demonstrate the declared region-to-entry and entry-to-field grouping; it must not claim source-derived records, counts, ordering, states, or behavior.

# Trace

The [claim matrix](claim-matrix.md) names the slot used by each potential exercise. A future rendered exercise must disclose its fixture use to a source-blind re-extractor and must not add any unlisted hierarchy slot.
