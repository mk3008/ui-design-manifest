# UI Design Manifest

UI Design Manifest is a docs-first starter for product teams that want reusable design knowledge to survive beyond screenshots, source code, and individual memory. It records design intent, relationships, and decisions as source-independent Markdown that a fresh implementer can apply without consulting an original UI.

## Problem and value

Visual and interaction decisions are often scattered across running code, tickets, and tacit team knowledge. This project explores whether a small, linked Markdown bundle can make the relevant decisions easier to discover, inspect, refine, and apply.

The repository provides an OKF-compatible UI profile, two small starter bundles, reusable prompts, and an experiment ladder. These are a useful starting point, not evidence that a manifest improves fidelity. Product teams own the content and should revise it against observed implementation and human judgment.

A manifest records durable direction, not executable truth. It is an abstract intermediate representation of design intent, independent from the original UI. An application must not receive or consult the original UI, its URL, screenshots, source-specific explanation, or extraction trace. If an implementer needs any of those to apply a concept, that concept has not been abstracted sufficiently; record the gap instead. Concrete implementation values in the target product—such as CSS, component code, and runtime behavior—remain operational truth. A deliberate local deviation from manifest guidance is allowed and is not, by itself, a defect.

## Operating model

Normal product use begins with a local Manifest, target-product requirements, and an Application Input Contract. It does not require a source UI. Teams may author that Manifest directly or refine it from prior source-independent knowledge.

Repository calibration uses bounded, good-quality source UIs as probes and test oracles. Extraction dogfoods the observation method: failures reveal missing or misleading questions about roles, ownership, hierarchy, grouping, reading order, repetition, density, state, action priority, and region boundaries. Source-blind reconstruction and semantic re-extraction dogfood whether the Markdown preserves those relationships well enough to communicate them. Neither activity is a cloning or fidelity target.

An extracted Manifest is a useful distilled artifact and may become a candidate for shared knowledge. One source does not make a rule canonical. Promotion to a reusable observation question, authored principle, or context-dependent pattern requires its provenance and scope to remain explicit and needs corroboration through calibration, holdout evidence, independent review, and human judgment. See [Manifest authority and source independence](profile/manifest-authority.md#knowledge-lifecycle).

## Precedence

When sources disagree, apply this order:

1. Current target-product implementation and repository guidance.
2. Explicit product requirements, including accessibility, security, and business constraints.
3. Local design-manifest guidance.
4. Explicit starter defaults, only when needed.

The original UI is not an application input or authority. Record unresolved conflicts or missing guidance instead of consulting it.

## Evaluation and application conditions

Use the profile's [evaluation vocabulary](profile/ui-profile.md#evaluation-vocabulary) to distinguish a claim that is preserved, partial, failed, or not exercised. `Not exercised` records a gap and its next condition; it is never evidence of preservation or failure. Before application, the application owner supplies the [application input contract](profile/ui-profile.md#application-input-contract) for state, primary-record value, identity context, aggregates, optional destinations, and unresolved behavior. A source-blind fixture may demonstrate only an already instructed semantic slot with declared provenance; it cannot invent product meaning, hierarchy, or source-derived copy.

This precedence avoids dual ownership. The project does not require code and manifest text to remain mechanically synchronized. Teams may update a manifest when that improves future guidance, but implementation correctness does not depend on doing so.

## Calibration and validation path

1. Read the [UI profile](profile/index.md).
2. Start with the [blank bundle](templates/blank/design-manifest/index.md) or inspect the restrained [business-app example](templates/business-app/design-manifest/index.md).
3. When calibrating from a bounded source UI, use the [extraction prompt](prompts/extract-from-existing-ui.md) and keep capture or evaluation evidence outside the Manifest.
4. Give only the relevant Manifest files, target-product inputs, and the [application prompt](prompts/apply-manifest.md) to a fresh implementer.
5. Use the [experiment ladder](docs/poc/experiment-ladder.md) to evaluate the observation method, source-independent handoff, and human usefulness before promoting any shared knowledge.

## Explicit non-goals

- A web editor, CLI, validator, schema registry, or runtime.
- A static conformance checker, drift detector, contradiction checker, or code-to-manifest synchronization system.
- A comprehensive design-system or option catalog.
- A replacement for code, accessibility rules, security controls, or business requirements.
- Guaranteed or numerically certified reproduction fidelity.
- Framework-specific implementation instructions.

## Repository map

- `profile/` — bundle structure, fields, provenance, precedence, and the source-independence boundary.
- `templates/blank/` — a minimal fill-in starting point.
- `templates/business-app/` — one small example across four concept categories.
- `prompts/` — model-agnostic extraction and application procedures.
- `docs/poc/` — observable experiment stages and stop conditions.
