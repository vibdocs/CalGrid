---
title: "Dispatch Modes"
description: "Configure Safe, Normal, Fast, and Ultra delivery profiles."
order: 9
---
# Dispatch Modes

CalGrid offers four **Dispatch Modes** that control the pacing, batch size, and anti-spam behavior of your campaigns. Each mode is a preset that balances deliverability against throughput.

---

## Selecting a Mode

The mode selector appears in the **Title Bar**, centered at the top of the window:

```
[🛡️ Safe]  [⚡ Normal]  [🚀 Fast]  [⚡⚡ Ultra]
```

Click any mode button to activate it. The currently active mode is highlighted with a colored border.

The active mode is also shown in the **bottom status bar** (e.g., "⚡ Normal Mode").

> **Important:** The dispatch mode cannot be changed while a campaign is running. Select your mode before clicking Start.

---

## Mode Comparison

| Mode | Invites per Batch | Rate Limit | Human Jitter | Slot Stagger | Best For |
|---|---|---|---|---|---|
| 🛡️ **Safe** | 1 | 1 req/s | 2–5 s | +15 min | Cold outreach, fresh accounts, maximum deliverability |
| ⚡ **Normal** | 3 | 3 req/s | 1–2.5 s | +10 min | Balanced daily outreach for warmed accounts |
| 🚀 **Fast** | 5 | 5 req/s | None | None | Bulk dispatch for established warm domains |
| ⚡⚡ **Ultra** | 10 | 10 req/s | None | None | Internal team sync, pipeline testing |

---

## Mode Descriptions

### 🛡️ Safe Mode

**Recommended for:** Cold outreach, fresh Google accounts, campaigns where inbox placement is critical.

Safe Mode sends one invitation per request with significant delays between requests and a 15-minute time stagger between recipients. This closely mimics human scheduling behavior and maximizes the chance that invitations land in recipients' primary inboxes.

Settings applied:
- Batch size: 1
- Rate: 1 request/second
- Human jitter: 2.0–5.0 seconds
- Slot stagger: +15 minutes per recipient
- Invisible entropy: enabled

---

### ⚡ Normal Mode

**Recommended for:** Most regular outreach campaigns.

Normal Mode is the default. It sends 3 invitations per batch at 3 requests/second with moderate jitter and a 10-minute stagger. It balances deliverability with reasonable throughput.

Settings applied:
- Batch size: 3
- Rate: 3 requests/second
- Human jitter: 1.0–2.5 seconds
- Slot stagger: +10 minutes per recipient
- Invisible entropy: enabled

---

### 🚀 Fast Mode

**Recommended for:** Bulk dispatch to warm, known-good recipient lists where speed matters.

Fast Mode sends 5 invitations per batch with no jitter or stagger. It is significantly faster than Normal but provides less deliverability protection for cold contacts.

Settings applied:
- Batch size: 5
- Rate: 5 requests/second
- Human jitter: disabled
- Slot stagger: disabled
- Invisible entropy: enabled

---

### ⚡⚡ Ultra Mode

**Recommended for:** Internal team notifications, development/testing, or non-external calendars.

Ultra Mode maximizes throughput at 10 invitations per batch. It is not recommended for external outreach or inbox deliverability goals.

Settings applied:
- Batch size: 10
- Rate: 10 requests/second
- Human jitter: disabled
- Slot stagger: disabled
- Invisible entropy: disabled

---

## Mode vs. Manual Settings

Selecting a mode applies a **preset** of settings. You can further customize individual settings in [Settings → Calendar, Rate, and Advance](../settings/application-settings.md) for fine-grained control.

> **Note:** Switching modes while settings are open will update the displayed values to match the selected mode's preset.

---

## Related Pages

- [Settings Reference — Rate & Advance](../settings/application-settings.md)
- [Dispatch Controls](dispatch-controls.md)
- [Sending Your First Campaign](../workflows/sending-first-campaign.md)
