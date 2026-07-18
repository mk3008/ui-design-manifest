---
type: UI design manifest
title: Bounded workspace shell
description: User-visible hierarchy and state guidance for one light desktop Overview slice.
status: draft
source: mixed
scope: 1280x720 desktop Overview in light theme with JP active and the sidebar expanded or collapsed.
requires:
  - foundations/workspace-density
  - components/workspace-header
  - components/sidebar-navigation
  - components/overview-lead-card
  - policies/sidebar-visibility
  - screen-patterns/overview-workspace
---

# Guidance

Treat this as a restrained business-application workspace, not a marketing surface. Preserve a stable top header, a distinct navigation area when available, and a readable main work area. The initial Overview state uses a lead card before structured explanatory sections.

# Evidence

E-001 shows the expanded arrangement; E-002 shows the same bounded workspace after navigation is hidden. See the experiment [evidence register](../../evidence-register.md).

# Inferences

Working width is treated as a reversible trade-off against persistent navigation, rather than as a route change.

# Unresolved

No rule is supplied for responsive breakpoints, focus behavior, persistence, data states, or content below the first viewport.

# Relationships

Apply [workspace density](foundations/workspace-density.md) across this composition. Use [sidebar visibility](policies/sidebar-visibility.md) when implementing the observed transition.
