---
type: Header Observation Method
title: Global Header observation method
description: Image-first, source-blind method for extracting a bounded global Header.
status: active
source: authored
---

# Purpose

This method records a product-wide Global Header without turning a source UI into an application dependency. It is extraction and evaluation guidance only; the resulting Manifest and Implementer packet must be source-blind.

# Boundary and responsibility

Include the Header region, its product or screen identity title slot, and any visibly established global navigation, search, utility, account, or Drawer-trigger roles. Exclude page-local context, breadcrumbs, local navigation, Drawer body content, main content, and footer.

The title slot is required. Its value, destination, and all optional roles are supplied by the Application Input Contract. Do not turn a missing optional role into a default.

When a visible Drawer trigger is established, Header owns its placement, visible treatment, and accessible name. Drawer owns its content, presentation, current visibility, closed representation, persistence, and transitions. Left and right Drawer possibilities are independent Contract inputs. Never create a Drawer trigger, target side, state, or behavior unless it is observed or Contract-supplied.

# Use

1. Record extraction-only facts with the [observation schema](header-observation-schema.md).
2. Use the [extraction prompt](header-extraction-prompt.md) and [template](header-extraction-template.md).
3. Apply the [first-pass rubric](header-first-pass-rubric.md).
4. Keep prior evidence matrices and experiments historical; do not overwrite them.

Every applicable observation axis has one status: `observed`, `not observed`, `unresolved`, or `not applicable`. Source-blind statements separately use one provenance: `observed`, `method-default`, or `product input required`.

# Static-image limit

A still image can support region boundary, title prominence, grouping, order, density, surface/edge relation, visible placement, and icon responsibility. It cannot prove a target, transition, persistence, responsive transformation, focus, keyboard behavior, motion, or overflow behavior. Preserve those gaps.

# Round-trip gate

A source-blind static fixture must be visibly nonblank and permit re-extraction of each material exercised claim. It must use meaningful inline `currentColor` SVG for icon-only controls and put the accessible name on the interactive control. Text glyphs, empty boxes, placeholder shapes, and source-specific icon names are not acceptable.
