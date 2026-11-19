---
title: "Event Details"
description: "Configure event title, date, time, location, meet link, and body message."
order: 5
---
# Event Details

The **Event Details** panel is the large left panel in each workspace. It defines the Google Calendar event that will be created for each recipient.

---

## Fields

### Name (Event Title)

**What it is:** The title of the Google Calendar event that recipients will see in their calendar.

**How to use:**
1. Click the Name field.
2. Type your event title (e.g., "Team Kickoff Meeting", "Product Demo Call").

**Supports template tags:** Yes — you can use dynamic tags like `{name}` in the event title. See [Template Tags](template-tags.md).

**Required:** Yes — a name is required before you can start a campaign.

---

### Date & Time

**What it is:** The start date and time of the calendar event.

**How to use:**
1. Click the **Date & Time** field.
2. The field shows a date/time in `YYYY-MM-DD hh:mm AM/PM` format.
3. Click the small calendar icon on the right of the field to open a date picker popup.
4. Select your date and adjust the time.

**Rules:**
- The date and time must be in the future. Past dates are not accepted.
- CalGrid defaults to the next day at 10:00 AM when no date has been set.
- The timezone of the event is determined by your [Default Timezone setting](../settings/application-settings.md#calendar-settings).

**Slot Staggering:** When [Slot Stagger](../settings/application-settings.md#advance-settings) is enabled, each recipient's event start time is offset by the configured interval (e.g., +15 minutes per recipient). The `{time}` and `{date}` template tags reflect each recipient's individual staggered time.

---

### Meeting Link / Location

**What it is:** An optional URL or physical location for the event.

**How to use:**
1. Click the **Meeting Link / Location** field.
2. Type or paste a meeting URL (e.g., `https://meet.google.com/xxx-xxxx-xxx`) or a venue address.

**Google Meet links:** To automatically generate a Google Meet link for every event, enable **Auto Generate Meet Link** in [Settings → Invites](../settings/application-settings.md#invitations-settings) instead of entering a manual URL here.

---

### Message (Description)

**What it is:** The body text of the calendar invitation — the description that recipients see when they open the event.

**How to use:**
1. Click inside the message area.
2. Type your invitation message.
3. Use template tags (e.g., `{name}`, `{spin:Option A|Option B}`) for personalization.

**Rich Text & Formatting Toolbar:**
The message editor features a compact formatting toolbar:
- **Text Styles**: **B** (Bold, `Ctrl+B`), *I* (Italic, `Ctrl+I`), <u>U</u> (Underline, `Ctrl+U`), and ~~S~~ (Strikethrough).
- **Lists**: `•≡` (Bulleted list) and `1≡` (Numbered list) with compact spacing.
- **Hyperlink Insertion (`🔗`)**: Opens a dialog to attach web links (`https://...`).
- **Unicode Font Styler (`Aa ▾`)**: Applies zero-dependency stylized Unicode text (Sans-Serif Bold, Serif Bold, Sans-Serif Italic, Monospace).
- **Dynamic Tag Inserter (`⚡ Tag ▾`)**: 1-click dropdown to insert placeholders like `{name}`, `{email}`, `{company}`, `{date}`, `{ref}`, or `{id}` directly at cursor position.

**Live Preview (`👁 Live Preview`):**
Opens an interactive Google Calendar invitation simulation dialog (`CalendarPreviewDialog`). It displays the exact card recipients will see, including the organizer brand, date badge, location, and description. You can switch between different sample recipients using the top dropdown menu to test how dynamic tags and spintax expand.

**Template Tags (`Template tags`):**
Opens the comprehensive dynamic tags modal dialog (`TagsDialog`) with 1-click clipboard copy.

---

## Field Lock During Dispatch

All Event Details fields are **locked (read-only) while a campaign is running**. You cannot change the event name, date, or message during an active job.

To modify event details, [stop the current job](dispatch-controls.md) first, then edit the fields and start a new campaign.

---

## Related Pages

- [Template Tags](template-tags.md)
- [Dispatch Controls](dispatch-controls.md)
- [Settings — Calendar](../settings/application-settings.md#calendar-settings)
