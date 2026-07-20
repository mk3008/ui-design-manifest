# UI Design Manifest

UI Design Manifest is a docs-first starter for product teams that want reusable design knowledge to survive beyond screenshots, source code, and individual memory. The customer is a team maintaining an existing product UI and asking a fresh implementer or AI agent to reproduce a bounded slice without loading an entire design system into context.

## Problem and value

Visual and interaction decisions are often scattered across running code, reference screens, tickets, and tacit team knowledge. This project explores whether a small, linked Markdown bundle can make the relevant decisions easier to discover, inspect, refine, and apply.

The repository provides an OKF-compatible UI profile, two small starter bundles, reusable prompts, and an experiment ladder. These are a useful starting point, not evidence that a manifest improves fidelity. Product teams own the content and should revise it against observed implementation and human judgment.

A manifest records durable direction, not executable truth. Concrete implementation values in the current product—such as CSS, component code, and runtime behavior—are the operational source of truth. Teams use the manifest alongside that code and any nominated reference, then tune the result for the actual screen. A deliberate local deviation from manifest guidance is allowed and is not, by itself, a defect.

## Precedence

When sources disagree, apply this order:

1. Current implementation and code.
2. An explicitly nominated reference UI, only within its declared visual and interaction scope.
3. Local design-manifest guidance.
4. Starter defaults.

A nominated reference never overrides accessibility, security, business, or other requirements outside its declared scope. Record unresolved conflicts instead of silently choosing.

This precedence avoids dual ownership. The project does not require code and manifest text to remain mechanically synchronized. Teams may update a manifest when that improves future guidance, but implementation correctness does not depend on doing so.

## PoC path

1. Read the [UI profile](profile/index.md).
2. Start with the [blank bundle](templates/blank/design-manifest/index.md) or inspect the restrained [business-app example](templates/business-app/design-manifest/index.md).
3. Use the [extraction prompt](prompts/extract-from-existing-ui.md) for a bounded source UI.
4. Give only the relevant manifest files and the [application prompt](prompts/apply-manifest.md) to a fresh implementer.
5. Evaluate each gate in the [experiment ladder](docs/poc/experiment-ladder.md).

## Explicit non-goals

- A web editor, CLI, validator, schema registry, or runtime.
- A static conformance checker, drift detector, contradiction checker, or code-to-manifest synchronization system.
- A comprehensive design-system or option catalog.
- A replacement for code, accessibility rules, security controls, or business requirements.
- Guaranteed or numerically certified reproduction fidelity.
- Framework-specific implementation instructions.

## Repository map

- `profile/` — bundle structure, fields, provenance, precedence, and extension guidance.
- `templates/blank/` — a minimal fill-in starting point.
- `templates/business-app/` — one small example across four concept categories.
- `prompts/` — model-agnostic extraction and application procedures.
- `docs/poc/` — observable experiment stages and stop conditions.
