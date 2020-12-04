---
title: "Interaction Caller: cerb.toolbar.eventHandlers.editor"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.eventHandlers.editor/
toc:
  title: cerb.toolbar.eventHandlers.editor
  expand: Automations
jumbotron:
  title: cerb.toolbar.eventHandlers.editor
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: interaction.web.worker &raquo;
    url: /docs/automations/triggers/interaction.web.worker/
  -
    label: Callers &raquo;
    url: /docs/automations/triggers/interaction.web.worker/#callers
---

{% include docs/note_preview.html %}

[event handler](/docs/automations/#event-handlers)

# Parameters

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.web.worker/):

| Key | Type | 
|-|-|-
| **`trigger`** | string | The automation [trigger](/docs/automations/#triggers) of the [event handlers](/docs/automations/#event-handlers)
| **`selected_text`** | string | The currently selected editor text

# return:

The caller expects the following `return:` dictionary:

| Req'd | Key | Type | 
|:-:|-|-|-
| | **`snippet`** | string | A snippet of text to insert in the editor at the cursor
