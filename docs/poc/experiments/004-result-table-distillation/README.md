# Experiment 004: Result-table distillation and anonymous reconstruction

> Historical result under the prior source-aware rule. It has not been revalidated under the source-independent manifest boundary and does not demonstrate current validity.

## Source-blind application packet

Use the explicit [application-packet.md](apply-packet.md) allowlist. All calibration evidence, source-aware contracts, and reviews are test-only and must not reach an implementer.

This calibration experiment tests whether a bounded, read-only result-table direction can be extracted from observed source evidence and applied by a fresh implementer without exposing source-specific copy or product data.

## Scope

Included: one header row and representative body rows for four aligned roles—record state, primary record, identity context, and grouped state summary. The accepted review is a static calibration slice, not a complete page.

Excluded: search criteria, actions, result counts, pagination, sorting, selection, editing, empty/loading/error states, page chrome, and complete-page composition. No excluded behavior or state is authorized by this experiment.

## Calibration source and evidence

- Source URL: [GitLab Pipelines](https://gitlab.com/gitlab-org/gitlab/-/pipelines)
- [Bounded anonymous source evidence](calibration/evidence/gitlab-result-table-anonymous.png)
- [Source-aware Contract](calibration/components/result-table-core.md)
- [Evidence register](calibration/evidence-register.md)
- [Source-anonymous apply Contract](calibration/apply-contract/read-only-result-table.md)

The source-aware materials record observed evidence and provenance limits. The apply Contract expresses reusable visual direction using generalized roles; it does not authorize source strings, records, statuses, people, identifiers, counts, or fixture values. The review fixtures are non-product static fixtures used only to test the visual direction.

## Accepted static review

- [Wide review](calibration/review/wide.png)
- [Narrow review](calibration/review/narrow.png)
- [Static review HTML](calibration/review/index.html)
- [Static review stylesheet](calibration/review/styles.css)

The static reconstruction was human-visually accepted for this bounded calibration. Acceptance applies to the supplied slice and does not establish universal fidelity, responsive behavior, interaction behavior, or product semantics.
