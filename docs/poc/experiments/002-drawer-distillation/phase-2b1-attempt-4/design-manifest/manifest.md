---
type: design-manifest
title: Open drawer navigation guidance
description: Source-blind guidance for a bounded visible navigation drawer state.
status: draft
source: authored
scope: A wide-viewport, visibly open drawer; no behavior outside that visual state is established.
---

# Guidance

Use the drawer as a visible left-side orientation and navigation region in the declared open state. Keep it distinct from the content canvas so global navigation remains available without competing with page content.

Organize the region from stable context to navigation: an identifying area, optional signed-in context, a search or filtering affordance, then navigation. Use restrained separators only when they clarify a supplied responsibility boundary.

## Relationships

Apply [navigation grouping](foundations/navigation-grouping.md), [drawer navigation](components/drawer-navigation.md), and [open drawer](screen-patterns/open-drawer.md).

# Unresolved

Closed presentation, viewport transition, focus behavior, persistence, motion, destinations, and update triggers are outside this bundle's scope.
