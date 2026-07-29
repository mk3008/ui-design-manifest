# Run 1 — Customer create

Static customer-create screen built from the supplied Run 1 common shell and
the fixed Japanese product prompt.

Open `index.html` directly in a browser. The shared shell accepts the provided
display-only query parameters:

- `?drawer=open|hidden`
- `?theme=light|dark`

The Save control deliberately prevents submission. It validates required
fields plus date, phone-number, and email formats in the page, with an error
summary and field-associated messages. It does not persist data, connect to a
service, navigate, or evaluate permissions.
