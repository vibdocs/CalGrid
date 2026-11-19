---
title: "Frequently Asked Questions"
description: "Common questions about CalGrid features, limits, and best practices."
order: 3
---
# Frequently Asked Questions

---

## General

### What is CalGrid?

CalGrid is a Windows desktop application for scheduling and batch-sending Google Calendar invitations. It lets you send personalized calendar events to hundreds or thousands of recipients with features like anti-spam pacing, dynamic personalization, slot staggering, and Google Drive attachments.

---

### Does CalGrid work on Mac or Linux?

No. CalGrid is a Windows-only application built with native Windows technologies (PySide6/Qt, Windows Credential Manager). No Mac or Linux version is available.

---

### Does CalGrid require a Google Workspace account?

No. CalGrid works with standard personal Google accounts. You need a **Google Cloud project** with the Calendar API enabled and an OAuth Desktop client credential file, but no Workspace subscription is required.

---

### What does "Done" mean in the Progress panel?

**Done** means the Google Calendar API successfully accepted the event creation request. It does **not** mean the recipient saw, accepted, or received an email about the invitation. Email delivery depends on Gmail's spam filters and the recipient's Google Calendar settings, which CalGrid cannot control.

---

## Google API & Authentication

### Can I use the same Google account in multiple workspaces?

Yes. You can use the same OAuth JSON file and authorize the same Google account in multiple workspace tabs. However, all workspaces sharing an account also share that account's Google Calendar API quota. For best results with parallel campaigns, use different Google accounts in different workspaces.

---

### Do I need to re-authorize my Google account every time I restart CalGrid?

No. CalGrid stores your OAuth token securely in Windows Credential Manager and restores your connection automatically on each launch. You only need to re-authorize if the token expires, is revoked, or you explicitly disconnect.

---

### My Google Cloud project is in "testing" mode. Will invitations be blocked?

Invitations from an OAuth app in "testing" mode work normally — the limitation for testing-mode apps is the number of authorized test users (typically 100). Add your test recipients as test users in the Google Cloud Console OAuth consent screen.

---

### Why does the OAuth browser flow redirect to localhost?

CalGrid uses Google's official "InstalledAppFlow" (Desktop app) OAuth flow, which uses a temporary local server on `localhost` to receive the authorization callback from Google. This is the standard, secure method for desktop app authentication. No server infrastructure is involved.

---

## Sending & Deliverability

### How many invitations can I send?

Google Calendar API quota limits apply. The standard quota is typically 600 requests/minute per user, but this varies by Google Cloud project and account. CalGrid does not impose its own hard limit — configure your Batch Size and Rate Limit in Settings to stay within your quota.

---

### Can recipients opt out of receiving invitations?

Google Calendar automatically handles invitation acceptance and decline for recipients. CalGrid cannot control or access recipients' responses. Recipients can delete unwanted events from their calendars directly.

---

### Can I send the same event to the same recipient twice?

CalGrid uses a **SQLite job ledger** that stores recipient hashes (not raw addresses) and event IDs. If a campaign crashes or is restarted, CalGrid does **not** automatically re-send to recipients who already received an event in a previous run of the same campaign. This prevents unintentional duplicate invitations.

---

### Will recipients see each other's email addresses in the invitation?

No. By default, **Guests Can See Other Guests** is disabled. Each recipient's event is created independently — recipients do not see the full list of other invited people. You can change this in [Settings → Invites](../settings/application-settings.md#invitations-settings).

---

## Attachments

### What file types can I attach?

Any file type that Google Drive accepts can be attached. Common types include PDF, DOCX, XLSX, PPTX, PNG, JPG, and others.

---

### Where are attached files stored?

Attached files are uploaded to your **Google Drive** account (the same account connected in the workspace). CalGrid uploads the file once and then shares it individually with each recipient by email.

---

### Is the attached file publicly accessible?

No. CalGrid shares the file only with named recipients (by email address, reader-only permission). It does not create "anyone with the link" public access.

---

## Data & Privacy

### Where is my data stored?

| Data | Location |
|---|---|
| Workspace data, recipient lists, logs | `%LOCALAPPDATA%\CalGrid\` (encrypted with Windows DPAPI) |
| OAuth tokens | Windows Credential Manager |
| Application settings | `%LOCALAPPDATA%\CalGrid\settings.json` |
| Job ledger (recipient hashes, event IDs) | `%LOCALAPPDATA%\CalGrid\` (SQLite database) |

---

### Is my recipient list sent to CalGrid's servers?

No. Recipient email addresses are only sent to the **Google Calendar API** to create events. They are never sent to CalGrid's licensing servers or any other service.

---

### Is my license key stored on disk?

No. Your license key is verified in memory and immediately discarded after verification. It is never stored in any file on disk, in logs, or in the Windows registry.

---

## Related Pages

- [Troubleshooting](troubleshooting.md)
- [Limitations](limitations.md)
- [Settings Reference](../settings/application-settings.md)
