---
title: "reminder.remind"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/reminder.remind/
toc:
  title: reminder.remind
jumbotron:
  title: reminder.remind
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Triggers &raquo;
    url: /docs/automations/#triggers
---

{% include docs/note_preview.html %}

**reminder.remind** [automations](/docs/automations/) are triggered by a [reminder](/docs/reminders/) alarm.

This trigger uses [event handler](/docs/automations/#event-handlers) KATA, and all enabled automations are executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller
| `reminder_*` | record | The [reminder](/docs/records/types/reminder/) record (supports key expansion)

# Outputs

## return:

This trigger doesn't expect any `return:` keys.