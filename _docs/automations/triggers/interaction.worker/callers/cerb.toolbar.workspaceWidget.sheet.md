---
title: "Interaction Caller: cerb.toolbar.workspaceWidget.sheet"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/callers/cerb.toolbar.workspaceWidget.sheet/
toc:
  title: cerb.toolbar.workspaceWidget.sheet
  expand: Automations
jumbotron:
  title: cerb.toolbar.workspaceWidget.sheet
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

# after:

| Key | Type | 
|-|-|-
| **`refresh_widgets@list:`** | array | A list of [card widget](/docs/records/types/card_widget/) names to refresh 
