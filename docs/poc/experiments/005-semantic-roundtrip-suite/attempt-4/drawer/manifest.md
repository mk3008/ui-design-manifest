---
type: Drawer Design Manifest
title: Explicit method-default Drawer relationships
description: Source-independent relationships and guarded defaults for one static Drawer exercise.
status: draft
source: authored
scope: Open primary navigation Drawer at wide and narrow static captures.
---

# Guidance

Keep a vertical navigation reading order, restrained repeated-row rhythm, and a quiet Drawer-to-workspace edge. Rows are not decorative rounded cards. Retain only the roles declared by the Application Input Contract; do not add captions, groups, destinations, or topology.

Every retained claim is classified as `observed`, `method-default`, `unresolved/not observed`, or `product input required`. `method-default` is source-independent policy, not an observation. An implementer must not silently add an absent default.

## Explicit guarded method defaults

When the Application Input Contract declares an expandable parent and its indicator treatment is `unresolved/not observed`, apply the `method-default` disclosure fallback: a meaningful inline `currentColor` SVG chevron/caret, right when collapsed and down when expanded, synchronized with the parent-owned child group and accessible expanded state. The fallback is forbidden for captions and leaves. It must not be a text glyph, square placeholder, or checkbox-like mark, and it never authorizes inventing an expandable parent.

When the Application Input Contract declares a current item and its accent treatment is `unresolved/not observed`, apply the `method-default` current-item fallback: a restrained straight leading accent using the target product semantic accent token, paired with a non-color current distinction and programmatic current state. It never authorizes inventing a current item or copying source color values, dimensions, rounded-pill treatment, or source-specific geometry.

## Boundaries

Presentation, closed representation, toggle behavior, persistence, focus, motion, overflow, contrast conformance, and responsive behavior remain unresolved unless separately supplied. This bundle permits static wide and narrow captures only; it does not supply runtime behavior.
