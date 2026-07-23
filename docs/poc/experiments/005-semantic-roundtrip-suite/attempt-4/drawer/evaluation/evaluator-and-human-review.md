---
title: Drawer evaluator and human review
status: human review required
date: 2026-07-23
---

# Drawer evaluator and human review

## Handoff summary

- **Goal:** Evaluate the frozen static Drawer exercise against the bounded oracle and the declared semantic gate, without revising the fixture.
- **Now / Next:** Mechanical evaluation is complete; the next action is the human choice of accepted, conditionally accepted, or rejected.
- **Open questions:** Are the guarded defaults appropriate for reuse? Is the C1/C8 criterion clarification convincing? Which unresolved runtime axes need product input?
- **Actions taken:** Verified every frozen input digest, inspected the allowed oracle and captures, independently inspected HTML/CSS, and ran the declared static and boundary checks.
- **Code changes:** None. One evaluator record was added; frozen implementation and prior evidence were not changed.
- **Verification methods:** SHA-256 verification, static method check, source-boundary check, local Markdown-link check, `git diff --check`, repository-artifact leak scan, and nonblank external-page check.
- **Repository evidence:** This record and the linked frozen Manifest, Contract, matrix, static HTML, captures, and re-extraction.
- **Supplementary evidence:** The bounded oracle and external visual review page; this evidence supports relationship comparison only, not a clone or source-fidelity claim.
- **Review triage:** No blocker was found for human review. The C1/C8 wording ambiguity is a non-blocking Extractor/criterion gap; runtime axes remain product decisions.
- **Attainment status:** partial — the evaluative and review material is done, while the required human disposition is intentionally pending.
- **Outcome:** A reviewer can now make a source-independent acceptance decision with both visual evidence and a provenance-safe semantic assessment.
- **Why it matters:** The record separates defaults, declared product input, and unresolved behavior so a static example cannot silently become a source claim or product commitment.

## Decision boundary

This record evaluates a frozen static exercise. It does not approve a product implementation or decide the human acceptance outcome.

- Bounded oracle: `drawer-oracle-2026-07-a` (SHA-256 `40B47625CC38F66F7B71569F782560F7CC2E4C4579D3C6DC99E305AA6EE37A17`)
- Evaluated result: [static HTML](../implementation/index.html), [wide capture](../implementation/wide.png), and [narrow capture](../implementation/narrow.png)
- Method inputs: [Manifest](../manifest.md), [Application Input Contract](../application-input-contract.md), and [claim matrix](../claim-matrix.md)
- Independent image-first evidence: [re-extraction](re-extraction.md)

All packet-listed digests matched before evaluation. The only outside evidence opened was the bounded oracle above. It was used to assess relationships, not copied values, dimensions, labels, geometry, or pixel similarity.

## Exact failure-condition gate

| Gate | Result | Evaluator finding |
| --- | --- | --- |
| Hierarchy is structural, not visual-only | pass | The parent is a disclosure button owning a nested child list through `aria-controls`; `aria-expanded` identifies its revealed state. |
| Every fallback retains `method-default` provenance | pass | Disclosure and current-accent fallbacks are explicitly bounded by declared Contract slots and remain labelled as defaults. |
| No default is presented as observed source fact | pass | The Manifest, Contract, implementation report, and re-extraction distinguish observed claims from method defaults and product input. |
| No uncontracted expandable parent or current item | pass | The fixture has only the declared parent, child, leaf, direct item, and one declared current destination. No caption, extra group, or extra row was added. |
| Nonblank; no required exercised claim omitted | pass | Both captures are nonblank; C1–C8 each have a witness and evaluator disposition. |

## Claim adjudication

| Claim | Result | Provenance | Notes |
| --- | --- | --- | --- |
| C1 | pass | method-default | Nested ownership, a parent-owned disclosure button, and synchronized expanded state are structural. The default applies only because the Contract declares the parent. |
| C2 | pass | product input required | The top-level leaf is direct and has neither child group nor disclosure state. |
| C3 | pass | product input required | The separate direct item remains top-level and ungrouped. |
| C4 | pass | method-default | The declared current item has a straight leading semantic-token accent, a text-weight distinction, and `aria-current`. |
| C5 | pass | product input required | The named visibility control is separate from navigation rows and retains application-owned state responsibility. |
| C6 | pass | observed | Both captures show comparable rectangular repeated rows rather than decorative card treatment. |
| C7 | pass | observed | Both captures retain a quiet Drawer/workspace boundary. |
| C8 | pass with wording clarification | method-default | The inline chevron is visual meaning within its labelled parent control, uses CSS `stroke: currentColor`, and is synchronized with that control’s expanded state. |

## Re-extraction C1/C8 adjudication

The fixed re-extraction correctly records the evidence it was allowed to inspect, but its partial C1/C8 result is a review-evidence/criterion false positive rather than a product or method failure.

- CSS independently establishes `.chevron { stroke: currentColor; }`; the HTML-only inspection could not establish that declaration.
- The SVG is intentionally `aria-hidden` because its labelled disclosure button, not the SVG, owns the accessible name and expanded-state semantics. Requiring the SVG to have independent accessible meaning would duplicate or misplace responsibility.
- “Meaningful inline SVG” is therefore satisfied as a non-placeholder visual disclosure affordance with parent-owned semantics. It should not be read as requiring an independently named SVG.

The re-extraction artifact remains unchanged. This adjudication identifies an **Extractor gap / criterion ambiguity**, not an Implementer error. A future matrix should say “visually meaningful inline SVG with parent-owned accessible disclosure semantics” to remove the ambiguity.

## Relationship and boundary assessment

The result preserves the bounded relationship inventory: a Drawer edge, a distinct compact control, a current expandable parent, a revealed child, and two non-current top-level direct roles. The generated output is source-independent: it uses neutral system/semantic tokens and avoids source-specific text, palette, dimensions, and runtime invention.

The following remain `unresolved/not observed`: closed state, operating toggle behavior, persistence, focus treatment, motion, overflow, contrast conformance, and responsive behavior. These are not defects in this static exercise and require product input or a separately scoped runtime evaluation.

## Human review requested

Please review the external visual page alongside the links above and choose one outcome:

1. **accepted** — the source-independent result communicates the intended Drawer relationships and the defaults are acceptable.
2. **conditionally accepted** — the relationships communicate, but named refinements or product decisions are required before reuse.
3. **rejected** — the relationships or default policy do not communicate the intended result.

In particular, decide whether (a) the intended Drawer relationships are communicated, (b) the guarded defaults are acceptable, and (c) the C1/C8 false-positive adjudication is convincing.

## Limits and non-claims

This evaluation is not a visual clone comparison, accessibility conformance audit, runtime test, or source-fidelity claim. It does not turn any unresolved axis into an observation or a default. Human disposition remains pending.
