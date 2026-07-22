# Render log

Local headless Chrome rendered `index.html` without network access using `--headless=new`, `--disable-gpu`, `--hide-scrollbars`, and the declared viewport sizes.

| Viewport | Output | Result |
| --- | --- | --- |
| 1440 x 900 | `wide.png` | rendered; inspected visually |
| 390 x 844 | `narrow.png` | rendered; inspected visually |

The first local Playwright-CLI attempt stopped because no cached CLI was available and it attempted package resolution. No package was installed. Existing Chrome was then used for the required local-file rendering.
