---
type: Apply Instruction
title: Apply bounded result cards
description: Implementation-facing instruction for a neutral, source-blind card reconstruction.
status: draft
source: authored
scope: One compact result-card collection.
---

# Apply

Apply [manifest guidance](manifest.md) only after the [Application Input Contract](application-input-contract.md) supplies product inputs. Build a wrapping gallery of compact equal-width cards in stable row-major Z DOM order. Use a title, a vertical I-shaped body, and captioned metadata where a value alone is unclear. Keep the incomplete final row left aligned.

For the neutral fixture, render six or more cards with placeholder-only labels, selected and unselected states, no decorative image, and no domain meaning. Put selection in the upper-right checkbox. Keep title navigation separate and omit it when no destination is supplied. Omit inline actions, global actions, badges, statuses, counts, media, and pagination unless supplied.

Do not convert this guidance into fixed tokens, broad responsive claims, or a table/grid implementation. Preserve DOM/visual order. Treat all unresolved behavior as Contract-owned.
