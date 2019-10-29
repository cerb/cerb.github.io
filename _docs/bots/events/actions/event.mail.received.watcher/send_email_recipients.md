---
title: >-
  Bot Action: Send email to recipients
permalink: /docs/bots/events/event.mail.received.watcher/actions/send_email_recipients/
toc:
  expand: Bots
jumbotron:
  title: >-
    Send email to recipients
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
      New message on a watched ticket &raquo;
    url: /docs/bots/events/event.mail.received.watcher/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.mail.received.watcher/#event-actions
---

|---
|-|-
| **Identifier (ID):** | send_email_recipients
| **Event:** | event.mail.received.watcher

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
|  | `headers` | text | A list of `Header: Value` pairs delimited by newlines
|  | `format` | text | `parsedown` for Markdown/HTML, or omitted for plaintext
| **x** | `content` | text | The email message body
|  | `html_template_id` | id | The [html template](/docs/records/types/html_template/) to use with Markdown format
|  | `bundle_ids` | id[] | An array of [file bundles](/docs/records/types/file_bundle/) to attach
|  | `is_autoreply` | bit | `0` (not an autoreply), `1` (an autoreply)
