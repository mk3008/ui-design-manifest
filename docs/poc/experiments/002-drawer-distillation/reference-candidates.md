# Drawer and Enterprise UI Reference Candidate Catalog

Last checked: 2026-07-19
Scope: future part-by-part design distillation experiments after the Grafana seed and the GitLab holdout

## How to read this catalog

This catalog separates two evidence lanes:

- **Product evidence** shows what a production interface, public demo, or official product screenshot actually renders.
- **Design guidance** explains an owner's intended component or layout behavior. It is not proof that every production screen follows that guidance.

The list is intentionally compact. A high priority means the source is useful for revealing a new extractor weakness and has enough public evidence to run a controlled experiment. It does not mean the interface has been proven usable by popularity or adoption.

## Candidate summary

| ID | Candidate | Classification | Public access | Best region to distill | Priority |
| --- | --- | --- | --- | --- | --- |
| C1 | GitHub public repository | Production product | Anonymous, directly observable | Repository header + horizontal sub-navigation + file table | 1 |
| C2 | Cloudscape App layout | Design-system reference | Anonymous, interactive documentation | Full application shell with left navigation, tools, drawers, and split panel | 1 |
| C3 | Stripe Dashboard and Apps drawer | Official product documentation with screenshots | Documentation is public; live Dashboard requires an account | Contextual right drawer beside object/list content | 1 |
| C4 | OpenSearch Dashboards Playground | Public demo | Officially anonymous/read-only; direct fetch failed in this check | Analytics main area + classic/workspace navigation | 2, pending capture preflight |
| C5 | Backstage demo | Public demo | Public JavaScript shell; inner render not verified in this check | Software catalog navigation + entity list/detail | 2, pending render verification |
| C6 | Shopify Admin extension surfaces | Official product documentation with screenshots | Documentation is public; live Admin requires a store/account | Resource detail + contextual block/action | 2 |
| C7 | Carbon UI shell right panel | Design-system reference | Anonymous, live component demo | Global header + floating right panel/switcher | 2 |
| C8 | PatternFly Page demos | Design-system reference | Anonymous, rendered demos and screenshots | Enterprise page shell + responsive sidebar + sticky sections | 2 |
| C9 | Fluent 2 Nav and Drawer | Design-system reference | Anonymous, rendered guidance and screenshots | Responsive inline navigation/drawer | 3 |
| C10 | Atlassian Navigation system | Design-system reference | Anonymous documentation; current page is thin in text extraction | Product navigation shell and side-nav item hierarchy | 3 |

## Detailed candidates

### C1. GitHub public repository

- **Original product URL:** https://github.com/microsoft/vscode
- **Official guidance:** https://primer.style/product/components/page-layout/
- **Owner/provenance:** GitHub owns the production surface and Primer.
- **Last checked:** 2026-07-19.
- **Access observation:** Opened anonymously. The public repository rendered its global header, repository identity and actions, horizontal repository navigation, branch/action controls, file table, and repository content.
- **Business relevance:** Mature developer-workflow product with real project navigation, status counts, action density, and tabular content.
- **Most suitable region:** Repository header through the file table, including the horizontal tab row and responsive overflow behavior.
- **Expected contrast with Grafana/GitLab:** More horizontal than drawer-led navigation; a compact global header, repository-scoped tabs, and table/content transitions replace the persistent dark side rail found in many operations tools.
- **Evidence basis:** Direct product observation plus Primer's documented page regions, panes, sidebars, and responsive variants.
- **Uncertainty:** One repository is only one state of GitHub. Signed-in controls, narrow breakpoints, menus, and issue/detail screens need separate captures.
- **Experiment priority:** **1**. It is the strongest fully public production holdout after GitLab.

### C2. Cloudscape App layout

