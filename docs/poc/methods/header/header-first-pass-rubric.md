---
type: Extraction Rubric
title: Global Header first-pass rubric
description: Review gates for a source-blind Global Header handoff.
status: active
source: authored
---

# Review labels

Use `sufficient`, `partial`, `missing`, `unsupported`, `source-specific`, or `out-of-scope`.

| Check | Pass condition |
| --- | --- |
| Image-first boundary | The extraction-only record verifies the image digest and says URL used is false. |
| Status and provenance | Every applicable axis uses the exact status and provenance vocabularies separately. |
| Required identity | A neutral identity title slot is present; its value comes from the Contract. |
| Optional role separation | Navigation, search, utilities, account actions, and Drawer control are distinct optional roles. |
| Visual relationships | Boundary, order/grouping, density, title prominence, and surface/edge relationship are recorded without measurements. |
| Icon accessibility | Icon-only controls specify meaningful inline `currentColor` SVG and an interactive accessible name. |
| Drawer seam | Header trigger ownership is distinct from Drawer content, presentation, state, closed representation, persistence, and transition ownership. |
| Drawer restraint | No target, side, visibility, or behavior is created without observation or Contract input. |
| Static limits | Responsive, focus, keyboard, motion, and overflow are unresolved unless visibly proven. |
| Round trip | A nonblank fixture exercises material claims and permits semantic re-extraction; unproved Drawer semantics are not exercised. |
| Source boundary | No source identity, copied copy, path, URL, icon name, or searchable identifier enters the source-blind handoff. |
