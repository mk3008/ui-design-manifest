---
type: Fixture Trace
title: Global Header neutral fixture trace
description: Declares minimal synthetic values for an explicitly static semantic exercise.
status: draft
source: authored
scope: Static semantic review only.
requires:
  - application-input-contract
---

# Permitted fixtures

| Fixture ID | Declared slot | Neutral synthetic value | Purpose | Prohibited interpretation |
| --- | --- | --- | --- | --- |
| `F-QUERY-1` | `globalQuery` | `sample query` | Makes the global query role visible. | Product terminology, submitted query, or behavior. |
| `F-UTILITY-1` | `utilityActionGroup` | `action alpha` | Makes one member of the declared utility-action group visible. | Product action meaning, destination, or source item count. |

# Exclusions

No fixture is supplied for `identityContext`. A fixture cannot invent identity, account meaning, a destination, a status, or an additional hierarchy slot. The static exercise uses only the declared roles above and does not assert an action count or a state transition.
