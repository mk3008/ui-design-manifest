---
type: Method Guide
title: Record-detail and delete extraction method
description: A bounded method for a read-only record detail and separately owned delete flow.
status: draft
source: authored
scope: Reusable method.
---

# Purpose

Use this method for a single record reached from a result surface. It treats inspection as the base responsibility and deletion as a separately composed destructive capability.

# Method

1. Complete the [observation schema](observation-schema.md) without filling missing behavior.
2. Use the [extraction template](extraction-template.md) to preserve ownership and limits.
3. Score the result with the [first-pass rubric](first-pass-rubric.md).
4. Apply only a source-blind manifest plus an Application Input Contract through the [extraction prompt](extraction-prompt.md).
