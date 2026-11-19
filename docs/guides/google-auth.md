---
title: "Google Authentication"
description: "Connect, authorize, switch, and manage Google Calendar accounts."
order: 4
---
# Google Account Connection

Each CalGrid workspace connects to a separate Google account via OAuth 2.0. This page explains how to connect, verify, and manage your Google account per workspace.

---

## Overview

CalGrid uses the official Google Desktop OAuth 2.0 flow to access your Google Calendar. Your account credentials are stored securely in Windows Credential Manager — never in any file on disk.

---

## Connecting a Google Account

### Requirements

Before connecting, you need:
- A Google Cloud project with the Calendar API enabled
- An OAuth 2.0 Desktop client JSON file downloaded from Google Cloud Console

If you have not completed this setup yet, see [Google API Setup](../getting-started/google-api-setup.md).

### Connection Steps

1. In the **left sidebar**, find the **Google Auth** section.
2. Click **+ Add** (or **✓ JSON** if a file was previously selected).
3. A file picker opens — navigate to and select your OAuth client JSON file.
4. The button changes to **✓ JSON** and shows the filename on hover.
5. Click **🔗 Connect**.
6. Your default browser opens the Google sign-in page.
7. Sign in with your Google account.
8. Grant CalGrid the requested Calendar permissions when prompted.
9. After authorization, the browser closes or shows a confirmation message.
10. Return to CalGrid — the sidebar now shows **🔓 Disconnect** and the title bar shows your account email with a green dot.

---

## Connection Status Indicators

| Sidebar Button Text | Title Bar Dot | Meaning |
|---|---|---|
| **+ Add** | Grey | No JSON file selected |
| **✓ JSON** + **🔗 Connect** | Grey | JSON loaded, not yet authorized |
| **⏳ Verify...** | Grey | Checking saved credentials on startup |
| **⏳ Wait...** | Grey | OAuth browser flow in progress |
| **🔓 Disconnect** | Green (✓ email) | Connected and authorized |

---

## Automatic Credential Restoration

When CalGrid starts, it automatically checks saved credentials for every workspace in the background:

1. CalGrid reads the stored OAuth token from Windows Credential Manager.
2. If the token is valid, the workspace is marked connected — no browser prompt required.
3. If the token has expired or was revoked, the workspace shows **🔗 Connect** and you must re-authorize.

This check takes a few seconds. The sidebar shows **⏳ Verify...** briefly during this process.

---

## Disconnecting a Google Account

1. In the left sidebar, click **🔓 Disconnect**.
2. The stored token is immediately deleted from Windows Credential Manager.
3. The sidebar returns to **🔗 Connect** state.

You can reconnect at any time by clicking **🔗 Connect** again.

---

## Reselecting a JSON File

If you need to use a different OAuth JSON file (e.g., after recreating credentials in Google Cloud):

1. Click the **✓ JSON** button in the sidebar.
2. A file picker opens — select the new JSON file.
3. Click **🔗 Connect** to authorize with the new credentials.

---

## Service Account JSON (Advanced)

CalGrid accepts **Service Account JSON** files in addition to Desktop OAuth client files. Service accounts require Google Workspace domain-wide delegation to send invitations from other users' calendars.

For standard personal Google accounts, always use a **Desktop OAuth client JSON**.

---

## Security Notes

- OAuth tokens are stored in **Windows Credential Manager** under the key `CalGrid.OAuth.v1`.
- Tokens are tied to your Windows user account and cannot be read by other users on the same machine.
- CalGrid never stores your Google password.
- Disconnecting removes the stored token permanently.

---

## Related Pages

- [Google API Setup](../getting-started/google-api-setup.md)
- [Troubleshooting — Google Auth Issues](../help/troubleshooting.md#google-auth-issues)
