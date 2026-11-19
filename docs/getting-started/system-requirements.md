---
title: "System Requirements"
description: "Hardware and software requirements for running CalGrid on Windows."
order: 2
---
# System Requirements

CalGrid is a native Windows desktop application. The following requirements must be met before installation.

---

## Minimum Requirements

| Component | Requirement |
|---|---|
| **Operating System** | Windows 10 (64-bit) or Windows 11 |
| **Python** | Python 3.12 or higher |
| **RAM** | 2 GB available |
| **Storage** | 500 MB free disk space (for dependencies and virtual environment) |
| **Internet** | Required for Google Calendar API and license verification |
| **Google Account** | A Google account with access to Google Calendar |
| **Google Cloud Project** | Required for OAuth client credentials (see [Google API Setup](google-api-setup.md)) |

---

## Software Requirements

| Software | Purpose |
|---|---|
| **Python 3.12** | Application runtime |
| **pip** | Package installation |
| **Windows Credential Manager** | Secure token storage (built into Windows — no installation required) |
| **Google Chrome or Edge** | Used by the OAuth authorization flow to open the Google sign-in page |

---

## Network Requirements

CalGrid requires internet access for:

- License verification (on startup and during use)
- Google OAuth authorization (once per workspace connection)
- Google Calendar API calls (during event dispatch)
- Optional: Google Drive API (if using file attachments)

CalGrid does **not** require a static IP address or server-side infrastructure.

---

## Supported Platforms

| Platform | Support |
|---|---|
| Windows 10 (64-bit) | ✅ Supported |
| Windows 11 (64-bit) | ✅ Supported |
| Windows 32-bit | ❌ Not supported |
| macOS | ❌ Not supported |
| Linux | ❌ Not supported |

> **Note:** CalGrid is a Windows-only application. No cross-platform version exists.

---

## Related Pages

- [Installation](installation.md)
- [First-Time Setup](first-time-setup.md)
