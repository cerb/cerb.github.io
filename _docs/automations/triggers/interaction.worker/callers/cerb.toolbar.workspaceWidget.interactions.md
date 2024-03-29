---
title: "Interaction Caller: cerb.toolbar.workspaceWidget.interactions"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/callers/cerb.toolbar.workspaceWidget.interactions/
toc:
  title: cerb.toolbar.workspaceWidget.interactions
  expand: Automations
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
    label: interaction.worker &raquo;
    url: /docs/automations/triggers/interaction.worker/
  -
    label: Callers &raquo;
    url: /docs/automations/triggers/interaction.worker/#callers
---

# Parameters

The following `caller_params` are passed to the [interaction](/docs/automations/triggers/interaction.worker/):

| Key | Type | 
|-|-|-
| **`page_id`** | record | [workspace page](/docs/records/types/workspace_page/)
| **`widget_id`** | record | [workspace widget](/docs/records/types/workspace_widget/)

# return:

The caller implements the following `return:` dictionary:

| Req'd | Key | Type |
|:-:|-|-|-
| | **`alert:`** | string | A time-limited message to display at the top of a worker's browser
| | **`clipboard:`** | string | Text to copy in the worker's browser
| | **`open_link:`** | string | A URL to open in a new tab in the worker's browser

# after:

| Key | Type | 
|-|-|-
| **`refresh_widgets@list:`** | array | A list of [card widget](/docs/records/types/card_widget/) names to refresh 
