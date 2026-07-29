# Run 3: Customer search showcase

This self-contained Japanese customer-search specimen has no external dependency, request, asset, font, or real customer data.

The app.js fixture contains exactly the six fictional records specified by the experiment contract (C-000101 through C-000106), including all seven fixed fields and .test email addresses. Search provides exactly Name, Date of birth, Phone number, and Email address. Clear restores all six in-memory records. Save and Delete explicitly do not persist.

Applied standard-pack choices: the Header owns the Drawer controller and the Drawer is a separate navigation region; the default screen has a compact search panel and a scan-oriented grid with Details as its frequent row action; read values use a description list; forms use labeled native controls with Customer ID visible but disabled; and deletion uses a named confirmation with Cancel. CSS uses the canonical Light palette without a local override.

Run capture.ps1 from this directory. The committed PNG is the required default state: 1440x1200, Drawer open, Light mode, empty conditions, six results, and no transient message.
