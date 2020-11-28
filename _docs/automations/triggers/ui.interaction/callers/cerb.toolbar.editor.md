---
title: "Interaction Caller: cerb.toolbar.editor"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.interaction/callers/cerb.toolbar.editor/
toc:
  title: cerb.toolbar.editor
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
    label: ui.interaction &raquo;
    url: /docs/automations/triggers/ui.interaction/
  -
    label: Callers &raquo;
    url: /docs/automations/triggers/ui.interaction/#callers
---

# Parameters

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/ui.interaction/):

| Key | Type | 
|-|-|-
| **`toolbar`** | string | The interaction [toolbar](/docs/interactions/toolbars/)
| **`selected_text`** | string | The currently selected editor text

### Toolbars

* `cerb.toolbar.cardWidget.interactions`
* `cerb.toolbar.cardWidget.sheet`
* `cerb.toolbar.profileWidget.interactions`
* `cerb.toolbar.profileWidget.sheet`
* `cerb.toolbar.profiles.ticket.message`

# return:

The caller expects the following `return:` dictionary:

| Req'd | Key | Type | 
|:-:|-|-|-
| | **`snippet`** | string | A snippet of text to insert in the editor at the cursor
