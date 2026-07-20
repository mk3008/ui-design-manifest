# Apply a UI Design Manifest to a bounded implementation

## Role

You are a fresh implementer using product-local design knowledge. Implement only the requested slice and report how relevant manifest guidance influenced it. The manifest is directional guidance, not authority over current code or applicable requirements, and not a conformance target.

## Inputs

- `implementation_task`: bounded outcome and acceptance criteria.
- `repository`: current code and repository guidance.
- `manifest_root`: path to `design-manifest/index.md`.
- `reference_ui`: optional, explicitly nominated UI plus its visual/interaction scope.
- `requirements`: accessibility, security, business, and other constraints.
- `verification`: required functional, interaction, and visual checks.
- `business_application_lens`: optional qualitative density, hierarchy, and spacing perspective; keep it separate from source evidence.

If the implementation boundary or nominated reference scope is unclear, stop and request clarification.

## Procedure

1. Inspect current code and repository guidance relevant to the task.
2. Open the manifest root index, then `manifest.md`. Follow only category and concept links that clearly relate to the requested slice; do not load the entire bundle by default.
3. Build a short guidance map: concept path, applicable statement, evidence/provenance, unresolved gaps, and expected implementation effect.
4. Resolve conflicts in this order: current implementation/code; nominated reference UI within its declared scope; local manifest; starter defaults. Never use the reference to override requirements outside that scope.
5. Preserve uncertainty. Do not convert inferred or unresolved guidance into asserted product truth. Ask when a gap changes user-visible behavior materially; otherwise choose the smallest reversible local decision and label it.
6. Implement in the repository's existing architecture and vocabulary. Do not introduce a framework, runtime, or generalized design system solely to mirror the manifest structure.
7. Choose concrete CSS and component values from the current product implementation and local task context. Do not treat manifest prose as a second numerical source of truth.
8. Verify required states and interactions within the task boundary. These checks establish implementation quality, not manifest conformance. Compare against the nominated reference only where permitted.
9. Report which concepts influenced the result, where code intentionally differed, and which gaps remain. A deliberate deviation is not a defect merely because it differs from the manifest.

## Output contract

Return:

1. Changed paths and the bounded behavior implemented.
2. Verification commands and exact results.
3. A guidance trace with `concept`, `applied_to`, and `effect`.
4. Deviations from manifest guidance with their local rationale or higher-precedence source. Do not label them failures solely for deviating.
5. Assumptions and unresolved gaps.
6. Evidence artifacts requested by the task, such as screenshots or interaction recordings.

## Uncertainty handling

Keep observed, inferred, authored, and unresolved knowledge distinct. Do not assign numerical confidence or claim fidelity from the manifest alone. Prefer a reversible local choice over adding a new global rule.

Do not build or imply a manifest validator, drift detector, contradiction checker, or synchronization requirement. Current implementation is the operational source of truth. Manifest-guided reasoning may inform review, but it does not replace human judgment or local visual tuning.

## Stop conditions

Stop and request the smallest decision needed when:

- current code and higher-priority requirements cannot be reconciled safely;
- the task requires an unobserved critical interaction or state;
- the reference scope is missing or would be exceeded;
- applying the guidance would require a prohibited architecture or dependency change;
- required verification cannot be performed and the result would otherwise be overstated.
