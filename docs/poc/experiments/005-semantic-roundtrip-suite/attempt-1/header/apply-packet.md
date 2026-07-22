---
type: Source-Blind Apply Packet
title: Global Header implementation packet
description: Self-contained source-blind input for a bounded static Header exercise.
status: draft
source: authored
scope: Static implementation and later independent re-extraction of `H-01` only.
requires:
  - manifest
  - application-input-contract
  - fixture-trace
  - claim-matrix
---

# Permitted inputs

Apply [Manifest](manifest.md), [Application Input Contract](application-input-contract.md), [Fixture trace](fixture-trace.md), and the `H-01` row of the [Claim matrix](claim-matrix.md). Do not use extraction records, source-aware material, external references, or remembered source details.

# Required static output

Produce one bounded static Header state that visibly contains:

- a global query role populated only by `F-QUERY-1`; and
- a separate utility-action group populated only by `F-UTILITY-1`.

The output must make their common Header membership and their distinct roles understandable without page content. It must not add an identity value, destination, local navigation, controlled region, additional hierarchy, behavior, or state.

# Evaluation handoff

Give the re-extractor only the generated static output, [Claim matrix](claim-matrix.md), and [Fixture trace](fixture-trace.md). The re-extractor evaluates `H-01` by role and relationship only, and records `preserved`, `partial`, `failure`, or `not exercised` with rationale.
