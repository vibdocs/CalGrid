---
title: "Google API Setup"
description: "Configure Google Cloud project, OAuth credentials, and connect your Calendar."
order: 5
---
# Google API Setup

CalGrid uses the **Google Calendar API** to create calendar events. Before sending any invitations, you must create a Google Cloud project and connect your Google account.

---

## Overview

The setup process has five steps, all in the **Google Cloud Console**:

```
1. Create a Project  →  2. Enable Calendar API  →  3. Configure Consent  →  4. Create OAuth Client  →  5. Download JSON
```

CalGrid includes a **quick-access toolbar** at the bottom of each workspace with clickable buttons that open the correct Google Cloud Console page for each step.

---

## Step 1 — Create or Select a Google Cloud Project

1. Go to [console.cloud.google.com/projectcreate](https://console.cloud.google.com/projectcreate).
2. Create a new project, or select an existing one from the top project menu.
3. Note the project name — you will use it throughout the setup.

---

## Step 2 — Enable the Google Calendar API

1. Go to [console.cloud.google.com/apis/library/calendar-json.googleapis.com](https://console.cloud.google.com/apis/library/calendar-json.googleapis.com).
2. Ensure your project is selected at the top.
3. Click **Enable**.

> **Optional — Google Drive API:** If you plan to attach files to invitations, also enable the Google Drive API at [console.cloud.google.com/apis/library/drive.googleapis.com](https://console.cloud.google.com/apis/library/drive.googleapis.com).

---

## Step 3 — Configure the OAuth Consent Screen

1. Go to [console.cloud.google.com/apis/credentials/consent](https://console.cloud.google.com/apis/credentials/consent).
2. Select **External** user type (unless you have Google Workspace).
3. Fill in the required fields: App name, User support email, Developer contact email.
4. Add the required OAuth scopes:
   - `https://www.googleapis.com/auth/calendar.events` *(Required: creating and dispatching calendar events)*
   - `https://www.googleapis.com/auth/drive.file` *(Required: uploading and sharing event attachments via Google Drive)*
   - `https://www.googleapis.com/auth/userinfo.email` and `openid` *(Required: displaying your connected Google email in the app title bar)*
5. Add your own Google account as a **Test user** (required for external apps).
6. Save and continue through all consent screen steps.

---

## Step 4 — Create an OAuth Client ID

1. Go to [console.cloud.google.com/apis/credentials/oauthclient](https://console.cloud.google.com/apis/credentials/oauthclient).
2. For **Application type**, select **Desktop app**.
3. Give it a name (e.g., "CalGrid Desktop").
4. Click **Create**.

> **Important:** Choose **Desktop app**, not Web application. Web application client JSON requires extra callback configuration to work with CalGrid's local OAuth flow.

---

## Step 5 — Download the Client Secret JSON

1. Go to [console.cloud.google.com/apis/credentials](https://console.cloud.google.com/apis/credentials).
2. Find the OAuth 2.0 client you just created.
3. Click the **Download** (⬇) icon on the right.
4. Save the downloaded JSON file somewhere accessible on your computer — for example, your Desktop or Documents folder.

> **Keep this file safe.** It contains your app's client credentials. Do not share it publicly or commit it to source control.

---

## Step 6 — Connect CalGrid to Your Google Account

1. Open CalGrid.
2. In the left sidebar of any workspace, find the **Google Auth** section.
3. Click **+ Add** to open a file picker.
4. Select the JSON file you downloaded in Step 5.
5. The button changes to **✓ JSON** when the file is accepted.
6. Click **🔗 Connect**.
7. Your default web browser opens the official Google sign-in page.
8. Sign in with your Google account and grant CalGrid the requested Calendar permissions.
9. After authorization, return to CalGrid — the sidebar shows **🔓 Disconnect** and your account email appears in the title bar.

---

## Service Account JSON (Advanced)

CalGrid also accepts **Service Account JSON** files. Service accounts can be useful for automated workflows but have limitations:

- Google may restrict calendar invitations sent from service accounts without **Google Workspace domain-wide delegation**.
- For personal Google accounts and standard outreach, use a **Desktop OAuth client JSON** (described above).

---

## Reconnecting After Restart

CalGrid remembers your OAuth connection across restarts using **Windows Credential Manager**.

When you reopen CalGrid:

- The sidebar briefly shows **⏳ Verify...** while checking your saved credentials.
- If valid: the sidebar shows **🔓 Disconnect** automatically — no re-authorization needed.
- If expired or revoked: the sidebar shows **🔗 Connect** — click to re-authorize in your browser.

---

## Disconnecting

To disconnect a Google account from a workspace:

1. In the left sidebar, click **🔓 Disconnect**.
2. The stored token is deleted from Windows Credential Manager.
3. The sidebar returns to **🔗 Connect** state.

---

## Related Pages

- [Google Auth Guide](../guides/google-auth.md)
- [Troubleshooting — Google Auth](../help/troubleshooting.md#google-auth-issues)
- [FAQ — Google API](../help/faq.md)
