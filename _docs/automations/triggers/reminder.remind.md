---
title: reminder.remind
excerpt: This page provides information about the "reminder.remind" automation trigger
  in Cerb, which is activated by a reminder alarm.
summary: This page provides information about the "reminder.remind" automation trigger
  in Cerb, which is activated by a reminder alarm. It explains that this trigger utilizes
  event handler KATA, executing all enabled automations. The page details the inputs
  available in the automation dictionary, including custom input values from the caller
  and the reminder record, which supports key expansion. There are no outputs specified
  for this trigger.
permalink: /docs/automations/triggers/reminder.remind/
toc:
  title: reminder.remind
  expand: Automations
jumbotron:
  title: reminder.remind
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Triggers &raquo;
    url: /docs/automations/#triggers
---

**reminder.remind** [automations](/docs/automations/) are triggered by a [reminder](/docs/reminders/) alarm.

This trigger uses [event handler](/docs/automations/#events) KATA, and all enabled automations are executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller
| `reminder_*` | record | The [reminder](/docs/records/types/reminder/) record (supports key expansion)

# Outputs

(none)