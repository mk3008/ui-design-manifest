---
type: PoC evaluation record
title: Clean-room customer-search creation repeat
status: human-review-required
source: authored
---

# Input identity

| Input | Identity |
| --- | --- |
| Consumer manifest | `consumer-input/design-manifest/`, 43 files, one shared snapshot for all runs |
| Fixed user prompt | `consumer-input/user-prompt-ja.md` SHA-256 `CBC7DE854E974CA96B3498305D5A54AFC8A29421AE6EAF3B589BB8DB12757941` |
| Model | `gpt-5.6-terra`, `medium` |
| Prior artifacts, tests, skills | Excluded by the implementation instruction |

The isolation is procedural: all workers were instructed to read only the two
consumer-visible inputs. It is not a filesystem sandbox guarantee.

# Capture identity

Chrome `150.0.7871.187` captured each initial view with the normal
`--headless=new --disable-gpu` path at `1440×1200`; no SwiftShader retry was
used.

| Run | PNG raw-byte SHA-256 | Bytes |
| --- | --- | ---: |
| 1 | `BEFE10F6B64AAA2BBB318E7453B0625EA4C0C7C6ABE00847AB01700F9D9545C9` | 97,331 |
| 2 | `6276F10D54C0C18C3C253F53FFFD41BC48B9E10EC10989A0DC017E57ADF625B9` | 88,122 |
| 3 | `766BCFB2FC1576BE7ACDFB05DAF8DF3FF1CADA8B8CDED0184E09F73B23118A9E` | 94,803 |

# Observed convergence

All three outputs provide a Japanese customer-search task, the four requested
conditions, Search/Clear actions, a grid containing the requested management
fields, and a non-editable visible Customer ID. They use a page title followed
by a description, and use vertical heading groups for the search and result
regions. Search actions appear at the logical end of the conditions region.
Runs 2 and 3 place record opening in the leading name cell; Run 1 supplies no
visible record-opening action.

# Remaining variance

| Area | Observation | Assessment |
| --- | --- | --- |
| Theme | Run 1 renders dark from the browser preference. Runs 2 and 3 render light but add a user-visible theme control. | The prompt does not supply a theme preference or selection capability; this is an invented product behavior. |
| Header | Runs 2 and 3 add a global Header; Run 1 does not. | The prompt does not declare global navigation or product identity. This variation is expected until a product shell is supplied. |
| Data capabilities | Run 3 adds sort and pagination; Runs 2/3 add detail dialogs. | The prompt does not declare these capabilities. They are product-binding concerns, not layout choices. |
| Fixture | Result counts and illustrative customer values differ. | The prompt supplies field schema, not data. A repeatable visual benchmark would need a separate fixture input; ordinary consumer creation should not infer production data. |
| Detail link | Run 1 does not expose the leading identity as a record-opening link. | The manifest preference is conditional on an available open-record capability, which the prompt does not supply. |

# Conclusion

The revised manifest now produces meaningful convergence in the requested
search-screen structure, especially title/description hierarchy, vertical
section heading groups, and search action alignment. It does not yet make
product-owned capabilities converge when the user requirement does not state
them. That is partly intentional: the manifest must not invent bindings.

Human review should decide whether the fixed user prompt is intentionally
minimal, or whether a reusable consumer prompt template should explicitly ask
for a declared capability/binding block. Adding that block would test a richer
input contract, not the current “manifest plus minimal screen request” case.
