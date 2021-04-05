---
title: "Interaction Caller: cerb.toolbar.editor"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/callers/cerb.toolbar.editor/
toc:
  title: cerb.toolbar.editor
  expand: Automations
jumbotron:
  title: cerb.toolbar.editor
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  -
    label: Callers &raquo;
    url: /docs/automations/triggers/interaction.worker/#callers
---

{% include docs/note_preview.html %}

# Parameters

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type | 
|-|-|-
| **`toolbar`** | string | The interaction [toolbar](/docs/toolbars/)
| **`selected_text`** | string | The currently selected editor text

### Toolbars

* `cerb.toolbar.cardWidget.interactions`
* `cerb.toolbar.cardWidget.sheet`
* `cerb.toolbar.profileWidget.interactions`
* `cerb.toolbar.profileWidget.sheet`
* `cerb.toolbar.mail.compose`
* `cerb.toolbar.mail.read`
* `cerb.toolbar.mail.reply`

# return:

The caller expects the following `return:` dictionary:

| Req'd | Key | Type | 
|:-:|-|-|-
| | **`snippet`** | string | A snippet of text to insert in the editor at the cursor
