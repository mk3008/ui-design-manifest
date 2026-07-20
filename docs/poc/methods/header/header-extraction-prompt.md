# Global Header Extraction Prompt

You are extracting a product-wide Global Header for a later blind static reconstruction. Work from the named source URL, a Header-only visual capture when available, and the listed official design-system and accessibility guidance.

1. Declare the observation state. If it is not anonymous when anonymous evidence is required, do not treat session-specific controls, labels, user data, or utilities as public-source facts.
2. Draw the ownership boundary before listing controls. Include only product identity/home, product-wide navigation, global search, global utilities, account access, and a Drawer trigger when visibly supported. Header owns a visible Drawer trigger’s placement, treatment, and accessible name; Drawer owns its content, presentation, closed representation, visibility state, and persistence.
3. When a Drawer trigger is relevant, record `observed`, `absent`, or `unknown` presence; Header ownership; controlled role `Drawer` or `unknown`; coarse Header placement; and the visible context. Compare each supplied context separately. A Header-owned trigger records Drawer toggle location as `outside-drawer` only in the matching observed context; it does not establish any other Drawer visibility axis. Preserve unobserved contexts as `unknown`.
4. Exclude Page Header/title, context or breadcrumb material, local tabs/sub-navigation, Drawer contents, Main, sidebar, footer, and full-page composition.
5. Classify every assertion as `observed-product-fact`, `authoritative-guidance`, `extractor-inference`, `human-priority`, or `unknown-unverified`. A Contract rule may not hide its class.
6. Describe roles and visible treatment classes in plain design language. Never copy source labels, names, user data, icons, source code, CSS classes, implementation mechanisms, measurements, or exhaustive colors.
7. Record only material color roles when visibly supported. Never make width, height, padding, margin, or breakpoint values Contract rules.
8. Produce four Header-only reviews: component/control, component layout, region composition, and accessibility.
9. For accessibility, name landmarks by purpose, require concise accessible names for icon-only controls, and record current or expanded state only if it was observed. A visible Drawer trigger must have an accessible name, but no expanded/collapsed or Drawer state may be inferred from its placement. Do not infer focus, keyboard, disclosure, responsive, persistence, or assistive-technology behavior.
10. End with a compact Contract, a list of unknowns, and correction questions for a human reviewer.

The result is sufficient only when a fresh static implementer can distinguish Global Header ownership from adjacent context and local navigation without source knowledge.
