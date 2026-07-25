# Source-blind semantic round-trip review

## Purpose and boundary

Use this method after a bounded extraction has produced a source-independent Manifest or Application Input Contract and before a reconstruction is accepted. It tests whether the declared semantic roles and material relationships can survive a source-blind application and re-extraction. It is not a pixel-fidelity, copied-copy, geometry, color, icon, item-count, runtime-behavior, or accessibility-conformance test.

The method applies to a declared component scope only. It does not turn unknown source facts into requirements, and it does not authorize an implementer to add product meaning. Component-specific methods may add stricter requirements. In particular, the Drawer gate remains binding where it applies; this shared method does not relax it.

This is communication dogfooding for the source-independent Markdown, not a route for reconstructing the source. A failure may identify an observation-method gap, an abstraction loss, an Application Input Contract gap, or an implementation interpretation error. A preserved round trip makes only the bounded communication claim; it does not promote a single-source Manifest to canonical knowledge.

Keep original source material and source-aware notes outside the source-blind Manifest, Application Input Contract, implementer input, and re-extractor input. A human review packet may pair the generated static evidence with a bounded external oracle display, but that display remains outside the repository and those source-blind inputs.

## Claim matrix

Create one row for every material kept claim before generated evidence is reviewed. The matrix is the common comparison object for the Contract, the application packet, and the re-extractor.

| Matrix ID | Declared component scope | Observed intent and evidence limit | Manifest claim | Application Input Contract need | Fixture support | Generated static evidence | Source-blind re-extraction result | Review status and rationale |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| | | State the observed role or relationship without copied source detail; preserve unknowns. | State the source-independent role or relationship to retain. | State the semantic slot or decision needed to render it; do not add unspecified product meaning. | Name the declared slot and neutral synthetic value, or `none`. | Name the bounded rendered state that makes the relationship observable. | Record the role/relationship comparison result. | `preserved`, `partial`, `failure`, `not exercised`, `unresolved`, or `not applicable`, with reason. |

The matrix must preserve the distinction between an observed intent, a Manifest claim, an input need, fixture support, generated evidence, and the re-extraction result. A missing input need is a gap, not permission to invent a value. A claim outside the declared component scope must be removed or marked `not applicable` with a boundary reason.

## Required procedure

1. Freeze the source-blind claim matrix for the reviewed generated state. Retain unknowns and stated scope boundaries.
2. Supply the implementer only the source-blind Manifest/Application Input Contract, declared semantic slots, and permitted neutral fixtures. Do not supply an oracle, source capture, source-aware history, copied labels, or product identity.
3. Generate bounded static evidence that makes each exercised material claim observable.
4. Give a fresh re-extractor only the generated evidence, the source-blind matrix, and the fixture disclosure. The re-extractor compares semantic role and relationship, not source details or visual fidelity.
5. Record one status per matrix row, then make a component-scope gate decision. Human reviewers receive the completed matrix, generated evidence, re-extraction result, and a bounded external oracle display kept outside the repository and every implementer/source-blind input.

## Comparison and status rules

Compare by role and relationship only: for example, ownership, grouping, parent-to-child relation, current/selected relation, condition-to-result relation, or result-to-field relation when each is actually declared and rendered. Do not compare copied labels, product data, source identity, pixels, geometry, colors, icon choice, or item count.

| Status | Meaning | Gate treatment |
| --- | --- | --- |
| `preserved` | Generated evidence lets the re-extractor identify the declared material role and relationship without contradiction. | Counts toward the material-relationship obligation. |
| `partial` | Some declared semantic content is visible, but a stated material role, relationship, or required input remains missing or ambiguous. | Does not satisfy the incomplete portion; resolve or explicitly narrow the claim before acceptance. |
| `failure` | The evidence contradicts a required claim, substitutes another meaning, or is blank/omission-only for a required claim. | Fails the component-scope gate. |
| `not exercised` | No safe generated evidence was produced for the declared claim. | Never proof of preservation; record the missing input, safety, or scope reason. |
| `unresolved` | Available source-blind evidence cannot safely decide preservation. | Does not pass; request a bounded decision or input without importing source facts. |
| `not applicable` | The claim is genuinely outside the declared component scope or absent from the accepted Contract. | Does not count as an exercised claim; retain the boundary rationale. |

At least one material relationship within every declared component scope must be exercised and `preserved`. A bare region boundary, empty container, or blank output never satisfies this obligation. A scope with only `not exercised`, `unresolved`, or `not applicable` rows is not preserved.

## Neutral fixtures

Fixtures exist only to populate already-declared Application Input Contract semantic slots so that a relationship can be observed. They must be neutral, synthetic values and must be disclosed in the matrix. They may not copy source labels, product identity, user or business data, hierarchy shape, item count, visual treatment, geometry, colors, icons, or behavior; nor may they invent a product meaning. If a safe fixture cannot exercise a claim, leave it `not exercised` and record the required input or decision.

## Component obligations

The following are minimum review obligations, not universal component content. Apply an obligation only when the corresponding role or relationship is declared by the bounded Contract; otherwise retain the explicit unknown or boundary.

| Declared scope | Non-empty observable obligation |
| --- | --- |
| Drawer | Exercise and preserve at least one declared internal navigation relationship beyond the drawer/workspace boundary, such as group-to-destination, parent-to-child, current-state-to-destination, or declared trigger-to-controlled-region relation. Follow the stricter [Drawer method](drawer/README.md). |
| Header | Exercise and preserve at least one declared Header role relationship, such as identity/home role within the Header, global role grouping, or a visibly supported Header-owned Drawer trigger and controlled-region relation. Do not infer Drawer state from trigger placement. |
| Search conditions | Exercise and preserve at least one declared condition relationship, such as condition role-to-input slot, condition group-to-combination meaning, or declared submitted-condition-to-result context. Do not invent predicates, values, or behavior. |
| Result grid | Exercise and preserve at least one declared result relationship, such as grid-to-field role, header-to-result-field correspondence, result state-to-declared status, or declared result grouping. Do not invent records, counts, sort behavior, or product taxonomy. |

## Gate decision

The component scope is `preserved` only when every required exercised claim is preserved, no required claim is a failure, all partial or unresolved rows have an explicit unresolved decision, and the scope has at least one preserved material relationship. Otherwise report `partial` or `failure` according to the row results; report `not exercised` rather than preservation when no material relationship was safely exercised. This method requires independent review before any implementation suite is treated as accepted evidence.
