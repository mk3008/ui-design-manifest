---
type: Observation Schema
title: Header–Drawer composite stable observation schema
description: Independent axes for cross-component control and layout responsibility.
status: active
source: authored
---

# Independent axes

| Axis | Permitted observation question |
| --- | --- |
| Target Drawer side | Is the target side declared as left, right, or unresolved? |
| Trigger existence | Does a state expose an open/close control? |
| Trigger owner region | Is its authoritative owner Header, Drawer, another region, or unresolved? |
| Trigger placement | Where in that owner region is it visibly placed? |
| Trigger visibility by state | Which declared states retain the control? |
| Open state | Which state presents the expanded Drawer? |
| Closed representation | Is closure fully hidden, icon rail, unresolved, or not applicable? |
| Presentation | Is presentation declared independently of closure? |
| Content displacement | Does content relation require an explicit product declaration? |
| Backdrop | Is backdrop supplied, unresolved, or not applicable? |
| Persistent remainder | Does a closed rail or persistent region remain? |
| Viewport-to-mode mapping | Is a mapping supplied, optional, unresolved, or not applicable? |
| State synchronization | Is one controller authoritative, and are any duplicates explicitly synchronized? |
| Accessible relationship | Does the named control declare expanded and controls relationships? |
| Focus, keyboard, motion | Are these separately supplied rather than inferred? |
| Persistence | Is state retention supplied rather than inferred? |
| Unresolved inputs | Does the Contract say whether to omit, use an existing fallback, or stop? |

Never combine trigger owner, trigger placement, closed representation, presentation, persistence, target side, or viewport policy into one enum.
