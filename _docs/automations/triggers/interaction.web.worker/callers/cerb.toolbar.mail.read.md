---
title: "Interaction Caller: cerb.toolbar.mail.read"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/triggers/interaction.web.worker/callers/cerb.toolbar.mail.read/
toc:
  title: cerb.toolbar.mail.read
  expand: Automations
jumbotron:
  title: cerb.toolbar.mail.read
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
| **`message_id`** | record | The [message](/docs/records/types/message/)
| **`selected_text`** | string | The currently selected editor text

# return:

The caller expects the following `return:` dictionary:

| Req'd | Key | Type | 
|:-:|-|-|-
| | **`reply:draft_id:`** | record | The [draft](/docs/records/types/draft/) ID to resume
| | **`refresh_widgets@list:`** | records | One or more [profile_widget](/docs/records/types/profile_widget/) names to refresh
