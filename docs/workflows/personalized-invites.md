---
title: "Personalized Invitations"
description: "Compose dynamic, personalized invitations using tags and spintax."
order: 5
---
# Personalized Invites

This workflow shows how to create invitations that are uniquely personalized for each recipient using CalGrid's template tag and spintax engine.

---

## Overview

Personalization helps your invitations feel individual rather than mass-sent. CalGrid supports:

- **Name and email tags** — insert the recipient's name, first name, domain, etc.
- **Date and time tags** — show each recipient their personal appointment time (useful with Slot Stagger)
- **Spintax rotation** — vary the wording across recipients to avoid repetitive patterns

---

## Step 1 — Write Your Message with Tags

In the **Message (Description)** field of the Event Details panel, write your invitation using tags:

```
Dear {name},

We'd like to invite you to {spin:our upcoming webinar|our online session|a live demo} on {date} at {time}.

The session is designed for {domain} professionals like yourself.

Looking forward to seeing you,
The Events Team
```

Each recipient receives a unique version:
- `John` at `acme.com` might get: "Dear John, We'd like to invite you to our upcoming webinar on 2026-12-15 at 10:00 AM. The session is designed for acme.com professionals..."
- `Sarah` at `techcorp.com` might get: "Dear Sarah, We'd like to invite you to a live demo on 2026-12-15 at 10:15 AM. The session is designed for techcorp.com professionals..."

---

## Step 2 — Add Tags to the Event Title (Optional)

You can also use tags in the event name:

```
{name}'s Strategy Call
```

This creates events titled "John's Strategy Call", "Sarah's Strategy Call", etc.

---

## Step 3 — Enable Slot Stagger for Appointment-Style Scheduling

For appointment scheduling (each recipient at a different time):

1. Open **Settings** (`Ctrl + ,`).
2. Go to the **🛡️ Advance** category.
3. Enable **Time-Staggered Slot Booking**.
4. Set the **Slot Stagger Interval** (e.g., 15 minutes).
5. Click **Save Settings**.

With stagger enabled:
- Recipient 1 gets an event at your base time (e.g., 10:00 AM)
- Recipient 2 gets an event at 10:15 AM
- Recipient 3 gets an event at 10:30 AM
- And so on...

The `{time}` and `{date}` tags in your message automatically reflect each recipient's individual slot.

---

## Step 4 — Preview Your Message

Click **👁 Live Preview** (above the message editor) to see how the message renders for a sample recipient. Verify that all tags are filled in correctly.

---

## Step 5 — Open the Tags Reference

If you need to look up available tags:

1. Click **Template tags** (above the message editor), or
2. Click **🏷 Tags** in the bottom status bar.

The Tags dialog shows all tags with examples and copy buttons.

---

## Step 6 — Send the Campaign

Follow the standard [Sending Your First Campaign](sending-first-campaign.md) steps from Step 4 onward.

---

## Tips for Effective Personalization

| Tip | Detail |
|---|---|
| Use `{name}` for natural greetings | `{name}` extracts the capitalized first name (e.g., `john.doe@...` becomes `John`) |
| Test spintax with Live Preview | Verify all variants make grammatical sense |
| Combine stagger + time tags | For appointment-style scheduling with personalized times |
| Keep fallbacks in mind | If no name can be parsed from the email username, `{name}` safely falls back to `Friend` |

---

## Related Pages

- [Template Tags](../guides/template-tags.md)
- [Settings — Advance (Slot Stagger)](../settings/application-settings.md#advance-settings)
- [Event Details](../guides/event-details.md)
