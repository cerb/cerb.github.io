---
title: mail.reply.validate
excerpt: This page provides detailed information on the `mail.reply.validate` automation
  events in Cerb, which are used to implement interactive custom validators before
  replying to emails.
summary: This page provides detailed information on the `mail.reply.validate` automation
  events in Cerb, which are used to implement interactive custom validators before
  replying to emails. These validators function similarly to worker interactions and
  can be configured to check recent worker activity to prevent duplication of effort.
  The page explains how interactive validators can allow workers to bypass warnings
  and proceed with sending emails, unlike non-interactive validators that would require
  error correction before continuing. It also outlines the structure of the automation
  event dictionary, including placeholders and outputs, and emphasizes the importance
  of filtering unnecessary validators to optimize the process.
permalink: /docs/automations/events/mail.reply.validate/
toc:
  title: mail.reply.validate
  expand: Automations
jumbotron:
  title: mail.reply.validate
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Automations &raquo;
    url: /docs/automations/
  - label: Events &raquo;
    url: /docs/automations/#events
---

**mail.reply.validate** [automation](/docs/automations/) [events](/docs/automations/#events) implement interactive custom validators before replying to email. These automations have the same functionality as worker interactions. 

For example, checking recent worker activity to avoid duplication of effort.

Interactive validators are configured on the `mail.reply.validate` automation event, and all enabled automations will run in sequence.

Through interactivity, a validator can allow a worker to bypass a warning and continue sending; whereas non-interactive custom validators would reject with an error message that a worker would have to correct before continuing.

While the most efficient option is to filter unneeded validators from the event, a `mail.reply.validate` automation that exits without an `await:` is silent and never opens the interaction popup.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key             | Type       | Notes                                                                            |
|-----------------|------------|----------------------------------------------------------------------------------|
| `caller_name`   | string     | The [caller](#callers) which started the interaction.                            |
| `caller_params` | dictionary | Built-in parameters based on the caller type.                                    |
| `inputs`        | dictionary | [Custom input](/docs/automations/#inputs) values from the caller.                |
| `message_*`     | record     | The [message](/docs/records/types/message/) record. Supports key expansion.      |
| `worker_*`      | record     | The active [worker](/docs/records/types/worker/) record. Supports key expansion. |

# Outputs

| Key       | Type   | Notes                                                                          |
|-----------|--------|--------------------------------------------------------------------------------|
| `reject:` | string | If set, sending the message is aborted. If omitted, message sending continues. |
