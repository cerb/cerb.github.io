---
title: "record.merged"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/record.merged/
toc:
  title: record.merged
  expand: Automations
jumbotron:
  title: record.merged
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

**record.merged** [automation](/docs/automations/) [events](/docs/automations/#events) trigger after a set of records have been merged into a target, but before the sources have been deleted.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
|`record_type_*` | text | The merged [record type](/docs/records/types/).
|`records` | records | An array of [record](/docs/records/) dictionaries that were merged.
|`source_ids` | array | An array of record IDs merged into `target_id`.
|`target_id` | id | The destination [record](/docs/records/) ID the `source_ids` merged into.
|`worker_*` | record | The current [worker](/docs/records/types/worker/) dictionary. Supports key expansion.

# Outputs

(none)
