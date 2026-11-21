---
title: "Frequently Asked Questions"
description: "Common questions about CalGrid features, limits, and best practices."
order: 3
---
# Frequently Asked Questions

## What is CalGrid?

CalGrid v1.0.6 is a Windows x64 app for preparing and sending Google Calendar invitations from your own Google account.

## Do I need Python or administrator rights?

No. Use the installer or extract the complete portable ZIP.

## Why do I need both a CalGrid license and Google sign-in?

The license unlocks CalGrid. Google authorization lets your account create and manage Calendar events.

## Can I use multiple tabs?

Yes. Each workspace keeps its own event, recipients, attachments and Google connection. Rate limits are shared across the app.

## Can I import CSV, TXT or Excel recipient lists?

Yes, use **Upload List** with a supported file, check the resulting count and use **Remove Duplicates**.

## Can I attach more than one file?

Yes, through the **Event Attachment** area. Google Drive API and access permissions are required.

## What are template tags and Spintax?

Tags such as `{name}` and `{ref}` insert per-recipient details. `{spin:Hello|Hi}` chooses a wording option. Use **Live Preview** to check.

## Does “Done” guarantee an email arrived?

No. It indicates app/API completion, not inbox delivery or invitation acceptance.

## Can I pause or stop sending?

Yes. In-flight requests already sent to Google cannot be recalled.

## Where is my local data?

Under `%LOCALAPPDATA%\CalGrid\` on Windows. Avoid deleting it when updating the program.

## What changed in v1.0.6?

The first embedded browser opening is smoother, the message editor and attachment-name personalization are updated, and version-related reliability and shutdown handling improved.

[Installation](../getting-started/installation.md) · [Troubleshooting](troubleshooting.md)
