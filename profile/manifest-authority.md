---
type: UI Design Manifest Principle
title: Manifest authority and source independence
description: Defines a UI Design Manifest as source-independent design guidance.
status: experimental
source: authored
---

# Canonical principle

A UI Design Manifest is an abstract intermediate representation of design intent, independent from the original UI.

An application user must not see or consult the original UI, its URL, screenshots, source-specific explanation, or extraction trace. If application requires original-UI information, the manifest was not abstracted sufficiently. Report the missing guidance; do not recover it by consulting the original.

# Knowledge lifecycle

A team may author a local Manifest directly. During repository calibration, a bounded source UI may instead act as a probe or test oracle: extraction tests whether the observation method asks the right questions, while source-blind reconstruction and semantic re-extraction test whether the resulting Markdown communicates the retained roles and relationships.

An extracted Manifest is a distilled, source-independent artifact and a candidate for reuse. It is not canonical merely because it was extracted or accepted for one experiment. Promote knowledge only with an explicit scope and provenance after appropriate calibration, a different-source holdout where transfer is claimed, independent review, and human judgment.

Keep these classes distinct:

- **Observed**: visibly established within a bounded source state or viewport. It is evidence, not a universal rule.
- **Inferred**: an interpretation supported by observations but still requiring confirmation.
- **Authored default**: a deliberate fallback that was not observed. It must be named as a default, used only at the precedence level of its owning guidance, and never override target-product inputs.
- **Context-dependent pattern**: reusable guidance whose applicability and counterconditions are stated; it is not a universal invariant.
- **Target-product decision**: product meaning, data, state, destination, responsive behavior, or other owner-supplied input governed by requirements, current implementation, or the Application Input Contract.

Cross-source convergence may justify a stable observation question or a bounded pattern. It does not erase differing contexts or turn source-specific presentation into a central principle. Historical calibration, holdout, review, and correction records remain test evidence rather than application inputs.

# Responsibility boundary

## Extraction

Extraction may inspect the original UI within a declared scope. It turns reusable intent, relationships, roles, behavior principles, and uncertainty into the manifest. Original names, URLs, copy, data, product terms, screen names, capture paths, and evidence links do not belong in the manifest. Evidence that cannot be abstracted stays separate as unresolved or extraction/evaluation-only material.

## Application

Application receives only the local manifest, target-product implementation and repository guidance, the implementation task, applicable product requirements, and verification conditions. It must not access original sites, captures, extraction traces, source-aware PoC material, or remembered original vocabulary. Missing information is a reported gap.

## Evaluation and PoC

Evaluation may compare the original UI, the manifest, and an application result. Its source-aware inputs, captures, observation notes, and historical acceptance records are test-only. They must not be linked from a manifest, included in an application packet, or treated as a required product artifact.

# Authority and precedence

Resolve application conflicts in this order:

1. Current target-product implementation and repository guidance.
2. Explicit product requirements, including accessibility, security, and business constraints.
3. Local UI Design Manifest guidance.
4. Explicit starter defaults, only when needed.

The manifest is directional knowledge, not an executable specification, conformance target, or replacement for target-product code. It does not authorize visible copy, product meaning, or state by itself when product requirements are needed.

# Information loss and uncertainty

Handle lost original-specific detail through relational design intent: hierarchy, density, grouping, reading order, responsibility boundaries, state principles, relative importance, avoidances, scope, and unresolved gaps. Do not solve loss by restoring a source URL, source name, screenshot, evidence link, or product vocabulary to the manifest.

# Relationships

The profile defines bundle fields and [precedence](ui-profile.md#precedence). The [application prompt](../prompts/apply-manifest.md) enforces the application boundary; the [extraction prompt](../prompts/extract-from-existing-ui.md) enforces the extraction boundary.
