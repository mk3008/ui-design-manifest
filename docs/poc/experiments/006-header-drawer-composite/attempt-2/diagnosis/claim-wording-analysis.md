---
title: Claim Wording Analysis — Pattern A Evaluator–Human Diagnosis
status: final-review-pending
baseline_sha: 33a16e2bfbd2f1f60cfabb78cc26b6b4d02e4ea6
---

# Claim Wording Analysis

| Claim | Exact obligation | Directly observable from a fixed PNG pair | Interpretive terms without an operational threshold | Oracle dependence | Diagnostic consequence |
| --- | --- | --- | --- | --- | --- |
| `PA-CTRL` | “Drawer controller is perceptibly in Header in both states and not Drawer body.” | A candidate icon, its visible position, and whether a separate drawer region is visible. | “Drawer controller”, “perceptibly”, “in Header”, and “Drawer body”. The contract does not specify a bounding region, contrast threshold, or candidate-identification rule. | None was delivered to the replacement evaluator. | The same pixels can support different affiliation/visibility conclusions without either conclusion being traceable to a stated rubric. |
| `PA-TITLE` | “The primary title anchor remains in Header in both states.” | A candidate text label, its visible position, and its apparent presence in each state. | “primary”, “title anchor”, “remains”, and “in Header”. The contract does not define title selection, continuity, or a Header region. | None was delivered to the replacement evaluator. | “Visible text” and “primary Header title anchor” are not equivalent, so a conclusion needs a rule that is absent. |
| `PA-HIDDEN` (comparison only) | “Drawer is fully hidden: no visible Drawer region, empty Drawer boundary, or retained Drawer space.” | Visible panel/boundary/space candidates. | “empty Drawer boundary” and “retained Drawer space”. | None was delivered to the replacement evaluator. | The same lack of visual rubric also affects the preserved result, but Phase 3C does not reopen it. |

The claims supply a stable target but not a reproducible visual decision procedure. This is claim/rubric ambiguity, not evidence that either the evaluator or the human answer is wrong.
