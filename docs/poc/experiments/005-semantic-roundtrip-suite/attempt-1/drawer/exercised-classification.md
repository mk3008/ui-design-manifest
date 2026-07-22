---
type: Exercise Classification
title: Drawer static evidence classification
description: Separates the permitted material exercise from unresolved and omitted behavior.
status: draft
source: mixed
scope: Drawer only.
requires:
  - claim-matrix
---

# Classification

| Subject | Classification | Reason | Next condition |
| --- | --- | --- | --- |
| `current navigation state -> navigation destination` | `to be exercised` | It is a material internal Drawer relationship supported by the bounded static observation and has safe declared fixture slots. | Render the fixture and obtain independent source-blind re-extraction. |
| Drawer region boundary | `insufficient alone` | A region boundary does not satisfy the component obligation. | Evaluate D-01 instead. |
| Icon responsibility | `not exercised` | No safe responsibility value is supplied. | Application owner supplies one, then apply the accessibility constraint. |
| Destination activation | `not exercised` | No destination target is authorized. | Application owner supplies an authorized target. |
| Grouping, hierarchy, counts, and captions | `unresolved` | The bounded state does not establish them. | Provide an application decision; do not infer them. |
| Closed state, triggers, persistence, focus, animation, and responsiveness | `unresolved` | They are outside the available static evidence. | Provide a bounded additional visual input or an application decision. |

No row in this pre-implementation classification is a preservation result.
