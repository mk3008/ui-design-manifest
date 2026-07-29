---
type: UI Component
title: Header
description: The common-shell region that identifies the workspace and hosts available global controls.
status: draft
source: authored
scope: Desktop business-app work surfaces that use the standard common shell.
---

# Guidance

Use a Header as the default common-shell region for this business-app pack. It
identifies the product or workspace and provides a stable home for an available
global control. It is not a duplicate page header: the Header identifies the
application or workspace, while the [page header](page-header.md) identifies
the current task or destination.

When the product binding declares an available Drawer, place its controller in
the leading Header area. Keep the controller visually associated with the
Header in both visible and hidden Drawer states. The controller does not make
the Drawer, its navigation items, or any route available. The
[Drawer](drawer.md) remains responsible for its available navigation content.

Keep a supplied workspace identity stable across a shared shell. Do not turn
the Header into a second navigation list, a record-specific action bar, a
decorative banner, or a place to repeat the page title. Place a theme-selection
control here only when the product binding declares the selectable theme mode;
otherwise do not infer one.

# Product boundary

The product binding owns the workspace identity, whether the common Header is
replaced by another approved shell, the available global controls, the
available Drawer and its state, navigation items, destinations, permissions,
and any theme-selection capability. The default Header does not invent any of
those values.

# Non-goals

This component sets no Header height, sticky behavior, responsive behavior,
breakpoint, keyboard or focus behavior, animation, CSS, DOM, route, or
framework.
