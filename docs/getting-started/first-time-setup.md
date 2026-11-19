---
title: "First-Time Setup"
description: "Activate your license key and perform initial setup on first launch."
order: 4
---
# First-Time Setup

When you launch CalGrid for the first time, you will see the **License Activation** screen before the main application opens.

---

## License Activation Screen

CalGrid requires a valid license key to operate. The activation screen appears every time you start CalGrid until a valid license session is established.

### What You See

The activation screen shows:

- The CalGrid logo and name
- A **License Key** input field
- A **Show / Hide** toggle for the key
- A **Verify License & Continue** button
- A status message below the button

### How to Activate

1. Obtain your license key from your seller or distributor.
2. Launch CalGrid — the activation screen appears automatically.
3. Click the **License Key** field and paste your license key.
4. Click **Verify License & Continue** (or press **Enter**).
5. CalGrid connects to the license server to verify your key.
6. When verification succeeds, the main application opens automatically.

> **Tip:** Use the **Show** button to reveal the key and confirm you pasted it correctly.

---

## License Status Messages

| Message | Meaning |
|---|---|
| *Enter the license key provided with your purchase.* | Ready — waiting for your key |
| *Verifying your license...* | License check is in progress |
| *Invalid license key. Please check and try again.* | Key is incorrect or not recognized |
| *This license has expired. Please renew to continue.* | Your license subscription has ended |
| *Unable to verify. Check your connection and try again.* | Internet connection issue |
| *Device limit reached for this license.* | The key has been used on the maximum number of devices |

---

## After Activation

Once CalGrid opens, you will see the main workspace. Before sending invitations, you need to connect a Google account to each workspace.

See [Google API Setup](google-api-setup.md) for the full Google Calendar connection guide.

---

## License and Session Behavior

- CalGrid maintains a live license session while running. Do not block internet access during use.
- If the license server becomes temporarily unavailable, CalGrid may enter an **Offline Grace** period — existing sessions remain active for a limited time.
- If your license is revoked or expires during use, CalGrid will show a notification and require re-verification on the next launch.
- Your license key is **never stored** in any file on disk. It is verified in memory and then discarded.

---

## Related Pages

- [Installation](installation.md)
- [Google API Setup](google-api-setup.md)
- [Troubleshooting — License Issues](../help/troubleshooting.md#license-issues)
