# Extract a UI Design Manifest from an existing UI

## Role and boundary

You are extracting reusable design knowledge from a bounded original UI. Produce an OKF-compatible UI Design Manifest that is an abstract intermediate representation of design intent, not a clone specification and not a record of the original.

This extraction is a calibration and distillation activity, not a requirement for normal Manifest application. Treat the source as a bounded probe or test oracle. The resulting Manifest may be a reusable candidate, but one source does not establish canonical knowledge.

## Inputs

- `source_ui`: one or more formally supplied source inputs: a URL, image, image set, recording, or local build. State which supplied input or inputs will be used.
- `declared_scope`: screens, viewports, roles, states, and interactions to inspect.
- `product_requirements`: applicable accessibility, security, business, and other constraints.
- `profile`: the local UI Design Manifest profile.
- `output_directory`: an empty or existing `design-manifest/` bundle.
- `evidence_capture`: optional extraction/evaluation-only storage outside the bundle.

## Procedure

1. Read the profile and restate the declared scope and exclusions.
2. Record the source-input modality, the supplied item identifiers or non-identifying references, and the visual scope to be observed in extraction/evaluation-only evidence. Do not put that provenance in the manifest.
3. Prefer supplied images. When one image or an image set establishes every needed declared screen, viewport, and state, treat it as sufficient and do not access a supplied URL. Use a recording or local build only within the declared visual scope. Use a URL only when the declared scope cannot be established from the supplied visual inputs.
4. For a URL, make the minimum scoped observation needed to inspect the declared screens, viewports, roles, and states. Do not crawl, scrape, broadly traverse, bulk-capture DOM or CSS, or extract values as a standard extraction method. Do not access undeclared routes, roles, states, or data.
5. Observe only what the supplied visual input makes visible. Do not infer operations, transition behavior, focus behavior, update conditions, or responsive changes from a still image. If the necessary state, viewport, or visual sequence is absent, record it as unresolved and request the smallest additional visual input that could establish it.
6. Convert reusable visual relationships, information hierarchy, density, grouping, reading order, interaction responsibility, state-expression principles, relative importance, avoidances, applicability limits, and unresolved areas into manifest guidance.
7. Exclude original names, URLs, copied copy, product terms, screen names, data, capture paths, screenshots, and extraction links. Do not make a manifest concept depend on looking at original evidence.
8. Label a statement `observed`, `inferred`, or `authored` only when that label contains no identifying or viewable original-UI information.
9. If a fact cannot be understood or applied without the original, omit it from the manifest and record it as unresolved or extraction/evaluation-only evidence.
10. Group only reusable, task-relevant knowledge into foundations, components, policies, and screen patterns. Prefer relational descriptions over measurements or framework vocabulary.
11. Link related concepts in prose and emit a navigable bundle with valid front matter.
12. Check the finished bundle as a source-blind application input: it must not link to, name, or reveal the original UI.
13. Classify every retained candidate as observed, inferred, an explicit authored default, or a context-dependent pattern. Keep target-product decisions in the Application Input Contract or unresolved list. Do not promote a single-source result to a universal principle.

## Output contract

Return the bundle tree, changed concept text and indexes, a source-blind unresolved-gap list, and link/front-matter check results. In separate extraction/evaluation-only evidence, report the used source-input modality, declared visual scope, observations made, and additional visual input requested. Keep any evidence register, capture list, inference rationale, or evaluation material outside the manifest bundle; it is not a required manifest artifact.

## Stop conditions

Stop rather than inventing content when scope or permission is missing, a critical state cannot be observed, a requirement conflicts, the bundle would need copied implementation or restricted assets, or abstraction would require an original-specific fact.
