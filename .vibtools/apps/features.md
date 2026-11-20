# CalGrid — Feature Reference

CalGrid is a Windows desktop application for dispatching personalized Google Calendar invitations in bulk. All features listed here are live and verified in the current release.

---

## Core Dispatch Engine

- **Batch Google Calendar invitations** — Creates one real Calendar event per recipient with attendee, unique client-generated event ID, date, time, duration, location, and message body.
- **Google Calendar HTTP batching** — Up to `min(100, configured batch size, configured request/s limit)` events per HTTP batch for throughput efficiency.
- **Cooperative rate limiter** — Shared token-bucket rate limiter across all workspace tabs; configurable requests-per-second ceiling.
- **Capped exponential backoff with jitter** — Automatic retry on transient API errors with configurable retry limit.
- **Duplicate prevention** — SQLite job ledger stores stable recipient hashes and event IDs to prevent re-dispatching the same recipient after crash or restart.
- **Pause / Resume / Stop controls** — Mid-dispatch flow control with clean semantics: Stop halts new batches; in-flight HTTP batches already sent to Google cannot be retracted.

---

## Anti-Spam Personalization Engine

CalGrid's template engine resolves dynamic tags per-recipient for each field (event name, description, location, attachment filename):

### Recipient Identity Tags
- `{name}` — Capitalized first name from email prefix
- `{firstname}` / `{first_name}` — First name token split from username
- `{lastname}` / `{last_name}` — Second name token with `Customer` fallback
- `{username}` — Email local-part before `@`
- `{email}` — Full recipient email address
- `{domain}` — Recipient's email domain
- `{company}` — Capitalized first segment of domain

### Anti-Spam / Tracking Reference Tags
- `{id}` — 6-character uppercase alphanumeric tracking ID
- `{ref}` — Prefixed tracking code (`REF-` + `{id}`)
- `{random}` — 5-digit random numeric salt
- `{random_invo}` / `{invo}` — 7-digit invoice code (`INV-XXXXXXX`), deterministic across all fields per recipient
- `{alphanum}` / `{random2}` — 6-character random alphanumeric salt
- `{uuid}` — 8-character hex UUIDv4 token
- `{number_5}` — 5-digit numeric salt with leading zeros
- `{number_10}` — 10-digit numeric salt with leading zeros
- `{number}` — 7-digit numeric salt with leading zeros

### Commerce & Licensing Tags
- `{license_key}` — 16-character license key (`XXXX-XXXX-XXXX-XXXX`)
- `{price}` — Random transaction amount (`$199.99`–`$999.99`)

### Persona Name Tags
- `{usa_name}` — Random US full name from 20×20 pool
- `{uk_name}` — Random UK full name from 20×20 pool
- `{spain_name}` — Random Spanish full name from 20×20 pool

### Address Tags
- `{address}` — Random US street address
- `{add_s}` — Random Spanish street address

### Brand & Schedule Tags
- `{brand}` — Active workspace brand name
- `{sender}` — Authenticated Google sender email
- `{date}` — Scheduled event date (YYYY-MM-DD)
- `{time}` — Start time in 12-hour format
- `{day}` — Day of the week
- `{duration}` — Duration in minutes

### Spintax
- `{spin:A|B|C}` — Multi-option word rotator; supports nested dynamic tags inside options

### Cross-Field Determinism
All random / generated tags share a single `shared_context` per recipient — the same `{random_invo}`, `{alphanum}`, `{license_key}`, etc. appears identically in the event title, description, location, and attachment filename for that recipient.

---

## Multi-Workspace Tab System

- Up to N independent workspace tabs, each with its own Google credentials, recipient list, event data, attachments, and dispatch worker.
- Add, close, rename, and switch tabs via the tab bar or keyboard shortcuts (`Ctrl+T`, `Ctrl+W`, `Ctrl+Tab`).
- Background workspaces continue dispatching independently while other tabs are active.

---

## Google Drive Attachment Pipeline

- Multiple attachments per workspace, each uploaded to Google Drive before dispatch.
- Attachment filenames support the full dynamic tag catalog (including date/time, recipient, anti-spam tokens).
- Filesystem-safe normalization: currency symbols stripped, commas replaced with hyphens.
- Attachment filename length capped at 150 characters with Unicode NFKC normalization.
- If Google Drive API is not enabled, `DriveGuideDialog` triggers with step-by-step resolution instructions.

---

## Google OAuth 2.0 Authentication

- Authenticates via official Google Desktop OAuth 2.0 client JSON files.
- Tokens stored securely in **Windows Credential Manager** (DPAPI-protected); never written to project files or logs.
- Background credential verification on launch restores authenticated state without re-login.
- One connected Google account per workspace tab.

---

## Brand Identity System

- Configure a custom brand name and secondary Calendar ID per workspace via `BrandDialog`.
- When enabled, event titles are formatted as `[Brand] Event Title` and `Organizer: Brand` is injected into the event description.
- Clean brand removal resets workspace to standard personal scheduling.

---

## Live Preview & UI Dialogs

- **Calendar Preview Dialog** — Live per-recipient preview of event name, meeting link, and message body with deterministic token rendering.
- **Tags Dialog** — Interactive catalog of all 27+ supported dynamic tags with category filtering, search, and 1-click clipboard copy.
- **Attachment Name Dialog** — Live preview of attachment filename templates with full dynamic tag autocomplete.
- **Debug Dialog** — Live worker diagnostics, rate monitor, and log stream.
- **Settings Dialog** — Full configuration across Rate, Calendar, Invites, App, and Reminders categories.

---

## Application Settings

- **Rate Control** — Requests per second, batch size, retry count, and retry delay.
- **Calendar Options** — Send updates mode (`all`, `externalOnly`, `none`), Meet link generation, reminder configuration.
- **Dispatch Modes** — Normal, Test (send to self only), and Offline Test Runner modes.
- **Offline Test Runner** — Validates dispatch behavior and tag rendering without consuming Google API quota.
- **Windows Notifications** — Toast notifications and finish alert sound on dispatch completion.

---

## Technical Specifications

- **Platform:** Windows 10/11 x64 (no administrator privileges required)
- **Runtime:** Nuitka-compiled standalone — no Python installation required by end users
- **Build tool:** Python 3.12.8 + Nuitka 4.2.2
- **UI framework:** PySide6 / Qt Widgets
- **Storage:** `%LOCALAPPDATA%\CalGrid\` (session, settings, SQLite ledger)
- **Security:** Windows Credential Manager (DPAPI) for OAuth tokens; SQLite ledger for duplicate prevention
