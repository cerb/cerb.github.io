---
title: >-
  Bot Action: Prompt with multiple choices
permalink: /docs/bots/events/event.form.interaction.worker/actions/prompt_checkboxes/
toc:
  expand: Bots
jumbotron:
  title: >-
    Prompt with multiple choices
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
| **Identifier (ID):** | prompt_checkboxes
| **Event:** | event.form.interaction.worker

### Params

|---
| Req'd | Key | Type | Notes
|:-:|-|-|-
| **x** | `label` | text | The label for the set of choices
|  | `options` |  | 
| **x** | `var` | placeholder | The placeholder to set with the user's choices
|  | `var_validate` | text | A template for validating this prompt
