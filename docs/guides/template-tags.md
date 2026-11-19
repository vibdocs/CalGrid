---
title: "Template Tags & Spintax"
description: "Personalize invitation content with dynamic recipient tags and spinning syntax."
order: 12
---
# Template Tags

CalGrid supports **dynamic template tags** that personalize each invitation with recipient-specific data. Use tags in the event name, message description, and other text fields.

---

## Overview

Template tags are placeholders written as `{tag_name}` that CalGrid replaces with real values for each recipient when creating events. For example, if a recipient's email is `john.doe@company.com`, the tag `{name}` becomes `John Doe`.

---

## Available Tags

### Recipient Identity Tags

| Tag | Example Output | Description |
|---|---|---|
| `{name}` | `John` | Recipient's capitalized first name derived from email prefix |
| `{username}` | `john.doe` | Email username portion before the `@` symbol |
| `{email}` | `john.doe@example.com` | Full recipient email address |
| `{domain}` | `example.com` | Recipient's email domain host |
| `{company}` | `Example` | Capitalized company name extracted from domain |

### Schedule & Calendar Tags

| Tag | Example Output | Description |
|---|---|---|
| `{date}` | `2026-12-15` | Scheduled event date (YYYY-MM-DD; reflects slot stagger) |
| `{time}` | `10:00 AM` | Scheduled start time in 12-hour format (reflects slot stagger) |
| `{day}` | `Wednesday` | Scheduled day of the week |
| `{duration}` | `30 mins` | Scheduled event duration |

### Anti-Spam & Reference Tags

| Tag | Example Output | Description |
|---|---|---|
| `{id}` | `A7B2X9` | Deterministic 6-char alphanumeric code unique to this recipient |
| `{ref}` | `REF-A7B2X9` | Formatted tracking reference token |
| `{random}` | `48291` | Unique 5-digit random number per invite |
| `{spin:A\|B\|C}` | `A` or `B` or `C` | Spintax rotator (deterministic selection per recipient) |

### Brand & Sender Tags

| Tag | Example Output | Description |
|---|---|---|
| `{brand}` | `Acme Corp` | Active brand identity name configured in workspace |
| `{sender}` | `outreach@company.com` | Connected Google sender account email |

---

## Using Tags in Fields

Tags work in:
- **Event name (title)**
- **Message (description)**
- **Meeting Link / Location** (plain text portions)

### Example — Personalized Message

```
Hi {name},

You are invited to our {spin:annual|quarterly|monthly} review meeting with {brand}.

Your appointment is scheduled for {day}, {date} at {time} ({duration}).

Tracking Ref: {ref}
```

Each recipient receives a unique version:
- `john.doe@acme.com` might get: "Hi John, You are invited to our annual review meeting with Acme... scheduled for Wednesday, 2026-12-15 at 10:00 AM (30 mins). Tracking Ref: REF-A7B2X9"
- `sarah.connor@tech.org` might get: "Hi Sarah, You are invited to our quarterly review meeting with Acme... scheduled for Wednesday, 2026-12-15 at 10:15 AM (30 mins). Tracking Ref: REF-C4F1E8"

---

## Spintax

Spintax allows you to rotate through multiple versions of text for each recipient:

```
{spin:Good morning|Hello|Hi there}
```

CalGrid selects one option per recipient based on a deterministic algorithm — the same recipient always gets the same option for the same campaign. This ensures consistency without being completely random.

You can nest spintax and combine it with identity tags:

```
{spin:Dear {name}|Hi {name}|Hello {name}}
```

---

## Opening the Tags Reference

Access the complete interactive tags reference by:

- Clicking **Template tags** (link above the message editor in the Event Details panel)
- Clicking **🏷 Tags** in the bottom status bar

The Tags dialog shows all available tags with examples and allows 1-click copy to clipboard.

### Tags Dialog Controls

| Element | Function |
|---|---|
| Search box | Filter tags by name or description |
| Category pills | Filter by category (All, Identity, Date, Spintax, etc.) |
| Tag pill (click) | Copy the tag to clipboard |
| **Done** button | Close the dialog |

---

## Live Preview

Click **👁 Live Preview** (above the message editor) to see how the message will look for a sample recipient with all tags filled in. This helps verify your template before sending.

---

## Related Pages

- [Event Details](event-details.md)
- [Personalized Invites Workflow](../workflows/personalized-invites.md)
- [Settings — Advance (Slot Stagger)](../settings/application-settings.md#advance-settings)
