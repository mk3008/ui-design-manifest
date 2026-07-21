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
