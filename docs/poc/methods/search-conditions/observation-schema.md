---
type: Observation Schema
title: Condition-entry observation schema
description: Required static-evidence axes and classifications for a bounded condition-entry region.
status: draft
source: authored
scope: Reusable method.
---

# Required axes

Complete each row before handoff. `Observed` means visibly established; `not observed` means the evidence does not show it; `unresolved` needs an owner decision or more bounded evidence; `not applicable` is outside the declared region.

| Axis | Record | Typical static limit |
| --- | --- | --- |
| Region responsibility | Local task and boundary | No surrounding-screen responsibility |
| Field inventory | Role, label, control, state, group | No product semantics unless supplied |
| Labels and association | Existence, position, and control association | Do not infer programmatic binding |
| Required indication | Visible required/optional cue | No validation rule |
| Grouping and boundaries | Section and control membership | No conditional relationship unless visible |
| Reading and tab order | Visible reading sequence; tab order classification | Tab sequence is not visible in a static image |
| Density and rhythm | Qualitative repetition and separation | No measurements |
| Action responsibility | Visible action ownership and role | No action outcome |
| Action-group alignment | Visible horizontal or regional alignment of the action set | No action behavior |
| Action order | Visible order within the action set | When Clear or order is absent, use the authored default Search then Clear without claiming observation |
| State visibility | Visible defaults, selections, or empty state | No state model or update trigger |
| Help and validation | Visible inline help or error responsibility | Absence does not prove none exists |
| Advanced or saved conditions | Visible collapse, expansion, or saving responsibility | Do not invent controls |
| Results relationship | Visible declared connection to a result region | Excluded regions remain unclaimed |
| Narrow policy | Visible narrow transformation | One viewport cannot establish it |
| Focus, keyboard, motion | Visible evidence only | Static evidence normally leaves these unresolved |
| Application Input Contract needs | Product-owned slots and safe omission | Never fill missing meaning from the source |
