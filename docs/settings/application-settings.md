---
title: "Application Settings"
description: "Complete reference for Calendar, Rate, Invites, Advance, and App settings."
order: 2
---
# Settings Reference

Complete reference for all CalGrid settings. Open Settings with `Ctrl + ,` or the ⚙ button in the title bar.

---

## Calendar Settings {#calendar-settings}

Settings in the **📅 Calendar** category control how events are created and dispatched.

---

### Default Calendar ID

**Default:** `primary`

The Google Calendar ID where events are created. Use `primary` to send to the recipient's primary calendar. Use a specific calendar email (e.g., `c_xxx@group.calendar.google.com`) to target a custom calendar.

> **Note:** When Brand Calendar is active for a workspace, it overrides this setting for that workspace only. See [Brand Identity](../guides/brand-identity.md).

---

### Batch Size

**Default:** 100 | **Range:** 1–100

Maximum number of calendar event creation requests bundled into a single Google Calendar HTTP batch request. Larger batches are more efficient but may hit quota limits faster.

Effective batch size is `min(Batch Size, Rate Limit/second, 100)`.

---

### Default Event Duration

**Default:** 30 min | **Range:** 5–480 min | **Step:** 5 min

Duration in minutes for calendar events created by CalGrid. For example, a value of 30 creates events from the start time to 30 minutes later.

---

### Default Timezone

**Default:** Local (Auto-detect)

The timezone assigned to event start and end timestamps. Options include:

| Option | Description |
|---|---|
| Local (Auto-detect) | Uses your Windows system timezone |
| UTC | Coordinated Universal Time |
| America/New_York | Eastern Time (US) |
| America/Chicago | Central Time (US) |
| America/Denver | Mountain Time (US) |
| America/Los_Angeles | Pacific Time (US) |
| Europe/London | GMT/BST |
| Europe/Paris | CET/CEST |
| Asia/Dubai | GST |
| Asia/Dhaka | BST (Bangladesh) |
| Asia/Kolkata | IST |
| Asia/Singapore | SGT |
| Asia/Tokyo | JST |
| Australia/Sydney | AEST/AEDT |
| *(and more)* | Additional IANA timezones |

> **Note:** If you have a custom timezone saved that is not in the list, CalGrid appends it to the list automatically.

---

### Send Updates Mode

**Default:** `all`

Controls whether Google Calendar sends invitation emails to attendees.

| Option | Behavior |
|---|---|
| `all` | Send invitation emails to all attendees (internal and external) |
| `externalOnly` | Send only to attendees outside your Google Workspace domain |
| `none` | Do not send any invitation emails (events are created silently) |

---

## Rate Settings {#rate-settings}

Settings in the **⏱️ Rate** category control API pacing and error recovery.

---

### API Rate Limit

**Default:** 5 req/s | **Range:** 1–50 req/s

Maximum Google Calendar API requests per second. This is a CalGrid-side limiter — Google's own quota limits (typically 600 requests/minute per user) always apply independently.

> **Tip:** Dispatch modes (Safe / Normal / Fast / Ultra) automatically configure this setting. Adjust manually only if you need fine-grained control beyond the preset modes.

---

### Max Retry Attempts

**Default:** 5 | **Range:** 0–10

Number of automatic retry attempts when a request fails with a temporary error (HTTP 429 Too Many Requests or HTTP 503 Service Unavailable).

Set to 0 to disable retries entirely.

---

### Base Backoff Delay

**Default:** 1.5 s | **Range:** 0.5–10.0 s

Starting delay multiplier for exponential backoff on retries. When a request fails, CalGrid waits `Base Backoff × 2^retry_number` seconds before retrying (with randomized jitter added).

---

### HTTP Request Timeout

**Default:** 30 s | **Range:** 5–120 s | **Step:** 5 s

Maximum time (in seconds) CalGrid waits for a Google Calendar API response before considering a request failed.

---

## Invitations Settings {#invitations-settings}

Settings in the **🔔 Invites** category control privacy and notification behavior for created events.

---

### Guests Can See Other Guests

**Default:** Off (unchecked)

When enabled, attendees can see the full list of other invited guests in the event details. Keep disabled for privacy when sending to multiple unrelated recipients.

---

### Guests Can Invite Others

**Default:** Off (unchecked)

When enabled, invited guests can forward or share the invitation with additional people. Keep disabled to prevent unauthorized redistribution of the invitation.

---

### Default Reminder

