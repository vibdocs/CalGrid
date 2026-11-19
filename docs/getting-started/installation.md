---
title: "Installation"
description: "Install CalGrid from source on Windows with Python 3.12."
order: 3
---
# Installation

CalGrid runs from source using Python. Follow these steps to install and run CalGrid on your Windows PC.

---

## Prerequisites

Before installing, ensure you have:

- Windows 10 or Windows 11 (64-bit)
- Python 3.12 installed ([python.org](https://www.python.org/downloads/))
- CalGrid source files on your computer

---

## Step 1 — Open a Terminal

Open **Command Prompt** or **PowerShell** and navigate to the CalGrid folder:

```powershell
cd path\to\CalGrid
```

---

## Step 2 — Create a Virtual Environment

```powershell
py -3 -m venv .venv
```

This creates an isolated Python environment inside the `.venv` folder so CalGrid's dependencies do not conflict with other Python programs on your system.

---

## Step 3 — Install Dependencies

```powershell
.venv\Scripts\python.exe -m pip install -r requirements.txt
```

This installs all required packages including PySide6 (the UI framework) and the Google API client libraries. The installation may take a few minutes depending on your internet speed.

---

## Step 4 — Run CalGrid

After installation, launch CalGrid using either method:

**Option A — Command line:**
```powershell
.venv\Scripts\python.exe main.py
```

**Option B — Double-click launcher:**  
Double-click `RUN_CalGrid.bat` in the CalGrid folder.

> **Note:** You only need to run Steps 2 and 3 once. After that, use `RUN_CalGrid.bat` or the command in Step 4 to start CalGrid each time.

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
