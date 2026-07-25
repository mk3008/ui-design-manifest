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
| Owner and slot stability | Does the declared owner retain the same named slot across the paired states? |
| Title/landmark anchor stability | Does the Header title or declared landmark retain its anchor independently of Drawer visibility? |
| Trigger visibility by state | Which declared states retain the control? |
| Open state | Which state presents the expanded Drawer? |
| Closed representation | Is closure fully hidden, icon rail, unresolved, or not applicable? |
| Dismiss-vs-compact action semantics | Does the control fully dismiss the Drawer, compact it to a retained rail, expand it, or remain unresolved? |
| Icon direction | When an icon conveys compact/expand direction, does it point toward the declared resulting movement? |
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

Never combine trigger owner, slot stability, title/landmark anchor stability, trigger placement, closed representation, action semantics, icon direction, presentation, persistence, target side, or viewport policy into one enum.