**Default:** 15 min | **Range:** 0–120 min

Minutes before the event when Google Calendar sends the recipient a reminder popup. Set to 0 to disable reminders.

> **Note:** This setting is automatically disabled when **Multi-Tier Reminders** (in Advance settings) is enabled, as the two systems conflict.

---

### Auto Generate Meet Link

**Default:** Off (unchecked)

When enabled, CalGrid instructs Google Calendar to automatically generate a unique Google Meet conference link for each created event. The meeting link appears in the event details for all attendees.

Leave disabled if you are providing your own meeting URL in the **Meeting Link / Location** field.

---

## Advance Settings {#advance-settings}

Settings in the **🛡️ Advance** category enable anti-spam and smart scheduling features. All Advance settings default to off.

---

### Randomized Human Jitter

**Enable Human Jitter:** Off | **Min Delay:** 1.5 s | **Max Delay:** 4.5 s

When enabled, CalGrid adds a randomized pause between each request dispatch. The pause is a random duration between Min Delay and Max Delay seconds.

**Purpose:** Mimics human scheduling behavior to reduce the chance of Google anti-abuse detection flagging your account.

> **Note:** Jitter is non-blocking — it responds instantly to Pause and Stop commands during the wait.

The active workspace shows a meta label (e.g., `⏱️ Jitter 1.5s–4.5s`) when jitter is configured.

---

### Time-Staggered Slot Booking

**Enable Slot Stagger:** Off | **Stagger Interval:** 15 min

When enabled, each recipient's event start time is offset by the configured interval:

- Recipient 1: Base time (e.g., 10:00 AM)
- Recipient 2: Base + 15 min (10:15 AM)
- Recipient 3: Base + 30 min (10:30 AM)
- ...

**Purpose:** Creates individual appointment slots instead of inviting everyone to the same time. Essential for scheduling one-on-one calls or appointments at scale.

The `{time}`, `{date}`, and `{day}` template tags automatically reflect each recipient's individual staggered time.

**Stagger interval range:** 5–240 minutes.

---

### Multi-Tier Reminder Notifications

**Enable Multi-Tier Reminders:** Off

When enabled, CalGrid sends up to three separate reminder notifications per event instead of a single reminder.

| Tier | Default Minutes | Default Method |
|---|---|---|
| Tier 1 | 1440 (24 hours) | Email |
| Tier 2 | 60 (1 hour) | Popup |
| Tier 3 | 15 (15 minutes) | Popup |

Each tier has a **minutes** spinbox and a **method** selector (Email or Popup).

Set any tier to **0 (Off)** to disable that tier while keeping others active.

**Deduplication:** CalGrid automatically removes duplicate (method, minutes) combinations before sending to the Google API, preventing HTTP 400 errors.

> **Important:** Enabling Multi-Tier Reminders automatically disables the Default Reminder setting in the Invites category.

---

### Invisible Entropy Injection

**Default:** Off

When enabled, CalGrid appends a unique sequence of invisible zero-width Unicode characters to each invitation description. The characters are invisible to human readers but make each event's byte content unique.

**Purpose:** Bypasses Gmail/Google Calendar repetitive template fingerprinting that may cause invitations to be treated as spam when hundreds of identical messages are detected.

The workspace status shows `🛡️ Unique Entropy` when entropy is active.

---

## App Settings {#app-settings}

Settings in the **💻 App** category control the application interface and notification behavior.

---

### Log Retention Limit

**Default:** 2000 | **Range:** 100–10,000

Maximum number of log entries retained in the Debug dialog's log console. Older entries are removed when the limit is reached. Increase for long-running campaigns where you need longer history.

---

### Auto-Scroll Logs

**Default:** On (checked)

When enabled, the log console automatically scrolls to the newest entry as it arrives. Uncheck to freeze the scroll position and read older entries while a job is running.

---

### Desktop Notifications

**Default:** On (checked)

When enabled, CalGrid shows a Windows system notification when a campaign completes. The notification includes the final Done/Fail counts.

---

### Sound Alerts

**Default:** Off (unchecked)

When enabled, CalGrid plays a sound when a campaign finishes. The sound uses the Windows system notification sound.

---

## Related Pages

- [Dispatch Modes](../guides/dispatch-modes.md)
- [Template Tags — Stagger Tags](../guides/template-tags.md)
- [Brand Identity](../guides/brand-identity.md)
- [Troubleshooting](../help/troubleshooting.md)