- **Original reference URL:** https://cloudscape.design/components/app-layout/
- **Official guidance:** https://cloudscape.design/components/app-layout/?tabId=usage
- **Owner/provenance:** Cloudscape is published by Amazon Web Services; the page footer identifies AWS.
- **Last checked:** 2026-07-19.
- **Access observation:** Opened anonymously. The component page and usage/API guidance describe and preview a layout with collapsible side navigation, a content region, tools, multiple drawers, notifications, breadcrumbs, and a split panel.
- **Business relevance:** Purpose-built shell for cloud consoles and high-complexity operational products.
- **Most suitable region:** Entire app shell, especially the simultaneous left navigation, central task surface, right tools/drawer, and optional split panel.
- **Expected contrast with Grafana/GitLab:** Tests a deliberately symmetric multi-panel shell and independent panel state, rather than one dominant navigation drawer.
- **Evidence basis:** Official component contract, usage guidance, state APIs, accessibility labels, and rendered preview. This is design guidance, not observed AWS Console production evidence.
- **Uncertainty:** A component demo may be cleaner and less irregular than a real service console. Production AWS pages require credentials and are intentionally not claimed here.
- **Experiment priority:** **1**. It directly stresses region ownership and multiple concurrent secondary surfaces.

### C3. Stripe Dashboard and Apps drawer

- **Original product-documentation URL:** https://docs.stripe.com/dashboard/basics
- **Official drawer guidance:** https://docs.stripe.com/stripe-apps/design
- **Owner/provenance:** Both pages are on Stripe's official documentation domain.
- **Last checked:** 2026-07-19.
- **Access observation:** Both documentation pages opened anonymously. The Dashboard page documents primary sidebar sections, home analytics, transaction/customer lists, reports, settings, and Workbench. The Apps design page includes screenshots and defines a dock-triggered drawer beside Dashboard content, plus contextual and focused view types.
- **Business relevance:** Financial operations, reporting, customer/resource lists, and developer diagnostics in one authenticated business product.
- **Most suitable region:** A payment or customer detail/list page with the Stripe Apps contextual drawer; if only public evidence is allowed, use the documented screenshots rather than reconstructing an unseen account state.
- **Expected contrast with Grafana/GitLab:** A light, transaction-focused interface with a narrow app dock and context-preserving right drawer; it tests a secondary panel that augments an object rather than navigating the whole product.
- **Evidence basis:** Official product behavior documentation and owner-provided screenshots. No anonymous production Dashboard was observed.
- **Uncertainty:** Live Dashboard capture requires an account, and account configuration changes navigation and visible modules. Treat screenshots as bounded evidence, not a complete production screen.
- **Experiment priority:** **1** for a screenshot-based distillation; lower it if the experiment requires live anonymous interaction.

### C4. OpenSearch Dashboards Playground

- **Original demo URL:** https://playground.opensearch.org/app/home#/
- **Official guidance:** https://docs.opensearch.org/latest/dashboards/getting-started/access/
- **Official access evidence:** https://opensearch.org/blog/opensearch-playground/
- **Owner/provenance:** The OpenSearch Project owns both the demo and documentation.
- **Last checked:** 2026-07-19.
- **Access observation:** The original demo URL was opened, but the research fetcher reported a redirect loop. Official documentation, opened successfully, identifies the same URL as a web-based read-only Playground and shows classic and workspace navigation screenshots. The official launch note also describes anonymous read-only access.
- **Business relevance:** Search, observability, security analytics, dashboards, query workbenches, and cluster operations.
- **Most suitable region:** Classic or workspace left navigation plus Discover/Dashboard content, filter bar, time range, and dense visualization grid.
- **Expected contrast with Grafana/GitLab:** Shares analytics density with Grafana but adds workspace switching, Discover-style data exploration, and multiple query/application modes; this is intentionally a harder near-neighbor rather than a new visual family.
- **Evidence basis:** Official public-demo documentation and owner screenshots. Direct visual interaction was not verified in this run.
- **Uncertainty:** Redirect behavior or current deployment health must be checked with a real browser before scheduling the holdout.
- **Experiment priority:** **2, conditional**. Promote only after a capture preflight succeeds.

### C5. Backstage demo

