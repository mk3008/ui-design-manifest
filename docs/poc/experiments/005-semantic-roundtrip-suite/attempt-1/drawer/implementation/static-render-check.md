# Static render check

## Final check

| Viewport | Result | Observable material evidence |
| --- | --- | --- |
| 1440 × 900 | passed | A distinct leading Drawer navigation region shows `Destination` with the current-state treatment. |
| 375 × 812 | passed | The same bounded Drawer state remains visible without introducing a responsive behavior claim. |

The rendered accessibility snapshot was:

```text
main
  complementary "Drawer"
    navigation
      Destination
```

The `aria-current="page"` attribute and selected visual treatment are the implementation expression of the declared `navigation_item.is_current=true` fixture. There is no activation target.
