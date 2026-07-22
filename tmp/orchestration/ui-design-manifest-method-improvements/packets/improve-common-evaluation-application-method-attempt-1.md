# WORKER task packet

## Transport preflight — before any work

Use the actual Codex App thread-to-orchestrator message tool targeting 019f86e6-7c6d-7c80-b2b3-ba587af2df90. Send:

```text
[WORKER_ACK v1] task_id=improve-common-evaluation-application-method attempt=1 handshake=f9aa7178-ba0c-421d-b697-8ed7d64cd033
worker_thread_id=019f875f-cede-78f3-be8b-97f622fe682b execution_surface=codex-thread-ui
base_commit=<observed git rev-parse HEAD> report=tmp/orchestration/ui-design-manifest-method-improvements/reports/improve-common-evaluation-application-method-attempt-1.yaml status=running
```

The only repository command allowed before ACK is git rev-parse HEAD. Compare it with expected base fcacec42d2dbc56816330d8b92e3beb3a4ec11b2 and send the observed value; never copy the expected value into base_commit.
Observe a successful tool result, then end this bootstrap turn without any other inspection or editing. Resume only after the orchestrator sends the exact PARENT_ACK_RECEIVED token. If the tool is unavailable or the call fails, stop with delivery=not_sent.

## Identity and model

- Task: improve-common-evaluation-application-method
- Attempt: 1
- Worker thread: 019f875f-cede-78f3-be8b-97f622fe682b
- Orchestrator thread: 019f86e6-7c6d-7c80-b2b3-ba587af2df90
- Visibility: codex-task-sidebar
- Execution surface: codex-thread-ui
- Base commit: fcacec42d2dbc56816330d8b92e3beb3a4ec11b2
- Model: configured-default (no override)
- Model rationale: No user-approved model mapping or explicit override was supplied; preserve the configured default.
- Durable report: tmp/orchestration/ui-design-manifest-method-improvements/reports/improve-common-evaluation-application-method-attempt-1.yaml

## Objective

Implement the three conditional-acceptance improvements as common, reusable evaluation and application guidance; do not change Experiment 004 fixed-run artifacts.

## Context

- Human decision: add not exercised; define safe source-blind fixtures; define Application Input Contract for state, primary value, identity context, aggregate data, optional destinations.
- Read profile/ui-profile.md, profile/manifest-authority.md, prompts/apply-manifest.md, templates, and current docs before selecting the smallest consistent surface.

## Confirmed facts

- Experiment 004 Phase 2A is conditionally accepted in a separate decision record.
- A fixture may not create product meaning, a new hierarchy slot, or source-specific copy.

## Allowed scope

- Update common profile/prompt/template/docs needed to make the three conditions operational.
- Create a durable report at the specified path.

## Prohibited scope

- Do not modify any files under docs/poc/experiments/004-result-table-distillation/phase-2a-attempt-1 or phase-2a-attempt-2.
- Do not implement or define the separate source-input specification task.
- Do not weaken source-boundary checks.

## Dependencies

- record-004-phase-2a-decision accepted by orchestrator.

## Acceptance criteria

- Evaluation vocabulary defines not exercised as distinct from preserved/partial/failure, with evidence expectations.
- Safe source-blind fixture rules specify neutral semantic slots, provenance, and prohibited product/source meaning.
- An Application Input Contract explicitly covers state model, primary-record value, identity context, aggregate information, optional destinations, and unresolved behavior.
- Guidance preserves source-blind boundaries and has clear application ownership.

## Verification

- Run tests/check-source-boundaries.ps1.
- Run Markdown front matter/local-link validation and git diff --check.
- Report changed paths and acceptance matrix.

## Stop conditions

- Stop if satisfying the conditions requires changing the fixed Experiment 004 run.
- Stop if current repository authority conflicts with the human decision.

## Durable output

English documentation changes plus YAML worker report with changed paths, verification, and acceptance matrix.

## Terminal transport — last required actions

1. Save the durable report at exactly tmp/orchestration/ui-design-manifest-method-improvements/reports/improve-common-evaluation-application-method-attempt-1.yaml.
2. Invoke the actual Codex App thread-to-orchestrator message tool targeting 019f86e6-7c6d-7c80-b2b3-ba587af2df90 with:

```text
[WORKER_REPORT v1] task_id=improve-common-evaluation-application-method attempt=1 status=<ready_for_review|blocked|failed>
report=tmp/orchestration/ui-design-manifest-method-improvements/reports/improve-common-evaluation-application-method-attempt-1.yaml worker_thread_id=019f875f-cede-78f3-be8b-97f622fe682b next=parent_review
```

3. Observe a successful tool result. If it fails, retry once with the identical idempotent payload.
4. Only after success, emit a short final response containing `delivery=sent`.
5. Printing [WORKER_REPORT v1] only in your own chat is not delivery and must be reported as delivery=not_sent.