- **Original demo URL:** https://demo.backstage.io/
- **Official guidance:** https://backstage.io/docs/deployment/
- **Owner/provenance:** The Backstage Project documentation links directly to the demo and calls it the easiest way to explore Backstage.
- **Last checked:** 2026-07-19.
- **Access observation:** The demo URL opened anonymously as a JavaScript application shell. The text-only fetcher could not verify the inner rendered screen. The official deployment page opened and linked the same live demo.
- **Business relevance:** Internal developer portals, software catalogs, service ownership, documentation, and operational metadata.
- **Most suitable region:** Catalog/entity list-to-detail flow with product navigation, filters, ownership/status metadata, and tabbed entity content.
- **Expected contrast with Grafana/GitLab:** Information architecture is entity/catalog centric, with portal plugins and metadata cards rather than repository/project operations or time-series dashboards.
- **Evidence basis:** Officially hosted demo and owner documentation. Current inner visual evidence is incomplete.
- **Uncertainty:** A real browser capture is required to confirm that anonymous routes, seed data, and layout remain available.
- **Experiment priority:** **2, conditional**. Useful once the render and seed state are verified.

### C6. Shopify Admin extension surfaces

- **Original product-documentation URL:** https://shopify.dev/docs/apps/build/admin
- **Official guidance:** https://shopify.dev/docs/apps/build/integrating-with-shopify
- **Owner/provenance:** Shopify publishes both pages on its official developer domain.
- **Last checked:** 2026-07-19.
- **Access observation:** Documentation opened anonymously. It includes owner-provided screenshots of Admin actions, inline Admin blocks on product resource pages, and print actions. It explains that extensions inherit the Shopify Admin look and feel.
- **Business relevance:** Commerce administration covering products, orders, customers, inventory, discounts, and fulfillment.
- **Most suitable region:** Product or order detail page with an inline contextual block and a launched Admin action.
- **Expected contrast with Grafana/GitLab:** Commerce resources, merchant-oriented language, inline extension cards, and action menus stress content hierarchy and embedded third-party surfaces rather than technical telemetry.
- **Evidence basis:** Official screenshots and extension-surface rules. Live Shopify Admin was not observed.
- **Uncertainty:** A store login is required for production UI, and the documentation emphasizes extensions rather than a complete current Admin shell.
- **Experiment priority:** **2** for a screenshot-scoped resource-detail experiment; not high priority for a full-shell extraction.

### C7. Carbon UI shell right panel

- **Original reference URL:** https://carbondesignsystem.com/components/UI-shell-right-panel/usage/
- **Official guidance:** Same page, with linked Style and Accessibility tabs.
- **Owner/provenance:** Carbon identifies IBM resources and carries IBM copyright and accessibility links.
- **Last checked:** 2026-07-19.
- **Access observation:** Opened anonymously. The live demo and guidance show header, optional left panel, and a full-height right panel anchored to a header icon. The documentation states that panels float above content and only one is expanded at a time.
- **Business relevance:** Cross-product enterprise shells and system-level switchers used in complex IBM product families.
- **Most suitable region:** Header-triggered right panel/switcher together with the underlying shell.
- **Expected contrast with Grafana/GitLab:** Overlay ownership is tied to a global header action, not a persistent left drawer; the selected-state model also differs because right-panel items remain unselected.
- **Evidence basis:** Official live component demo, anatomy, behavior, and accessibility test-status disclosures. No production IBM product screen is claimed.
- **Uncertainty:** The design-system demo does not show product-specific density or content irregularities.
- **Experiment priority:** **2**. Strong for focused drawer semantics, weaker for whole-product fidelity.

### C8. PatternFly Page demos

- **Original reference URL:** https://www.patternfly.org/components/page/react-demos/
- **Official guidance:** Same page, with linked Design guidelines and Accessibility sections.
- **Owner/provenance:** PatternFly is an open-source design system whose site carries Red Hat copyright.
- **Last checked:** 2026-07-19.
- **Access observation:** Opened anonymously. The page exposes screenshots and demos for full-page layouts, responsive managed sidebars, sticky groups and breadcrumbs, and a sidebar perspective switcher.
- **Business relevance:** Enterprise infrastructure and administration products with dense page chrome and context switching.
- **Most suitable region:** Full page shell with header, managed sidebar, sticky breadcrumb/section group, and main task content.
- **Expected contrast with Grafana/GitLab:** More explicit enterprise shell variants and sticky-section behavior; the perspective switcher can expose misclassification between global, contextual, and local navigation.
- **Evidence basis:** Official rendered demos, source examples, responsive behavior notes, and accessibility guidance. No Red Hat production product screen is claimed.
- **Uncertainty:** Demo placeholder content may underrepresent real information density.
- **Experiment priority:** **2**.

