---
title: "Interface Overview"
description: "Complete visual map and component layout of the CalGrid desktop interface."
order: 2
---
# Interface Overview

CalGrid uses a compact, high-density desktop interface. This page explains every area of the main window.

---

## Window Layout

```
┌─────────────────────────────────────────────────────────────────────┐
│  Title Bar  [● ● ●]  CalGrid  VERIFIED  [Safe|Normal|Fast|Ultra]  ⚙ │
├──────────────────────────────────────────────────────────────────────┤
│  [Workspace 1] [Workspace 2] [+]                                     │  ← Tab Bar
├────────────┬─────────────────────────────────────────────────────────┤
│            │  📅 Event Details           │  📧 Receivers              │
│  Sidebar   │  Name / Date / Link / Msg  │  Upload / Dedupe / List    │
│            │                            │  ▶ Start  ❚❚ Pause  ■ Stop │
│  Workspace │─────────────────────────── │────────────────────────────│
│  Google    │  Progress                  │  Stats (Total/Done/Fail)   │
│  Advance   │  ████████░░ 60%            │                            │
│            │─────────────────────────── ┴────────────────────────────│
│            │  ⚡ Create Google API: 1.Project  2.Enable  3.Consent…  │
├────────────┴─────────────────────────────────────────────────────────┤
│  🏷 Tags  ● Ready  ⚡ Normal Mode      ⚡Debug  📄Docs  ❓Help  ℹ️  v1.0.2│
└─────────────────────────────────────────────────────────────────────┘
```

---

## Title Bar

The dark title bar at the top of the window contains:

| Element | Purpose |
|---|---|
| **● (red dot)** | Close the application |
| **● (yellow dot)** | Minimize to taskbar |
| **● (green dot)** | Maximize or restore window size |
| **CalGrid logo + name** | Application branding |
| **VERIFIED badge** | License status indicator |
| **Mode Selector** | Switch dispatch mode (Safe / Normal / Fast / Ultra) |
| **● status dot** | Green = Google account connected; Grey = not connected |
| **Account email** | Shows connected Google account for active tab |
| **⚙ Settings** | Opens the Settings dialog (`Ctrl+,`) |

You can **drag the title bar** to move the window. **Double-click** to maximize or restore.

---

## Tab Bar

The tab bar below the title bar manages your workspaces.

| Element | Purpose |
|---|---|
| **Workspace tabs** | Each tab is an independent campaign workspace |
| **Active tab** | Highlighted with an indigo top border — this is your current workspace |
| **× on each tab** | Close that workspace tab |
| **+ button** | Create a new workspace tab |
| **‹ › arrows** | Scroll through tabs when many are open |

Each workspace tab shows an authentication status dot and a live progress badge:
- **Connection Dot**:
  - **Green** (`#16a34a`) — Google account connected and authorized
  - **Grey** (`#cbd5e1`) — No Google account connected
- **Progress Badge** (shown during or after dispatch):
  - **Amber badge** (e.g., `45%`) — Job is actively running
  - **Cyan badge** (e.g., `❚❚ 45%`) — Job is currently paused
  - **Green badge** (`✓`) — Campaign completed successfully
  - **Red badge** (`✗`) — Campaign was cancelled or stopped

When documentation or bug reporting is opened, an integrated **Browser Tab** (with a `🌐` globe icon) appears on the tab bar alongside workspace tabs.

---

## Left Sidebar

The 206px sidebar on the left side of each workspace has three sections:

### Workspace Section
- **Name field** — editable workspace name (locked during active dispatch)

### Google Auth Section
- **+ Add / ✓ JSON** — select your OAuth credential JSON file
- **🔗 Connect / 🔓 Disconnect** — authorize or revoke Google Calendar access
- **Status indicator** — shows connecting, verifying, or connected state

### Advance Section
- **🏷️ Brand Name** — configure brand identity for this workspace
- **Brand label** — shown when brand is active (e.g., "● Acme Corp")
- **📎 Event Attachment** — attach files via Google Drive
- **⚙ (gear icon)** — configure custom attachment display name

---

## Main Content Area

The main area has four panels arranged in a 2×2 grid:

### 📅 Event Details (top-left, tall panel)
Covers the full left column and contains:
- **Name (event title)** — the calendar event title
- **Date & Time** — date picker with calendar popup, time in AM/PM format
- **Meeting Link / Location** — URL or venue address
- **Message (Description)** — rich text invite message with Live Preview and Template Tags

### 📧 Receivers (top-right)
- **📁 Upload List** — import emails from CSV/Excel/text files
- **✂ Remove Duplicates** — deduplicate the current list
- **Email text area** — paste or type recipient emails
- **Status counter** — shows number of valid recipients
- **▶ Start / ❚❚ Pause / ▶ Resume / ■ Stop** — dispatch control buttons

### 📊 Progress (bottom-right)
- Percentage complete
- Progress bar
- **Total / Done / Fail / Left** stat cards

### ⚡ Google API Quick Setup Bar (bottom, full-width)
Five clickable step buttons that open the correct Google Cloud Console pages for initial setup.

---

## Bottom Status Bar

The thin dark bar at the very bottom of the window:

| Element | Location | Purpose |
|---|---|---|
| **🏷 Tags** | Left | Open the dynamic tags reference modal |
| **● Ready / Working / Paused** | Left-center | Live dispatch status |
| **⚡ Normal Mode** | Left-center | Current dispatch mode badge |
| **⚡ Debug** | Right | Open diagnostics dialog |
| **📄 Docs** | Right | Open documentation in built-in browser |
| **❓ Help** | Right | Open help resources |
| **🐛 Report** | Right | Open issue reporting |
| **ℹ️ About** | Right | Open About dialog with version and shortcuts |
| **v1.0.2** | Far right | Application version |

---

## Keyboard Shortcuts

| Shortcut | Action |
|---|---|
| `Ctrl + T` | Create new workspace tab *(Note: About modal cheat sheet lists Ctrl+N, but active runtime shortcut is Ctrl+T)* |
| `Ctrl + W` | Close active workspace tab |
| `Ctrl + Tab` | Switch to next workspace tab |
| `Ctrl + Shift + Tab` | Switch to previous workspace tab |
| `Ctrl + ,` | Open Settings dialog |
| `Ctrl + B` | Toggle navigation sidebar |
| `Ctrl + F` | Focus search bar in Settings dialog |
| `Escape` | Dismiss open dialogs and modals (or clear search input) |

---

## Related Pages

- [Workspace Tabs](workspace-tabs.md)
- [Google Auth](google-auth.md)
- [Event Details](event-details.md)
- [Receivers](receivers.md)
- [Dispatch Controls](dispatch-controls.md)
- [Settings Reference](../settings/application-settings.md)
