---
title: "Dispatch Controls"
description: "Start, pause, resume, and stop campaign dispatches with state preservation."
order: 7
---
# Dispatch Controls

The dispatch controls — **Start**, **Pause**, **Resume**, and **Stop** — manage the execution of your calendar campaign.

---

## The Four Controls

| Button | Label | Action |
|---|---|---|
| ▶ | **Start** | Begin dispatching invitations to all recipients |
| ❚❚ | **Pause** | Pause after the current batch completes |
| ▶ | **Resume** | Continue from where the job was paused |
| ■ | **Stop** | Cancel remaining recipients (cannot undo) |

---

## Start

**When to use:** After you have configured your event details, recipients, and Google account.

**What happens:**
1. CalGrid validates the event name, date/time, and recipient list.
2. If attachments are configured, CalGrid uploads them to Google Drive first.
3. CalGrid begins creating Google Calendar events in batches.
4. The Progress panel updates in real time.
5. The Start button becomes disabled; Pause and Stop become active.

**Requirements before starting:**
- Google account must be connected (🔓 Disconnect shown in sidebar)
- Event name must not be empty
- Date must be in the future
- At least one valid recipient email must be present
- A valid license session must be active

---

## Pause

**When to use:** To temporarily halt dispatch without losing progress.

**What happens:**
1. CalGrid finishes the current in-flight batch of requests (already sent to Google).
2. No new batches are started after the current one completes.
3. The status bar shows **Paused** in amber.
4. The Pause button is replaced by Resume and Stop.

> **Important:** Pausing does not cancel requests that have already been sent to Google. Those invitations may still be created even after you click Pause.

---

## Resume

**When to use:** After pausing, to continue sending to remaining recipients.

**What happens:**
1. CalGrid picks up from where it left off.
2. Recipients who already received invitations are not contacted again.
3. The job continues until all recipients are processed or you Stop.

---

## Stop

**When to use:** To permanently end the campaign before all recipients are processed.

**What happens:**
1. CalGrid stops scheduling any new batches.
2. Any batch **already sent** to Google cannot be recalled — those invitations may still be created.
3. The Progress panel shows final Total / Done / Fail counts.
4. All controls return to their initial state.

> **Warning:** Stop is not the same as deleting sent invitations. Google Calendar events that were already created will remain on recipients' calendars. CalGrid has no ability to delete or recall sent invitations.

---

## Button States

| State | Available Buttons |
|---|---|
| Idle (no job) | **▶ Start** only |
| Running | **❚❚ Pause**, **■ Stop** |
| Paused | **▶ Resume**, **■ Stop** |
| Completed | **▶ Start** (to send a new campaign) |

---

## Dispatch Mode Effect

The [Dispatch Mode](dispatch-modes.md) (Safe / Normal / Fast / Ultra) affects how many invitations are sent per batch and the pacing between batches. You should select your dispatch mode **before** clicking Start, as it cannot be changed during an active job.

---

## Related Pages

- [Progress Monitoring](progress-monitoring.md)
- [Dispatch Modes](dispatch-modes.md)
- [Troubleshooting](../help/troubleshooting.md)
