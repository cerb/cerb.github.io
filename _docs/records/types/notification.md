---
title: Notification Records
permalink: /docs/records/types/notification/
toc:
  title: Notification
  expand: Records
jumbotron:
  title: Notification
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Records &raquo;
    url: /docs/records/
  -
    label: Types &raquo;
    url: /docs/records/types/
---

|---
|-|-
| **Name (singular):** | Notification
| **Name (plural):** | Notifications
| **Alias (uri):** | notification
| **Identifier (ID):** | cerberusweb.contexts.notification

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `activity_point` | [text](/docs/records/fields/types/text/) | The event that triggered the notification 
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
| **x** | **`event_json`** | [object](/docs/records/fields/types/object/) | A key/value object of notification properties 
|   | `is_read` | [boolean](/docs/records/fields/types/boolean/) | Has this been read by the worker? 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
| **x** | **`target__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of the target record 
|   | `target_id` | [number](/docs/records/fields/types/number/) | The ID of the target record 
| **x** | **`worker_id`** | [number](/docs/records/fields/types/number/) | The ID of the [worker](/docs/records/types/worker/) who received the notification 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `activity_point` | text | Activity
| `assignee_` | record | [Assignee](/docs/records/types/worker/)
| `created` | date | Created
| `event_json` | text | Event Json
| `id` | number | Id
| `is_read` | boolean | Is Read
| `message` | text | Message
| `message_html` | text | Message (Html)
| `target_` | record | Target
| `url` | text | Url

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `links` | links | Links
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in notification [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `activity:` | [text](/docs/search/filters/text/) | Activity
| `created:` | [date](/docs/search/filters/dates/) | Created
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `isRead:` | [boolean](/docs/search/filters/booleans/) | Is Read
| `worker:` | [record](/docs/search/deep-search/) | [Worker](/docs/records/types/worker/)
| `worker.id:` | [chooser](/docs/search/filters/choosers/) | [Worker](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on notification [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `we_activity_point` | Activity
| `we_created_date` | Created
| `we_is_read` | Is Read
| `we_worker_id` | Worker

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>