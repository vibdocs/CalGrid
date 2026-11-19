---
title: "Brand Identity"
description: "Customize secondary calendars, organizer branding, and display names."
order: 10
---
# Brand Identity

The **Brand Identity** feature lets you customize how your organization appears on calendar invitations by displaying a brand name and routing events through a specific calendar.

---

## Overview

When Brand Identity is enabled, CalGrid:

- Formats event titles as `[Brand Name] Event Title`
- Adds `Organizer: Brand Name` to the event description
- Optionally routes events to a specific Google Calendar (instead of the default primary calendar)

---

## Accessing Brand Settings

1. In the left sidebar, find the **Advance** section.
2. Click **🏷️ Brand Name**.
3. The Brand Calendar Settings dialog opens.

---

## Brand Calendar Settings Dialog

| Field | Description |
|---|---|
| **Brand Name** | Your organization or brand name (e.g., "Acme Corporation") |
| **Brand Calendar ID (optional)** | A specific Google Calendar ID to send events to (leave blank to use workspace default) |
| **Save as default** | Apply this brand to all new workspaces automatically |

### Buttons

| Button | Action |
|---|---|
| **Save** | Apply brand settings to this workspace |
| **Cancel** | Discard changes |
| **Turn Off Brand** | Clear brand settings and return to standard scheduling |

---

## Enabling Brand Identity

1. Click **🏷️ Brand Name** in the sidebar.
2. Enter your **Brand Name** (required).
3. Optionally enter a **Brand Calendar ID** (use the email-style calendar ID from Google Calendar settings, e.g., `c_xxx@group.calendar.google.com`).
4. Check **Save as default** if you want this brand to apply automatically to all future workspaces.
5. Click **Save**.

After saving:
- The sidebar shows an active brand indicator: `● Your Brand Name`
- Event titles are automatically formatted as `[Your Brand Name] Your Event Title`
- The brand name is added to the event description as "Organizer: Your Brand Name"

---

## Using a Specific Brand Calendar

If you specify a **Brand Calendar ID**, CalGrid routes all events for this workspace to that calendar instead of the recipient's primary calendar.

To find your Brand Calendar ID:
1. Open Google Calendar.
2. Click the three dots next to the calendar you want to use.
3. Select **Settings and sharing**.
4. Scroll down to find the **Calendar ID** (looks like `c_xxx...@group.calendar.google.com`).

---

## Disabling Brand Identity

1. Click **🏷️ Brand Name** in the sidebar.
2. Click **Turn Off Brand**.
3. Brand settings are cleared for this workspace.
4. Future events from this workspace will not include brand formatting.

---

## Brand vs. Settings Calendar ID

CalGrid distinguishes between two calendar routing options:

- **Settings → Calendar ID** — the global default calendar used when no brand is configured
- **Brand Calendar ID** — overrides the settings calendar ID when brand is active

Disabling the brand reverts to the Settings calendar ID. The brand calendar ID is never stored in Settings unless you check **Save as default**.

---

## Related Pages

- [Interface Overview](interface-overview.md)
- [Settings Reference](../settings/application-settings.md)
- [Event Details](event-details.md)
