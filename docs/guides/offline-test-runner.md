---
title: "Offline Test Runner"
description: "Execute built-in test suites without network or Google API credentials."
order: 15
---
# Connection & Readiness Checks

CalGrid v1.0.6 performs checks while you connect a Google account and start an invitation job. **There is no separate general-purpose Offline Test Runner button in the normal workspace UI.**

Before sending, check that:

1. Your CalGrid license shows a valid signed-in state.
2. The workspace's **Google Auth** status shows connected.
3. Event date, timezone, recipients and attachments are correct.
4. **Live Preview** displays the intended invitation.
5. A small, appropriate test audience is ready before a larger campaign.

For errors, use **Debug** or the status messages. Local diagnostics do not send real Google invitations or replace a controlled test with your own authorized account.

[First campaign](../workflows/sending-first-campaign.md) · [Troubleshooting](../help/troubleshooting.md)
