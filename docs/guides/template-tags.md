---
title: "Template Tags & Spintax"
description: "Personalize invitation content with dynamic recipient tags and spinning syntax."
order: 12
---
# Template Tags, Spintax & Formatting

Template tags insert values into invitation titles, messages, locations and supported attachment filenames.

## Useful tags

| Example | Meaning |
|---|---|
| `{name}`, `{firstname}`, `{lastname}` | Name derived from an email address |
| `{email}`, `{username}`, `{domain}`, `{company}` | Recipient address details |
| `{date}`, `{time}`, `{day}`, `{duration}` | Meeting schedule |
| `{brand}`, `{sender}` | Brand and connected sender |
| `{ref}`, `{random_invo}`, `{uuid}`, `{random}` | Generated reference values |

Additional tags—including number formats, region-based sample names and file name components—are listed in the in-app **Tags** picker.

## How to use tags

1. Place the cursor in a supported message or event field.
2. Choose **Template tags** or **Tags** in the footer and insert a tag.
3. Use **Live Preview** to check the result.

For alternate wording, type `{spin:Hello|Good day|Welcome}`. The app selects one option when rendering. Generated values are kept consistent between supported fields for the same recipient.

In the message toolbar you can also use **bold, italic, underline, strikethrough, lists, links and text styles**. Tags are not a substitute for checking the preview or obtaining recipient consent.

[Personalized invitations](../workflows/personalized-invites.md) · [Event details](event-details.md)
