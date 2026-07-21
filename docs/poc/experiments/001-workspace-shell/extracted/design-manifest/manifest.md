---
type: UI design manifest
title: Bounded workspace shell
description: User-visible hierarchy and state guidance for a bounded desktop workspace.
status: draft
source: mixed
scope: A bounded desktop workspace with an expanded or reduced navigation representation.
requires:
  - foundations/workspace-density
  - components/workspace-header
  - components/sidebar-navigation
  - components/lead-context-card
  - policies/sidebar-visibility
  - screen-patterns/explanatory-workspace
---

# Guidance

Treat this as a restrained business-application workspace, not a marketing surface. Preserve a stable top header, a distinct navigation area when available, and a readable main work area. The initial workspace state uses a lead card before structured explanatory sections.

# Provenance

The guidance is an abstracted, non-identifying extraction. It intentionally does not link to the original UI or extraction evidence.

# Inferences

Working width is treated as a reversible trade-off against persistent navigation, rather than as a route change.

# Unresolved

No rule is supplied for responsive breakpoints, focus behavior, persistence, data states, or content below the first viewport.

# Relationships

Apply [workspace density](foundations/workspace-density.md) across this composition. Use [sidebar visibility](policies/sidebar-visibility.md) when implementing the observed transition.
