---
title: "Progress Monitoring"
description: "Monitor real-time progress bars, success counters, and live activity logs."
order: 8
---
# Progress Monitoring

During a campaign, CalGrid shows live progress for the current workspace:

- **Total:** Number of invitations in the job.
- **Done:** Requests completed successfully according to the app/Google API.
- **Failed:** Requests that did not complete successfully.
- **Left:** Remaining work.
- **Percentage and log:** How far the current job has progressed and what happened recently.

A status may also indicate **Running**, **Paused**, **Stopped** or **Completed**.

**Important:** “Done” means the app/API processed a request; it does **not** prove that an email reached a recipient's inbox or that an invite was accepted.

You can switch tabs and review another workspace while a worker is active. If failures occur, open [Debug](debug-dialog.md) and review [Troubleshooting](../help/troubleshooting.md).

[Sending controls](dispatch-controls.md)
