---
type: Application Packet
title: Source-blind condition-entry application packet
description: Bounded instructions for producing static evidence without product invention.
status: draft
source: authored
scope: One static condition-entry reconstruction.
requires:
  - manifest
  - application-input-contract
  - fixture-trace
  - claim-matrix
---

# Allowed input

Apply only the [Manifest](manifest.md), [Application Input Contract](application-input-contract.md), [Fixture trace](fixture-trace.md), and [Claim matrix](claim-matrix.md). Do not use source material, source-aware evidence, product vocabulary, or additional product data.

# Static rendering requirement

Render one compact condition-entry group with the five declared slots in this order: field, operator, value, selection, submit. Use only the declared neutral fixtures. Make the grouping and submit ownership observable without adding explanatory copy or result content.

# Prohibited inference

Do not infer predicates, field semantics, option values, defaults, validation, submission behavior, error handling, result updates, destinations, responsive behavior, product identity, or additional hierarchy.

# Evidence handoff

Provide the generated static evidence, this packet, the fixture disclosure, and the claim matrix to a fresh re-extractor. The re-extractor evaluates SC-01 by role and relationship only.
