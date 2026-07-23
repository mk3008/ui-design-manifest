---
result: ready_for_review
opened_design_inputs:
  - ../manifest.md
  - ../application-input-contract.md
  - ../apply-instruction.md
generated_files:
  - initial.html
  - initial.css
  - wide.png
  - narrow.png
render_command: "local headless Chrome --headless=new --window-size=1440,900|390,844 file:///.../implementation/initial.html"
checks: "visual wide+narrow inspection; method check; source-boundary check; git diff --check"
assumptions: "Neutral labels and Option 1 fixture values; text empty; checkbox unchecked."
unresolved_gaps: "Application-owned options, behavior, validation, and narrow policy remain unspecified."
guidance_trace: "One bordered condition group, labeled controls in order, primary Apply action after conditions."
fixture_trace: "Contract static fixture allowance only."
unsupported_invention: "None."
---

The local static render contains only the declared condition controls and primary action. The wide and narrow captures show the same single-column component; no separate narrow mode was added.
