# Phase 2A evaluator comparison — Experiment 004

## Scope and disposition

This bounded comparison uses only the packet allowlist. It is not a clone-similarity assessment. **Human review remains required.**

**Attainment status: partial.** The fixed specimen preserves the source-independent structure and deliberately withholds unsupported product detail. It cannot demonstrate populated state, identity, or grouped-summary treatment because authorized inputs do not establish those meanings.

## Source independence

| Check | Evidence | Result |
| --- | --- | --- |
| Allowlist and opened inputs | Implementation log and report record only the profile, apply prompt, fixed source-blind Manifest, and implementation requirements. | preserved |
| Digest record | Recorded input digests equal packet values, including Manifest `8BBFAE…CE968` and requirements `59B571…4025`. | preserved |
| Prohibited-input record | Implementer report says `prohibited_inputs_used: []`; log denies original, source-aware, historical, URL, and search inputs. | preserved as recorded |
| Source-blind leak scan | Candidate Manifest scan for source terms, URL, calibration/evidence/extraction/trace, screenshot/capture, and source-aware terms returned no matches. | preserved |
| Inspected output | Fixed HTML/renders contain only required headers and neutral fixtures; State/Summary are empty. No source copy, product name, identifier, status, link, or action appeared. | preserved |

This supports a source-independent handoff record, not proof of unobservable worker state.

## Intent preservation

| User-specified criterion | Status | Basis |
| --- | --- | --- |
| Header row, exactly three body rows, and required header order | preserved | Fixed HTML and both renders show four headers and three rows. |
| Required Record/Context fixtures | preserved | `Item 1–3` and `Context A–C` appear exactly. |
| Reserved empty State/Summary cells | preserved | No state label, count, destination, control, or interaction. |
| Record strongest; other columns quieter | preserved | Record uses heavier 15px text; headers/context are quieter. |
| Alignment, compact density, neutral surface, light row separation | preserved | Fixed widths, 52px rows, restrained border/surface, and separators are visible. |
| Stronger grouping within a cell than between rows | partially preserved | Cell/row structure exists, but empty State/Summary cannot show their intended grouping. |
| Wide and narrow output without invented transformation | preserved | Wide aligns four columns; narrow preserves table with authorized horizontal overflow. |
| No prohibited content or broader UI | preserved | No source terms, actions, navigation, inputs, selection, editing, or state UI. |

## Abstraction and application quality

**Abstraction quality: partially preserved.** The Manifest retains durable relationships—role order, header-as-key, primary-record hierarchy, compact scanning, and the boundary against invented product meaning. It correctly leaves state and grouped-summary semantics unresolved. Without target inputs, the intended compact state, identity representation, and repeated marks remain unexpressed.

**Application quality: partially preserved.** The fixed result is readable, aligned, and restrained in both viewports. Empty columns create visual silence and prevent assessment of populated grouping, state treatment, or identity representation. This is a consequence of the authorized boundary, not authorization to invent the omitted data.

## Unsupported-invention classification

| Output decision | Classification | Reason |
| --- | --- | --- |
| Four labels and six fixture values | neutral fixture | Explicit requirements. |
| Empty State/Summary cells | supported meaning | Requirements/Manifest require reserved, semantically empty cells. |
| Columns, surface, borders, typography, spacing, and horizontal overflow | local visual decision | Mechanical presentation within relational direction and authorized narrow behavior. |
| Product status, state marks, identity image/name, summary marks, links, actions, row click, or copied source wording | unsupported product meaning/state/action/copy/hierarchy slot — absent | None was added. |

## Information-loss comparison

Severity is for this bounded experiment. “Improve” means improve product readiness/evidence; it never authorizes restoring source-specific material.

| Category | Observed difference (old → new) | Old/new state | Manifest rule | Severity | Improve? | Owner | Without restoring source? |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1. Original identity/address | Identifiable source/address absent | source-specific → excluded | No source facts in application input | none | no | extraction boundary | yes |
| 2. Visible wording/record data | Historic strings become neutral fixtures/blanks | populated → neutral/empty | Values are product-owned | medium | yes, with target data | target product | yes |
| 3. Header vocabulary | Domain labels become role labels | source wording → generalized | Header conveys role, not source vocabulary | low | no | extraction boundary | yes |
| 4. Capture/evidence identifiers | Original evidence absent from app output | evidence-bearing → absent | Source-aware material is evaluation-only | none | no | evaluator | yes |
| 5. Palette/geometry/mechanics | Dark/detailed source becomes restrained local styling | concrete → relational | Preserve density/contrast qualitatively | low | optional | design system | yes |
| 6. Identity representation | Avatar-like treatment absent; Context text only | represented → text-only | Form/content product-owned | medium | yes, with input | target product | yes |
| 7. State semantics/treatment | Visible state becomes empty reservation | stateful → empty | State requires product model; never color alone | high | yes, with state model | target product | yes |
| 8. Grouped summary marks | Repeated visible marks become empty | populated group → empty | No labels/counts/meaning/update behavior | high | yes, with summary model | target product | yes |
| 9. Links/interactions/accessibility | Per-value link absent; focus/AT unresolved | link-capable → plain text | Only with supplied destination | medium | yes, with requirements | target product | yes |
| 10. Responsive/context/actions | Wider chrome/actions absent; narrow scrolls | broad surface → bounded overflow | No page composition/actions; responsive unresolved | low | no for this slice | product scope owner | yes |

## Old-rule similarity and source access

**Yes—old-rule similarity materially depended on source access.** The old calibration visibly populated source-aware role cues (state, identity, repeated summary marks) and was historically source-aware. The new implementer received generic Record/Context fixtures and was required to leave State/Summary empty. Its lesser visual resemblance is the expected cost of a source-independent boundary, not a failure to be remedied by exposing original material.

## Now / Next

Human review must determine whether the safe but intentionally sparse result is sufficient experiment evidence. Target-product inputs are still needed for state meanings, identity representation, grouped-summary values, destinations, responsive policy, and accessibility behavior.
