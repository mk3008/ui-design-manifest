---
type: UI Design Manifest
title: Example operations workspace
description: A restrained example for navigation and search-result business workflows.
status: experimental
source: authored
pack_version: 0.1.0
pack_id: example-business-app-standard-pack
scope: Illustrative desktop Drawer, search-with-grid, search-with-cards, record detail, and transition roles.
requires:
  - policies/confirm-destructive-action
---

# Product and scope

This fictional workspace helps an operations user locate records, scan a result
set, browse individual records, identify status, and open one record. The pack
covers a bounded desktop navigation and search-to-detail slice; it does not
define authentication, mobile behavior, data access, or a full component
library.

# Source-independence boundary

All content is authored to demonstrate structure. It contains no original-UI evidence and must be applicable without an original UI, URL, screenshot, or extraction trace.

# Precedence

Target-product implementation and repository guidance come first; explicit accessibility, security, and business requirements follow; this local manifest is next; explicit starter guidance is last. Original or reference UI is not an application authority.

# Configuration and product binding

The pack supplies stable Markdown guidance and the finite definitions in
[record-list options](configuration/record-list-options.md). Resolve defaults
with a separate local override; direct edits to this directory are a pack fork.
Drawer and result-card guidance add no configuration. The separate product
binding supplies feature availability, routes, permissions, state, data
sources, aggregate meaning, post-save/cancel behavior, and business language.
It evolves, but does not replace the Application Input Contract.

# Application input contract

The application owner must provide the task-level state model, primary-record value, identity context, aggregate information, optional destinations, and behavior for unresolved fields. This illustrative manifest does not authorize an implementer to invent them. If a neutral, source-blind fixture is allowed, it may fill only an already instructed semantic slot with recorded provenance; it must not create product meaning, source-specific copy, or a new hierarchy slot.

# Relationships

Use the [Drawer](components/drawer.md), [compact work surface](foundations/compact-work-surface.md), [search conditions](components/search-conditions.md), [result grid](components/result-grid.md), [result card](components/result-card.md), [pagination](components/pagination.md), [status badge](components/status-badge.md), [search with grid](screen-patterns/record-list.md), [search with cards](screen-patterns/search-with-cards.md), [record detail](screen-patterns/record-detail.md), and [list/card to detail flow](flows/list-to-detail.md) together only when the task needs them.

# Unresolved

Keyboard behavior, narrow viewports, loading, empty, error, permission-limited states, creation, editing, saving, cancellation, and deletion are intentionally unspecified until product binding and requirements supply them.
