# WORKER task packet

## Transport preflight — before any work

Use the actual Codex App thread-to-orchestrator message tool targeting 019f86e6-7c6d-7c80-b2b3-ba587af2df90. Send:

```text
[WORKER_ACK v1] task_id=record-004-phase-2a-decision attempt=1 handshake=2836e702-56b8-41bb-b4f2-9368d236c5d5
worker_thread_id=019f875b-39a8-71d0-b91f-dedc199637cd execution_surface=codex-thread-ui
base_commit=<observed git rev-parse HEAD> report=tmp/orchestration/ui-design-manifest-method-improvements/reports/record-004-phase-2a-decision-attempt-1.yaml status=running
```

The only repository command allowed before ACK is git rev-parse HEAD. Compare it with expected base fcacec42d2dbc56816330d8b92e3beb3a4ec11b2 and send the observed value; never copy the expected value into base_commit.
Observe a successful tool result, then end this bootstrap turn without any other inspection or editing. Resume only after the orchestrator sends the exact PARENT_ACK_RECEIVED token. If the tool is unavailable or the call fails, stop with delivery=not_sent.

## Identity and model

- Task: record-004-phase-2a-decision
- Attempt: 1
- Worker thread: 019f875b-39a8-71d0-b91f-dedc199637cd
- Orchestrator thread: 019f86e6-7c6d-7c80-b2b3-ba587af2df90
- Visibility: codex-task-sidebar
- Execution surface: codex-thread-ui
- Base commit: fcacec42d2dbc56816330d8b92e3beb3a4ec11b2
- Model: configured-default (no override)
- Model rationale: No user-approved model mapping or explicit override was supplied; preserve the configured default.
- Durable report: tmp/orchestration/ui-design-manifest-method-improvements/reports/record-004-phase-2a-decision-attempt-1.yaml

## Objective

Record the human decision that Experiment 004 Phase 2A is conditionally accepted, without modifying the fixed experiment run or its original human-review material.

## Context

- The human accepted source-independent application, retained table structure and hierarchy, absence of invented product-specific content, and information-loss framing.
- The human imposed three follow-on conditions: add not-exercised evaluation vocabulary; define safe source-blind fixture conditions; and define an Application Input Contract covering state model, primary record values, identity context, aggregate information, and optional destinations.

## Confirmed facts

- Phase 2A fixed run is committed at fcacec42d2dbc56816330d8b92e3beb3a4ec11b2.
- The existing human-review.md has status human review required and must remain historically unchanged.
- The conditional acceptance does not authorize a re-extraction, Manifest edit, or Implementer retry for Experiment 004.

## Allowed scope

- Create docs/poc/experiments/004-result-table-distillation/phase-2a-attempt-2/human-review-decision.md.
- Update only phase-2a-attempt-2/index.md to link the new decision record.
- Create the durable worker report at the specified path.

## Prohibited scope

- Do not modify human-review.md, evaluator-comparison.md, source-blind-manifest.md, implementation-requirements.md, HTML, CSS, PNGs, implementation log, or attempt-1 artifacts.
- Do not claim unconditional acceptance, done, or completed validation beyond the human decision supplied.
- Do not start the common-method or source-input work.

## Dependencies

- Human decision supplied in this conversation.

## Acceptance criteria

- A separate decision record states conditionally accepted, its accepted scope, all three conditions, and that Experiment 004's fixed run was not changed.
- The record links to the fixed human-review material and names the two follow-on workstreams without implementing them.
- The attempt-2 index links to the decision record.
- Markdown links and git diff --check pass.

## Verification

- Run a local Markdown link/front-matter check for changed files.
- Run git diff --check scoped to changed paths.
- Report changed paths and exact outcomes.

## Stop conditions

- Stop and report if recording the decision requires modifying a fixed artifact.
- Stop and report if a requested decision detail is ambiguous or conflicts with the supplied human decision.

## Durable output

Write a concise English decision record with front matter and a durable YAML worker report containing changed paths, acceptance matrix, verification, and blockers.

## Terminal transport — last required actions

1. Save the durable report at exactly tmp/orchestration/ui-design-manifest-method-improvements/reports/record-004-phase-2a-decision-attempt-1.yaml.
2. Invoke the actual Codex App thread-to-orchestrator message tool targeting 019f86e6-7c6d-7c80-b2b3-ba587af2df90 with:

```text
[WORKER_REPORT v1] task_id=record-004-phase-2a-decision attempt=1 status=<ready_for_review|blocked|failed>
report=tmp/orchestration/ui-design-manifest-method-improvements/reports/record-004-phase-2a-decision-attempt-1.yaml worker_thread_id=019f875b-39a8-71d0-b91f-dedc199637cd next=parent_review
```

3. Observe a successful tool result. If it fails, retry once with the identical idempotent payload.
4. Only after success, emit a short final response containing `delivery=sent`.
5. Printing [WORKER_REPORT v1] only in your own chat is not delivery and must be reported as delivery=not_sent.
