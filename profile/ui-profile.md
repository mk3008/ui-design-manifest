---
type: UI Design Manifest Profile
title: UI Design Manifest profile
description: A small OKF-compatible profile for locally owned UI design knowledge.
status: experimental
source: authored
---

# Purpose

This profile specializes Open Knowledge Format (OKF) v0.1 for UI design knowledge while retaining its permissive model. A bundle is a directory of linked Markdown concepts that a person or agent can discover progressively without a dedicated runtime.

Read [Manifest authority and use](manifest-authority.md) before applying a bundle. Manifest concepts describe direction and rationale; current implementation and code remain the operational source of truth. For business-product work, use the separate [Business application lens](business-application-lens.md) as an authored evaluation perspective, never as fabricated source evidence.

# Compatibility subset

The profile adopts these OKF rules:

- A concept is a UTF-8 Markdown file whose identity is its bundle-relative path without `.md`.
- Every concept file starts with parseable YAML front matter delimited by `---` and has a non-empty `type`.
- `index.md` is reserved for progressive directory discovery and normally has no front matter.
- Relationships use ordinary Markdown links. Link meaning is explained by surrounding prose.
- Unknown types and extension fields must be preserved or tolerated rather than rejected.

The starter bundles do not use `log.md`. If a team adds it, it remains an OKF reserved update-history file and must follow the OKF structure.

# Discovery and layout

The bundle root is `design-manifest/` and contains `index.md`, a central `manifest.md` concept, and four optional category directories:

```text
design-manifest/
├── index.md
├── manifest.md
├── foundations/
│   └── index.md
├── components/
│   └── index.md
├── policies/
│   └── index.md
└── screen-patterns/
    └── index.md
```

Directory names are routing conventions, not closed taxonomy. Start at the root index, read `manifest.md` for scope and precedence, then open only categories and concepts relevant to the task. Every index entry should include a short description suitable for deciding whether to read the target.

# Front matter fields

## Required by OKF

- `type`: a non-empty, descriptive concept kind. Consumers must tolerate unfamiliar values.

## Recommended for this UI profile

- `title`: human-readable routing name.
- `description`: one-sentence routing summary.
- `status`: restrained lifecycle note such as `draft`, `active`, or `retired`. Omit when it adds no value.
- `source`: provenance class, preferably `observed`, `inferred`, `authored`, or `mixed`.
- `requires`: a YAML list of concept IDs or requirement references that must be considered with this concept.
- `scope`: a short statement of the screens, states, or interactions to which the guidance applies.

These are profile recommendations, not additional OKF conformance requirements. Do not repeat a per-file priority: precedence is bundle-level policy. Do not add numerical confidence scores.

# Markdown body guidance

Use only sections that improve application. Useful headings include:

- `# Guidance` for the decision or invariant.
- `# Evidence` for what was directly observed.
- `# Inferences` for interpretations that need confirmation.
- `# Unresolved` for gaps, conflicts, or unavailable states.
- `# Relationships` for prose links to related concepts.

Keep statements reviewable and scoped. Describe user-visible intent and behavior rather than framework or CSS mechanics. Prefer relational language over measurements for typography, spacing, layout, and density. Use screenshots or source links as evidence references when permitted, not as substitutes for written guidance.

For added user-visible product information, meaning, or state, preserve a reviewable allowed-provenance trace to a requirement, current implementation, nominated reference within scope, manifest guidance, or an explicitly named fallback. This covers authored copy, controls with product meaning, indicators, statuses, counts, alerts, progress, and comparable semantic additions. A state-bearing element also needs a binding model: data or source of truth, possible state meaning, display condition, and update trigger. If evidence does not establish the model, record it as unresolved rather than silently authoring a status, count, alert, progress signal, control, or copy. Layout composition, spacing, borders, backgrounds, and visual treatment remain local implementation judgment unless they themselves communicate new product meaning or state.

An explicitly named fallback must pre-exist application in a requirement, current implementation, nominated reference within scope, local manifest, or task packet. An implementer may not invent, name, or promote a fallback during application to justify a chosen string, product meaning, control, or hierarchy slot.

Manifest design intent, scope prose, relationship descriptions, and explanatory prose do not authorize literal or paraphrased display copy. Preserve observed copy as evidence, but require explicit display intent from a requirement, current implementation, nominated reference within scope, or a pre-existing explicitly named display-copy fallback before showing each authored string. This applies to strings exposed visually or through accessibility semantics, including document titles, accessible names, and alternative text. An implementer-selected string not supplied verbatim by an authoritative input is a fixture or unsupported copy, even if generic or plausible. Application reporting must retain the exact string, exposure surface, and individual provenance; a broad concept trace is not enough. Fixture status and provenance are out-of-band evidence, not visible fixture-explanation copy. Neutral fixture content may fill only an already instructed semantic slot that cannot be meaningfully rendered empty; derive minimum cardinality from the smallest literal lower bound in authoritative input and report each string individually. A fixture may not create an uninstructed heading, caption, grouping label, helper, legend, or other hierarchy slot; structural grouping alone does not authorize such a visible slot. A neutral fixture label may not introduce product-domain meaning beyond its instructed slot; when a non-empty label is required, use only minimum generic or ordinal identification. Minimum accessibility naming, when required but not supplied verbatim, is an out-of-band-declared fixture. Do not add badges, eyebrow text, helper text, scope notes, captions, hidden values, or extra options solely to explain or make the fixture appear realistic.

# Provenance and uncertainty

Never present inference as observation. For mixed concepts, label individual statements under `Evidence`, `Inferences`, and `Unresolved`. Record the viewport, state, role, data condition, or interaction that bounded an observation. If evidence does not support a decision, leave a gap rather than filling it with a starter default.

Small local decisions may select implementation mechanics, but they do not authorize new user-visible meaning. The profile does not judge completeness, exact reproduction, or missing requirements; current implementation and applicable requirements remain authoritative under the precedence policy below.

# Precedence

Resolve conflicts in this order:

1. Current implementation and code.
2. An explicitly nominated reference UI within its declared visual and interaction scope.
3. Local manifest guidance.
4. Starter defaults.

Accessibility, security, business, and other applicable requirements remain constraints at every level. A reference UI does not override them outside its nominated scope. Surface unresolved conflicts to the implementer or owner.

Manifest guidance is not a conformance target. A reviewer may reason about alignment or deviation, but a difference is not automatically an error or a mandatory correction. The profile defines no validator, drift detector, contradiction checker, or synchronization obligation. See [Manifest authority and use](manifest-authority.md).

# Extensions

Teams may add directories, concept types, front matter keys, or body sections. Extensions should:

- remain valid YAML and Markdown;
- use descriptive names rather than closed choice catalogs;
- preserve unknown fields during round trips;
- state semantics and ownership in a linked profile concept;
- avoid converting recommendations into universal OKF requirements.

# Citations

[1] [Open Knowledge Format v0.1 specification](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md)
