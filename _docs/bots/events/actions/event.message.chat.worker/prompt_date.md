---
title: >-
  Bot Action: Prompt with date input
permalink: /docs/bots/events/event.message.chat.worker/actions/prompt_date/
toc:
  expand: Bots
jumbotron:
  title: >-
    Prompt with date input
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
      Chat with worker &raquo;
    url: /docs/bots/events/event.message.chat.worker/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.message.chat.worker/#event-actions
---

|---
|-|-
| **Identifier (ID):** | prompt_date
| **Event:** | event.message.chat.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
|  | `placeholder` | text | The instructive text in the textbox when empty
|  | `default` | text | The default text in the textbox
|  | `mode` | text | `single` or `multiple` lines
| **x** | `var` | placeholder | The placeholder to set with the user's input
|  | `var_format` | text | A template for formatting this prompt
|  | `var_validate` | text | A template for validating this prompt
