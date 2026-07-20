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
