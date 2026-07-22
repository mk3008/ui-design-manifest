---
type: Application Packet
title: Result-grid source-blind application packet
description: Bounded handoff inputs for a future static result-grid exercise.
status: draft
source: authored
scope: Static result-grid region only
requires:
  - manifest
  - application-input-contract
  - fixture-trace
  - claim-matrix
---

# Permitted inputs

- [Manifest](manifest.md)
- [Application Input Contract](application-input-contract.md)
- [Fixture trace](fixture-trace.md)
- [Claim matrix](claim-matrix.md)

# Application instructions

Implement only the declared region-to-entry and entry-to-field relationships. Use product-owned values only when the contract supplies them. For a bounded non-product exercise, use only the disclosed neutral fixture forms and disclose them again to the re-extractor.

Do not add display copy, product taxonomy, record identities, counts, marker semantics, destination affordances, refinement behavior, sorting, pagination, selection, activation, loading, empty states, failure states, or responsive behavior. Treat missing contract inputs as an omission or owner decision, not as permission to invent a fallback.

# Excluded material

The [extraction and evaluation record](extraction-evaluation-record.md) is excluded from application inputs. It must not be used to recover original values, source context, or behavior.
