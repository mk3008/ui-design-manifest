---
type: fixture-policy
title: Drawer fixture policy
description: Constraints for non-production fixtures used to exercise an already-defined drawer contract.
status: draft
source: authored
scope: Tests, examples, and prototypes applying this bundle.
---

# Guidance

Use fixtures only for semantic slots established in the [application input contract](application-input-contract.md). Fixtures must be neutral, explicitly marked test-only, and unable to introduce product identity, status, destination, aggregate, caption, icon semantics, asset, or navigation structure beyond supplied slots.

A fixture may show uncaptained navigation. It must not invent primary or secondary collection roles, a secondary caption, or any metadata needed to exercise the optional-caption rule. Only a real application owner may supply that metadata. A fixture may show a leading icon only when it supplies the complete optional semantic icon slot; otherwise it must show no leading marker.

# Unresolved

There is no approved display-copy or icon fallback in this bundle.
