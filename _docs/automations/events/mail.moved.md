---
title: "mail.moved"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/mail.moved/
toc:
  title: mail.moved
  expand: Automations
jumbotron:
  title: mail.moved
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

**mail.moved** [automation](/docs/automations/) [events](/docs/automations/#events) trigger after a ticket is moved to a new group or bucket.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key            | Type   | Notes                                                                                                                                          |
|----------------|--------|------------------------------------------------------------------------------------------------------------------------------------------------|
| `actor_*`      | record | The current [actor](/docs/records/types/) record. Supports key expansion. `actor__type` is the record type alias (e.g. `automation`, `worker`) |
| `was_group_*`  | record | The [group](/docs/records/types/group/) record before the ticket was moved. Supports key expansion.                                            |
| `was_bucket_*` | record | The [bucket](/docs/records/types/bucket/) record before the ticket was moved. Supports key expansion.                                          |
| `ticket_*`     | record | The new state of the moved [ticket](/docs/records/types/ticket/). Supports key expansion.                                                      |

# Outputs

(none)
