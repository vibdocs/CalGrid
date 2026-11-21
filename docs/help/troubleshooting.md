---
title: "Troubleshooting Guide"
description: "Step-by-step solutions for license, Google auth, deliverability, and app errors."
order: 2
---
# Troubleshooting CalGrid

Try the simple checks below before changing settings or retrying a large campaign.

## License issues {#license-issues}

**Invalid, expired or device-limit message:** Recheck the license details and contact the license provider if needed. Do not share your full key publicly.

**Verification or reconnect error:** Check the internet connection and reopen CalGrid. The app remains locked if it cannot establish a valid licensed session.

## Google sign-in issues {#google-auth-issues}

**Cannot connect:** Confirm you selected a Google OAuth **Desktop app JSON** file, use the intended account and approve Calendar permissions. Managed Google Workspace accounts may require admin consent.

**Calendar API disabled or access blocked:** Follow [Google API Setup](../getting-started/google-api-setup.md).

## Recipient or import issues {#recipient-issues}

**Count looks wrong:** Check file format, header rows and invalid email addresses. Reimport a smaller supported file, then use **Remove Duplicates**.

## Attachments and Drive {#attachment-issues}

**Upload unavailable:** Enable Google Drive API in the same Cloud project, reconnect if permissions changed and check Drive sharing. Large files or inaccessible accounts may fail.

## Sending and quotas {#sending-issues}

**Rate limit or temporary error:** Reduce the selected mode/rate, allow retries and read **Debug**. Do not repeatedly Start an uncertain job.

**Wrong appointment time:** Verify Date & Time and timezone in Settings, then preview again.

## Browser and app {#browser-issues}

**Docs, Help or Report not loading:** Check internet access; close and reopen the browser tab. This does not affect a campaign already started.

**Cannot save settings:** Check disk space and local Windows folder access.

**Still stuck?** Use **Debug** or **Report** in the footer. Share the CalGrid version and error text, not passwords, license keys or OAuth files.

[FAQ](faq.md) · [Limits](limitations.md)
