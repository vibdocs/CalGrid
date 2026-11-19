---
title: "Multi-Workspace Campaigns"
description: "Run and manage parallel campaigns across multiple independent workspaces."
order: 4
---
# Running Parallel Campaigns

CalGrid supports multiple independent workspace tabs running simultaneously. This lets you send different campaigns to different audiences at the same time.

---

## Use Cases

- Running separate campaigns for different events at the same time
- Using different Google accounts in parallel (one per workspace)
- Sending different messages to different recipient segments simultaneously
- Splitting a large list across multiple workspaces for faster dispatch

---

## Setting Up Multiple Workspaces

### Step 1 — Create Your Workspaces

1. Click **+** in the tab bar to create a new workspace, or press `Ctrl + T` *(note that About modal lists Ctrl+N, but active runtime shortcut is Ctrl+T)*.
2. Repeat to create as many workspaces as you need.
3. Each workspace starts empty with default settings.

### Step 2 — Configure Each Workspace Independently

For each workspace tab:

1. **Rename the tab** — Click the Name field in the sidebar and give it a descriptive name (e.g., "Campaign A — Tech Companies").
2. **Connect a Google account** — Each workspace can use a different Google account. Use **+ Add** and **🔗 Connect** in each tab's sidebar.
3. **Set event details** — Configure the event name, date/time, and message for each workspace.
4. **Add recipients** — Each workspace has its own independent recipient list.
5. **Choose dispatch mode** — The mode selector in the title bar applies to the active workspace's display, but each workspace retains its own mode setting at job start.

### Step 3 — Start Each Workspace

Switch to each workspace tab and click **▶ Start**.

Workspaces run in completely independent background threads. Starting or stopping one workspace does not affect others.

---

## Monitoring Multiple Workspaces

### Tab Status Badges

Each tab in the tab bar shows:
- A connection dot: **Green** (Google account authorized) or **Grey** (not connected)
- A status badge: Amber `{percent}%` (running), Cyan `❚❚ {percent}%` (paused), Green `✓` (completed), Red `✗` (cancelled)

### Switching Between Workspaces

Click any tab to switch to it. You can monitor progress, check logs, or pause/stop jobs in any workspace without interrupting others.

---

## Pausing and Stopping Individual Workspaces

Each workspace's Pause and Stop controls only affect that workspace:

- **Pause** in Workspace 2 does not affect Workspace 1 or Workspace 3
- **Stop** in one workspace lets others continue running
- Each workspace maintains its own progress and log state

---

## Resource Considerations

Each active workspace uses:
- One background worker thread
- Google Calendar API quota from the connected Google account
- Network bandwidth for API calls

Google Calendar API quota limits apply per Google account. Using different Google accounts in different workspaces gives each workspace its own independent quota.

---

## Recommended Approach

For best results when running parallel campaigns:

1. Use a **different Google account** per workspace if possible.
2. Use **Normal** or **Safe** mode for external outreach.
3. Keep the total number of simultaneous active workspaces to what your Google API quota supports.

---

## Related Pages

- [Workspace Tabs](../guides/workspace-tabs.md)
- [Dispatch Modes](../guides/dispatch-modes.md)
- [Google Auth](../guides/google-auth.md)
