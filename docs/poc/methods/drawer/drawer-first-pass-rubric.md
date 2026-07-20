# Primary navigation drawer first-pass rubric

## Purpose

Evaluate a first-pass drawer extraction separately from any reconstruction. This rubric judges whether the method produced a traceable and usable design-language input; it does not certify visual fidelity, runtime behavior, or accessibility conformance.

## Finding labels

| Label | Meaning | Required disposition |
| --- | --- | --- |
| `sufficient` | The claim is in scope, traceable, bounded, and precise enough for a fresh implementer to act on without importing source-specific detail. | Keep. |
| `partial` | The claim is useful but lacks one required view, state, or evidence limit. | Retain only with the gap recorded. |
| `missing` | A material observed role, state, relationship, or validation gap is absent. | Add an extraction question; do not invent an answer. |
| `unsupported` | The statement has no adequate authority or product observation, or overstates a static image as behavior. | Remove or mark `unconfirmed`. |
| `implementation-defect` | The extraction is adequate, but a later reconstruction fails to express the stated rule. | Send to reconstruction work; do not enlarge the extractor without new evidence. |
| `source-specific` | The statement accurately describes the seed but cannot yet be promoted to a reusable baseline. | Preserve as calibration evidence; exclude from stable baseline. |
| `out-of-scope` | The finding concerns another region, complete-page composition, runtime workflow, exhaustive geometry/palette, or implementation mechanism. | Exclude and record the boundary. |

## A. Extraction-quality scorecard

| Check | Pass condition | Failure classification if not met |
| --- | --- | --- |
| Subject boundary | The output names the primary drawer and explicitly excludes unrelated regions and complete-page rules. | `missing` or `out-of-scope` |
| Evidence separation | Every kept recommendation identifies its evidence class; observed, inferred, and unknown claims are not merged. | `unsupported` |
| Taxonomy | Group, parent item, disclosure, child list/item, plain item, toggle, and current item are distinguished when evidence shows them. | `missing` or `partial` |
| Four-view coverage | Component/control, component layout, region composition, and accessibility each have a drawer-only entry or an explicit `unknown`. | `missing` |
| Current state | A visible current destination has a distinct-state description and an explicit programmatic-validation need. | `missing` or `partial` |
| Disclosure state | Disclosure is not confused with group membership or drawer visibility; behavior unproven by static evidence remains `unknown`. | `unsupported` or `partial` |
| Visibility-mode axes | `presentation`, `closedRepresentation`, `toggleLocation`, and `persistence` are each recorded as an allowed value with evidence, or as `unknown`. | `missing` or `partial` |
| Visibility causality | The extraction does not derive one axis from another or treat a static state as runtime persistence. | `unsupported` |
| Accessible naming | Icon-only or compact controls have a discernible-name requirement; icon familiarity is not assumed without context. | `missing` or `unsupported` |
| Distillation restraint | No copied source labels/data, exhaustive geometry/palette, implementation mechanism, or framework detail is used as a Contract rule. | `out-of-scope` |
| Generalization boundary | Every recommended rule is marked stable, contextual, source-specific, or unconfirmed. | `unsupported` |
| Freeze discipline | The output states that the extractor must be frozen before cross-site drawer validation. | `missing` |

## B. Reconstruction-quality scorecard

Use this only after an implementation exists. It must not be used to rewrite a sufficient extraction merely because of an implementation error.

| Check | Evidence needed | Classification guidance |
| --- | --- | --- |
| Taxonomy expression | Rendered evidence plus semantic inspection, when available | If the extraction clearly distinguished group and parent but the result merges them, classify `implementation-defect`. If the extraction never made the distinction, classify `missing`. |
| Current-state expression | Rendered evidence plus accessibility inspection, when available | A reconstruction that removes the stated distinct state is an `implementation-defect`; untested programmatic exposure remains `partial` or `unknown`, not a conformance failure. |
| Disclosure/drawer independence | Evidence for relevant visible states | Confusing parent disclosure with drawer visibility is an `implementation-defect` when the extraction kept them separate. Behavior absent from source evidence remains `unknown`. |
| Presentation/visibility expression | Rendered evidence plus documented state evidence, when available | A reconstruction that contradicts a specified axis is an `implementation-defect`; an unobserved closed representation, toggle location, or persistence must remain `unknown`, not be filled by convention. |
| Icon treatment | Rendered state evidence and accessible-name inspection | Missing discernible naming or visibly indistinct meaningful icons is an `implementation-defect` against a clear requirement; contrast conformance remains unconfirmed without measurement. |
| Boundary preservation | Change review plus rendered evidence | New full-page, source-copy, geometry, or framework rules are `out-of-scope`, not improved drawer fidelity. |

## Decision rule

A first pass is acceptable for human review when every material extraction-quality row is `sufficient`, `partial` with an explicit gap, `source-specific`, or `out-of-scope` for a documented reason; no material row may remain silently `missing` or `unsupported`. A reconstruction can be evaluated only after that review, and a different successful product can test generalization only after the extractor is frozen.
