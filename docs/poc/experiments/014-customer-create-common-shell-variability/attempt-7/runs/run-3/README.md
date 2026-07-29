# Run 3 — Customer create

Local-only static HTML for the supplied customer-create task, built on the
provided common shell.

Open `index.html` in a browser. Optional query parameters preserve the common
shell experiment controls:

- `?drawer=open|hidden`
- `?theme=light|dark`

The Drawer and theme buttons work locally. The form validates required fields,
the `YYYY-MM-DD` date format, and telephone and email formats on blur and on
Save. Save intentionally performs no persistence, data connection, navigation,
or permission check.
