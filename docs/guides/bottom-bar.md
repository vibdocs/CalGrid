---
title: "Bottom Status Bar"
description: "Quick access to Tags drawer, Debug panel, Docs, Help, Report, and About."
order: 13
---
# Bottom Status Bar

The thin dark bar at the very bottom of the CalGrid window provides quick access to tools, diagnostics, documentation, and application information.

---

## Bar Layout

```
[🏷 Tags] | ● Ready | ⚡ Normal Mode      [⚡ Debug] [📄 Docs] [❓ Help] [🐛 Report] [ℹ️ About] | v1.0.2
```

---

## Left Side

### 🏷 Tags

Opens the **Template Tags** dialog — an interactive reference showing all available dynamic placeholders.

Use this when composing your invitation message to quickly look up and copy tags like `{name}`, `{email}`, `{spin:...}`.

See [Template Tags](template-tags.md) for details.

---

### ● Status Indicator

Shows the current dispatch state of the active workspace:

| Indicator | Color | Meaning |
|---|---|---|
| ● Ready | Grey/White | Idle — no active job |
| ● Working | Green | Campaign is dispatching |
| ● Paused | Amber | Campaign is paused |
| ● Error | Red | An error occurred |

---

### Mode Badge

Shows the currently active dispatch mode (e.g., "⚡ Normal Mode"). The badge color corresponds to the mode:

| Badge | Mode |
|---|---|
| 🛡️ Safe Mode (green) | Safe |
| ⚡ Normal Mode (indigo) | Normal |
| 🚀 Fast Mode (blue) | Fast |
| ⚡⚡ Ultra Mode (amber) | Ultra |

---

## Right Side

### ⚡ Debug

Opens the **Debug Diagnostics** dialog — a live log viewer showing API calls, errors, rate limit events, and worker status.

Useful for troubleshooting failed invitations or understanding why the campaign is running slower than expected.

See [Debug Dialog](debug-dialog.md) for details.

---

### 📄 Docs

Opens documentation in the built-in browser panel (VS Code-style side panel). The documentation page loads within CalGrid — no external browser is required.

---

### ❓ Help

Opens help resources in the built-in browser.

---

### 🐛 Report

Opens the issue/bug reporting page in the built-in browser.

---

### ℹ️ About

Opens the **About CalGrid** dialog, which shows:

- Application version
- Application description
- Author information
- System and runtime details (Python version, OS version)
- Full keyboard shortcuts reference

---

### Version Label

Shows the current CalGrid version (e.g., `v1.0.2`).

---

## Related Pages

- [Template Tags](template-tags.md)
- [Debug Dialog](debug-dialog.md)
- [Dispatch Modes](dispatch-modes.md)
