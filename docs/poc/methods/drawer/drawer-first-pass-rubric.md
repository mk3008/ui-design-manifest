# Primary navigation drawer first-pass rubric

> Test-only rubric: it may compare extraction and application results with source-aware evidence, but none of that evidence may be passed to an implementer or linked from an application packet.

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
| Provenance classification | Every retained claim has exactly one provenance: `observed`, `method-default`, `unresolved/not observed`, or `product input required`; a method-default is never presented as a source observation. | `unsupported` |
| Taxonomy | Group, parent item, disclosure, child list/item, plain item, toggle, and current item are distinguished when evidence shows them. | `missing` or `partial` |
| Coverage inventory | The role-and-relationship coverage inventory classifies expandable parent, top-level leaf without shown children, child, independent/direct item, selected/non-selected contrast, Drawer trigger, row rhythm, and region-edge relationship as observed and retained, observed but not exercised, not observed, out of scope, or unresolved. | `missing` or `partial` |
| Four-view coverage | Component/control, component layout, region composition, and accessibility each have a drawer-only entry or an explicit `unknown`. | `missing` |
| Current state | A visible current destination records accent presence, placement, shape/role, coexistence with fill/text/icon cues, and an explicit programmatic-validation need; absent or unclear cues remain `not observed` or `unresolved`. Only a Contract-declared current item with unobservable accent treatment may receive the explicit method-default: target semantic accent token, restrained straight leading accent, non-color distinction, and programmatic current state. | `missing` or `partial` |
| Disclosure state | Caption, leaf, and expandable parent are distinguished. Disclosure records indicator presence, placement, direction, synchronization, parent-owned child group, icon responsibility, and accessible state; behavior unproven by static evidence remains `unknown`. Only a Contract-declared expandable parent with unestablished indicator treatment may receive the explicit meaningful `currentColor` SVG chevron/caret fallback, right when collapsed and down when expanded. | `unsupported` or `partial` |
| Visibility-mode axes | `presentation`, `closedRepresentation`, `toggleLocation`, and `persistence` are each recorded as an allowed value with evidence, or as `unknown`. Dismissed absence/external restore ownership and compact-rail retention/internal control/declared shortcuts remain separate observations. | `missing` or `partial` |
| Visibility causality | The extraction does not derive one axis from another or treat a static state as runtime persistence. | `unsupported` |
| Accessible naming | Icon-only or compact controls have a discernible-name requirement; icon familiarity is not assumed without context. | `missing` or `unsupported` |
| Reconstruction restraint | Unobserved group captions and groups are absent; ambiguous square or checkbox-like icon placeholders and rounded navigation items are not introduced by default. A meaningful icon has a declared semantic slot; its parent control has a discernible name where interactive. Only a contract-declared expandable parent with unobservable indicator treatment may use the explicit `method-default` `currentColor` inline SVG chevron/caret, right when collapsed and down when expanded; captions and leaves never receive that fallback. Only a Contract-declared current item with unobservable accent treatment may use the explicit method-default straight leading semantic-accent indicator with a non-color cue and programmatic current state. Never invent a parent or current item, or copy source color, dimensions, rounded-pill treatment, or geometry. | `implementation-defect` or `unsupported` |
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
| Disclosure fallback | Contract, rendered state evidence, and accessible-name inspection | A text glyph, placeholder, caption/leaf indicator, unsynchronized direction, or missing accessible state is an `implementation-defect` when the Contract declares a fallback. |
| Presentation/visibility expression | Rendered evidence plus documented state evidence, when available | A reconstruction that contradicts a specified axis is an `implementation-defect`; an unobserved closed representation, toggle location, or persistence must remain `unknown`, not be filled by convention. |
| Header–Drawer seam | Contract boundary and later composite validation | Treat a fully dismissed Drawer's reopen control as Drawer-owned, invent compact-rail shortcuts, or claim seam proof without composite validation as `out-of-scope` or `partial`. |
| Icon treatment | Rendered state evidence and accessible-name inspection | Missing discernible naming or visibly indistinct meaningful icons is an `implementation-defect` against a clear requirement; contrast conformance remains unconfirmed without measurement. |
| Boundary preservation | Change review plus rendered evidence | New full-page, source-copy, geometry, or framework rules are `out-of-scope`, not improved drawer fidelity. |

## C. Semantic round-trip and completeness gate

Use this gate after the generated static evidence exists. The re-extractor receives only that evidence, the source-blind semantic claim matrix, and any declared neutral fixture disclosure. They must not receive source captures, source-aware notes, or an external oracle. This is semantic comparison, not pixel matching.

| Check | Pass condition | Failure classification if not met |
| --- | --- | --- |
| Claim inventory | Each material kept Drawer statement maps to a required claim or an explicit justified omission in the matrix. | `missing` |
| Retained-relationship witness | Every observed-and-retained material relationship has a neutral fixture witness and generated-evidence re-extraction check, or a concrete justified omission. A single selected row cannot stand in for retained broader organization. | `missing` or `implementation-defect` |
| Omission justification | Every claim not exercised names a bounded safety, missing-input, or scope reason; unknown source behavior is not filled with convention. | `unsupported` |
| Re-extraction independence | A reviewer can identify the claimed role or relationship from generated static evidence and matrix terms alone, without source-aware material. | `partial` or `implementation-defect` |
| Semantic equivalence | Re-extracted exercised claims preserve the matrix role and relationship; source-specific pixels, labels, counts, geometry, colors, and icons are not comparison targets. | `implementation-defect` |
| Fixture safety | Any fixture is in a declared semantic slot, explicitly neutral, and does not reproduce source copy or structure. | `out-of-scope` or `unsupported` |
| Meaningful exercise threshold | At least one required material Drawer relationship beyond a bare navigation-region/workspace boundary is exercised and preserved. A claim marked only `not exercised` does not count. | `implementation-defect` |
| Gate result | No required claim is contradicted; all omissions are justified; and the meaningful exercise threshold passes. | Reconstruction `fails` |

The gate may report an otherwise boundary-respecting reconstruction as `failed` when the available source-blind inputs cannot exercise a meaningful Drawer claim. That outcome identifies an application-input or product-decision gap; it does not authorize an implementer to invent content or behavior.

## Decision rule

A first pass is acceptable for human review when every material extraction-quality row is `sufficient`, `partial` with an explicit gap, `source-specific`, or `out-of-scope` for a documented reason; no material row may remain silently `missing` or `unsupported`. A reconstruction can be evaluated only after that review and after the semantic round-trip gate passes. Future human-review packets must pair the matrix, generated-evidence re-extraction, and gate result with a bounded read-only display of the external oracle. That display remains outside the repository and all source-blind Manifest and Implementer inputs. A different successful product can test generalization only after the extractor is frozen.
