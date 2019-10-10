---
title: >-
  Bot Action: Prompt with images
permalink: /docs/bots/events/event.message.chat.worker/actions/prompt_images/
toc:
  expand: Bots
jumbotron:
  title: >-
    Prompt with images
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
| **Identifier (ID):** | prompt_images
| **Event:** | event.message.chat.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `images` | array | An array of base64-encoded images in `data:` URI format
|  | `labels` | array | An array of textual labels for the above images
| **x** | `var` | placeholder | The placeholder to set with the user's input
|  | `var_format` | text | A template for formatting this prompt
|  | `var_validate` | text | A template for validating this prompt
