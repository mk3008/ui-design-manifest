# Source-independence audit

## Goal

Keep UI Design Manifests as source-independent intermediate representations: extraction may see an original UI; normal application may not; evaluation may compare both in a separate test context.

## Classification

| Material | Classification | Treatment |
| --- | --- | --- |
| Original UI, original URL, captures, screenshots, source evidence, evidence registers, original-specific copy, and original product names | 1 for manifests/application; 2 for extraction; 3 for evaluation | Exclude from application packets and manifests; retain only as bounded extraction or test evidence. |
| `observed`, `inferred`, and `authored` provenance labels | 4 when non-identifying | Keep only as abstraction/provenance classes; never include a viewable or identifying trace. |
| Target implementation, repository guidance, product requirements, accessibility, security, and business requirements | 4 | Normal application inputs and precedence authorities. |
| Calibration, holdout, review, correction log, candidate catalog, and historical acceptance records | 3 | Keep as test-only history; do not treat as current source-independent proof. |

## Inventory decisions

- `README.md`, `profile/`, `prompts/`, and `templates/` are canonical product-facing documentation. They now state the source-independence principle and exclude original/reference UI from standard application.
- `docs/poc/experiments/001-workspace-shell/extracted/design-manifest/` is a source-blind bundle. Its manifest no longer links to an evidence register or identifies the original state.
- `docs/poc/experiments/*/apply-packet.md` are explicit application allowlists. They separate the files an implementer may see from experiment evidence.
- `docs/poc/experiments/*/{calibration,holdout,evidence,review}` and source-named contracts/results remain test-only. Existing acceptance statements are historical and require revalidation under the new boundary.
- `docs/poc/methods/` and `reference-candidates.md` are extraction/evaluation method material, not standard application input.

## Ledger snapshot

- Goal: make the manifest and normal application independent from original UI evidence.
- Now: canonical docs, templates, prompts, PoC packets, and regression check updated.
- Next: Phase 2 re-extract and independently evaluate the listed historical experiments.
- Blockers: none for this documentation phase.
- Evidence ready: repository-static checks and independent review; human re-acceptance remains pending by design.
