# Primary navigation drawer extraction prompt

## Role and boundary

Distill a first-pass design-language description for the **primary navigation drawer only**. Do not write a complete-page reconstruction, copy product content, collect exhaustive geometry or color values, choose a framework, or infer runtime behavior from a static image.

## Inputs

- A bounded seed drawer evidence set.
- The frozen extractor version: [evidence matrix](evidence-matrix.md), [correction log](drawer-correction-log.md), and [template](drawer-extraction-template.md).
- Authoritative guidance only where it addresses the claim being made.

## Required process

1. **Stage the observation.** State the drawer-only boundary, the visual states supplied, and the evidence limits. Separate visible facts from anything inferred.
2. **Inventory visible roles.** List only candidate drawer parts: container, toggle, group, plain destination, parent item, disclosure trigger/indicator, child list/item, current item, and material icon-led control. Mark missing parts `unknown`; do not invent them.
3. **Classify presentation and visibility.** Record all four independent axes before writing a behavior rule: `presentation` = `overlay|persistent|unknown`; `closedRepresentation` = `dismissed|compact-rail|unknown`; `toggleLocation` = `inside-drawer|outside-drawer|none-observed|unknown`; and `persistence` = `persistent|non-persistent|unknown`. Give each axis an evidence ID and `observed`, `inferred`, or `unknown` status. Never infer one axis from another.
4. **Normalize taxonomy.** Decide whether each candidate is a non-destination group, a parent item with a disclosure relationship, a child destination, a plain destination, or unresolved. Do not call ordinary navigation a menu bar or turn a group label into a parent solely to make it interactive.
5. **Classify through four views.** Fill component/control, component layout, region composition, and accessibility rows in the template. Each row must be `observed`, `inferred`, or `unknown` and cite evidence IDs.
6. **Separate evidence classes.** For every recommendation, identify authoritative guidance, successful-product observation, human priority/preference, extractor inference, and unknown/unverified claims. Never write a human preference as if it were universal proof.
7. **Filter to the boundary.** Keep only drawer role, hierarchy, current state, presentation/visibility axes, material color-role relationships, icon affordance, and accessibility implications. Remove header, dashboard, right utility, footer, full-page, source-copy, geometry, palette inventory, CSS, library, and workflow detail.
8. **Run the gap check.** Ask: Did the extraction distinguish group from parent? Is a current destination addressed when visible? Is a disclosure state separate from drawer visibility? Does each visibility axis have evidence or `unknown`? Are icon-only controls given a discernible-name requirement? Are every unknown behavior and accessibility gap explicit?
9. **Run the contradiction check.** Reject a rule if it conflicts with an observed fact, treats a static image as runtime proof, derives `compact-rail` from an inside toggle, derives `dismissed` from an outside toggle, makes an exact source treatment universal, or has no source and boundary. When evidence conflicts, preserve `contextual` variants rather than average them into a false universal rule.
10. **Write the output.** Produce concise Contract-ready statements plus a decision log. For each statement, give evidence classes and one classification: `stable`, `contextual`, `source-specific`, or `unconfirmed`. Use relational language, not measurements or implementation instructions.
11. **Freeze for validation.** After human acceptance, freeze this extractor version before applying it to another successful product’s drawer. The later cross-site result may evaluate and classify the frozen extractor, but it may not silently alter the prompt or template while testing.

## Required output shape

1. Subject boundary and evidence limits.
2. Completed four-view template.
3. Candidate Contract statements with evidence and generalization boundaries.
4. Explicit unknowns and validation needs.
5. A short freeze record naming the extractor version and stating that the next source is a holdout test, not a new source of unreviewed rules.

## Stop conditions

Stop and report `blocked` when the evidence cannot distinguish a group from a parent item, when a material claim has no evidence, or when a requested rule crosses the drawer boundary. Do not select a validation product as part of this extraction.
