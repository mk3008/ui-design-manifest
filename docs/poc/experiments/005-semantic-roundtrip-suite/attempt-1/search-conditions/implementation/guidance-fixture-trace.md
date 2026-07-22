# Guidance and fixture trace

SC-01 requires one compact condition-entry group in this order: field, operator, value, selection, submit. The submit slot belongs to that group.

The rendered values come only from the declared neutral fixtures:

| Slot | Rendered fixture |
| --- | --- |
| field | `field-1` |
| operator | `operator-1` |
| value | `value-1` |
| selection | `false` (unchecked) |
| submit | `submit-1` |

No fixture is treated as product meaning, behavior, a predicate, an option set, or result context.
