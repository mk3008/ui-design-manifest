---
type: Semantic Round-Trip Evaluation
title: Drawer evaluator and human review
description: Source-aware evaluation of the frozen Drawer round trip; decision reserved for human review.
status: human review required
source: mixed
scope: One bounded open Drawer state and its source-blind reconstruction.
---

# Experiment purpose

This evaluation asks whether a bounded source observation was abstracted into source-independent Drawer guidance that a source-blind application can render and a fresh reviewer can re-extract. It compares roles and relationships only; it does not judge copied labels, pixels, palette, geometry, item count, icon family, source identity, or unobserved runtime behavior.

# Frozen inputs and evidence

| Item | Verified record |
| --- | --- |
| Evaluation base | `fd821aa568c5ad5221f03f3b1be813ee7ef52809` |
| Opaque oracle | `drawer-oracle-2026-07-a` |
| Oracle digest | `40b47625cc38f66f7b71569f782560f7cc2e4c4579d3c6dc99e305aa6ee37a17` |
| Source-blind bundle digests | Manifest `a88499b01c4d094b00ee0a1526a55e7caad3341201fc6653a873b3e36cd3d84a`; Contract `8afbdc8ce202d203ad8a1893d22e8ea52c63e306e87f406658ed0cf88a4d0f71`; fixture `a26f22e232c171375df25789c92fe92159e6ca951f363219dbd58c5379c78f2f`; matrix `9849a5a0e0dd755eec80c227b62ffe9d388a28ebed9aa7c509f6764a2faeb8ef` |
| Frozen implementation digest anchors | HTML `556c537b8a42b805e978cec3bbb6b6defd71efb54e0bf8ff815984b26cecfe4a`; CSS `92ce14eb729adbd732215c26445adec8a7f65019e358f8f11206b839c11a2510` |
| Current evidence | [wide open rendering](../implementation/wide.png), [narrow open rendering](../implementation/narrow.png), [static check](../implementation/static-render-check.md), [frozen-evidence note](../implementation/frozen-evidence.md) |
| Historical comparison | [older rendering](../../../attempt-1/drawer/implementation/wide.png) and [older HTML](../../../attempt-1/drawer/implementation/index.html) |

Both current renderings exist, are nonblank, and have the declared `1440x900` and `390x844` viewports. The historical files and frozen implementation remained unchanged during this evaluation.

# Source independence

The implementer allowlist was the profile, the source-blind Drawer bundle, the first-pass method/rubric, and repository guidance. Its recorded opened-file list contains no oracle, historical result, source-aware extraction record, network asset, or external site; its prohibited-input declaration and source-boundary check report no prohibited input. The re-extractor opened only the two current renderings and generated HTML, inspecting pixels before HTML. This evaluator accessed the bounded oracle only after the source-blind work was frozen.

The fixture is neutral and contract-declared: it uses four synthetic navigation witnesses and one declared named control, without source copy, product identity, count claim, badge, destination meaning, or runtime state. No external search was performed. Repository-facing material deliberately records the oracle only by opaque ID and digest.

# Original-oracle review slot

Human reviewers must view the bounded external oracle in the separate evaluation display beside the current wide and narrow renderings. That display is evaluation-only and is not linked, copied, or made available to the implementer through this repository artifact.

# Extraction and information-loss assessment

The bounded observation supports a separate navigation region, open-state orientation, a parent/shown-child relationship, direct-row roles, one current/non-current comparison, a compact separate control, caption/group absence in this state, compact repeated rhythm, and a quiet edge against adjacent work. The extraction retained those relational design points without retaining source-specific identity, copy, data meaning, topology, count, geometry, palette, icon set, destinations, or behavior.

No unnecessary source-specific detail was retained. Necessary visible intent was retained at the role-and-relationship level. Intentional exclusions are correct for closed representation, presentation mode, persistence, responsive transformation, focus, motion, overflow, contrast conformance, icon semantics, and runtime operation; static imagery cannot establish them. These are classifications `4 source-specific intentional exclusion`, `5 unresolved`, or `6 not exercised`, not reconstruction defects.

# Intent preservation and round-trip result

