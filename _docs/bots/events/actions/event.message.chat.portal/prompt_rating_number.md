---
title: >-
  Bot Action: Prompt with numeric rating scale
permalink: /docs/bots/events/event.message.chat.portal/actions/prompt_rating_number/
toc:
  expand: Bots
jumbotron:
  title: >-
    Prompt with numeric rating scale
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
| **Identifier (ID):** | prompt_rating_number
| **Event:** | event.message.chat.portal

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `range_from` | number | The starting value of the rating scale
| **x** | `label_from` | text | The starting label of the rating scale
|  | `color_from` | text | The starting hex color code of the rating scale
| **x** | `range_to` | number | The ending value of the rating scale
| **x** | `label_to` | text | The ending label of the rating scale
|  | `color_to` | text | The ending hex color code of the rating scale
|  | `color_mid` | text | The midpoint hex color code of the rating scale
| **x** | `var` | placeholder | The placeholder to set with the user's input
