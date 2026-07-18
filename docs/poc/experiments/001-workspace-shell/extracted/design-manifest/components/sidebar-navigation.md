---
type: UI component guidance
title: Sidebar navigation
description: A grouped navigation rail with one clearly active entry and an explicit visibility control.
status: draft
source: mixed
scope: Expanded 1280x720 Overview state and the one observed collapse transition.
---

# Guidance

When visible, present navigation as a dedicated left rail with an immediately recognizable active entry and labelled groups beneath it. Keep the rail independent of the main reading area. Offer an explicit header control for hiding and restoring this navigation.

# Evidence

E-001 shows Overview as the active entry and groups headed Foundations, Components, Interaction Policies, and Screen Patterns. The header control exposes an expanded state before the transition; E-002 no longer exposes the complementary navigation landmark.

# Inferences

The grouped rail is intended to support scanning and orientation across a rules-oriented workspace.

# Unresolved

Destination behavior, all sidebar content, keyboard traversal, scrolling behavior, and responsive alternatives were not inspected.

# Relationships

The state change is governed by [sidebar visibility](../policies/sidebar-visibility.md) and contributes to [the Overview workspace](../screen-patterns/overview-workspace.md).
