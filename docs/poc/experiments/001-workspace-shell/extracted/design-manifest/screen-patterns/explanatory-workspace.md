---
type: Screen pattern
title: Explanatory workspace
description: A bounded workspace composition for orientation, lead context, and sectional content.
status: draft
source: mixed
scope: A desktop reading workspace with optional navigation.
requires:
  - components/workspace-header
  - components/sidebar-navigation
  - components/lead-context-card
  - policies/sidebar-visibility
---

# Guidance

Compose the screen as a persistent header above optional navigation and a main reading workspace. When navigation is visible, preserve a dedicated leading region. Start the main area with a lead context card and continue with labelled explanatory sections whose topic cue, heading, and supporting content establish a clear reading rhythm.

# Unresolved

Editing flows, data entry, empty/loading/error states, navigation destinations, and content beyond the bounded work area are target-product decisions.

# Relationships

This pattern composes [the header](../components/workspace-header.md), [sidebar navigation](../components/sidebar-navigation.md), [the lead card](../components/lead-context-card.md), and [navigation visibility](../policies/sidebar-visibility.md).
