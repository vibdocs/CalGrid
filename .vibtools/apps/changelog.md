# CalGrid — Changelog

All releases are Windows x64 standalone builds (Nuitka-compiled, no Python required).  
Download and integrity verification via `installer.ps1` from [get.vib.tools/calgrid](https://get.vib.tools/calgrid).

---

## v1.0.4 — 2026-11-20

**LicenX SDK 1.2.7 · License session stability**

- Stabilized license session management and LicenX SDK integration.
- Pinned `licenx[realtime]==1.2.7` for verified realtime license validation.
- Delivery optimization and drive/meet fault tolerance carry-over from v1.0.3.
- **SHA256:** `e4178cc65e511d98401ecb25500fa100aaaf5056d6a7272d679f0e55db1ca108`
- **ZIP size:** 183 MB

---

## v1.0.3 — 2026-11-20

**Expanded dynamic tags (15 new tags) · Deliverability improvements**

### New Dynamic Tags
- Added `{firstname}` / `{first_name}` and `{lastname}` / `{last_name}` — split from email username with robust fallbacks.
- Added `{random_invo}` / `{invo}` — deterministic `INV-XXXXXXX` invoice code synchronized across all event fields per recipient.
- Added `{alphanum}` / `{random2}` — 6-character alphanumeric random salt.
- Added `{uuid}` — 8-character hex UUIDv4 token.
- Added `{number_5}`, `{number_10}`, `{number}` — fixed-width zero-padded numeric salts.
- Added `{license_key}` — `XXXX-XXXX-XXXX-XXXX` format software license key.
- Added `{price}` — random transaction amount (`$199.99`–`$999.99`).
- Added `{usa_name}`, `{uk_name}`, `{spain_name}` — realistic persona full names from 20×20 pools.
- Added `{address}` and `{add_s}` — random US and Spanish street addresses.

### Cross-Field Determinism
- All random tags now share a single `shared_context` per recipient — identical values appear in event title, description, location, and attachment filename for each recipient.

### Attachment Security & Filesystem Safety
- Currency symbols (`$`) stripped from attachment filenames; commas replaced with hyphens.
- Zero-width Unicode Category Cf characters removed from filenames (MITRE ATT&CK T1036.002 compliance).
- Attachment filenames capped at 150 characters with Unicode NFKC normalization.

### UI Synchronization
- Tags Dialog updated with category filtering and search for all 27+ tags.
- Attachment Name Dialog tag count and search placeholder scale dynamically.
- Calendar Preview Dialog uses deterministic `preview_context` for synchronized live preview.

### Deliverability & Settings
- Settings sync, Drive and Meet fault tolerance improvements.
- LicenX SDK updated to `1.2.7`.

- **SHA256:** `f9ba647c00b2068fae408c16b81c741658631a9d633c82a2cb31e73339904f26`
- **ZIP size:** 183 MB

---

## v1.0.2 — 2026-11-16

**Standalone Windows build · Local packaging pipeline**

- First production-packaged standalone Windows x64 EXE build via Nuitka 4.2.2 / Python 3.12.8.
- Removed Forgejo CI release pipeline; build is local Windows only via `build.py`.
- Pinned `licenx[realtime]==1.2.6`.
- Existing template tags: `{name}`, `{email}`, `{username}`, `{domain}`, `{company}`, `{id}`, `{ref}`, `{random}`, `{date}`, `{time}`, `{day}`, `{duration}`, `{brand}`, `{sender}`, `{file_stem}`, `{file_ext}`, `{file_no}`, `{recipient_no}`, `{date_compact}`, `{time_compact}`, `{spin:A|B|C}`.
- Multi-workspace tab system, Google Drive attachment pipeline, Brand Identity system, all operational.
- **SHA256:** `6a81522bc441fa37e059f4ac10ab1df3bfcaa68939994f2e91364c8b427cf510`
- **ZIP size:** 183 MB
