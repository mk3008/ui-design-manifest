---
type: Navigation Drawer Guidance
title: Open primary navigation drawer
description: Directional guidance for a vertically ordered primary navigation region in one observed open state.
status: draft
source: mixed
scope: One desktop-scale static image showing an open primary navigation drawer.
---

# Guidance

In the observed state, primary navigation occupies a dedicated vertical region beside the workspace. Its interior is read from top to bottom: a compact identity/context area, then a stacked sequence of navigation entries. Entries may appear as direct destinations or as hierarchical parents with a separately visible disclosure affordance. A selected destination is more prominent than its peers while remaining part of the same navigation rhythm.

Use restrained repeated alignment, consistent row cadence, and sparse separators only where they clarify responsibility boundaries. Keep the navigation region responsible for orientation and movement only; adjacent workspace content, global utilities, and page-specific controls remain outside this guidance.

# Observed

- A visible vertical primary-navigation region is open next to an adjacent workspace.
- The entry sequence contains several top-level rows, including visually nested relationships.
- One row has a distinct current-state treatment.
- Some rows visibly pair a leading graphic affordance with a text-bearing destination slot; some also show a trailing disclosure indicator.

# Inferences

- Where a trailing indicator is visibly paired with an entry, preserve a parent-to-child distinction rather than flattening it into an undifferentiated list.
- The visual differentiation of the current entry should be represented programmatically when product requirements supply a current destination.

# Unresolved

- Presentation mode, closed representation, toggle location, and persistence are not established by the supplied static state.
- No runtime disclosure state, activation behavior, destination, focus order, keyboard behavior, responsive behavior, contrast, forced-colors behavior, or assistive-technology result is observed.
- The visible context area does not authorize product identity, display copy, or an interactive control.

# Relationships

Application must follow [the input contract](../application-input-contract.md) and [the application packet](../apply-packet.md). Current implementation and explicit product requirements take precedence.
