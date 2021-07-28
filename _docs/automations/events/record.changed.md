---
title: "record.changed"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/record.changed/
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
    label: Events &raquo;
    url: /docs/automations/#events
---

**record.changed** [automation](/docs/automations/) [events](/docs/automations/#events) are triggered whenever one or more fields are changed on a [record](/docs/records/types/).

In the events KATA, all enabled automations are executed in order.

Automations can dynamically be enabled/disabled by record type, field values, or actor.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
| `actor_*` | record | The current actor dictionary. Supports key expansion.
| `inputs` | dictionary | [Custom input](/docs/automations/#inputs) values from the caller.
| `is_new` | boolean | `true` if the record was created during the current request.
| `record_*` | record | The new [record](/docs/records/types/) dictionary. Supports key expansion.
| `was_record_*` | record | The former [record](/docs/records/types/) dictionary. Supports key expansion.

# Outputs

(none)