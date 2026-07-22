---
type: Source-blind Apply Packet
title: Drawer static reconstruction handoff
description: Permitted renderer inputs and explicit exclusions for a bounded Drawer exercise.
status: draft
source: authored
scope: One static generated evidence state.
requires:
  - manifest
  - application-input-contract
  - fixture-trace
  - claim-matrix
---

# Allowed renderer inputs

1. Read [Manifest](manifest.md), [Application Input Contract](application-input-contract.md), [Fixture trace](fixture-trace.md), and [Claim matrix](claim-matrix.md).
2. Render one visible Drawer static state with the fixture only: an item labelled `Destination`, marked current, without an activation target.
3. Make the current-state-to-destination relationship legible in the static evidence without adding captions, groups, nesting, counts, destinations, product identity, or runtime behavior.
4. Keep an icon slot absent unless the application owner supplies its semantic responsibility. If supplied later, follow the contract's accessible non-checkbox-shaped SVG or icon constraint.

# Required renderer output

Provide one bounded static image or equivalent static view for D-01, then hand it with the frozen matrix and fixture disclosure to an independent source-blind re-extractor.

# Exclusions and stop rule

Do not consult any original interface, source-aware artifact, extraction trace, external resource, remembered source vocabulary, or unstated fallback. Stop and return the missing decision if a requested output needs a destination, caption, group, hierarchy, count, control, behavior, or icon meaning not declared here.
