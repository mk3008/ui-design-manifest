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

# Provenance and uncertainty

Never present inference as observation. For mixed concepts, label individual statements under `Evidence`, `Inferences`, and `Unresolved`. Record the viewport, state, role, data condition, or interaction that bounded an observation. If evidence does not support a decision, leave a gap rather than filling it with a starter default.

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
