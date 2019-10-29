---
title: >-
  Bot Action: Prompt with text input
permalink: /docs/bots/events/event.message.chat.portal/actions/prompt_text/
toc:
  expand: Bots
jumbotron:
  title: >-
    Prompt with text input
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
      Chat with portal visitor &raquo;
    url: /docs/bots/events/event.message.chat.portal/
  -
    label: Actions &raquo;
    url: /docs/bots/events/event.message.chat.portal/#event-actions
---

|---
|-|-
| **Identifier (ID):** | prompt_text
| **Event:** | event.message.chat.portal

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
|  | `placeholder` | text | The instructive text in the textbox when blank
|  | `default` | text | The default text in the textbox
|  | `mode` | text | `single` or `multiple` lines
| **x** | `var` | placeholder | The placeholder to set with the user's input
|  | `var_format` | text | A template for formatting this prompt
|  | `var_validate` | text | A template for validating this prompt
