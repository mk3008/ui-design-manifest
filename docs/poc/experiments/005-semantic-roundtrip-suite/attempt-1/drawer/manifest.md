---
type: Drawer Manifest
title: Drawer navigation relationship
description: Source-independent guidance for a bounded static Drawer navigation state.
status: draft
source: observed
scope: One visible static Drawer state only.
requires:
  - application-input-contract
  - claim-matrix
---

# Guidance

In the exercised static state, present a Drawer as a distinct leading navigation region. Its retained material relationship is `current navigation state -> navigation destination`: the displayed current state belongs to one declared destination, rather than to the surrounding workspace.

Keep navigation entries visually readable as a repeated vertical set when more than one application-provided entry is present. Do not derive captions, groups, hierarchy, destinations, counts, actions, or product meaning from this Manifest.

An optional entry icon may support recognition of its already-declared navigation responsibility. It must not be used to introduce an unstated meaning.

# Unresolved

- Closed representation, opening trigger, persistence, focus, animation, responsive behavior, destinations, and update triggers are not established.
- Captions, groups, nesting, entry cardinality, and control behavior are not established.
- No application-owned navigation data or destination target is supplied by this bundle.

# Relationships

Apply only with the [Application Input Contract](application-input-contract.md) and evaluate using the [Claim matrix](claim-matrix.md).
