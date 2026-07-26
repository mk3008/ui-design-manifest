---
title: Evidence Lineage — Pattern A Evaluator–Human Diagnosis
status: final-review-pending
baseline_sha: 33a16e2bfbd2f1f60cfabb78cc26b6b4d02e4ea6
---

# Evidence Lineage

This record classifies evidence used for the Phase 3C diagnosis. It does not alter the Phase 3B evaluation or its `rejected` experiment result.

| Evidence role | Record | What it establishes | Boundary |
| --- | --- | --- | --- |
| Claim definition | `../experiment-contract.md` | The exact wording of `PA-CTRL`, `PA-TITLE`, and `PA-HIDDEN`. | A claim is not an observation or an external oracle. |
| Fixed visual artifacts | `../implementation/A-open.png`; `../implementation/A-hidden.png` | The two bytes-identified visual inputs at `1280x720`. | They do not, by themselves, define the meaning of “Header”, “controller”, or “anchor”. |
| Artifact identity | `../artifact-manifest.yaml`; `../artifact-identity-reconciliation.md` | Paths, states, viewport, and raw-byte SHA-256 identity. | Identity does not establish a visual interpretation. |
| Evaluator input | `evaluator-input-record.md` | The replacement evaluator received the experiment contract, manifest, and fixed PNGs, without an external oracle. | The record is an input/procedure record, not an evaluator conclusion. |
| Evaluator observation and conclusion | `../evaluator-record.md` | The evaluator reported `failure` for `PA-CTRL` and `PA-TITLE`, and `preserved` for `PA-HIDDEN`. | It combines observations and result rationale; it does not provide an operational rubric. |
| Human decision | `../human-review-record.md` | The human selected `accept` for all three claims. | The detailed basis is explicitly unavailable. |
| Historical claim context | `../../attempt-1/claim-matrix.md`; `../../attempt-1/pattern-evidence.md` | Earlier Pattern A discussion and coordinate-oriented context. | Historical context was not delivered as a replacement-evaluator oracle and is not used to decide Phase 3B. |
| Diagnosis-only blind observation | `blind-visual-observation.md` | A task isolated to two PNGs and viewport reported what it could observe. | It is not a replacement evaluation, oracle, or human decision. |
| Diagnosis-only contract review | `contract-only-review.md` | A document-only task identified claim/rubric and output-semantic gaps. | It did not see artifacts or Phase 3B results. |

No external UI, route, product binding, original implementation, or web source was used as a Phase 3C oracle. The Phase 3B human rationale remains `unavailable`; this diagnosis does not infer one.
