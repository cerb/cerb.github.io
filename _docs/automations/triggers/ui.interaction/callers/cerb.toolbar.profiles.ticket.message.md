---
title: "Interaction Caller: cerb.toolbar.profiles.ticket.message"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/ui.interaction/callers/cerb.toolbar.profiles.ticket.message/
toc:
  title: cerb.toolbar.profiles.ticket.message
jumbotron:
  title: cerb.toolbar.profiles.ticket.message
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
| **`message_id`** | record | The [message](/docs/records/types/message/)
| **`selected_text`** | string | The currently selected editor text

# return:

The caller expects the following `return:` dictionary:

| Req'd | Key | Type | 
|:-:|-|-|-
| | **`reply:draft_id:`** | record | The [draft](/docs/records/types/draft/) ID to resume
| | **`refresh_widgets@list:`** | records | One or more [profile_widget](/docs/records/types/profile_widget/) names to refresh
