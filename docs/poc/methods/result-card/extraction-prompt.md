---
type: Extraction Prompt
title: Result-card extraction prompt
description: A bounded prompt for observing result cards without source leakage.
status: draft
source: authored
scope: Reusable method.
---

# Prompt

Observe only the declared card collection and declared state. Complete every axis in the [observation schema](observation-schema.md) with observed, not observed, unresolved, or not applicable. Separate direct observation from inference, authored default, context pattern, and target-product input. Decide whether cards are suitable or a table/list is more scannable. Record collection Z/I traversal separately from internal card Z/I flow. Do not collect exact tokens, source copy, URLs, unrelated routes, or unshown behavior. Return source-blind guidance plus a Contract-owned unresolved list.
