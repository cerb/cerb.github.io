---
title: "Interaction Caller: cerb.toolbar.workspaceWidget.interactions"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.interaction/callers/cerb.toolbar.workspaceWidget.interactions/
toc:
  title: cerb.toolbar.workspaceWidget.interactions
jumbotron:
  title: cerb.toolbar.workspaceWidget.interactions
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

{% include docs/note_preview.html %}

# Parameters

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/ui.interaction/):

| Key | Type | 
|-|-|-
| **`page_id`** | record | [workspace page](/docs/records/types/workspace_page/)
| **`widget_id`** | record | [workspace widget](/docs/records/types/workspace_widget/)

# return:

The caller expects the following `return:` dictionary:

| Req'd | Key | Type | 
|:-:|-|-|-
| | **`refresh_widgets@list:`** | array | A list of [card widget](/docs/records/types/card_widget/) names to refresh 
