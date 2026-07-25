---
type: Observation Schema
title: Record-detail and delete observation schema
description: Required axes for bounded single-record inspection and deletion.
status: draft
source: authored
scope: Reusable method.
---

# Required axes

Complete every row with `observed`, `not observed`, `unresolved`, or `not applicable`. Separately classify every finding as `observed`, `inferred`, `authored default`, `context pattern`, or `target-product input`.

| Responsibility | Axis | Static-evidence limit |
| --- | --- | --- |
| Read-only detail | Record identity, title, and status | Do not invent identity or status values. |
| Read-only detail | Summary versus full attributes; label/value captions | Do not infer the field inventory. |
| Read-only detail | Hierarchy, weighting, section grouping, density, and host-width use | Do not extract exact visual tokens. |
| Read-only detail | Wide multi-column versus narrow I-flow | Unshown breakpoint behavior is unresolved. |
| Read-only detail | Long, empty, and multi-value handling; copyable values | Do not infer truncation or copying behavior. |
| Read-only detail | Read-only semantics versus disabled form controls | Do not turn readable content into disabled inputs by default. |
| Read-only detail | Action ownership and return/close affordance | Do not infer destinations or dismissal behavior. |
| Delete | Trigger placement, initial emphasis, and impact classification | Do not equate visibility with authorization. |
| Delete | Digest versus full-record confirmation; identity and consequences | Do not require every field in a confirmation. |
| Delete | Reversibility, undo/recovery, confirmation strength, and typed confirmation | Do not promise undo or make typed confirmation universal. |
| Delete | Pending, double-submit prevention, failure, success, and post-delete destination | These require a state model. |
| Delete | Audit, retention, permission, lock, dependency, and irreversible constraints | These are target-product inputs. |
| Delete | Unavailable-action explanation and omission policy | Distinguish temporary prerequisite from permanent restriction. |
| Navigation | Full page, modal, and side/drawer presentation | Do not treat Close as a universal return action. |
| Navigation | Result-to-detail, creation, edit, and delete paths | Do not infer quick actions from a result surface. |
| Contract | Required values, state sources, display conditions, and update triggers | Omit dependent UI when the Contract is absent. |

# Authored defaults

Favor a purpose-built readable label/value information view over a disabled edit form. Preserve a predictable scan order. For medium-impact deletion, retain the underlying detail and use a separate confirmation surface with a concise digest: identity and consequences, rather than every attribute. Require typed confirmation only for high-impact or unusually irreversible deletion. Show undo only when a real reversal or retention window exists.
