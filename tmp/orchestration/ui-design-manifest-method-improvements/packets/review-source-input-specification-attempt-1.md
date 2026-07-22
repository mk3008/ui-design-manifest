# WORKER task packet

## Transport preflight — before any work

Use the actual Codex App thread-to-orchestrator message tool targeting 019f86e6-7c6d-7c80-b2b3-ba587af2df90. Send:

```text
[WORKER_ACK v1] task_id=review-source-input-specification attempt=1 handshake=66899501-1892-4075-941f-1247145c5c1a
worker_thread_id=019f8764-be13-7651-9b14-c508ab2bbdea execution_surface=codex-thread-ui
base_commit=<observed git rev-parse HEAD> report=tmp/orchestration/ui-design-manifest-method-improvements/reports/review-source-input-specification-attempt-1.yaml status=running
```

The only repository command allowed before ACK is git rev-parse HEAD. Compare it with expected base fcacec42d2dbc56816330d8b92e3beb3a4ec11b2 and send the observed value; never copy the expected value into base_commit.
Observe a successful tool result, then end this bootstrap turn without any other inspection or editing. Resume only after the orchestrator sends the exact PARENT_ACK_RECEIVED token. If the tool is unavailable or the call fails, stop with delivery=not_sent.

## Identity and model

- Task: review-source-input-specification
- Attempt: 1
- Worker thread: 019f8764-be13-7651-9b14-c508ab2bbdea
- Orchestrator thread: 019f86e6-7c6d-7c80-b2b3-ba587af2df90
- Visibility: codex-task-sidebar
- Execution surface: codex-thread-ui
- Base commit: fcacec42d2dbc56816330d8b92e3beb3a4ec11b2
- Model: configured-default (no override)
- Model rationale: No user-approved model mapping or explicit override was supplied; preserve the configured default.
- Durable report: tmp/orchestration/ui-design-manifest-method-improvements/reports/review-source-input-specification-attempt-1.yaml

## Objective

Record and implement the independent follow-on improvement: source UI inputs are not URL-only and extraction observes only the minimum declared visual scope.

## Context

- The user requires URL, image, multiple images, recording, and local build as first-class source_ui inputs.
- Images are formal inputs, not fallback. If supplied images establish needed states/viewports, do not access URL. URLs require minimum scoped observation; crawling, scraping, broad traversal, DOM/CSS bulk capture, and value extraction are not standard.

## Confirmed facts

- The manifest extracts hierarchy, relationships, density, grouping, reading order, relative importance, and responsibility boundaries—not DOM/CSS/numerical implementation data.
- Image-unobservable operations, transitions, focus, update conditions, and responsive changes must remain unresolved or request extra visual input.
- Used source type/provenance belongs in extraction/evaluation evidence, never source-blind Manifest.

## Allowed scope

- Update prompts/extract-from-existing-ui.md and related extraction/profile/template documentation required for this source-input specification.
- Add an independent durable decision/specification record under docs or tmp orchestration if needed.
- Create the durable worker report.

## Prohibited scope

- Do not modify Experiment 004 attempt artifacts.
- Do not change source-blind application rules beyond cross-reference needed for extraction input provenance.
- Do not make a live-source access, crawl, scrape, or web search.

## Dependencies

- Human source-input request; common-method task accepted by orchestrator.

## Acceptance criteria

- source_ui accepts URL, image, multi-image, recording, and local build as formal input forms.
- The guidance requires image-first sufficiency and minimum scoped URL observation, prohibiting standard crawling/scraping/bulk DOM/CSS/value extraction.
- Observable versus unobservable input facts and unresolved/additional-input handling are explicit.
- Extraction evidence records input modality and scope, while source-blind Manifests do not retain it.

## Verification

- Run tests/check-source-boundaries.ps1.
- Run Markdown front matter/local-link validation and git diff --check.
- Report changed paths and acceptance matrix.

## Stop conditions

- Stop if requirements conflict with source-boundary policy or require editing fixed Experiment 004 artifacts.

## Durable output

English documentation changes plus YAML worker report with changed paths, verification, acceptance matrix, and blockers.

## Terminal transport — last required actions

1. Save the durable report at exactly tmp/orchestration/ui-design-manifest-method-improvements/reports/review-source-input-specification-attempt-1.yaml.
2. Invoke the actual Codex App thread-to-orchestrator message tool targeting 019f86e6-7c6d-7c80-b2b3-ba587af2df90 with:

```text
[WORKER_REPORT v1] task_id=review-source-input-specification attempt=1 status=<ready_for_review|blocked|failed>
report=tmp/orchestration/ui-design-manifest-method-improvements/reports/review-source-input-specification-attempt-1.yaml worker_thread_id=019f8764-be13-7651-9b14-c508ab2bbdea next=parent_review
```

3. Observe a successful tool result. If it fails, retry once with the identical idempotent payload.
4. Only after success, emit a short final response containing `delivery=sent`.
5. Printing [WORKER_REPORT v1] only in your own chat is not delivery and must be reported as delivery=not_sent.
