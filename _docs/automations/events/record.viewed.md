---
title: "record.viewed"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/record.viewed/
toc:
  title: record.viewed
  expand: Automations
jumbotron:
  title: record.viewed
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

**record.viewed** [automation](/docs/automations/) [events](/docs/automations/#events) are invoked after a [worker](/docs/workers/) views a [record](/docs/records/) profile.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key        | Type   | Notes                                                                                 |
|------------|--------|---------------------------------------------------------------------------------------|
| `record_*` | record | The viewed [record](/docs/records/) dictionary. Supports key expansion.               |
| `worker_*` | record | The current [worker](/docs/records/types/worker/) dictionary. Supports key expansion. |

# Outputs

(none)