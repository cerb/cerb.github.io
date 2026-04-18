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

# Legacy behaviors

When both automations and legacy [bot](/docs/records/types/bot/) behaviors are active on the `mail.sent` event, they run in this order based on automation [priority](/docs/automations/#priority):

| Priority | Execution order |
|-|-|
| 0–127 | Automation runs **before** legacy behaviors |
| 128–255 | Automation runs **after** legacy behaviors |

This ordering was introduced in [11.1.8](/releases/11.1.8/). Prior to that version, automations always ran before legacy behaviors regardless of priority.