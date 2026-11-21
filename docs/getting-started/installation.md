---
title: "Installation"
description: "Download and install CalGrid on Windows using get.vib.tools or direct installer."
order: 3
---
# Download and Install CalGrid

**Latest stable: v1.0.6 · Windows 10/11 x64.**

## Recommended download

1. Open the [CalGrid app page](https://apps.vib.tools/app/calgrid) and choose **Download / Install**.
2. Run the downloaded installer following its instructions. The app goes into a version-specific CalGrid folder on your Desktop.
3. Open CalGrid and enter your license key.

For a portable copy, [download the v1.0.6 ZIP](https://dl.vib.tools/CalGrid/v1.0.6/CalGrid-v1.0.6-win-x64.zip), extract **all** files together, then open **CalGrid.exe** in the extracted folder. Do not move the EXE away from its supporting files.

You can also download the [v1.0.6 installer script](https://dl.vib.tools/CalGrid/v1.0.6/installer.ps1).

## Optional PowerShell command

If you are comfortable reviewing PowerShell scripts, run:

`irm https://get.vib.tools/calgrid | iex`

For an exact version: `irm https://get.vib.tools/calgrid/1.0.6 | iex`

The installer checks the download before installation. Admin rights and Python are not required.

## Updating from an older version

Install v1.0.6 into its **own version folder**, not over a running previous version. Your saved workspaces and preferences are stored separately under `%LOCALAPPDATA%\CalGrid\`. Do not delete that folder.

[First-time setup](first-time-setup.md) · [System requirements](system-requirements.md)
