---
type: Evaluator instruction record
title: Replacement evaluator input
description: The Phase 3B replacement evaluator packet relevant to this diagnosis.
status: frozen
source: task-transcript
---

# Delivered instruction

The replacement evaluator was instructed to use only the Phase 3B experiment
contract, artifact manifest, and two fixed PNGs. It was told to recompute the
two specified raw-byte SHA-256 values, visually open both images at original
resolution, and stop with identity mismatch if those values differed.

It was instructed to evaluate only `PA-CTRL`, `PA-TITLE`, and `PA-HIDDEN`; for
each it had to state the artifact IDs and digests, observations, one of
`preserved`, `partial`, `failure`, or `not exercised`, limitations, and next
condition. The packet explicitly prohibited inference about activation, ARIA,
keyboard, focus, Escape, assistive technology, persistence, responsive
behavior, DOM/CSS mechanism, navigation destinations, and universal ownership
rules. It also prohibited standard-pack conclusions and use of the prior
evaluator report.

# Oracle handling

No external oracle was delivered to the replacement evaluator. Therefore no
oracle comparison can explain its recorded `failure` results in this attempt.

# Record limitation

This is a transcription of the delivered task instruction relevant to the
replacement evaluator whose result is retained in `../evaluator-record.md`.
It is a diagnostic input record, not a revised evaluator instruction and not a
new evaluation.
