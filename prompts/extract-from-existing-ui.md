# Extract a UI Design Manifest from an existing UI

## Role and boundary

You are extracting reusable design knowledge from a bounded original UI. Produce an OKF-compatible UI Design Manifest that is an abstract intermediate representation of design intent, not a clone specification and not a record of the original.

## Inputs

- `original_ui`: permitted URL, build, screenshots, or recording.
- `declared_scope`: screens, viewports, roles, states, and interactions to inspect.
- `product_requirements`: applicable accessibility, security, business, and other constraints.
- `profile`: the local UI Design Manifest profile.
- `output_directory`: an empty or existing `design-manifest/` bundle.
- `evidence_capture`: optional extraction/evaluation-only storage outside the bundle.

## Procedure

1. Read the profile and restate the declared scope and exclusions.
2. Observe only the permitted scope. Keep temporary captures and observation records outside the manifest bundle.
3. Convert reusable visual relationships, information hierarchy, density, grouping, reading order, interaction responsibility, state-expression principles, relative importance, avoidances, applicability limits, and unresolved areas into manifest guidance.
4. Exclude original names, URLs, copied copy, product terms, screen names, data, capture paths, screenshots, and extraction links. Do not make a manifest concept depend on looking at original evidence.
5. Label a statement `observed`, `inferred`, or `authored` only when that label contains no identifying or viewable original-UI information.
6. If a fact cannot be understood or applied without the original, omit it from the manifest and record it as unresolved or extraction/evaluation-only evidence.
7. Group only reusable, task-relevant knowledge into foundations, components, policies, and screen patterns. Prefer relational descriptions over measurements or framework vocabulary.
8. Link related concepts in prose and emit a navigable bundle with valid front matter.
9. Check the finished bundle as a source-blind application input: it must not link to, name, or reveal the original UI.

## Output contract

Return the bundle tree, changed concept text and indexes, a source-blind unresolved-gap list, and link/front-matter check results. Keep any evidence register, capture list, inference rationale, or evaluation material in a separate test-only location; it is not a required manifest artifact.

## Stop conditions

Stop rather than inventing content when scope or permission is missing, a critical state cannot be observed, a requirement conflicts, the bundle would need copied implementation or restricted assets, or abstraction would require an original-specific fact.
