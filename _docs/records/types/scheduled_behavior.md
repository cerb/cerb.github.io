---
title: Behavior Scheduled Records
permalink: /docs/records/types/scheduled_behavior/
toc:
  title: Behavior Scheduled
  expand: Records
jumbotron:
  title: Behavior Scheduled
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
| **Name (singular):** | Behavior Schedule
| **Name (plural):** | Behavior Schedules
| **Alias (uri):** | scheduled_behavior
| **Identifier (ID):** | cerberusweb.contexts.behavior.scheduled

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`behavior_id`** | [number](/docs/records/fields/types/number/) | The ID of the [behavior](/docs/records/types/behavior/) to be scheduled 
| **x** | **`run_date`** | [timestamp](/docs/records/fields/types/timestamp/) | The date/time to run the scheduled behavior 
| **x** | **`target__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of the target record to run the behavior against 
| **x** | **`target_id`** | [number](/docs/records/fields/types/number/) | The ID of the target record 
|   | `variables` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `behavior_` | record | [Behavior](/docs/records/types/behavior/)
| `id` | number | Id
| `name` | text | Name
| `record_url` | text | Record Url
| `run_date` | date | Run Date
| `target_` | record | Target

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
| `watchers` | watchers | [Watchers](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in behavior scheduled [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `behavior:` | [record](/docs/search/#deep-search) | [Behavior](/docs/records/types/behavior/)
| `behavior.id:` | [chooser](/docs/search/#choosers) | [Behavior](/docs/records/types/behavior/)
| `bot:` | [record](/docs/search/#deep-search) | [Bot](/docs/records/types/bot/)
| `bot.id:` | [chooser](/docs/search/#choosers) | [Bot](/docs/records/types/bot/)
| `id:` | [number](/docs/search/#numbers) | Id
| `on:` | [text](/docs/search/#text) | On
| `on.<type>:` | [record](/docs/search/#deep-search) | On
| `runDate:` | [date](/docs/search/#dates) | Run Date
	
### Worklist Columns

These columns are available on behavior scheduled [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_target` | On
| `b_behavior_bot_id` | Bot
| `b_behavior_name` | Name
| `c_id` | Id
| `c_repeat_json` | Repeat
| `c_run_date` | Run Date
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>