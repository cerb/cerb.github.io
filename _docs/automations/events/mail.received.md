---
title: "mail.received"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/mail.received/
toc:
  title: mail.received
  expand: Automations
jumbotron:
  title: mail.received
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

**mail.received** [automation](/docs/automations/) [events](/docs/automations/#events) can react to received messages after they are appended to a ticket. For instance, sending an auto-reply confirmation to new tickets.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
|`is_new_ticket` | bool | `true` if the message opened a new ticket, `false` if a reply to an existing ticket
|`message_*` | record | The [message](/docs/records/types/message/) record. Supports key expansion.

# Outputs

(none)