---
title: "Application Settings"
description: "Complete reference for Calendar, Rate, Invites, Advance, and App settings."
order: 2
---
# Application Settings Explained

The Settings dialog groups the options you can change without editing files.

| Section | Main settings | What to know |
|---|---|---|
| **Calendar** | Calendar ID, batch size, event duration, timezone, Send Updates | Use `primary` for your default calendar; incorrect IDs may fail |
| **Rate** | Requests/second, retries, backoff, network timeout | Google quotas can be lower than the number you choose |
| **Invites** | Guest list visibility, guest invitations, reminder, Meet link | Guest visibility affects privacy; notification choices affect Google invites |
| **Advance** | Delay jitter, Slot Stagger, multi-tier reminders, additional optional controls | These alter timing/event behavior, not Google's delivery guarantees |
| **App** | Local behavior and log preferences | Review before resetting or clearing saved activity |

## Useful choices

- **Timezone:** Use the zone matching the intended appointment time; check daylight-saving changes.
- **Slot Staggering:** Adds a chosen minute interval to successive recipients' appointments.
- **Send Updates:** Choose whether Google should notify attendees; “None” does not mean an email was delivered.
- **Multi-Tier Reminders:** Google Calendar reminders are for the connected calendar user where supported; they are **not guaranteed guest email alerts**.
- **Rate Limit:** Slower pacing can reduce errors but does not bypass Google restrictions.
- **Advanced options:** Read the in-app description before enabling optional attachment or message variations. They do not guarantee spam avoidance.

After making changes, choose **Save Settings**. If saving fails, verify free space and folder access. Check a new **Live Preview** to see how timing affects invitations.

[Sending modes](../guides/dispatch-modes.md) · [Troubleshooting](../help/troubleshooting.md)
