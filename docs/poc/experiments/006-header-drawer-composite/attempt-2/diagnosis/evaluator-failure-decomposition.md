---
title: Evaluator Failure Decomposition — Pattern A Evaluator–Human Diagnosis
status: final-review-pending
baseline_sha: 33a16e2bfbd2f1f60cfabb78cc26b6b4d02e4ea6
---

# Evaluator Failure Decomposition

| Claim | Evaluator-record observation/rationale | Result interpretation | Oracle comparison | What is not traceable from the record |
| --- | --- | --- | --- | --- |
| `PA-CTRL` | The record says the `A-hidden` artifact has no Header/control. | `failure`: the controller was therefore not perceptibly in Header in both states. | Not applicable: no external oracle was in the packet. | A visual region definition, how the controller candidate was identified, a perceptibility threshold, and why `failure` rather than `partial` follows. |
| `PA-TITLE` | The record says the `A-hidden` artifact has no Header/title. | `failure`: the primary title anchor therefore did not remain in Header in both states. | Not applicable: no external oracle was in the packet. | A title-anchor definition, a continuity rule, a Header region definition, and why `failure` rather than `partial` follows. |

The decomposition does not prove evaluator overreach. It shows that the conclusion cannot be replayed as a distinct chain of direct fact, operational rule, and result from the persisted record. The human record does not repair this gap because its detailed reason is unavailable.
