---
type: Fixture Trace
title: Neutral Header–Drawer composite fixture
description: Source-blind minimal content held constant across two ownership policies.
status: draft
source: authored
---

# Frozen neutral fixture

Use the same short neutral Header title and the same navigation semantics for both policies: one expanded parent with one child, one top-level leaf, one independent direct item, and current/non-current comparison. Include meaningful inline `currentColor` SVG icons for icon-only controls. Do not declare a group caption, badge, count, permission, status, source-specific copy, or product identity.

# State witnesses

| Witness | Policy and state | Required visible relationship |
| --- | --- | --- |
| `A-open` | Pattern A, expanded | Header title continuity; expanded Drawer; Header-owned controller visible. |
| `A-hidden` | Pattern A, fully hidden | Drawer absent; Header controller remains as the sole reopen affordance. |
| `B-open` | Pattern B, expanded | Header has no Drawer trigger; Drawer-owned controller is visible. |
| `B-rail` | Pattern B, icon rail | Drawer rail remains; Drawer controller and meaningful declared icon shortcuts remain. |

The fixture does not exercise behavior, animation, focus, keyboard, persistence, backdrop, presentation, viewport policy, or content displacement unless separately supplied.
