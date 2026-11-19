---
title: "Troubleshooting Guide"
description: "Step-by-step solutions for license, Google auth, deliverability, and app errors."
order: 2
---
# Troubleshooting

Solutions for common problems in CalGrid.

---

## License Issues {#license-issues}

### "Invalid license key. Please check and try again."

**Cause:** The key was entered incorrectly, or the key is not registered.

**Solutions:**
- Use the **Show** button to reveal the key and verify there are no extra spaces
- Copy-paste the key directly from the email or purchase confirmation
- Contact your seller to verify the key is active

---

### "This license has expired. Please renew to continue."

**Cause:** Your license subscription period has ended.

**Solution:** Renew your license through your seller or distributor, then enter the new key.

---

### "Device limit reached for this license."

**Cause:** The license key has been used on the maximum number of Windows PCs allowed.

**Solution:** Contact your seller to remove old device bindings or upgrade your license.

---

### "Unable to verify. Check your connection and try again."

**Cause:** CalGrid cannot reach the license verification server.

**Solutions:**
- Check that you have an active internet connection
- Temporarily disable any firewall or VPN that may be blocking outbound HTTPS connections to `ivib.cc`
- Try again after a few minutes

---

### CalGrid shows the license screen every time I start

**Cause:** The license session could not be re-established, or the license service is unavailable.

**Solutions:**
- Verify your internet connection is active
- Enter your license key again
- Check if your license has expired

---

## Google Auth Issues {#google-auth-issues}

### "⏳ Verify..." stays indefinitely after restart

**Cause:** The background credential verification is not completing.

**Solutions:**
- Wait up to 20 seconds — the check has a built-in timeout
- If still stuck, click **🔗 Connect** to manually re-authorize

---

### Browser opens but nothing happens after Google sign-in

**Cause:** The OAuth callback did not reach CalGrid's local listener.

**Solutions:**
- Ensure no other application is blocking `localhost` on the callback port
- Try closing and reopening CalGrid, then clicking **🔗 Connect** again
- Use a Desktop app OAuth client JSON (not Web application type)

---

### "✓ JSON" button shows but Connect button is disabled

**Cause:** A dispatch job is active, preventing auth changes during operation.

**Solution:** Stop the current job, then connect your Google account.

---

### After reconnecting, old workspace is still not connected

**Cause:** The workspace state did not update correctly.

**Solution:** Click **🔗 Connect** in the sidebar of the specific workspace that is not connected.

---

## Dispatch and Delivery Issues {#deliverability}

### Many recipients show as "Fail"

**Causes and solutions:**

| Cause | Solution |
|---|---|
| Google API quota exceeded | Switch to **Safe** or **Normal** mode; wait and retry later |
| Invalid email addresses | Use **✂ Remove Duplicates** and manually check for malformed addresses |
| Temporary Google service outage | Check [Google Workspace Status](https://www.google.com/appsstatus) and retry later |
| Rate limit too high | Lower the API Rate Limit in Settings |

---

### Invitations are not arriving in recipients' inboxes

**Important:** CalGrid creates Google Calendar events — it does not control Gmail delivery.

**Possible reasons:**
- Recipient's Gmail is filtering invitations from unknown senders
- Recipient's Google Calendar settings reject automatic invitations
- Google anti-spam filters detected repeated identical messages (use Invisible Entropy and Spintax)

**What you can verify:**
- Check the Debug log for HTTP 200 responses — this confirms Google accepted the event
- Ask a test recipient to check their Spam folder and Google Calendar

---

### Campaign is running very slowly

**Causes and solutions:**

| Cause | Solution |
|---|---|
| Human Jitter is adding delays | Expected behavior in Safe/Normal mode; switch to Fast mode for speed |
| Rate limit is set very low | Increase API Rate Limit in Settings |
| Exponential backoff is active | Google is rate-limiting; reduce batch size and rate |

---

### "Start" button does nothing when clicked

**Causes:**
- Google account not connected — connect first
- Event name is empty — add an event title
- Date is in the past — set a future date/time
- Recipient list is empty — add at least one email
- License session is not active — verify your license

---

## Attachment Issues {#attachment-issues}

### "Drive Guide" dialog appears when attaching files

**Cause:** Google Drive API is not enabled in your Google Cloud project.

**Solution:** Follow the steps in the Drive Guide dialog to enable the Drive API and reconnect your account.

---

### Attachment upload fails at campaign start

**Causes and solutions:**

| Cause | Solution |
|---|---|
| Drive API not authorized | Reconnect your Google account after enabling Drive API |
| File is too large | Reduce file size or compress before attaching |
| File is locked by another application | Close the file in other programs before attaching |

---

## Startup Issues {#startup-issues}

### CalGrid doesn't start (double-clicking RUN_CalGrid.bat)

**Solutions:**
- Ensure Python 3.12 is installed and accessible as `py`
- Verify that `pip install -r requirements.txt` completed without errors
- Run from Command Prompt to see the error output:
  ```
  .venv\Scripts\python.exe main.py
  ```

---

### "PySide6 is required" error on startup

**Solution:** Run:
```powershell
.venv\Scripts\python.exe -m pip install -r requirements.txt
```

---

### Application crashes immediately after license activation

**Cause:** A missing dependency or incompatible Python version.

**Solution:**
- Verify Python 3.12 is installed: `py --version`
- Reinstall dependencies: `.venv\Scripts\python.exe -m pip install -r requirements.txt`

---

## Data and Settings Issues

### My workspace data was lost after reinstalling Windows

**Cause:** Workspace data is stored in `%LOCALAPPDATA%\CalGrid\` and is encrypted using Windows DPAPI (tied to your Windows user account). Data encrypted under a previous Windows installation cannot be decrypted on a new installation.

**Prevention:** Back up `%LOCALAPPDATA%\CalGrid\` before reinstalling Windows. The backup is usable only on the same Windows user account.

---

### Settings I changed are not saving

**Solutions:**
- Ensure the `%LOCALAPPDATA%\CalGrid\` folder exists and is writable
- Try running CalGrid as your normal user (not as Administrator)
- Check available disk space

---

## Related Pages

- [FAQ](faq.md)
- [Limitations](limitations.md)
- [Debug Dialog](../guides/debug-dialog.md)
