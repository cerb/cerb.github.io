---
title: mail.sent
excerpt: This page provides information about the "mail.sent" automation events in
  Cerb, which are designed to execute actions after a worker sends an outgoing message.
summary: This page provides information about the "mail.sent" automation events in
  Cerb, which are designed to execute actions after a worker sends an outgoing message.
  It outlines the available placeholders within the automation event dictionary, specifically
  focusing on the message record and its key expansion capabilities. The page notes
  that there are no outputs associated with these automation events.
permalink: /docs/automations/events/mail.sent/
toc:
  title: mail.sent
  expand: Automations
jumbotron:
  title: mail.sent
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Events &raquo;
    url: /docs/automations/#events
---

**mail.sent** [automation](/docs/automations/) [events](/docs/automations/#events) can perform actions after an outgoing message is sent by a worker.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
|`message_*` | record | The [message](/docs/records/types/message/) record. Supports key expansion.

# Outputs

(none)