### C9. Fluent 2 Nav and Drawer

- **Original reference URL:** https://fluent2.microsoft.design/components/web/react/core/nav/usage
- **Official drawer guidance:** https://fluent2.microsoft.design/components/web/react/core/drawer/usage
- **Owner/provenance:** Fluent 2 is published on Microsoft's official Fluent design domain with Microsoft copyright.
- **Last checked:** 2026-07-19.
- **Access observation:** Both pages opened anonymously with owner screenshots and behavior guidance. Nav is an inline drawer at wide widths and becomes an overlay at 640 px; Drawer guidance distinguishes inline and overlay types and documents header/body/footer anatomy.
- **Business relevance:** Microsoft-style productivity and administration interfaces across desktop and web.
- **Most suitable region:** Responsive navigation drawer with grouped items, one secondary action per node, and a contextual drawer transition.
- **Expected contrast with Grafana/GitLab:** Breakpoint-driven inline-to-overlay transformation, two-level hierarchy, wrapping labels, and hover actions make responsive and accessibility states central.
- **Evidence basis:** Official component behavior, screenshots, content rules, and accessibility notes. No Azure or Microsoft 365 production screen is claimed.
- **Uncertainty:** Component guidance permits product variation, so a later production target must be pinned before judging visual fidelity.
- **Experiment priority:** **3**. Valuable after a concrete Microsoft product surface is selected.

### C10. Atlassian Navigation system

- **Original reference URL:** https://atlassian.design/components/navigation-system
- **Official supporting reference:** https://atlassian.design/components/navigation-system/side-nav-items
- **Owner/provenance:** Both pages are on Atlassian's official design-system domain.
- **Last checked:** 2026-07-19.
- **Access observation:** The current Navigation system page opened anonymously and identifies itself as the latest navigation system for Atlassian apps. The extracted page is text-light; the supporting side-nav page confirms the current package move. The older Side navigation and Drawer pages were also checked and explicitly marked deprecated, so they are not the recommended basis.
- **Business relevance:** Project management, issue tracking, knowledge work, and cross-product navigation.
- **Most suitable region:** Current product shell and hierarchical side-nav items, once a stable rendered example or public product page is pinned.
- **Expected contrast with Grafana/GitLab:** Cross-product navigation and user-customizable/reorderable hierarchy can stress the distinction between platform chrome, product navigation, and project navigation.
- **Evidence basis:** Official current-component status and package guidance. Rich visual evidence was not available through this text extraction.
- **Uncertainty:** Do not infer the current visual treatment from deprecated Atlassian Navigation, Side navigation, or Drawer examples. A browser-based visual preflight is required.
- **Experiment priority:** **3, conditional**.

## Recommended next three after GitLab

1. **GitHub public repository (C1)** — reveals whether the extractor can distinguish a compact global header, repository identity/actions, horizontal product tabs, responsive overflow, and a dense file table without forcing them into a drawer-shaped model.
2. **Cloudscape App layout (C2)** — reveals whether the extractor can assign independent ownership and geometry to left navigation, central content, right tools/drawers, notifications, and a split panel when several secondary regions coexist.
3. **Stripe Dashboard Apps drawer (C3)** — reveals whether the extractor preserves the relationship between an underlying list/detail object and a contextual right drawer, including dock trigger, non-blocking context view, and focused overlay escalation.

These three are deliberately not a single visual family: C1 is observed production UI, C2 is an authoritative multi-panel shell reference, and C3 is official product documentation with screenshots for a contextual transaction workflow.

## Exclusions and non-candidates

