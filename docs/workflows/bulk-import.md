---
title: "Bulk Recipient Import"
description: "Import large recipient lists from CSV, TXT, or Excel files with deduplication."
order: 3
---
# Bulk Recipient Import

This workflow explains how to import large lists of email addresses from files into CalGrid.

---

## Supported File Formats

| Format | Extension | Notes |
|---|---|---|
| CSV | `.csv` | Any column layout; auto-detects emails in all cells |
| Excel (modern) | `.xlsx` | All sheets scanned; no header required |
| Excel (legacy) | `.xls` | Same as .xlsx |
| Plain text | `.txt` | One email per line or delimited |
| Tab-separated | `.tsv` | Auto-detected email column |

---

## Method 1 — Upload Button

1. In the **📧 Receivers** panel, click **📁 Upload List**.
2. A file picker opens — navigate to your file and click **Open**.
3. CalGrid scans the file in the background (the UI stays responsive).
4. A status message appears showing the import progress.
5. When complete, the imported emails are merged into the existing list.

---

## Method 2 — Drag and Drop

1. Open File Explorer and find your email list file.
2. Drag the file directly onto the **email text area** in the Receivers panel.
3. Drop it — CalGrid automatically detects the file and starts importing.

---

## Auto-Detection Logic

CalGrid does not require a specific column layout or header row. It scans every cell in every row and column of the file and extracts any string that matches a valid email pattern:

```
example@domain.com
user.name+tag@company.org
```

This means you can import files with:
- Multiple columns (e.g., Name, Email, Company)
- Mixed data types in the same column
- No header row at all
- Multiple sheets (Excel)

---

## After Import

After import completes:

1. The imported emails appear in the text area, merged with any existing list.
2. Click **✂ Remove Duplicates** to deduplicate the combined list.
3. Check the recipient counter to verify the total count.

---

## Import Performance

CalGrid's importer is benchmarked at approximately **15,000 emails per 0.5 seconds**. Even very large lists (tens of thousands of rows) complete quickly without freezing the UI.

---

## Preparing Your File

For best results:

- Use `.csv` or `.xlsx` format
- Ensure the file contains valid email addresses
- Do not use password-protected Excel files
- Very large files (100,000+ rows) are supported but may take a few seconds

---

## Deduplication

After importing, click **✂ Remove Duplicates** to:
- Remove case-insensitive duplicate emails (`John@example.com` = `john@example.com`)
- Preserve the original order of unique addresses
- Display a toast notification with the count removed

---

## Related Pages

- [Receivers Guide](../guides/receivers.md)
- [Sending Your First Campaign](sending-first-campaign.md)
