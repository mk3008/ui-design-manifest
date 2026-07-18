---
type: Interaction policy
title: Sidebar visibility transition
description: An explicit header control hides or restores navigation while retaining the current workspace context.
status: draft
source: observed
scope: The single sidebar close/reopen interaction at 1280x720.
requires:
  - components/sidebar-navigation
  - components/workspace-header
---

# Guidance

Make sidebar visibility an explicit, reversible workspace action. On hide, remove the navigation rail and let the main reading area use the released width; retain the header, current content, and language selection. Expose the reverse action from the same header area.

# Evidence

The close control changed from `サイドバーを閉じる` with expanded state to `サイドバーを開く` after activation. The complementary navigation landmark disappeared and the main area widened. Reopening restored the control named `サイドバーを閉じる` with expanded state.

# Unresolved

Animation, focus placement, persistence, escape behavior, and accessibility announcements were not inspected.

# Relationships

This policy changes [sidebar navigation](../components/sidebar-navigation.md) inside [the Overview workspace](../screen-patterns/overview-workspace.md).
