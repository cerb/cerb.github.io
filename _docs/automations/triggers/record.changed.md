---
title: "record.changed"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/record.changed/
toc:
  title: record.changed
  expand: Automations
jumbotron:
  title: record.changed
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

**record.changed** [automations](/docs/automations/) are triggered when one or more record fields change.

This trigger uses [event handler](/docs/automations/#events) KATA, and the first enabled automation is executed.

* TOC
{:toc}

# Inputs

The automation [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `actor_*` | record | The current actor dictionary. Supports key expansion.
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller.
| `is_new` | boolean | `true` if the record was created during the current request.
| `record_*` | record | The new [record](/docs/records/types/) dictionary. Supports key expansion.
| `was_record_*` | record | The former [record](/docs/records/types/) dictionary. Supports key expansion.

# Outputs

(none)
