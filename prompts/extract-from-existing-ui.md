# Extract a UI Design Manifest from an existing UI

## Role

You are documenting reusable design knowledge from a bounded existing UI. Produce an OKF-compatible UI Design Manifest bundle, not implementation code or a comprehensive design system.

## Inputs

- `source_ui`: accessible URL, build, screenshots, or recording.
- `declared_scope`: named screens, viewports, roles, states, and interactions to inspect.
- `evidence_capture`: permitted capture method and storage location.
- `product_requirements`: accessibility, security, business, and other applicable constraints.
- `profile`: the local UI Design Manifest profile.
- `output_directory`: empty or existing `design-manifest/` bundle.

If the declared scope or evidence permission is missing, stop and request it.

## Procedure

1. Read the profile and existing root index, if present. Do not preload unrelated concepts.
2. Restate the declared scope and exclusions. Do not follow links or flows outside it.
3. Capture representative evidence for each permitted viewport, role, state, and interaction. Include default plus relevant loading, empty, error, disabled, focus, expanded, or confirmation states only when observable.
4. Record each direct observation with its evidence location and context. Keep observations separate from interpretations.
5. Write inferences only when they help application; label them as inferred and explain the supporting observation.
6. Record unresolved gaps for unavailable viewports, states, roles, content conditions, conflicts, or ambiguous behavior. Never fill a gap with a starter assumption silently.
7. Group only reusable, task-relevant knowledge into foundations, components, policies, and screen patterns. Avoid an option catalog and framework-specific vocabulary.
8. Link related concepts with ordinary Markdown links and describe the relationship in prose.
9. Emit a navigable bundle. Every non-`index.md` concept must have valid YAML front matter with a non-empty `type`; use `title` and `description` for routing.
10. Review precedence: current implementation/code; nominated reference within scope; local manifest; starter defaults. Requirements constrain every layer.

Do not copy source code, class names, CSS declarations, proprietary text beyond what is necessary to identify evidence, or assets without permission. Describe user-visible intent and behavior.

## Output contract

Return:

1. The created or updated bundle tree.
2. The full text of each changed concept and index.
3. An evidence register mapping observations to viewport/state captures.
4. An inference register with rationale.
5. An unresolved-gap list.
6. A link and front-matter check result.
7. A concise scope statement confirming what was not inspected.

## Uncertainty handling

Use `source: observed`, `inferred`, or `mixed` accurately. In mixed files, separate `# Evidence`, `# Inferences`, and `# Unresolved`. Do not use numeric confidence. When sources conflict, record the conflict and applicable precedence rather than blending them.

## Stop conditions

Stop without inventing content if:

- the source or evidence capture is unavailable or unauthorized;
- the requested work exceeds the declared scope;
- a critical state cannot be observed and no owner can resolve it;
- accessibility, security, or business requirements conflict with the nominated reference;
- a valid bundle would require copying implementation code or restricted assets.

Report the smallest missing input or decision needed to continue.
