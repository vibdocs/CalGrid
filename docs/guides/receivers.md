---
title: "Recipients Management"
description: "Add, paste, import from CSV/Excel, and deduplicate attendee email lists."
order: 6
---
# Receivers

The **Receivers** panel manages your list of recipient email addresses. CalGrid creates one Google Calendar event per recipient.

---

## Overview

Receivers are the people who will receive your Google Calendar invitation. Each email address in the list gets its own individual calendar event with that person as an attendee.

---

## Adding Recipients

### Method 1 — Type or Paste Directly

Click inside the recipient text area and type or paste email addresses.

Accepted formats:
```
john@example.com
jane@example.com, alice@company.org
bob@work.com; carol@domain.net
```

CalGrid accepts:
- One email per line
- Comma-separated emails
- Semicolon-separated emails
- Mixed formats

Invalid email addresses are silently skipped when the job starts.

---

### Method 2 — Upload a File

Click **📁 Upload List** to open a file picker.

Supported file formats:

| Format | Extension | Notes |
|---|---|---|
| CSV | `.csv` | Any column layout; auto-detects email addresses |
| Excel (modern) | `.xlsx` | Reads all sheets; no header row required |
| Excel (legacy) | `.xls` | Same as .xlsx |
| Plain text | `.txt` | One email per line or delimited |
| Tab-separated | `.tsv` | Auto-detected email column |

CalGrid automatically scans **all columns and rows** in the file — no specific column layout is required. It extracts every valid email address it finds.

**Import behavior:**
- Newly imported emails are **merged** into the existing list (not replaced).
- Duplicate emails are not automatically removed — use **✂ Remove Duplicates** after import if needed.
- The import runs in the background — the UI remains responsive during large file imports.

---

### Method 3 — Drag and Drop

Drag a supported file (`.csv`, `.xlsx`, `.xls`, `.txt`, `.tsv`) directly onto the recipient text area. CalGrid automatically imports all email addresses from the file.

---

## Removing Duplicates

Click **✂ Remove Duplicates** to deduplicate the current recipient list.

- Deduplication is **case-insensitive** (`John@Example.com` and `john@example.com` are treated as the same address).
- The **order** of addresses is preserved — only the second (and subsequent) occurrences of a duplicate are removed.
- A toast notification appears showing how many duplicates were removed and how many unique addresses remain.

---

## Recipient Counter

The small counter label at the top-right of the Receivers panel shows the current number of valid recipient emails detected in the text area.

---

## Field Lock During Dispatch

The recipient text area and the Upload/Deduplicate buttons are **locked** while a campaign is running. You cannot modify the recipient list during an active job.

---

## Privacy and Data Handling

- Recipient email addresses are stored locally in encrypted form (`%LOCALAPPDATA%\CalGrid\workspaces.json`) using Windows DPAPI.
- Recipient data is tied to your Windows user account.
- A SQLite job ledger stores recipient **hashes** (not raw addresses) to prevent duplicate sends after crashes or restarts.
- CalGrid never sends recipient email addresses to any external server other than Google Calendar API.

---

## Related Pages

- [Template Tags](template-tags.md)
- [Bulk Import Workflow](../workflows/bulk-import.md)
- [Dispatch Controls](dispatch-controls.md)
