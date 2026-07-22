---
type: application-input-contract
title: Drawer application input contract
description: Required owner-supplied inputs before the drawer can be applied to a product.
status: draft
source: authored
scope: Any product application of the open drawer pattern.
---

# Guidance

The application owner must provide, when the dependent UI is needed:

- **State model:** source of truth, allowed states, display conditions, update triggers, and persistence behavior.
- **Identity context:** permitted actor or workspace context, whether it may be displayed, and its update behavior. Omit the block when unavailable.
- **Optional destinations:** allowed targets, accessible names, authorization conditions, and invocation behavior.
- **Navigation information:** structure, parent-child relations where used, primary versus secondary collection role, order, labels, provenance, and update conditions. Primary navigation needs no caption. A secondary caption is permitted only when the owner provides a distinct secondary collection and its caption.
- **Optional semantic icon slots:** for each icon, the semantic slot, permitted asset or category, accessible-name relationship, and display condition. When absent or incomplete, omit the icon.
- **Search or filtering model:** query input, searchable scope, empty and unavailable states, result update trigger, and accessibility behavior. Omit the entry point when unavailable.

For every absent field, omit dependent UI, use a pre-existing product-defined fallback, or stop for an owner decision. The implementer may not invent captions, icon meanings, generic decorative markers, or icon assets.

# Unresolved

This bundle supplies no product-specific values, destinations, hierarchy labels, icon assets, or state transitions.
