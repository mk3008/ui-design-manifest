---
type: Application Input Contract
title: Global Header application inputs
description: Bounded inputs required to apply the Global Header guidance without importing source-specific meaning.
status: draft
source: authored
scope: Static application of the Global Header manifest.
requires:
  - manifest
---

# Allowed semantic slots

| Slot | Required input | If absent | Ownership |
| --- | --- | --- | --- |
| `identityContext` | A product-authorized identity value and any permitted destination. | Omit the identity display and destination. | Product requirement or current implementation. |
| `globalQuery` | A product-authorized query submission model, or permission to render a static query affordance. | Render no query control. | Product requirement or current implementation. |
| `utilityActionGroup` | A declared set of product-authorized utility actions and destinations, or permission for the neutral static exercise below. | Omit the action group. | Product requirement or current implementation. |

# State model

No state model is supplied. This contract does not authorize submission, navigation, authentication transitions, a controlled region, or any update behavior. The bounded exercise is static only.

# Static exercise permission

For source-blind semantic review only, the application may render the declared `globalQuery` and `utilityActionGroup` roles with the neutral fixtures in [Fixture trace](fixture-trace.md). This permission does not authorize product behavior, display copy outside those declared slots, an identity value, or a destination.

# Unresolved decisions

`identityContext` remains unresolved until product-owned input is supplied. The exercise must not manufacture an identity in order to complete the Header.
