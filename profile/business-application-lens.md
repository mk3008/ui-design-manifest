---
type: UI Design Evaluation Lens
title: Business application lens
description: A fixed qualitative lens for readable density, restrained hierarchy contrast, and purposeful spacing.
status: experimental
source: authored
requires:
  - profile/manifest-authority
---

# Purpose

Use this lens when distilling or applying design knowledge for operational, administrative, productivity, or other information-rich applications. It is an authored perspective informed by business-application needs; it is not an observation about a source UI and must not be presented as source evidence.

The lens helps reviewers ask consistent questions without prescribing a spacing scale, typography scale, component library, or CSS values. It describes a likely golden path, not a universal rule.

# Information density

Business applications commonly need to keep substantial information and frequent actions available for scanning and repeated work. Prefer a compact but readable work surface over promotional spaciousness. Keep primary identifiers, status, context, and the next likely action discoverable without forcing excessive navigation or scrolling.

Density does not mean indiscriminate compression. Preserve legibility, target clarity, and task grouping. Reduce decorative containers and empty space before reducing the clarity of labels, values, states, or controls.

# Hierarchy contrast

Use enough visual contrast to establish orientation and reading order, but avoid making headings dominate the information and actions they introduce. Prefer restrained differences between titles, section headings, labels, values, and supporting text over editorial or marketing-style jumps in scale and weight.

The intended result is clear hierarchy with attention remaining on the work. A heading should organize the task, not become the primary visual event unless the product context explicitly requires it.

# Spacing and rhythm

Use spacing as a relationship:

- elements within one functional group are closer;
- separate groups have a noticeable but economical gap;
- major regions receive the strongest separation;
- repeated rows or controls keep a stable rhythm;
- whitespace, dividers, surfaces, and headings are not all used redundantly for the same boundary.

Avoid both extremes: undifferentiated compression that hides grouping, and generous empty space that lowers useful density without improving comprehension.

# Applying the lens by region

- **Global Header:** keep product orientation and global actions compact; prevent identity or title treatment from overwhelming routine work.
- **Drawer:** preserve scan rhythm, current destination, group boundaries, and parent/child hierarchy without unnecessary vertical expansion.
- **Main content:** balance information volume, heading prominence, section grouping, and action placement. This is where density and hierarchy contrast usually need the most explicit review.
- **Forms and data views:** keep labels, values, validation, actions, and record boundaries understandable while avoiding marketing-page spacing.

# Distillation boundary

First record what the source actually shows, with observed, inferred, and unknown knowledge separated. Then, if useful, assess the result through this lens in a distinct authored or review section. Do not rewrite a source observation to make it conform.

Use qualitative findings such as aligned, contextual deviation, or unresolved. These are decision aids, not pass/fail conformance results. Under [Manifest authority and use](manifest-authority.md), current implementation and human judgment remain higher-authority inputs.

# Numeric boundary

Do not distill exact spacing, type sizes, dimensions, or breakpoints merely to satisfy this lens. Express density, hierarchy contrast, and spacing through relationships and intent. Concrete implementation values belong in code.
