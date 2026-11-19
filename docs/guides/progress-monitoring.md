---
title: "Progress Monitoring"
description: "Monitor real-time progress bars, success counters, and live activity logs."
order: 8
---
# Progress Monitoring

The **Progress** panel (bottom-right of each workspace) shows real-time statistics for the active dispatch job.

---

## Progress Panel Elements

### Percentage and Count

- **Large percentage number** — overall completion (e.g., `72%`)
- **X/Y counter** — recipients processed / total recipients (e.g., `72/100`)

### Progress Bar

A 6px horizontal bar that fills from left to right as the job advances.

### Stat Cards

Four counters below the progress bar:

| Card | Color | Meaning |
|---|---|---|
| **Total** | Neutral | Total number of recipients in this campaign |
| **Done** | Green | Recipients who received a successful calendar event |
| **Fail** | Red | Recipients where the Google API returned an error |
| **Left** | Neutral | Recipients remaining to be processed |

---

## Status Badge

The small badge in the top-right corner of the Progress panel header shows the current state:

| Badge Text | Meaning |
|---|---|
| *(empty)* | Idle |
| **Working** | Job is running |
| **Paused** | Job is paused |
| **Done** | Job completed successfully |
| **Stopped** | Job was stopped manually |

---

## Bottom Status Bar

The bottom status bar (across the full width of the window) also shows dispatch state:

| Indicator | Meaning |
|---|---|
| **● Ready** (grey) | No active job |
| **● Working** (green) | Dispatching |
| **● Paused** (amber) | Job is paused |
| **● Error** (red) | An error occurred |

---

## Understanding "Done" vs. Invitation Delivery

**Done** means Google Calendar API **acknowledged** the event creation request. It does **not** guarantee:

- That the recipient opened or accepted the invitation
- That the invitation email was delivered to the recipient's inbox
- That the event appears in the recipient's calendar immediately

Google Calendar invitation delivery depends on Gmail delivery, the recipient's calendar settings, and anti-spam filters — none of which CalGrid controls.

---

## Fail Count and Retries

A **Fail** is counted when Google Calendar API returns an error for a recipient after all retry attempts are exhausted.

Common causes of fails:
- Temporary Google API quota limits (HTTP 429)
- Network timeouts
- Invalid recipient email address rejected by Google Calendar

CalGrid automatically retries temporary errors using exponential backoff. The number of retry attempts is configured in [Settings → Rate](../settings/application-settings.md#rate-settings).

---

## Logs

The live log view (accessible via **⚡ Debug** in the bottom bar) shows detailed per-recipient results and API error details. See [Debug Dialog](debug-dialog.md) for instructions.

---

## Desktop Notifications

When a campaign finishes, CalGrid can show a **Windows desktop notification**. Enable or disable this in [Settings → App](../settings/application-settings.md#app-settings).

---

## Related Pages

- [Dispatch Controls](dispatch-controls.md)
- [Debug Dialog](debug-dialog.md)
- [Settings Reference](../settings/application-settings.md)
