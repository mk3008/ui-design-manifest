---
type: application-input-contract
title: Drawer application input contract
description: Required owner-supplied inputs before the drawer can be applied to a product.
status: draft
source: authored
scope: Any product application of the open drawer pattern.
---

# Guidance

The application owner must provide the following bounded inputs:

- **State model:** the source of truth for whether the drawer is displayed, which parent paths are expanded, and which location is current; display conditions, update triggers, and any persistence behavior for each state.
- **Primary-record value:** whether the current screen has a primary record and whether it belongs in this navigation region. If absent, omit record-dependent UI.
- **Identity context:** the permitted actor or workspace context, whether it may be displayed, and its update behavior. If unavailable, omit the identity block or use a pre-existing product fallback.
- **Aggregate information:** any counts, badges, or summaries, including provenance and update behavior. If unavailable, omit them.
- **Optional destinations:** the allowed navigation targets, their accessible names, authorization conditions, and invocation behavior. If unavailable, stop for a product decision.
- **Navigation information:** the navigation tree or flat structure; parent-child relations where used; group membership and order; labels; provenance; and update conditions. If any required navigation information is unavailable, omit the dependent navigation UI or stop for a product decision.
- **Search or filtering model:** allowed query input, searchable scope, empty and unavailable states, result update trigger, and accessibility behavior. If unavailable, omit the entry point.

# Unresolved

No product-specific values, destinations, hierarchy labels, or state transitions are provided by this manifest.
