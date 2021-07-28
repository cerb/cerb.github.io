---
title: "mail.draft"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/mail.draft/
toc:
  title: mail.draft
  expand: Automations
jumbotron:
  title: mail.draft
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Automations &raquo;
    url: /docs/automations/
  -
    label: Events &raquo;
    url: /docs/automations/#events
---

**mail.draft** [automation](/docs/automations/) [events](/docs/automations/#events) can modify any property on a new or resumed draft after a worker clicks on a 'Compose'  or 'Reply' button, but before the editor popup opens.

Automations on this event are cumulative -- multiple automations can modify the draft, with subsequent changes on the same fields overwriting earlier ones.

When setting `custom_fields:`, their `uri` field can be used as the key instead of IDs. New custom field changes are merged with existing fields.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
|`draft_*` | record | The [draft](/docs/records/types/draft/) record. Supports key expansion.
|`is_resumed` | bool | `true` if the draft was resumed, `false` if new

# Outputs

| Key | Type | Notes
|-|-|-
|`draft:params:` | dictionary | A dictionary of [draft parameter](/docs/records/types/draft/) modifications
