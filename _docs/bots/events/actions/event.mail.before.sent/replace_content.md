---
title: >-
  Bot Action: Replace text in message content
permalink: /docs/bots/events/event.mail.before.sent/actions/replace_content/
toc:
  expand: Bots
jumbotron:
  title: >-
    Replace text in message content
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
      Before message sent by worker &raquo;
    url: /docs/bots/events/event.mail.before.sent/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.mail.before.sent/#event-actions
---

|---
|-|-
| **Identifier (ID):** | replace_content
| **Event:** | event.mail.before.sent

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
|  | `is_regexp` | bit | `0` (plaintext match), `1` (regular expression match)
|  | `replace_mode` | text | `text`, `html`, or omit for both
| **x** | `replace` | text | The content to match in the message body
| **x** | `with` | text | The new content to replace the match with
