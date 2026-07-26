---
title: Contract-Only Review — Pattern A Evaluator–Human Diagnosis
status: final-review-pending
baseline_sha: 33a16e2bfbd2f1f60cfabb78cc26b6b4d02e4ea6
---

# Contract-Only Review

## Isolation

A separate Codex task read only `../experiment-contract.md`, `diagnosis-contract.md`, and `evaluator-input-record.md`. It did not receive images, Phase 3B evaluator/human records, artifact identity, or prior experiment history.

## Findings

| Severity | Finding |
| --- | --- |
| High | `perceptibly`, `in the Header`, `primary title anchor`, and `Drawer-body item` have no visual decision criteria; different reviewers can reach different conclusions from the same PNG. |
| High | `PA-HIDDEN` terms “empty Drawer boundary” and “retained Drawer space” also lack a visual boundary, though Phase 3C does not reopen that claim. |
| High | No boundary defines `preserved` versus `partial` versus `failure`; reproducibility is especially weak for weak perceptibility or partial retained space. |
| Medium | The evaluator packet asks for observations and a result, but does not require separate recorded fields for observation, interpretation, oracle comparison, and claim decision. |
| Low | Oracle comparison is explicitly not applicable because no external oracle was delivered; the diagnosis record should avoid conflating absence of an oracle with an oracle-based violation. |
| High | The evaluator and human use different result vocabularies and lack an answer mapping or rationale requirement. They share artifacts/claims but are not fully formalized as the same decision problem. |

This is a document-only contract assessment, not an artifact or result review.
