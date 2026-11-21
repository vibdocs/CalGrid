---
title: "Google Authentication"
description: "Connect, authorize, switch, and manage Google Calendar accounts."
order: 4
---
# Connect Your Google Account

Each workspace needs an authorized Google account before it can create Calendar invitations.

1. In the left sidebar, go to **Google Auth**.
2. Select **+ Add** and choose your Google **OAuth desktop JSON** file when needed.
3. Select **Connect** and sign in in Google's browser screen.
4. Approve the requested Calendar permissions. Wait until the connection state shows success.

Use **Disconnect** if you need to switch accounts. You cannot safely switch an account while that workspace has an active sending job.

Your saved sign-in is handled by the app's protected local credential storage; you should not paste passwords or tokens into invitation fields.

Google sign-in is separate from [CalGrid license activation](../getting-started/first-time-setup.md). If you see “API disabled,” enable Calendar API in [Google setup](../getting-started/google-api-setup.md).

[Google API setup](../getting-started/google-api-setup.md) · [FAQ](../help/faq.md)
