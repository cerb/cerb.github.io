---
title: >-
  Bot Action: Prompt with text
permalink: /docs/bots/events/event.form.interaction.worker/actions/prompt_text/
toc:
  expand: Bots
jumbotron:
  title: >-
    Prompt with text
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
| **Identifier (ID):** | prompt_text
| **Event:** | event.form.interaction.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `label` | text | The label for the text input
|  | `placeholder` | text | The descriptive text in the textbox when empty
|  | `default` | text | The default value in the textbox
|  | `mode` | text | `multiple` (multiple lines), or omit for single line
| **x** | `var` | placeholder | The placeholder to set with the user's input
|  | `var_format` | text | A template for formatting this prompt
|  | `var_validate` | text | A template for validating this prompt
