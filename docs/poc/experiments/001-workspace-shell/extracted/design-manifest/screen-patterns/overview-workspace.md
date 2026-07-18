---
type: Screen pattern
title: Overview workspace
description: A bounded desktop composition for explaining a UI contract through orientation, lead context, and sectional content.
status: draft
source: mixed
scope: First 1280x720 light desktop Overview viewport with sidebar visible or hidden.
requires:
  - components/workspace-header
  - components/sidebar-navigation
  - components/overview-lead-card
  - policies/sidebar-visibility
---

# Guidance

Compose the screen as a persistent header above an optional navigation rail and a main reading workspace. In the expanded state, preserve a dedicated left navigation region. In both states, start the main area with the Overview lead card and continue with labelled explanatory sections that pair a small uppercase-style topic cue, a stronger section heading, and readable supporting copy.

# Evidence

E-001 shows header, rail, lead card, and sequential sections in one viewport. E-002 preserves header, lead card, and sections while omitting the rail and widening the reading region.

# Inferences

The section rhythm supports quick orientation before detailed reading in a documentation-like application surface.

# Unresolved

No guidance is supplied for editing flows, data entry, empty/loading/error states, actual navigation destinations, or content beyond the first viewport.

# Relationships

This pattern composes [the header](../components/workspace-header.md), [sidebar navigation](../components/sidebar-navigation.md), [the lead card](../components/overview-lead-card.md), and [sidebar visibility](../policies/sidebar-visibility.md).
