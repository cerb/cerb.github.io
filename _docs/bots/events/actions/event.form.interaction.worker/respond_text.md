---
title: >-
  Bot Action: Respond with text
permalink: /docs/bots/events/event.form.interaction.worker/actions/respond_text/
toc:
  expand: Bots
jumbotron:
  title: >-
    Respond with text
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Events &raquo;
    url: /docs/bots/events/
  -
    label: >-
      Form interaction &raquo;
    url: /docs/bots/events/event.form.interaction.worker/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.form.interaction.worker/#event-actions
---

|---
|-|-
| **Identifier (ID):** | respond_text
| **Event:** | event.form.interaction.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `message` | text | The message to send to the user
|  | `format` | text | The format of the message: `markdown`, `html`, or omit for plaintext
