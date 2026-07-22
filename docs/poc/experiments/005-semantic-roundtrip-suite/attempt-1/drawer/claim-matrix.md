---
type: Semantic Claim Matrix
title: Drawer semantic round-trip claims
description: Frozen comparison object for the bounded Drawer static state.
status: draft
source: mixed
scope: Drawer only.
requires:
  - manifest
  - application-input-contract
  - fixture-trace
---

# Matrix

| Matrix ID | Declared component scope | Observed intent and evidence limit | Manifest claim | Application Input Contract need | Fixture support | Generated static evidence | Source-blind re-extraction result | Review status and rationale |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| D-01 | Drawer | A visible static state supports a navigation item marked as current within a distinct navigation region. It does not establish target, action, count, grouping, or runtime behavior. | `current navigation state -> navigation destination` is retained within the Drawer. | `drawer_presentation`; one `navigation_item` label and current state; a destination only if independently authorized. | `visible`; `Destination`; `true`; target omitted. | A static Drawer showing the synthetic current destination without an activation target. | Pending an independent re-extractor who receives only this matrix, fixture disclosure, and generated static evidence. | `unresolved` before rendering. This is the required material relationship to exercise; it cannot be called preserved until generated evidence is reviewed. |
| D-02 | Drawer | A navigation icon slot is visible, but its specific meaning is not retained. | An icon may only support an already-declared navigation responsibility. | Optional `entry_icon_responsibility` with accessible treatment. | None; slot omitted. | None. | No comparison is requested. | `not exercised`; no safe semantic responsibility was supplied. |
| D-03 | Drawer | The bounded static state does not establish grouping, hierarchy, or control behavior. | None retained. | Application-owner decision required before rendering dependent structure. | None. | None. | No comparison is requested. | `not applicable`; outside the accepted Contract. |

# Gate precondition

D-01 is material and exceeds a bare Drawer/workspace boundary. A renderer may start only with the disclosed fixture and must provide static evidence for an independent re-extraction. The scope is not preserved at this pre-implementation stage.
