---
title: "Debug Diagnostics"
description: "Inspect real-time API traffic, system events, and diagnostic logs."
order: 14
---
# Debug Dialog

The **Debug Dialog** provides real-time diagnostics for the CalGrid dispatch engine — API events, rate limit notifications, errors, and worker status.

---

## Opening the Debug Dialog

Click **⚡ Debug** in the bottom status bar.

---

## Dialog Layout

### Header KPI Cards

Four status cards at the top of the dialog:

| Card | Shows |
|---|---|
| **WORKSPACE** | Active workspace name and tab ID |
| **AUTH STATUS** | Google account connection state |
| **WORKERS** | Number of active background worker threads |
| **TOTAL EVENTS** | Total events created across all workspaces |

---

### Log Search and Filter

A search bar and filter pills to narrow the log view:

| Element | Function |
|---|---|
| Search field | Filter log entries by text content |
| **All** pill | Show all log entries |
| **Error** pill | Show only error entries (red) |
| **Success** pill | Show only successful entries (green) |
| **Info** pill | Show informational entries (grey/white) |

---

### Log Console

A dark terminal-style log viewer showing timestamped entries:

- **Green entries** — successful API calls, events created
- **Red entries** — errors, quota exceeded, failed recipients
- **Grey/white entries** — informational messages, rate limit events, batch status

The log retains entries up to the **Log Retention Limit** configured in [Settings → App](../settings/application-settings.md#app-settings).

---

### Footer Actions

| Button | Action |
|---|---|
| **Copy Report** | Generates a sanitized diagnostic report and copies it to clipboard |
| **Clear** | Clears the log display (does not affect saved logs) |
| **×** | Close the dialog |

---

## Understanding Log Entries

### Common Log Patterns

| Entry | Meaning |
|---|---|
| `✓ event created: recipient@email.com` | Successfully created a calendar event |
| `✗ failed: recipient@email.com — HTTP 429` | Rate limit hit; will retry |
| `↺ Retry 2/5 — waiting 3.2s` | Backoff retry in progress |
| `❚❚ Paused — waiting for resume` | Job is paused |
| `📅 Slot staggering active: +15m interval` | Slot stagger is applied |
| `🛡️ Unique Entropy active` | Invisible entropy injection is on |
| `⏱️ Jitter 1.5s–4.5s` | Human jitter delay information |

---

## In-App Offline Test Runner

**⚡ Debug → Offline Tests** opens the separate **Offline Test Runner** window, which runs CalGrid's internal test suite without making any live Google API calls.

See [Offline Test Runner](offline-test-runner.md) for details.

---

## Related Pages

- [Progress Monitoring](progress-monitoring.md)
- [Offline Test Runner](offline-test-runner.md)
- [Troubleshooting](../help/troubleshooting.md)
