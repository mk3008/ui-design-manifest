# Run 2 — customer search static showcase

This is an independent, static Japanese customer-search showcase for experiment
011. It has no dependencies, external requests, persistence, routes,
authentication, or real customer data.

## Fixture

The in-memory fixture in `app.js` contains exactly six fictional customer
records, `C-000101` through `C-000106`. Each record has the fixed fields:
Customer ID, Name, Date of birth, Address, Phone number, Email address, and
Notes. Every email address uses the `.test` domain.

The default search view has empty Name, Date of birth, Phone number, and Email
address conditions and displays all six records. Search and Clear only filter
or reset that in-memory fixture. Create, edit, and delete deliberately do not
persist changes; the interface states this before a potentially misleading
action.

## Applied standard-pack choices

- A Header owns the Drawer controller. The Drawer is visible by default and
  disappears with its reserved space when closed.
- Search conditions are above the result grid, with Search primary and Clear
  subordinate. The grid keeps a frequent record-opening operation with its row.
- Record detail presents one compact label/value surface. Create and edit use a
  single-column labeled field flow with a persistent action footer; edit keeps
  Customer ID visible and non-editable.
- Delete uses a separate confirmation surface that names the record and keeps
  Cancel as the safe alternative.
- CSS uses the canonical Light values from the business-app theme-color
  configuration, without a local palette override.

## Capture

Run `./capture.ps1`. It captures the fixed `1440x1200` default Search view:
Drawer open, Light mode, empty conditions, all six results, and no transient
message. The script uses Chrome headless new with GPU disabled and retries once
with SwiftShader only if the first capture fails.
