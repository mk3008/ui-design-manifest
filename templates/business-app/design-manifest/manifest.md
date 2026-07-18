---
type: UI Design Manifest
title: Example operations workspace
description: A restrained example for a list-based business workflow.
status: experimental
source: authored
scope: Illustrative desktop record-list view and its local actions.
requires:
  - policies/confirm-destructive-action
---

# Product and scope

This fictional workspace helps an operations user scan records, identify status, and act on one record. The bundle covers one desktop list pattern and does not define navigation, authentication, mobile behavior, or a full component library.

# Evidence boundary

All content is authored to demonstrate structure. It is not extracted evidence and should be replaced by product-local observation.

# Precedence

Current implementation comes first; a nominated reference applies only within its declared scope; this local manifest follows; starter guidance is last. Accessibility, security, and business requirements continue to constrain every source.

# Relationships

Use the [compact work surface](foundations/compact-work-surface.md), [status badge](components/status-badge.md), [destructive-action policy](policies/confirm-destructive-action.md), and [record list](screen-patterns/record-list.md) together only when the task needs them.

# Unresolved

Keyboard behavior, narrow viewports, loading, empty, error, and permission-limited states are intentionally unspecified.
