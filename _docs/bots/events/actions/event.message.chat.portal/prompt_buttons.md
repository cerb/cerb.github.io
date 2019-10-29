---
title: >-
  Bot Action: Prompt with buttons
permalink: /docs/bots/events/event.message.chat.portal/actions/prompt_buttons/
toc:
  expand: Bots
jumbotron:
  title: >-
    Prompt with buttons
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
| **Identifier (ID):** | prompt_buttons
| **Event:** | event.message.chat.portal

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `options` | text | A list of predefined options separated by newlines
|  | `color_from` | text | A hex color code for the gradient start
|  | `color_mid` | text | A hex color code for the gradient midpoint
|  | `color_to` | text | A hex color code for the gradient end
|  | `style` | text | Additional CSS styles to apply to the buttons
| **x** | `var` | placeholder | The placeholder to set with the user's input
|  | `var_format` | text | A template for formatting this prompt
|  | `var_validate` | text | A template for validating this prompt
