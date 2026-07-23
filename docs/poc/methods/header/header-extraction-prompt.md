---
type: Extraction Prompt
title: Global Header extraction prompt
description: Bounded, image-first instructions for a source-blind Header bundle.
status: active
source: authored
---

# Task

Extract a Global Header from the declared visual input only. Record input evidence outside the source-blind bundle, then produce reusable guidance and an Application Input Contract.

1. Verify the supplied image digest before opening it. Declare the opaque input ID, input type, viewport/state, observed scope, unobserved scope, and whether a URL was used.
2. Draw the Header boundary. Separate it from page-local context or breadcrumbs, local navigation, and Drawer body content.
3. Fill every applicable [observation-schema](header-observation-schema.md) axis with exactly `observed`, `not observed`, `unresolved`, or `not applicable`. Give source-blind claims separate provenance: `observed`, `method-default`, or `product input required`.
4. Require a neutral product or screen identity title slot. Treat global navigation, global search, utilities, account actions, and Drawer controls as optional Contract roles.
5. Record only visible relationships: role order/grouping, title prominence, density, surface/divider/on-header contrast, and visible control placement. Do not copy labels, counts, product terms, icons, measurements, or source structure.
6. For any icon-only role, require meaningful inline `currentColor` SVG and an accessible name on its interactive control. Do not substitute a text glyph, empty box, placeholder, or source-specific icon name.
7. Record a Drawer seam only when visibility establishes it. Header owns a visible trigger's placement, treatment, and name; Drawer owns content, presentation, visibility, closed representation, persistence, and transitions. Target, side, and state remain Contract inputs or unresolved unless directly established.
8. Mark responsive, focus, keyboard, motion, overflow, targets, transitions, and persistence unresolved when a static image cannot establish them.
9. Produce a neutral fixture only for Contract-supplied semantic slots. It must exercise material visible claims without implying unproved Drawer semantics.
10. Reject a blank Header, missing title, conflated search and utility roles, leaked page-local context, invented Drawer semantics, source leakage, provenance conflation, or an output that cannot be semantically re-extracted.
