---
type: Evaluator–human disagreement diagnosis contract
title: Pattern A limited disagreement diagnosis
description: A non-replacement analysis of the existing Phase 3B judgments.
status: active
source: authored
---

# Identity and scope

- Phase 3B baseline commit: `33a16e2bfbd2f1f60cfabb78cc26b6b4d02e4ea6`
- Experiment ID: `header-drawer-pattern-a-reconnection-attempt-2`
- Diagnosis claims: `PA-CTRL`, `PA-TITLE`
- Comparison-only claim: `PA-HIDDEN`
- Fixed artifacts: `HDA2-A-OPEN-1280X720` and
  `HDA2-A-HIDDEN-1280X720`, at `1280x720` and with the raw-byte SHA-256 values
  in `../artifact-manifest.yaml`.

# Allowed and prohibited inputs

Allowed inputs are the Phase 3B experiment contract, evaluator instruction
record, evaluator record, human-review packet and record, artifact manifest,
the two fixed PNGs, identity reconciliation, final closure, and only the
minimum earlier Pattern A material needed to trace claim provenance. The
replacement evaluator received no external oracle. No new external material or
original-UI observation is permitted.

Do not use a new UI, capture, image, implementation, human rationale, or an
assumption that either evaluator or human is correct. Do not change any Phase
3B result, fixed artifact, or `rejected` conclusion.

# Diagnostic vocabulary

Use one or more of: `claim-ambiguity`, `rubric-ambiguity`,
`oracle-overconstraint`, `evaluator-overreach`, `artifact-visual-ambiguity`,
`artifact-defect-supported`, `human-rationale-missing`,
`different-review-question`, `insufficient-evidence`, `mixed`, or
`undetermined`.

Evidence must distinguish a directly visible artifact fact, evaluator
interpretation, oracle comparison, claim violation, human decision, and human
rationale. The human rationale is `unavailable` because no rationale was
provided.

# Diagnosis, not reevaluation

This work explains how the existing disagreement could arise from the defined
inputs. It does not replace the evaluator result, re-score the human decision,
or decide which judgment is correct.

# Success and stop conditions

Success requires separate diagnosis of both claims, a blind visual observation,
a contract-only review, evidence-linked classifications, one minimal next-work
recommendation, and independent final review. Stop with
`human-clarification-required`, `additional-blind-review-required`, or
`undetermined` when available evidence cannot support a claim-level diagnosis.
