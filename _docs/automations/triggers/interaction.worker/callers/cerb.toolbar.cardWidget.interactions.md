---
title: "Interaction Caller: cerb.toolbar.cardWidget.interactions"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.worker/callers/cerb.toolbar.cardWidget.interactions/
toc:
  title: cerb.toolbar.cardWidget.interactions
  expand: Automations
jumbotron:
  title: cerb.toolbar.cardWidget.interactions
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
| **`record_type`** | string | [record type](/docs/records/types/)
| **`record_id`** | int | record ID
| **`widget_id`** | record | [card widget](/docs/records/types/card_widget/)

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