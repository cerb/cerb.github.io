---
title: "record.merge"
#excerpt: 
#social_image_url: /assets/images/search/kata.png
permalink: /docs/automations/events/record.merge/
toc:
  title: record.merge
  expand: Automations
jumbotron:
  title: record.merge
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

**record.merge** [automation](/docs/automations/) [events](/docs/automations/#events) can allow or reject a record merge request based on its properties (e.g. record type, records, source ids, target id, worker).

This occurs after merge mapping. A worker must still have permission to merge records in one of their roles.

This uses events KATA, and the first automation to **return:** is used.

For instance, a policy could require that tickets can only be merged if they share the same group or participants.

# Placeholders

The automation event [dictionary](/docs/automations/#dictionaries) starts with the following values:

| Key | Type | Notes
|-|-|-
|`record_type_*` | text | The [record type](/docs/records/types/) being merged.
|`records` | records | An array of [record](/docs/records/) dictionaries to be merged.
|`source_ids` | array | An array of record IDs being merged into `target_id`.
|`target_id` | id | The destination [record](/docs/records/) ID the `source_ids` will be merged into.
|`worker_*` | record | The current [worker](/docs/records/types/worker/) dictionary. Supports key expansion.

# Outputs

| Key | Type | Notes
|-|-|-
|`deny:` | string | If set, the merge is denied, and this key's value is the displayed error message. If omitted the merge is allowed. 
