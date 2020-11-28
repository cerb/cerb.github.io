---
title: "Interaction Caller: cerb.toolbar.cardWidget.sheet"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.interaction/callers/cerb.toolbar.cardWidget.sheet/
toc:
  title: cerb.toolbar.cardWidget.sheet
jumbotron:
  title: cerb.toolbar.cardWidget.sheet
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
| **`record_type`** | string | [record type](/docs/records/types/)
| **`record_id`** | int | record ID
| **`widget_id`** | record | [card widget](/docs/records/types/card_widget/)

# return:

The caller expects the following `return:` dictionary:

| Req'd | Key | Type | 
|:-:|-|-|-
| | **`refresh_widgets@list:`** | array | A list of [card widget](/docs/records/types/card_widget/) names to refresh 