- **Grafana:** excluded from the candidate count because it is the seed source. Reusing it would not test transfer.
- **GitLab:** excluded from the candidate count because it is the current holdout.
- **Jira public instance:** considered, but the candidate URL could not be opened by the research fetcher. The catalog retains only the official current Atlassian design-system reference and does not claim Jira production evidence.
- **AWS Console, IBM Cloud, Azure portal, and authenticated Stripe/Shopify screens:** not promoted as anonymous production candidates because credentials are required. Their public design-system or owner-documentation evidence is cataloged separately where useful.
- **OpenSearch and Grafana as a pair:** OpenSearch remains only a conditional near-neighbor; its overlap with observability dashboards is disclosed rather than presented as a materially new family.
- **Gallery sites, marketing landing pages, personal portfolios, and third-party screenshots:** excluded because they do not provide reliable product provenance or behavior guidance.

## Verification log

| URL | Owner check | Open result on 2026-07-19 |
| --- | --- | --- |
| https://github.com/microsoft/vscode | GitHub production domain | Opened; anonymous repository UI content observed |
| https://primer.style/product/components/page-layout/ | GitHub Primer | Opened; rendered examples and responsive variants observed |
| https://demo.backstage.io/ | Backstage demo domain linked by official docs | Opened JavaScript shell; inner render not verified |
| https://backstage.io/docs/deployment/ | Backstage Project | Opened; links the live demo |
| https://playground.opensearch.org/app/home#/ | OpenSearch Playground | Attempted; research fetcher hit a redirect loop |
| https://docs.opensearch.org/latest/dashboards/getting-started/access/ | OpenSearch Project | Opened; confirms Playground URL and read-only UI screenshots |
| https://opensearch.org/blog/opensearch-playground/ | OpenSearch Project | Opened; describes anonymous read-only access and demo provenance |
| https://shopify.dev/docs/apps/build/admin | Shopify | Opened; owner screenshots and Admin surface descriptions observed |
| https://shopify.dev/docs/apps/build/integrating-with-shopify | Shopify | Opened during source review; official integration guidance |
| https://docs.stripe.com/dashboard/basics | Stripe | Opened; Dashboard regions and account requirement documented |
| https://docs.stripe.com/stripe-apps/design | Stripe | Opened; drawer screenshots and view anatomy observed |
| https://cloudscape.design/components/app-layout/ | AWS Cloudscape | Opened; component preview and shell regions observed |
| https://cloudscape.design/components/app-layout/?tabId=usage | AWS Cloudscape | Opened; usage, accessibility, and responsive behavior observed |
| https://carbondesignsystem.com/components/UI-shell-right-panel/usage/ | IBM Carbon | Opened; live demo, anatomy, behavior, and accessibility status observed |
| https://www.patternfly.org/components/page/react-demos/ | Red Hat PatternFly | Opened; screenshots, responsive sidebar behavior, and demos observed |
| https://fluent2.microsoft.design/components/web/react/core/nav/usage | Microsoft Fluent | Opened; screenshots, hierarchy, breakpoints, and accessibility guidance observed |
| https://fluent2.microsoft.design/components/web/react/core/drawer/usage | Microsoft Fluent | Opened; inline/overlay types and drawer anatomy observed |
| https://atlassian.design/components/navigation-system | Atlassian Design System | Opened; current-system status observed, but little visual text extracted |
| https://atlassian.design/components/navigation-system/side-nav-items | Atlassian Design System | Opened via official search result; current package move documented |

## Final quality and risk scan

- Every candidate has an original URL and a 2026-07-19 observation date.
- Production, demo, product-documentation, and design-system evidence are labeled separately.
- No credential-only candidate is ranked high as anonymous production evidence. Stripe is high only for a bounded official-screenshot experiment.
- Quality statements are tied to direct observation, owner guidance, accessibility disclosures, or fit for a specific extractor test; none rely on popularity alone.
- Similar visual families are disclosed: OpenSearch is a conditional observability near-neighbor, while the shortlist mixes production, multi-panel design guidance, and transactional product documentation.
- Remaining access risks are explicit for OpenSearch, Backstage, Atlassian, and authenticated product screens.
