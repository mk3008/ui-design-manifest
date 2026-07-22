---
type: Human Review
title: Source-independent drawer holdout review
description: Human decision record for a bounded, source-blind drawer application.
status: rejected
source: mixed
---

# Objective

Review whether the source-independent drawer guidance is credible and useful when applied only to the supplied Application Input Contract. This review does not decide acceptance; the human reviewer must choose `accepted`, `conditionally accepted`, or `rejected`.

## Review identity

- Base SHA: `4299e1829acae28e0fe9e2548ec7aaba2c6a088a`
- Opaque oracle ID: `oracle-002`
- Opaque oracle digest: `67634a8675ee96524a3229eebc91c3702cfdc8a8535c02be168dfd16484ac974`

## Source-blind input scope and digests

Only the following records and static captures were in scope for this review. Their paths are local review inputs, not an oracle reference.

| Input | SHA-256 |
| --- | --- |
| `design-manifest/index.md` | `035E256E26E35532A74C856A23E7641601A708FAEA4C66990EFD5EC546DEB5BF` |
| `design-manifest/manifest.md` | `E2E649B425DA7A88DA56DE7267AD19FB6D18393863724159BCA973D45BCBCB8F` |
| `application-input-contract.md` | `22EFFE64E283B172ACE27C7B1DFC2AC2F9E860BD5AE2323FD3B04164074BAFC2` |
| `exercised-classification.md` | `EA34DF7D994121961BDD6591950EA20E7C342A67360630AFD0646D37A4331939` |
| `evaluator-comparison.md` | `939DAD39DD05918ED0A71ABF2A05BC95DEFDA92086EF4E0A9544AD4F4ED8D59B` |
| `implementation/evidence.md` | `EB19B9CFC35ACAA23770BBBD5093A10F6749FB55214D3F7C73BE40C691AEE8B7` |
| `implementation/wide.png` | `EBB32DC1D4C58FF27E8624AB53F73E5B64C50F6DE3E9829AE2565C7CECB06697` |
| `implementation/narrow.png` | `1ABC03FAE90663711098EF5D38304AD2178B9FE59E7A3557556F6DA8013B3E50` |

## Static evidence

- [Wide static capture](implementation/wide.png) — 1440 × 900.
- [Narrow static capture](implementation/narrow.png) — 390 × 844.

Both captures show a dedicated open vertical region beside a neutral workspace. They do not show populated navigation.

## Exercised and not exercised

| Area | Outcome |
| --- | --- |
| Dedicated open navigation region beside workspace | Exercised and preserved in both static captures. |
| Separation of navigation responsibility from workspace responsibility | Exercised and preserved. |
| Ordered vertical navigation rhythm | Not exercised: no navigation data or display-copy slot was supplied. |
| Parent/child distinction and disclosure | Not exercised: no hierarchy data or state model was supplied. |
| Current-destination treatment | Not exercised: no current destination was supplied. |
| Context or identity area | Not exercised: no identity or context value was supplied. |
| Interaction, closed state, persistence, responsive behavior | Not exercised and unresolved. |
| Accessibility behavior | Not exercised and unresolved. |

## Evaluator outcomes

The evaluator records the structural boundary as preserved: a full-height navigation region remains separate from an adjacent workspace. It also records that omission of labels, icons, destinations, controls, hierarchy, and state avoided unsupported product content.

The outcome is deliberately minimal. It does not demonstrate rows, grouping, affordances, current-state treatment, interaction, or accessibility. The evaluation is relational rather than pixel-similarity based, so intentional omission is not treated as a cloning defect.

## Fixture and unsupported invention

No fixture values were used. No safe, pre-authorized semantic slot was available for fixture data. Labels, identity, icons, destinations, hierarchy, current state, controls, and behavior were omitted rather than invented.

## Information loss

- Navigation content loss: row cadence, labels, ordering, grouping, and contextual content cannot be demonstrated without source-blind target-product inputs.
- State loss: current destination, hierarchy, disclosure state, open/closed state, persistence, and responsive policy are unavailable.
- Semantic and accessibility loss: names, destination semantics, focus behavior, keyboard operation, contrast, forced-colors, and assistive-technology outcomes are unverified.
- Static-scope loss: a single open static state cannot establish hidden or interactive behavior.

## What can and cannot be claimed

Can be claimed:

- The source-blind application preserved a separate open navigation region beside a workspace.
- The application respected supplied omissions and did not invent visible product content.
- The manifest provides bounded relational guidance for a navigation responsibility separate from workspace responsibility.

Cannot be claimed:

- That the result is a meaningful populated navigation experience.
- That navigation hierarchy, current state, disclosure, responsive behavior, interaction, or accessibility works.
- That the guidance is sufficient for a target product without its own authorized data, semantic slots, and state model.

## Unresolved items

- Source-blind target-product navigation data, display copy, destinations, identity context, hierarchy, and current destination.
- A product decision for state ownership, operation, closed representation, persistence, and responsive behavior.
- Accessibility requirements and verification for any future interactive control.
- Whether a pre-authorized fixture is appropriate for a future holdout, and which semantic slot it may occupy.

## Human review questions

1. Is the source-independent boundary credible?
2. Is the open region/workspace relationship useful?
3. Is empty output a safe but insufficient result?
4. What source-blind Application Input Contract inputs/fixtures would support meaningful visible navigation?
5. Should the next holdout provide those inputs?

### Reviewer choice

Choose one: `accepted` / `conditionally accepted` / `rejected`.

Decision: `rejected`.

Reason: the static reconstruction is visually blank, so it does not demonstrate successful extraction or application of a Drawer. Its omission behavior avoided unsupported invention, but that is insufficient evidence that the design intent can be reconstructed.

Follow-up requirement: any future human-review request must include a bounded, read-only display of the external oracle alongside the static reconstruction. The oracle display must remain outside the repository and source-blind implementation allowlist; its opaque ID and digest alone are not enough for visual evaluation.
