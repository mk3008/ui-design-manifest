---
type: Non-Identifying Extraction Evaluation Record
title: Global Header bounded observation record
description: Evaluation-only observation boundary and unknowns for this extraction attempt.
status: draft
source: observed
scope: Bounded static Header observation; not an application input.
---

# Observation boundary

The declared scope is a single static Header view. It supports only coarse role order, role grouping, and visibly separated global roles. It does not support product identity, display copy, destinations, data values, action outcomes, controlled-region state, focus behavior, transitions, or responsive behavior.

# Retained observation classes

- An identity context occupies the leading Header role.
- A global query role follows the identity context.
- Utility actions form a role group after the global query.

# Evaluation boundary

This record is evaluation-only and is deliberately excluded from the source-blind [Apply packet](apply-packet.md). Later evaluation compares the generated state against `H-01` by roles and relationships, not visual fidelity or source details.
