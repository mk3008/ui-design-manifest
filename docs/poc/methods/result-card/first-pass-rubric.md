---
type: Evaluation Rubric
title: Result-card first-pass rubric
description: Checks whether a bounded card extraction remains source-blind and operationally useful.
status: draft
source: authored
scope: Reusable method.
---

# Review questions

- Does the record explicitly decide whether cards, table, or list best fit the information shape?
- Are collection packing, collection Z/I traversal, and internal card Z/I flow recorded separately?
- Does typography distinguish title, body, and caption hierarchy without fixed tokens?
- Are captions retained when a metadata value would be ambiguous by itself?
- Are selection, activation, title navigation, inline actions, and global actions separate responsibilities?
- Does the neutral default demonstrate selected and unselected cards without supplying business meaning?
- Are every unshown responsive, overflow, focus, update, empty, loading, and failure behavior marked unresolved?

# Pass condition

Pass only when every required axis is classified, the Manifest is source-blind, and the Application Input Contract owns all missing product data and state behavior.
