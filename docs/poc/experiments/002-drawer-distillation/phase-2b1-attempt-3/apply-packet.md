# Phase 2B1 source-blind application packet

## Purpose

Create exactly one initial, non-production static implementation that exercises the bounded visible-open Drawer guidance. This packet is source-blind and is the only task-specific application input.

## Required inputs

- [UI Design Manifest profile](../../../../../profile/ui-profile.md)
- [Source-blind Drawer manifest](design-manifest/index.md)
- [Application Input Contract](design-manifest/policies/application-input-contract.md)
- [Fixture policy](design-manifest/policies/fixture-policy.md)

## Fixed application inputs

| Contract slot | Supplied value | Handling |
| --- | --- | --- |
| Drawer presentation | A visible left-side navigation region beside an independently readable content region in the declared wide state. | Exercise. Do not infer overlay behavior. |
| Current state | The Drawer is visible; one parent is expanded and one nested child is current. | Exercise only this state. |
| Closed representation | Not supplied. | Not exercised; do not create one. |
| Toggle | Not supplied. | Do not create a toggle or assign an owner. |
| Persistence | Not supplied. | Not exercised; do not infer it. |
| Navigation structure | Two groups; one group contains a direct item and an expanded parent with one child, the other contains one direct item. | Test-only, owner-supplied fixture shape. |
| Group labels | `Group 1`, `Group 2`. | Neutral test-only fixture values. |
| Item labels | `Item 1`, `Parent 1`, `Child 1`, `Item 2`. | Neutral test-only fixture values. |
| Current location | `Child 1`. | Test-only fixture value. |
| Destinations | Not supplied. | Render non-link navigation rows. |
| Icon slots | Present as decorative, non-semantic compact markers. | Use no branded or domain-specific icon. |
| Search/filtering behavior | Not supplied. | An affordance may be visibly inert; do not invent query, results, empty state, or update behavior. |
| Narrow viewport | Capture only to document the unchanged bounded implementation. | Do not introduce a compact rail, overlay, collapse, toggle, or breakpoint behavior. |

## Implementation requirements

- Create only under `docs/poc/experiments/002-drawer-distillation/phase-2b1-attempt-3/implementation/`.
- Use a static HTML/CSS implementation. Do not add a package ecosystem, runtime, application framework, network access, external fonts, images, or dependencies.
- Keep fixture strings visibly marked as test-only in an out-of-band implementation record, not as product claims.
- Preserve the reading order: context, optional identity context, inert search/filter affordance, primary group, secondary group.
- Express the selected parent and current child as separate levels. Keep group boundaries and row rhythm scannable.
- Do not add product copy, destinations, aggregate values, badges, status, people, permissions, or interactions not supplied above.
- Render the declared visible-open state once. Do not revise this initial implementation after its evidence has been saved.

## Required evidence before evaluation

Save under the same `implementation/` directory:

- opened-file list and prohibited-input declaration;
- changed-file list and implementation log;
- assumptions, unresolved gaps, guidance trace, fixture trace, and unsupported-invention self-report;
- wide and narrow renderings of the same state;
- build/test result for the static artifact.

## Prohibited inputs

Do not access the original oracle, source URL/name/copy, screenshots, recordings, extraction/evaluation records, any legacy Experiment 002 material, other Phase 2B1 attempts, reviewer reports, old implementations, old reviews, correction logs, holdout material, external search, or anything outside the declared allowlist.
