---
type: Semantic Claim Matrix
title: Header–Drawer composite reconstruction claims
description: Evaluator-only source-blind claims for static comparison and re-extraction.
status: draft
source: authored
---

| ID | Claim | Witness | Status |
| --- | --- | --- | --- |
| `HD1` | Pattern A open state exposes its Header-owned authoritative controller and expanded Drawer. | `A-open` | exercised |
| `HD2` | Pattern A fully hidden state removes the Drawer completely while the Header trigger remains in the same slot and the title anchor is unchanged. | `A-hidden` | exercised |
| `HD3` | Pattern B expanded state has no Header Drawer trigger and exposes one Drawer-owned, left-pointing compact control. | `B-open` | exercised |
| `HD4` | Pattern B icon-rail state retains the Drawer-owned, right-pointing expand control and meaningful declared icon shortcuts. | `B-rail` | exercised |
| `HD5` | Each state declares exactly one authoritative controller; no duplicate independent state owner appears. | all | exercised |
| `HD6` | Pattern A Header trigger and title have identical x-coordinates in `A-open` and `A-hidden`; Drawer visibility alone changes. | `A-open`, `A-hidden` | exercised |
| `HD7` | The Drawer-to-content relation is visibly represented only as supplied by the Contract. | all | exercised |
| `HD8` | Focus, keyboard, motion, persistence, presentation, backdrop, and viewport policy are not simulated without input. | all | not exercised |

This matrix is not an Implementer input.
