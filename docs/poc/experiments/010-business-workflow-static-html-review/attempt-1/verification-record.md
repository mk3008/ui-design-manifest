---
type: PoC verification record
title: Business-workflow static review verification
status: passed-with-static-evidence-limits
source: direct-command-results
---

# Environment

- Baseline commit: `3965737a2458e586507db92e31bb77eb0d2dd47c`
- Branch: `main`
- Capture browser: Chrome `150.0.7871.187`
- Fixed viewport: `1440x1200`
- Worktree: uncommitted by design, pending consolidated human review

# Results

| Command | Exit | Exact result |
| --- | ---: | --- |
| All `tests/*.ps1`, sorted by name | 0 | 13 total, 13 passed, 0 failed |
| `./tests/check-business-app-standard-pack.ps1` | 0 | 3 positive contract cases and 11 negative contract cases passed |
| `./tests/check-business-workflow-standard-pack.ps1` | 0 | 22 concepts, 19 index links, 5 record-list configuration IDs, 21 theme roles, 2 theme modes, 10 override values, 8 negative theme-color cases, 68 default/resolved contrast assertions, and 2 product-binding fixtures passed |
| `./tests/check-business-workflow-static-html-review.ps1` | 0 | 12 fixed HTML, 12 fixed PNG, 1 supplementary Wizard state HTML, 1 supplementary Color/theme token HTML, 17 canonical text digests, 12 raw-byte PNG digests, 12 manifest/capture identities, 21 theme roles rendered per mode, 5 fixed theme-audit PNGs, 5 fixed applied-choice audit PNGs, and 0 external HTML/CSS references passed |
| `./tests/check-drawer-search-patterns-standard-pack.ps1` | 0 | Existing Drawer, Grid, Card, and shared-flow checks passed |
| `./tests/check-source-boundaries.ps1` | 0 | Source-boundary static checks passed |
| `./docs/poc/experiments/010-business-workflow-static-html-review/attempt-1/capture.ps1` | 0 | 12/12 Chrome captures succeeded in normal `--headless=new --disable-gpu` mode; SwiftShader fallback used for 0 captures |
| Read-only Node `yaml` front-matter, YAML, and local-link audit over `templates/business-app` and this experiment | 0 | 48 Markdown files: 39 front matters parsed and 9 plain Markdown files recognized; 9 YAML files parsed; 102 local Markdown links checked; 0 broken |
| `git diff --check` | 0 | No whitespace error |

# Capture details

Every capture recorded normal exit code `0`, a non-empty PNG, raw-byte
SHA-256, and dimensions of `1440x1200`. The capture uses the explicit Chrome
path `C:\Program Files\Google\Chrome\Application\chrome.exe`; no Edge fallback
exists. Normal capture succeeded for every page, so the single permitted
SwiftShader retry was not used.

An initial capture attempt inside the restricted command environment stopped
before producing a replacement set because Chrome could not use its GPU process
and reported a temporary profile-cache lock. Repeating the same script in the
approved normal command environment produced all 12 captures with normal exit
code `0`; the fallback was not used. The fixed evidence records only that
successful capture set.

The static review check verifies that all eleven product review pages expose
the same five vertically stacked `Applied choices` sections outside the
product canvas and that the previous evaluation-copy phrases do not occur in
those pages. It verifies the exact bounded-choice group count per page, at
least two options and exactly one selected option per group, and the absence
of invented radio options on pages without a defined alternative. The fixed
HTML, CSS, and product-surface PNG hashes are recorded in
`artifact-manifest.yaml`.

For the theme correction, the check additionally fixes the product-owner
before screenshot, the restored-page screenshot, the role-coverage
comparison HTML and PNG, and the Header-responsibility comparison HTML and
PNG by digest, byte size, and image dimensions. These supplemental audit
artifacts do not replace the fixed `1440x1200` `color-theme.png` recorded
by the artifact manifest.

