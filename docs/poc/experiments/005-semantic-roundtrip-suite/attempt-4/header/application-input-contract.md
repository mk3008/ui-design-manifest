---
type: Application Input Contract
title: Header application input contract
description: Required and optional inputs for applying the bounded Header without source access.
status: draft
source: authored
---

# Required input

`identityTitle` is required neutral product or screen identity text. It supplies the title slot but does not imply a destination.

# Optional roles

`globalNavigation`, `globalSearch`, `utilities`, and `accountActions` are independent optional role collections. Each supplied role declares its neutral label or accessible name, destination or no-action status, and group membership. `roleOrder` and `groupOrder` may override the default relationship while retaining distinct search and utility groups.

`iconControls` declares an accessible name and meaningful inline `currentColor` SVG semantic for every icon-only control. Text glyphs, blank shapes, placeholders, and source-specific icon names are invalid.

# Drawer-control input

`drawerControl` is optional and must explicitly declare whether it is present. When present it must supply its target identifier, side (`left` or `right`), current state if displayed, and the product-owned behavior model. Header may apply only placement, visual treatment, and accessible name. Drawer content, presentation, visibility, closed representation, persistence, and transitions are not Header inputs.

# Viewport and gaps

`viewportScope` declares the static view being applied. Responsive, focus, keyboard, motion, and overflow requirements must be supplied separately. For each missing input, `unresolvedHandling` must say `omit dependent UI`, `use pre-existing product fallback`, or `stop for decision`; the implementer may not invent a fallback.
