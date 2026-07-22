---
type: Semantic Round-Trip Exercise Classification
title: Global Header exercise classification
description: Records the pre-implementation scope gate and the exact conditions needed to run it.
status: draft
source: authored
scope: Static Global Header semantic round-trip review.
requires:
  - claim-matrix
---

# Classification

**Current gate: not exercised.** The bundle is pre-implementation input; no generated static evidence or independent source-blind re-extraction exists yet.

The next exercise must render `H-01` using only the [Apply packet](apply-packet.md), then give a fresh re-extractor the generated static evidence, this claim matrix, and the disclosed fixtures. A passing result requires the re-extractor to identify the query role and utility-action group as distinct roles within one Header.

# Scope decision

Implementation may safely start for `H-01` because its two declared slots have explicit static-exercise permission and neutral fixtures. It may not start for `H-02` without product-owned identity input. No result in this file is evidence of preservation.
