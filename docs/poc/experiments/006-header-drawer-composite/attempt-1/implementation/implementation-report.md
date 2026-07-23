# Implementation report

Four static witnesses are rendered from one neutral HTML fixture: `A-open`, `A-hidden`, `B-open`, and `B-rail`.

Pattern A places the sole named controller in the Header and removes the Drawer when hidden. Pattern B has no Header controller and preserves the Drawer controller plus Home and Files shortcuts in its compact rail. The captures use no adaptive behavior, persistence, focus handling, keyboard handling, motion, or unresolved product inputs.

## Capture validation

Each capture used an absolute `file:///C:/.../index.html?state=...` URI. Immediately before every screenshot, Chrome headless dumped the DOM for that exact URI and confirmed the expected document title, `body data-state` marker, `.canvas`, and `Workspace` content; the dump was also rejected if it contained `chrome-error://chromewebdata`, `DNS_PROBE_FINISHED`, or browser-error text. All six PNGs decoded with nonblank pixels. Visual inspection of `wide.png` and `A-hidden.png` confirmed the rendered Header, navigation/content UI, and absence of a browser error page.
