---
type: Application Input Contract
title: Record-detail and delete application inputs
description: Product-owned inputs required to render and operate the pattern.
status: draft
source: authored
scope: One supplied record and its deletion capability.
---

# Required inputs

| Input | Required owner decision |
| --- | --- |
| Presentation mode and return-state token | Full page, modal, or drawer; return behavior and update trigger. |
| Record identity and status | Permitted identity value, status meaning, visibility, and source of truth. |
| Summary and attribute groups | Field visibility, captions, ordering, long/empty/multi-value rules, and copy policy. |
| Action permissions | Whether Edit and Delete exist, their display conditions, and change trigger. |
| Delete impact and reversibility | Impact class, retention or reversal availability, and confirmation requirement. |
| Consequences and dependencies | Supplied consequences, locks, dependencies, business-rule and permission reasons. |
| Execution states | Pending, repeat-submit prevention, error, success, announcements, and audit behavior. |
| Post-delete destination | Supplied destination or omission rule after successful deletion. |

# Minimal source-blind fixture

Use only supplied neutral slots: identity `Record A`, status `Active`, summary `Example record`, and two captioned attribute groups. Demonstrate a delete-available medium-impact confirmation whose digest repeats `Record A` and a supplied generic consequence. Demonstrate one deletion-unavailable state with a supplied temporary prerequisite reason. These fixture values do not authorize product meaning, a destination, or an undo claim.
