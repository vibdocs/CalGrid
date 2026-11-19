---
title: "Sending Your First Campaign"
description: "End-to-end walkthrough for creating and sending your first calendar campaign."
order: 2
---
# Sending Your First Campaign

This guide walks through the complete process of setting up and sending a batch of Google Calendar invitations with CalGrid.

---

## Prerequisites

Before starting, ensure you have:

- [ ] CalGrid installed and license activated
- [ ] A Google Cloud project with Calendar API enabled
- [ ] An OAuth Desktop client JSON file downloaded
- [ ] A list of recipient email addresses

If any of these are missing, start with [Getting Started](../getting-started/index.md).

---

## Step 1 — Connect Your Google Account

1. Open CalGrid.
2. In the left sidebar, under **Google Auth**, click **+ Add**.
3. Select your OAuth client JSON file.
4. Click **🔗 Connect**.
5. Complete Google authorization in your browser.
6. Return to CalGrid — the sidebar shows **🔓 Disconnect** and your email appears in the title bar.

**Expected result:** Green dot + account email in the title bar.

---

## Step 2 — Configure Your Event

In the **📅 Event Details** panel (left side of the workspace):

1. **Name:** Type your event title (e.g., "Team Strategy Meeting").
2. **Date & Time:** Click the date field, open the calendar picker, and select a future date and time.
3. **Meeting Link / Location:** (Optional) Paste a Google Meet URL or venue address.
4. **Message:** Write your invitation message in the description area.

> **Tip:** Use `{name}` in your message to personalize it with each recipient's name automatically.

---

## Step 3 — Add Recipients

In the **📧 Receivers** panel (top-right):

**Option A — Paste directly:**
Click the email text area and paste your email list (one per line, or comma-separated).

**Option B — Upload a file:**
Click **📁 Upload List** and select a CSV, Excel, or text file containing email addresses.

**Check the counter:** The hint at the top of the Receivers panel shows how many valid emails are detected.

---

## Step 4 — Choose a Dispatch Mode

In the **Title Bar**, select your dispatch mode:

| Use case | Recommended mode |
|---|---|
| Cold outreach / fresh account | 🛡️ Safe |
| Standard daily outreach | ⚡ Normal |
| Warm lists / bulk | 🚀 Fast |
| Internal team only | ⚡⚡ Ultra |

---

## Step 5 — Start the Campaign

Click **▶ Start** in the Receivers panel.

CalGrid validates your configuration. If everything is correct, the job begins. You will see:

- The Progress panel updating with percentage and counts
- The status bar showing "● Working" in green
- The Start button becoming disabled; Pause and Stop become active

---

## Step 6 — Monitor Progress

Watch the **📊 Progress** panel:

- **% bar** — visual completion
- **Done** — events successfully created
- **Fail** — events that encountered errors (retried automatically)
- **Left** — remaining recipients

For detailed logs, click **⚡ Debug** in the bottom bar.

---

## Step 7 — Campaign Completes

When all recipients are processed:

- The Progress panel shows 100%
- The status bar returns to "● Ready"
- A Windows desktop notification appears (if enabled in Settings)
- Review Done / Fail counts

A **Fail** count means CalGrid was unable to create events for those recipients after all retry attempts. Check the Debug log for specific error messages.

---

## What Recipients See

Each recipient receives:
- A Google Calendar event invitation email
- The event appears in their Google Calendar (if they accept)
- The event shows your event title, date/time, location, and your message

> **Note:** "Done" in CalGrid means Google Calendar API accepted the event creation. It does not guarantee inbox delivery of the invitation email or that recipients accepted the event.

---

## Related Pages

- [Dispatch Modes](../guides/dispatch-modes.md)
- [Template Tags](../guides/template-tags.md)
- [Troubleshooting](../help/troubleshooting.md)
