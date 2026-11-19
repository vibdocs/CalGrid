---
title: "Drive Attachments"
description: "Attach and share Google Drive files directly inside calendar invitations."
order: 11
---
# Event Attachments

CalGrid can attach files to calendar invitations using **Google Drive**. Each recipient's invitation includes a link to the shared file.

---

## Overview

When you attach a file, CalGrid:

1. Uploads the file to Google Drive (before the campaign starts)
2. Shares the file individually with each recipient (reader access only, by name — not "anyone with link")
3. Attaches the Drive file link to each calendar event

---

## Requirements

- Google Drive API must be enabled in your Google Cloud project
- Your connected Google account must have Drive access

If the Drive API is not enabled, CalGrid automatically shows a **Drive Guide** dialog with step-by-step instructions to enable it.

---

## Attaching a File

1. In the left sidebar, find the **Advance** section.
2. Click **📎 Event Attachment**.
3. A file picker opens — select one or more files to attach.
4. Each selected file appears as a badge card in the sidebar showing the filename.

**Supported file types:** Any file type that Google Drive accepts (PDF, images, documents, spreadsheets, etc.)

---

## Managing Attachments

### Adding Multiple Files

Click **📎 Event Attachment** again to add more files. Each file is added as a separate attachment. If a file with the same name is already attached, it is silently skipped.

### Removing an Attachment

Each attachment badge in the sidebar has an **✕** button on the right. Click it to remove that specific file.

### Configuring Attachment Settings & Delivery Rules

Click the small **⚙** (gear) button next to the attachment button to open the **Attachment Settings & Delivery Rules Hub** (`AttachmentNameDialog`).

This modernized, modular hub (580×520 px) hosts two core cards:

#### 1. Dynamic Filename Templating
Personalize how attached files are named on the calendar event for each recipient using dynamic template tags:
- **Single-Line Layout**: Features a streamlined horizontal input with a direct `[ ✦ Insert tags · 21 ▾ ]` picker button and an inline `👁️ Preview:` badge.
- **Supported Tags**: You can include placeholders such as `{name}`, `{email}`, `{brand}`, `{id}`, `{ref}`, `{date}`, or `{time}` in the attachment title template.
- **Example Template**: `{name} - Confidential Agreement - {date}.pdf`
- **Output**: Each recipient sees an attachment personalized to them (e.g., `John - Confidential Agreement - 2026-12-15.pdf`). The original file extension is always safely preserved.

#### 2. 🛡️ Ghost Attachment Anti-Spam Shield
CalGrid features an enterprise-grade deliverability shield to prevent Google Mail & Calendar spam filters from fingerprinting high-volume attachments:
- **Enable Ghost Shield**: Master toggle to activate attachment fingerprint obfuscation.
- **Drive Ghost Copies (Pool Size 1–5)**: Uploads multiple independent copies of the attachment to Google Drive. The dispatch engine rotates these links round-robin across recipients so that no single Drive file URL is flooded.
- **Polymorphic Hash Mutation**: Morphs the binary SHA-256 hash of each uploaded copy (via format-safe non-destructive comment injection for PDF, JPEG, and PNG) so each copy has a completely unique cryptographic fingerprint while rendering identically.
- **Zero-Width Invisible Title Entropy**: Injects invisible Unicode entropy characters into calendar attachment titles to defeat regex-based spam filters.
- **Isolated Recipient Sharing**: Each ghost Drive file copy is shared strictly with its assigned slice of recipients (`type=user, role=reader`), preserving privacy and security.

---

## Attachment Upload Process

When you click **▶ Start**, CalGrid:

1. Uploads all attached files to Google Drive sequentially (before any calendar events are created)
2. Verifies the upload succeeded
3. Shares each file with each recipient by email (reader-only permission)
4. Proceeds to create calendar events with the attachment links included

> **Note:** If any attachment upload fails, the campaign does not start. Fix the Drive configuration and retry.

---

## Drive Permission Policy

CalGrid shares each Drive file **only with named recipients** (by email, reader-only). It does **not** create "anyone with the link" sharing. This means:

- Only recipients in your list can access the attached files
- Sharing uses `type=user, role=reader` for each recipient

---

## Drive Guide Dialog

If the Google Drive API is not enabled, CalGrid automatically shows the **Drive Guide** dialog with five steps:

1. Enable Drive API in Google Cloud Console
2. Verify your OAuth client has Drive scope
3. Reconnect your Google account in CalGrid
4. Test an attachment

Click the step buttons in the dialog to open the relevant Google Cloud Console pages.

---

## Related Pages

- [Google API Setup](../getting-started/google-api-setup.md)
- [Google Auth](google-auth.md)
- [Troubleshooting — Attachments](../help/troubleshooting.md#attachment-issues)
