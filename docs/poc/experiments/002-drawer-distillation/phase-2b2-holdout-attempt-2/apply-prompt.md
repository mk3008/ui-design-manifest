---
type: Application Prompt
title: Apply the drawer guidance
description: A bounded prompt for source-blind implementation.
status: draft
source: authored
---

# Task

Apply the local drawer manifest to the target product using only the allowlisted inputs in [the application packet](apply-packet.md).

# Required handling

Preserve the ordered vertical navigation relationship when the target product supplies compatible navigation data. Preserve parent, child, and current-state distinctions only when their semantic data and state model are supplied. Use target-product accessibility requirements for landmarks, names, current-state exposure, and disclosure semantics.

# Stop conditions

Do not recreate or consult source material. Do not manufacture display strings, icons, destinations, identity, a toggle, expansion behavior, persistence, responsive behavior, or accessibility claims. Omit dependent UI or request an owner decision when an input is missing.
