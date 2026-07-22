---
type: fixture-policy
title: Drawer fixture policy
description: Constraints for non-production fixtures used to exercise an already-defined drawer contract.
status: draft
source: authored
scope: Tests, examples, and prototypes applying this bundle.
---

# Guidance

Use fixtures only for semantic slots already established in the [application input contract](application-input-contract.md), including owner-supplied navigation information. Fixtures must be neutral, explicitly marked as test-only, and unable to introduce a product identity, status, destination, aggregate, hierarchy label, display copy, or navigation structure beyond those supplied slots.

Fixture data may demonstrate an existing state shape such as one selected path and one expanded parent, but it must not define why that state exists or how it changes. A fixture may populate only the owner-supplied navigation structure, relations, group membership, order, and labels. Omit dependent UI when the contract does not supply the required semantic slot.

# Unresolved

There is no approved display-copy fallback in this bundle.
