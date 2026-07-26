---
type: UI Component
title: Drawer
description: A product-bound navigation region kept distinct from the workspace and Header control.
status: draft
source: authored
scope: Static navigation and visibility guidance for an available product Drawer.
---

# Guidance

Keep the Drawer navigation region separate from the workspace where users carry
out the current task. When the product binding supplies a current destination,
make that location identifiable without treating every navigation item as the
current one.

Do not confuse Drawer visibility with hierarchy disclosure. Visibility concerns
whether the available Drawer region is shown; a disclosure concerns a supplied
parent/child navigation relationship. Neither fact creates the other.

When an available Drawer is visually hidden, omit its region, empty boundary,
and reserved space. A Header-side controller and the Drawer body have separate
responsibilities: the Header owns the controller's available placement and
treatment, while the Drawer owns only its available navigation content. This
guidance does not assert that either is available or operational.

# Product boundary

The product binding owns whether a Drawer exists, its items and display
language, destinations, current destination, permissions, visibility state,
and state persistence. Do not invent a product item, route, permission, state,
or navigation relationship when it is not supplied.

# Non-goals

This component sets no opening default, persistent/temporary default,
responsive rule, breakpoint, keyboard behavior, focus behavior, Escape
behavior, ARIA/assistive-technology behavior, animation, width, CSS, DOM, or
configuration value.
