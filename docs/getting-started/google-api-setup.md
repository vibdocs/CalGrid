---
title: "Google API Setup"
description: "Configure Google Cloud project, OAuth credentials, and connect your Calendar."
order: 5
---
# Google Calendar API Setup

CalGrid uses your own Google account. If you already have a working **OAuth desktop client JSON** file, select it in CalGrid's **Google Auth → + Add** area and connect. Otherwise follow these steps.

1. Open [Google Cloud Console](https://console.cloud.google.com/) and create or select a project.
2. In **APIs & Services → Library**, enable **Google Calendar API**.
3. If you use file attachments, also enable **Google Drive API**.
4. Complete the **OAuth consent screen** for your account type. Add your account as a test user if Google requests it.
5. Under **Credentials**, create an **OAuth client ID** for a **Desktop app** and download the JSON.
6. In CalGrid, select **+ Add**, pick the downloaded JSON and choose **Connect**. Approve access in Google's browser sign-in screen.

Keep the JSON file private: it is a Google connection credential, **not** an invitation attachment. Google may require admin approval for a managed Workspace account.

For errors such as “API not enabled” or “access blocked,” check your Google Cloud project, consent screen and account permissions.

[Google connection](../guides/google-auth.md) · [Attachments](../guides/attachments.md)
