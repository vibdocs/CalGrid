---
title: "Installation"
description: "Download and install CalGrid on Windows using get.vib.tools or direct installer."
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
irm https://get.vib.tools/calgrid | iex
```

Or install a specific version:

```powershell
irm https://get.vib.tools/calgrid/1.0.4 | iex
```

The installer will:
1. Download the latest CalGrid release (`CalGrid-v1.0.4-win-x64.zip`) from Cloudflare R2 (`dl.vib.tools`)
2. Verify the download integrity and archive structure automatically
3. Extract CalGrid to your Desktop (`Desktop\CalGrid\CalGrid-v1.0.4-win-x64\`)
4. Launch CalGrid automatically on first run

> **Tip:** If PowerShell blocks script execution, run this first to allow it for the current session:
> ```powershell
> Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
> ```

---

## Method 2 — Direct Installer Download

If you prefer not to run a one-liner command, download the installer script or standalone package directly:

| Download | Link | Description |
|---|---|---|
| **PowerShell Installer** | [installer.ps1](https://dl.vib.tools/CalGrid/v1.0.4/installer.ps1) | Automated installer script (Run with PowerShell) |
| **Standalone Package** | [CalGrid-v1.0.4-win-x64.zip](https://dl.vib.tools/CalGrid/v1.0.4/CalGrid-v1.0.4-win-x64.zip) | Portable ZIP archive (extract and run) |

**To install via downloaded script:**
1. Download `installer.ps1` from the link above
2. Right-click the file → **Run with PowerShell**
3. The installer will download, verify, and extract CalGrid automatically

---

## What the Installer Does

The installer performs these steps automatically:

1. **Pre-flight check** — Verifies 64-bit Windows and PowerShell 5.1+ compatibility
2. **Downloads** the CalGrid ZIP archive from trusted CDN (`dl.vib.tools`)
3. **Verifies** download integrity and archive safety (checks file structure and `CalGrid.exe` presence)
4. **Extracts** CalGrid to `Desktop\CalGrid\CalGrid-v{VERSION}-win-x64\`
5. **Launches** CalGrid immediately after extraction

No registry changes are made. No administrator privileges are required. CalGrid is fully portable.

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
