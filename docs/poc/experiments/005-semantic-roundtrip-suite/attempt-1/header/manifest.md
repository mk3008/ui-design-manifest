---
type: UI Design Manifest Concept
title: Global Header
description: Source-independent guidance for a bounded global header region.
status: draft
source: mixed
scope: Static global Header only; excludes page content, local navigation, controlled regions, and behavior not established in scope.
---

# Guidance

A Global Header gathers an identity context, a global query role, and a utility-action group into one high-level region. Its coarse reading order is identity context, then global query, then utility actions.

The global query is a distinct global role, rather than page-local content. The utility-action group remains distinguishable from the query role so that a reader can recognize the Header's global responsibilities without relying on page content.

# Boundaries

This guidance does not supply identity values, display copy, destinations, action meanings, authentication state, controlled-region state, navigation behavior, focus behavior, or responsive behavior. A Header does not own the state or contents of another region merely because its controls are placed in the Header.

# Unresolved

The available scope does not establish the update trigger or submitted behavior for the global query, the destinations or effects of utility actions, or any state transition. Application must omit dependent UI or obtain an allowed product decision.
