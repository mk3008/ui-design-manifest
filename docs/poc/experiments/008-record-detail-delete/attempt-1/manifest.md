---
type: Record-detail Manifest
title: Read-only record detail with separately owned deletion
description: Source-blind guidance for inspecting one record and confirming medium-impact deletion.
status: draft
source: mixed
scope: A record reached from a result surface.
---

# Guidance

Make read-only detail the base screen. Show supplied identity first, then summary and grouped attributes in a predictable label/value scan order. Favor a purpose-built readable label/value information view with weighted hierarchy over disabled edit controls. A wide host may use grouped columns when supplied content benefits; a narrow host uses a vertical I-flow. Do not invent long-value, empty-value, multi-value, or copy behavior.

Keep record actions separate from information content. For a full-page detail, supply a context-preserving Back to results affordance. Reserve Close for a dismissible modal or drawer. The authored navigation default is Results to Add for creation, Results to read-only detail for inspection, then Detail to Edit or Delete. Compact quick actions are context-dependent, not a universal branch.

Treat delete as a separately composed destructive action. For medium impact, keep the full record visible underneath a separate confirmation surface and show only a concise digest: supplied identity and supplied consequences. Do not require typed confirmation unless impact is high or unusually irreversible. Do not promise undo unless the Contract supplies an actual reversible operation or retention window. Prevent repeat submission while pending and render failure, success, and the post-delete destination only from supplied state.

When deletion is temporarily blocked by an incomplete confirmation, prerequisite, lock, or dependency, it may remain disabled with an adjacent reason. Permission restriction, business-rule prohibition, and irreversible product constraint need explicit policy; permanently unauthorized or inapplicable actions may be omitted.

# Unresolved

Record values, status, field visibility, action permissions, consequences, dependencies, reversibility, retention, confirmation wording, notifications, audit behavior, and destinations are product-owned.

# Relationships

Apply only with the [Application Input Contract](application-input-contract.md) and [apply instruction](apply-instruction.md).
