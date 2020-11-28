---
title: "Interaction Caller: cerb.toolbar.mail.reply"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.interaction/callers/cerb.toolbar.mail.reply/
toc:
  title: cerb.toolbar.mail.reply
jumbotron:
  title: cerb.toolbar.mail.reply
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
| **`selected_text`** | string | The currently selected editor text

# return:

The caller expects the following `return:` dictionary:

| Req'd | Key | Type | 
|:-:|-|-|-
| | **`snippet`** | string | A snippet of text to insert in the editor at the cursor
