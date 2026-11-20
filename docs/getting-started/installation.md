---
title: "Installation"
description: "Download and install CalGrid on Windows using the get.vib.tools installer."
order: 3
---
# Installation

CalGrid is a native Windows desktop application. Install it in seconds using the automated installer — no Python, no source code, no admin rights required.

---

## System Requirements

| Requirement | Minimum |
|---|---|
| **OS** | Windows 10 or Windows 11 (64-bit) |
| **Architecture** | x64 |
| **PowerShell** | 5.1 or later (included in Windows 10/11) |
| **Disk Space** | ~600 MB (extracted) |
| **Admin Rights** | Not required |

---

## Method 1 — PowerShell One-Liner (Recommended)

Open **PowerShell** and run:

```powershell
irm https://dl.vib.tools/CalGrid/installer.ps1 | iex
```

The installer will:
1. Download the latest CalGrid release (`CalGrid-v1.0.4-win-x64.zip`) from `dl.vib.tools`
2. Verify the download integrity automatically
3. Extract CalGrid to your Desktop (`Desktop\CalGrid\CalGrid-v1.0.4-win-x64\`)
4. Launch CalGrid automatically on first run

> **Tip:** If PowerShell blocks the script, run this first to allow it for the current session:
> ```powershell
> Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
> ```

---

## Method 2 — Direct Installer Download

If you prefer not to run a one-liner, download the installer script directly:

| File | URL |
|---|---|
| **Latest Installer** | [installer.ps1](https://dl.vib.tools/CalGrid/installer.ps1) |
| **v1.0.4 Installer** | [installer.ps1](https://dl.vib.tools/CalGrid/v1.0.4/installer.ps1) |
| **v1.0.4 ZIP (direct)** | [CalGrid-v1.0.4-win-x64.zip](https://dl.vib.tools/CalGrid/v1.0.4/CalGrid-v1.0.4-win-x64.zip) |

**To install:**
1. Download `installer.ps1` from the link above
2. Right-click the file → **Run with PowerShell**
3. The installer will download, verify, and extract CalGrid automatically

---

## What the Installer Does

The installer performs these steps automatically:

1. **Downloads** the CalGrid ZIP archive from `dl.vib.tools`
2. **Verifies** download integrity (checks file is a valid ZIP containing `CalGrid.exe`)
3. **Extracts** CalGrid to `Desktop\CalGrid\CalGrid-v{VERSION}-win-x64\`
4. **Launches** CalGrid immediately after extraction

No registry changes are made. No admin rights are required. CalGrid is fully portable.

---

## First Launch

On first launch, CalGrid opens the **License Activation** screen. You must enter a valid license key to access the application.

See [First-Time Setup](first-time-setup.md) to continue.

---

## Data Storage Location

CalGrid stores workspace data, session state, and application settings in:

```
%LOCALAPPDATA%\CalGrid\
```

This folder is created automatically on first run. Do not delete it while CalGrid is running.

---

## Related Pages

- [System Requirements](system-requirements.md)
- [First-Time Setup](first-time-setup.md)
- [Google API Setup](google-api-setup.md)
