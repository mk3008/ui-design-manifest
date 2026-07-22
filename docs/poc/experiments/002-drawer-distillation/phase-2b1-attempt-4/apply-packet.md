---
type: application-packet
title: Phase 2B1 corrective source-blind application packet
description: Test-only application inputs for the caption and leading-icon correction.
status: draft
source: authored
---

# Phase 2B1 corrective source-blind application packet

## Purpose

Supply one non-production static application input bundle that exercises the bounded visible-open Drawer guidance. This packet supplies test-only values only; it does not itself create or prescribe an implementation. An explicitly authorized separate implementation task may use these supplied inputs to create a neutral static reconstruction.

## Required inputs

- [UI Design Manifest profile](../../../../../profile/ui-profile.md)
- [Corrective source-blind Drawer manifest](design-manifest/index.md)
- [Application Input Contract](design-manifest/policies/application-input-contract.md)
- [Fixture policy](design-manifest/policies/fixture-policy.md)

## Fixed application inputs

| Contract slot | Supplied value | Handling |
| --- | --- | --- |
| Drawer presentation | A visible left-side navigation region beside an independently readable content region in the declared wide state. | Exercise only this state. |
| Current state | One parent is expanded and one nested child is current. | Test-only state shape. |
| Navigation structure | One direct item and one expanded parent containing one child, followed by one further direct item. | Test-only fixture shape; primary and secondary collection roles are not supplied. |
| Item labels | `Item 1`, `Parent 1`, `Child 1`, `Item 2`. | Neutral test-only fixture values. |
| Current location | `Child 1`. | Test-only fixture value. |
| Destinations | Not supplied. | Render non-link navigation rows. |
| Semantic icon slots | Not supplied. | Omit all leading icons and markers. |
| Search/filtering behavior | Not supplied. | Do not create an affordance or behavior. |

## Correction requirements

- Do not render a navigation caption. Primary and secondary collection roles are not supplied by this fixture.
- Keep the optional-caption rule unexercised until a real application owner supplies secondary-collection metadata and its caption.
- Do not render a leading icon, decorative marker, square, checkbox-like control, or fallback glyph when semantic icon inputs are absent.
- Do not add an icon library, package dependency, external asset, runtime code, or original-specific icon set.
- This corrective attempt does not itself create or prescribe an implementation. An explicitly authorized separate implementation task may create a neutral static reconstruction from the supplied inputs.

## Prohibited inputs

Do not access source-identifying material, historical artifacts outside the declared inputs, external search, or unprovided product data.
