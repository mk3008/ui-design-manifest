---
type: Implementer Apply Instruction
title: Header–Drawer static comparison instruction
description: Compact source-blind implementation instruction.
status: draft
source: authored
---

# Build

Using only this apply instruction, the Manifest, and the Application Input Contract, create one static comparison HTML plus captures for `A-open`, `A-hidden`, `B-open`, and `B-rail`. Keep the declared Header and navigation fixture identical; vary only control ownership and closed representation.

Pattern A retains the Header's leading named controller in the same slot after the left Drawer is fully hidden; keep the Header title anchor unchanged. Pattern B has no Header Drawer trigger. It has one Drawer control near the trailing/top edge: use a left-pointing inline `currentColor` SVG chevron in the expanded state to compact the left Drawer, and a right-pointing one in the rail state to expand it. Its icon rail retains that named Drawer controller and declared SVG shortcuts. An X-shaped icon is only for an explicitly contracted full dismissal with no retained rail; do not use it for compact/expand. Make sole-controller ownership obvious. Expanded navigation rows omit leading icons because no leading semantic icon slots are supplied. The expanded parent visibly exposes its child relationship through a trailing expanded disclosure affordance: use the permitted neutral simple downward inline `currentColor` SVG chevron. Use square navigation rows with no corner rounding, a visible current-item accent, and no caption.

Use meaningful inline `currentColor` SVG icons. Never use bracket glyphs, text-character icon substitutes, generic leading markers, square or checkbox-like icons, plus-sign substitutes, empty boxes, placeholder marks, or rounded navigation rows. Do not add behavior, breakpoints, animation, focus, keyboard handling, persistence, or any input not declared by the Contract.
