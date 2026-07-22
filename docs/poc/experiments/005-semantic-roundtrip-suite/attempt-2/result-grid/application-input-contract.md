---
type: Application Input Contract
title: Result-grid application inputs
description: Product-owned inputs required to render or evaluate the bounded result-grid scope.
status: draft
source: authored
scope: Static result-grid region only
requires:
  - manifest
---

# Required ownership

The application owner supplies all display values and determines whether each slot may be rendered. This contract does not authorize display copy, product taxonomy, record identity, counts, states, or destinations.

| Slot | Owner-supplied requirement | Unresolved behavior when absent |
| --- | --- | --- |
| Region header | Permitted value, source of truth, display condition, and update trigger. | Omit the header or stop for an owner decision. |
| Record collection | Product-owned record source, permitted fields, ordering decision, and display condition. | Omit entries; do not synthesize a product collection. |
| Record title | Permitted value and its provenance for each displayed record. | Omit the dependent entry. |
| Supporting metadata | Permitted fields, their meanings, display conditions, and update triggers. | Omit the metadata. |
| Marker | Meaning, source of truth, allowed values, display condition, and update trigger. | Omit the marker. |
| Optional destination | Destination authorization, presentation rule, and invocation rule. | Render no destination affordance or action. |

# Explicitly unresolved interaction

No behavior is declared for refinement, submission, sorting, pagination, selection, record activation, navigation, loading, empty state, failure state, or responsive change. The implementation owner must supply a bounded decision before adding any dependent UI or behavior.

# Fixture boundary

Fixtures may populate only the six declared slots above and only as described in the [fixture trace](fixture-trace.md). They are test disclosures, not product data or a fallback for missing owner input.
