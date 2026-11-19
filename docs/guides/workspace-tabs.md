---
title: "Workspace Tabs"
description: "Manage multiple independent campaign workspaces simultaneously."
order: 3
---
# Workspace Tabs

CalGrid supports multiple independent workspaces, each running its own campaign with its own Google account, recipient list, event settings, and dispatch state.

---

## Overview

Each workspace tab is completely isolated from other tabs. You can:

- Run different campaigns simultaneously
- Use different Google accounts in each tab
- Have different event details and recipient lists per tab
- Pause one workspace while another continues running

---

## Creating a New Workspace

**Method 1:** Click the **+** button at the right end of the tab bar.  
**Method 2:** Press `Ctrl + T` *(the primary runtime shortcut; note that About modal lists Ctrl+N)*.

A new workspace opens with default settings and an empty recipient list. It is named "Workspace N" where N is the next available number.

---

## Switching Between Workspaces

**Method 1:** Click the workspace tab you want.  
**Method 2:** Press `Ctrl + Tab` (next tab) or `Ctrl + Shift + Tab` (previous tab).

When you switch tabs, CalGrid loads the state of the selected workspace — including its event details, recipients, authentication status, and logs.

---

## Renaming a Workspace

1. Click the **Name** field at the top of the left sidebar.
2. Type the new workspace name.
3. The name updates immediately and is saved automatically.

> **Note:** The Name field is locked while a dispatch job is running in that workspace.

---

## Closing a Workspace

**Method 1:** Click the **×** button on the tab.  
**Method 2:** Select the tab and press `Ctrl + W`.

If a dispatch job is active in a workspace when you close it, CalGrid stops the job before closing.

> **Note:** You cannot close the last remaining workspace tab.

---

## Tab Status Indicators

Each tab chip displays an account connection indicator and a job progress badge:

### 1. Connection Status Dot (Left of Tab Label)
- **Green dot (`#16a34a`)**: Google OAuth account is connected and authorized for this workspace.
- **Grey dot (`#cbd5e1`)**: No Google account is currently connected to this workspace.

### 2. Job Progress Badge (Right of Tab Label)
When a campaign is started, paused, or completed, an informative badge appears:
- **Amber badge** (`{percent}%`): Job is actively dispatching in the background.
- **Cyan badge** (`❚❚ {percent}%`): Job is currently paused.
- **Green badge** (`✓`): Campaign finished successfully with all batches acknowledged.
- **Red badge** (`✗`): Job was cancelled or aborted manually.

---

## Tab Overflow Navigation

If you have more workspace tabs than fit in the tab bar, use the **‹** (left arrow) and **›** (right arrow) buttons at the right of the tab bar to scroll through them. You can also use the mouse scroll wheel while hovering over the tab bar.

---

## Workspace Persistence

CalGrid automatically saves workspace state:

- **On every edit** — a 350ms debounced save fires when you type or change fields
- **On application exit** — all workspaces are saved when CalGrid closes
- **On crash** — an emergency save fires if CalGrid exits unexpectedly

Workspace data is stored in `%LOCALAPPDATA%\CalGrid\workspaces.json`. Receiver text and log entries are encrypted using Windows DPAPI (tied to your Windows user account).

---

## Running Parallel Campaigns

You can run dispatch jobs in multiple workspaces simultaneously. Each workspace runs its own background worker thread independently.

To run parallel campaigns:

1. Create multiple workspace tabs.
2. Configure each tab with its own Google account, event details, and recipient list.
3. Click **▶ Start** in each tab.

Each workspace operates independently. Pausing or stopping one workspace does not affect others.

See [Running Parallel Campaigns](../workflows/multi-workspace.md) for a full walkthrough.

---

## Related Pages

- [Interface Overview](interface-overview.md)
- [Running Parallel Campaigns](../workflows/multi-workspace.md)
- [Google Auth](google-auth.md)
