---
title: Evaluator Input Analysis — Pattern A Evaluator–Human Diagnosis
status: final-review-pending
baseline_sha: 33a16e2bfbd2f1f60cfabb78cc26b6b4d02e4ea6
---

# Evaluator Input Analysis

| Question | Observed answer | Evidence |
| --- | --- | --- |
| Was full claim wording available? | Yes. The experiment contract with all three claim texts was delivered. | `evaluator-input-record.md`; `../experiment-contract.md` |
| Were pairwise states available? | Yes. `A-open` and `A-hidden` were delivered with the same viewport requirement. | `evaluator-input-record.md`; `../artifact-manifest.yaml` |
| Was an external oracle available? | No. The packet expressly excluded an external oracle. | `evaluator-input-record.md` |
| Was the evaluator required to record a direct observation? | Partially. The packet required observations and a result, but did not require separate fields for observation, interpretation, and claim decision. | `evaluator-input-record.md` |
| Were `preserved`, `partial`, `failure`, and `not exercised` boundary rules available? | No. The packet permitted these labels but supplied no condition that distinguishes them. | `evaluator-input-record.md`; `../experiment-contract.md` |
| Was an evaluator–human answer mapping available? | No. The evaluator used four result labels; the human packet used `accept` / `reject` / `uncertain`, with no mapping or rationale requirement. | `../human-review-packet.md`; `evaluator-input-record.md` |

The input was sufficiently bounded to identify its artifacts and claims. It was not sufficiently specified to reproduce a thresholded visual verdict or compare the evaluator’s result semantics with the human’s answer semantics.
