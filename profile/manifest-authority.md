---
type: UI Design Manifest Principle
title: Manifest authority and use
description: Defines the manifest as directional knowledge while current implementation remains operational truth.
status: experimental
source: authored
---

# Guidance

A UI Design Manifest communicates durable visual and interaction direction. It helps a person or agent understand what to preserve, emphasize, group, or avoid without turning that direction into framework-specific implementation instructions.

The manifest is not an executable specification or an absolute rule set. Use it with the current product implementation, repository guidance, task requirements, and any explicitly nominated reference. Implement the requested screen in the product's existing architecture, then make context-sensitive adjustments. A final implementation may intentionally differ from manifest guidance when the screen, content, workflow, or existing system warrants it.

# Operational source of truth

Current implementation and code are the operational source of truth. Concrete CSS values, component properties, layout calculations, breakpoints, and runtime behavior define what the product actually does. When code and manifest guidance disagree, code wins unless the task explicitly authorizes changing the implementation.

This precedence is not dual ownership. The manifest does not need to repeat every concrete value, and implementation correctness does not depend on updating the manifest after every local change. Teams may revise manifest guidance when a durable product direction has changed or when a correction would help future work.

# Visible-output provenance and state binding

The library's critical responsibility is narrow: it must not invent unnecessary user-visible product information, meaning, or state. Each such addition should trace to an allowed provenance: a requirement, current implementation, nominated reference within scope, manifest guidance, or an explicitly named fallback. If asked why it was added, an implementer must be able to cite that provenance. When no basis exists, omit it from the start.

An explicitly named fallback must pre-exist application in a requirement, current implementation, nominated reference within scope, local manifest, or task packet. An implementer may not invent, name, or promote a fallback during application to justify a chosen string, product meaning, control, or hierarchy slot.

Design intent, scope prose, relationship descriptions, and explanatory manifest prose describe guidance only; they do not authorize literal or paraphrased authored UI copy. Each authored string exposed visually or through accessibility semantics, including document titles, accessible names, and alternative text, requires explicit display intent from a requirement, current implementation, nominated reference within scope, or a pre-existing explicitly named display-copy fallback, recorded with its exposure surface and string-level provenance. Any implementer-selected string not supplied verbatim by an authoritative input is a fixture or unsupported copy, even if generic or plausible. Fixture status and fixture provenance belong in out-of-band evidence, not in new visible fixture-explanation copy. A static review may use neutral fixture content only in an already instructed semantic slot that cannot be meaningfully rendered empty; derive its minimum cardinality from the smallest literal lower bound in authoritative input and record each string out of band. A fixture may not create an uninstructed heading, caption, grouping label, helper, legend, or other hierarchy slot; structural grouping alone does not authorize such a visible slot. A neutral fixture label may not introduce product-domain meaning beyond its instructed slot; when a non-empty label is required, use only minimum generic or ordinal identification. Minimum accessibility naming, when required but not supplied verbatim, is also an out-of-band-declared fixture. Do not add badges, eyebrow text, helper text, scope notes, captions, hidden values, or extra options solely to explain or make a fixture appear realistic.

State-bearing product UI needs a binding model in addition to visual guidance. An authoritative input must establish the data or source of truth, possible state meaning, display condition, and update trigger. When that model is unavailable, omit the state-bearing element and preserve the gap for the product owner or implementer. Local visual mechanics—layout composition, spacing, borders, backgrounds, and visual treatment—remain available to implementation judgment unless they themselves communicate new product meaning or state.

This boundary does not claim that the library produces a finished UI in one pass. Visual mismatch and later local tuning are expected, and missing product requirements may also cause mismatch; discovering or supplying those requirements is outside this library's responsibility. Current implementation and CSS become more precise over time and remain authoritative. Do not frame post-generation artifact correction as a library feature or success path.

The boundary is not a completeness check, exact-reproduction promise, manifest-conformance test, or validation of omitted requirements. A clean-room review may evaluate unsupported additions, but it must not fail solely because an output is incomplete, visually approximate, or lacks an unstated requirement.

# Numeric boundary

Prefer relative, design-language descriptions over numeric implementation values. Describe relationships such as compact but readable, restrained hierarchy, tighter within a group, stronger separation between regions, or a clearly visible current state. Leave exact type sizes, spacing, dimensions, and breakpoints to product code.

A small set of exact key color values may be recorded when the product intentionally treats them as stable reference roles. They remain guidance and provenance; current implemented color values still take precedence.

# Review and deviation

Reasoned comparison against manifest guidance is allowed. It can help explain why a result feels aligned, where interpretation was required, or where the local screen made a different choice. Do not classify a deviation as an anomaly, defect, or mandatory correction solely because it differs from the manifest.

Functional, accessibility, security, and task-specific verification still apply to the implementation. They are not manifest-conformance tests.

# Explicit non-goals

This profile does not define or require:

- a static manifest-conformance analyzer;
- a validator that rejects implementation differences;
- a contradiction or drift detector between code and prose;
- automatic synchronization from code to manifest or manifest to code;
- numeric fidelity scoring;
- a requirement that local visual tuning be written back to the manifest.

# Relationships

The precedence order is defined in the [UI Design Manifest profile](ui-profile.md). The [Business application lens](business-application-lens.md) supplies an authored perspective for density, hierarchy, and spacing without changing this authority model.