| Area / claim | Status | Evidence and classification |
| --- | --- | --- |
| Region responsibility and edge (`C7`) | preserved | A left navigation region remains visibly distinct from the blank adjacent work surface through a quiet rule; rows are not floating cards. |
| Parent/shown-child hierarchy (`C1`) | partial | Pixels preserve a parent followed by an indented child. HTML flattens all rows into siblings, so the material structural containment is absent. `8 Implementer interpretation error`. |
| Top-level leaf (`C2`) | partial | The direct row is visibly non-child, but generated evidence cannot independently establish its distinct top-level-leaf role from the other direct row. `8 Implementer interpretation error`. |
| Independent/direct row (`C3`) | partial | The direct row is readable as a direct destination but its independent role is not semantically distinguished from the top-level leaf. `8 Implementer interpretation error`. |
| Current/non-current (`C4`) | preserved | One row has restrained visible contrast and exposes `aria-current`; no source-specific selected treatment was imported. |
| Compact control and responsibility (`C5`) | preserved | The control is separate at the interior top edge and has a named, application-owned role. Its operation is not claimed. |
| Rhythm, spacing, grouping absence (`C6`) | preserved | Repeated compact rows, no invented caption/group, and restrained square row treatment are visible. |
| Icon/control responsibility (`C8`) | preserved | Exactly one non-placeholder SVG belongs to the one named control; pixels alone do not decide its operation. |
| Presentation, closed form, toggle behavior/location beyond shown placement, persistence | unresolved / not exercised | The fixed run represents one open static state only. `5 unresolved`, `6 not exercised`. |
| Responsive transformation | not exercised | Narrow evidence repeats the declared open relationships, but no responsive rule is inferred. `6 not exercised`. |

The source-blind re-extraction is therefore only **partially semantically equivalent** to the Manifest. It recognizes the nonblank Drawer and all key visual relationships, but its visual-versus-DOM hierarchy mismatch is material: indentation communicates containment that the document structure does not provide. This does not require source information to correct; it is a frozen implementation interpretation finding.

# Abstraction and application quality

**Abstraction quality: preserved.** The Manifest and Contract keep stable roles and relationships while separating presentation, closed representation, toggle location, and persistence. Product-owned labels, destinations, state, and icon responsibility remain inputs, not extracted facts. The bundle has enough relational specificity for the isolated application.

**Application quality: partial.** The output is nonblank and recognizable as a Drawer; it has natural hierarchy, current-state emphasis, grouping absence, scan rhythm, a quiet surface edge, restrained square treatment, and no unauthorized narrow transformation. It does not invent copy, state, count, badge, extra operation, or decoration. The structural hierarchy defect prevents a complete application-quality result despite the visible hierarchy.

# Unsupported invention and historical comparison

No unsupported visible invention was found: no extra caption, group, row, badge, count, product semantic, icon, closed representation, persistence rule, overlay/persistent assertion, or responsive transformation. The one blank adjacent surface is contract-bounded, not omission of a required content region.

The older result shows only a single selected destination and boundary. The current result newly exercises a parent/child witness, two direct-row witnesses, current/non-current contrast, a separate named control, row rhythm, and edge relation. This comparison is context only: neither closeness to the older result nor closeness to the oracle is a success criterion.

# What can and cannot be claimed

Can claim: a source-independent Drawer abstraction was applied without source leakage; the frozen output visibly preserves several material claims; the generated evidence is nonblank; and the DOM hierarchy mismatch is an actionable fixed-run finding.

Cannot claim: acceptance, complete semantic round-trip success, source fidelity, accessibility conformance, correct interaction, responsive behavior, persistence, presentation mode, closed state, or control operation. The mechanical status is **human review required**.

# Human review questions

For each question, choose **accepted**, **conditionally accepted**, or **rejected**. Do not treat this document as the decision.

1. Is the bounded external-oracle display paired with the current evidence sufficient for a human visual review?
2. Is retaining relational hierarchy, rhythm, current contrast, control separation, and edge relation—while excluding source-specific detail—the right abstraction boundary?
3. Is the visual hierarchy alone enough for this isolated fixture, or must the parent/child relation be structurally encoded before acceptance?
4. Are the partial distinctions between top-level-leaf and independent/direct roles acceptable for the product context, or must they receive explicit structural semantics?
5. Is the neutral fixture sufficiently source-independent and free of unsupported product meaning?
6. Are the unresolved runtime and accessibility axes correctly held out rather than inferred from the static state?
7. Given the claim statuses and the hierarchy mismatch, should this fixed run be accepted, conditionally accepted with a documented implementation follow-up, or rejected?

# Unresolved items and recommended next

No new source state is needed to resolve the primary finding. If a future implementation is authorized, encode the shown child as a structural child relationship (for example, nested list semantics or an equally explicit semantic relation), then repeat source-blind re-extraction. Future product work must separately supply any needed state model for closed form, presentation, persistence, responsiveness, focus, motion, overflow, and contrast.

Status: **human review required**.
