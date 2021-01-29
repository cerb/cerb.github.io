---
title: "Interaction Caller: cerb.toolbar.editor.automation.script"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.editor.automation.script/
toc:
  title: cerb.toolbar.editor.automation.script
  expand: Automations
jumbotron:
  title: cerb.toolbar.editor.automation.script
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

# Parameters

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.web.worker/):

| Key | Type | 
|-|-|-
| **`trigger`** | string | The automation [trigger](/docs/automations/#triggers) of the [event handlers](/docs/automations/#events)
| **`selected_text`** | string | The currently selected editor text
| **`token_path`** | string | 
| **`cursor_row`** | int | 
| **`cursor_column`** | int | 
| **`value`** | string | 

# return:

The caller expects the following `return:` dictionary:

| Req'd | Key | Type | 
|:-:|-|-|-
| | **`snippet`** | string | A snippet of text to insert in the editor at the cursor