For the Applied choices correction, the check additionally fixes the exact
product-owner crop, the former full Record read capture, the corrected full
capture, the tall complete-note capture, and the before/after comparison PNG
by digest, byte size, and image dimensions. It also fixes the comparison
HTML's canonical-text digest. These supplemental artifacts make the full
vertical selection treatment reviewable without replacing the ordinary fixed
`record-read.png`.

The all-check rerun completed after this correction: 13 PowerShell checks
passed, 0 failed. The static HTML check found 5 bounded radio groups across
the eleven product pages: 2 on Record read, 1 on Record create, 1 on Record
edit, and 1 on Color/theme. The other seven pages contained 0 radio groups.
A separate read-only reviewer also reran the static HTML and business-workflow
standard-pack checks; both passed. Its final result was P0 `0`, P1 `0`, P2
`0`, P3 `0`.

The later Wizard correction adds one HTML-only comparison surface outside the
12-artifact fixed capture set. Its limited check confirms three states, the
input and Review progress, Back/Continue and Back/final-action separation,
Change links, absence of generic `OK`, absence of a predicted `Complete` step,
and absence of pre-submit navigation from the Result state. The HTML/CSS
canonical digests are fixed by the static check. No supplementary PNG was
captured because the available browser-control session rejected local `file:`
navigation; the page was subsequently accepted through direct human review.

A fresh read-only reviewer reran the business-workflow standard-pack check,
static HTML review check, Source Independence check, and `git diff --check`;
all exited `0`. After one P1 copy correction and two P2 evidence/test
corrections, the final result was P0 `0`, P1 `0`, P2 `0`, P3 `0` for
source/Contract/static evidence. Direct visual acceptance was subsequently
recorded for the Wizard page.

The later Color/theme responsibility correction adds a second HTML-only
supplement outside the 12-artifact fixed capture set. The standard-pack check
parses 21 roles for each required mode, validates 10 local override leaves,
rejects 8 negative cases, resolves the valid leaves over the canonical
defaults, and runs 17 contrast
assertions per mode against both the default and resolved palettes: 68 total.
The negative cases are unknown mode, unknown role, `null`, empty value,
invalid color notation, duplicate role, missing canonical roles, and multiple
selected theme-color overrides.
The static HTML check verifies that every displayed role and hex value matches
`theme-colors.default.yaml`, both specimens apply the values, and neither
product Header contains a theme caption or selection control. It also fixes
the HTML/CSS canonical digests and finds 0 external references.

No supplementary PNG was captured because the available browser-control
session rejected local `file:` navigation. The fixed `color-theme.html`,
`styles.css`, `color-theme.png`, artifact manifest, and capture record retain
their prior identities as historical evidence. The new supplement therefore
has source, structural, configuration, and contrast evidence. Its spacing,
wrapping, visual hierarchy, and perceived color balance were subsequently
accepted through direct human review after the Light focus-ring correction.

A different read-only reviewer then reran the business-workflow standard-pack
check, static HTML review check, Source Independence check, and
`git diff --check` against the resolved worktree. All passed. It confirmed the
eight negative cases, 68 contrast assertions, YAML/HTML/CSS value identity,
Header responsibility boundary, and absence of runtime or DSL expansion.
Final severity is P0 `0`, P1 `0`, P2 `0`, P3 `0`; the remaining evidence limit
is the unavailable baseline comparison for an experiment directory that did
not exist at that commit.

# Warnings, skips, and unconfirmed items

Git reported line-ending conversion warnings for existing LF files on this
Windows worktree; `git diff --check` remained successful. The temporary
`npm notice` about a newer npm major version did not affect the read-only
Node YAML audit. No repository check was skipped.

Static evidence alone does not confirm the visual rendering of the two
supplementary HTML pages; direct human review accepted their visible
composition. It does not confirm keyboard behavior, focus movement or
containment, Escape, background inertness, live announcements,
assistive-technology output, runtime contrast ratios, narrow reflow,
pseudo-localized labels, sticky behavior while scrolling, persistence, live
validation, concurrency behavior, browser-history restoration, or real product
integration. These are evidence limits, not passed runtime checks.
