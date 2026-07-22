---
type: design-manifest
title: Open drawer navigation guidance
description: Source-blind guidance for a bounded visible navigation drawer state.
status: draft
source: mixed
scope: A wide-viewport, visibly open drawer; no behavior outside that visual state is established.
---

# Guidance

Use the drawer as a persistent left-side orientation and navigation region while the declared open state is displayed. Keep its visual identity distinct from the content canvas so that global navigation remains available without competing with page content.

Organize the region from stable context to navigation: an identifying area, optional signed-in context, a search or filtering affordance, then grouped navigation. Use separators and group labels to make the transitions between those responsibilities legible.

## Relationships

Apply the shared grouping principles in [navigation grouping](foundations/navigation-grouping.md), the component responsibilities in [drawer navigation](components/drawer-navigation.md), and the bounded state rules in [open drawer](screen-patterns/open-drawer.md).

# Unresolved

The closed presentation, viewport transition, focus behavior, persistence, motion, destinations, and update triggers are outside the observed scope.
