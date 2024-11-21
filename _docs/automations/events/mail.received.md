---
title: mail.received
excerpt: This page provides information on the "mail.received" automation events in
  Cerb, which are designed to respond to incoming messages once they are added to
  a ticket.
summary: This page provides information on the "mail.received" automation events in
  Cerb, which are designed to respond to incoming messages once they are added to
  a ticket. It explains how these events can be used, such as sending an automatic
  reply confirmation for new tickets. The page details the placeholders available
  in the automation event dictionary, including keys like `is_new_ticket` to determine
  if a message is opening a new ticket or replying to an existing one, and `message_*`
  for accessing the message record with key expansion. There are no outputs specified
  for these events.
permalink: /docs/automations/events/mail.received/
toc:
  title: mail.received
  expand: Automations
jumbotron:
  title: mail.received
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Events &raquo;
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