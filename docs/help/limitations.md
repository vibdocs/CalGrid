---
title: "Limitations & Boundaries"
description: "Known system limits, Google API quotas, and platform boundaries."
order: 4
---
# Known Limitations & Boundaries

To ensure safe, predictable, and compliant operation, this document details the architectural boundaries, API constraints, and intentional limitations of CalGrid.

---

## 1. Google API & Invitation Lifecycle

### "Done" Status vs. Inbox Delivery
- In CalGrid, an event marked **Done** indicates that Google Calendar API acknowledged event creation (`HTTP 200/201`).
- CalGrid **cannot track or verify email delivery** to the recipient's inbox. Google Calendar and Gmail apply internal spam filtering, recipient notification preferences, and sender reputation checks independently.
- Recipients who disable calendar notifications or whose mail providers flag external calendar invites may not receive an email alert.

### In-Flight Batches & Non-Retractable Requests
- When you click **■ Stop** or **❚❚ Pause**, CalGrid terminates subsequent scheduling immediately.
- However, any HTTP batch **already sent across the network** to Google cannot be recalled or aborted. Events within that in-flight batch may still be created on Google Calendar.
- CalGrid does **not delete or recall** previously dispatched calendar events. Sent invitations remain on the creator's and recipients' calendars unless removed manually via Google Calendar.

### Google API Quota & Anti-Abuse Controls
- Google enforces strict per-user and per-project quotas (typically 600 requests per minute per user, plus daily event creation and attendee limits).
- Sending to too many external recipients too quickly from a new or un-warmed Google account can trigger temporary Google API throttling (`HTTP 429 Too Many Requests`) or account suspension.
- CalGrid's cooperative rate limiter, human jitter, and exponential backoff mitigate quota issues, but cannot bypass Google's remote server policies.

### Service Account Restrictions
- Standard Google Service Account credentials (`service_account` JSON) cannot send external calendar invitations without **Google Workspace Domain-Wide Delegation**.
- For regular personal accounts (`@gmail.com`) or standard Google Workspace setups, always use an **OAuth 2.0 Desktop Client JSON** (`installed`).

---

## 2. Operating System & Platform

### Windows 64-Bit Only
- CalGrid is compiled and verified strictly for **Windows 10 (64-bit)** and **Windows 11 (64-bit)**.
- macOS, Linux, and 32-bit Windows architectures are unsupported.

### Single-User DPAPI Encryption
- Workspace states, receiver lists, and execution logs are encrypted at rest using **Windows Data Protection API (DPAPI)**.
- Encrypted data is cryptographically tied to the active Windows user account. 
- Transferring `%LOCALAPPDATA%\CalGrid` files to a different PC, another user profile on the same PC, or restoring files after a clean Windows reinstallation will render saved receiver lists and session logs unreadable.

---

## 3. Concurrency & Workspace Limits

### One Worker Per Workspace
- Each workspace tab runs exactly one background daemon worker thread. Multiple workers cannot be attached to the same workspace tab simultaneously.
- To dispatch across multiple accounts or queues in parallel, create separate workspace tabs.

### Memory & Log Retention
- The live log viewer retains up to the configured limit (100 to 10,000 entries, default 2,000) to maintain low memory usage and high-density rendering speed.
- Older entries are trimmed automatically from the live visual log.

---

## 4. Licensing & Network Connectivity

### Continuous License Verification
- CalGrid requires an active internet connection on startup to verify license signatures with `https://ivib.cc`.
- If the license server becomes temporarily unreachable while running, CalGrid provides a short offline grace period. Once the grace window lapses, dispatching is locked until connectivity is restored.
- Hardware fingerprinting binds the license session to the active machine. Concurrent usage across multiple machines with a single-device license key is blocked.

---

## Related Pages

- [Troubleshooting](troubleshooting.md)
- [Frequently Asked Questions](faq.md)
- [Dispatch Controls](../guides/dispatch-controls.md)
- [Settings Reference](../settings/application-settings.md)
