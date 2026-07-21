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

# Source-independence boundary

All content is authored to demonstrate structure. It contains no original-UI evidence and must be applicable without an original UI, URL, screenshot, or extraction trace.

# Precedence

Target-product implementation and repository guidance come first; explicit accessibility, security, and business requirements follow; this local manifest is next; explicit starter guidance is last. Original or reference UI is not an application authority.

# Relationships

Use the [compact work surface](foundations/compact-work-surface.md), [status badge](components/status-badge.md), [destructive-action policy](policies/confirm-destructive-action.md), and [record list](screen-patterns/record-list.md) together only when the task needs them.

# Unresolved

Keyboard behavior, narrow viewports, loading, empty, error, and permission-limited states are intentionally unspecified.
