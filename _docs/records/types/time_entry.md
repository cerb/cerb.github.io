---
title: Time Tracking Records
permalink: /docs/records/types/time_entry/
toc:
  title: Time Tracking
  expand: Records
jumbotron:
  title: Time Tracking
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
| **Name (singular):** | Time Tracking Entry
| **Name (plural):** | Time Tracking Entries
| **Alias (uri):** | time_entry
| **Identifier (ID):** | cerberusweb.contexts.timetracking

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `activity_id` | [number](/docs/records/fields/types/number/) | The ID of the [activity](/docs/records/types/timetracking_activity/) for the work 
|   | `is_closed` | [boolean](/docs/records/fields/types/boolean/) | Is this time entry archived? 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `log_date` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time of the work 
| **x** | **`mins`** | [number](/docs/records/fields/types/number/) | The number of minutes worked (alternative to `secs`) 
| **x** | **`secs`** | [number](/docs/records/fields/types/number/) | The number of seconds worked (alternative to `mins`) 
| **x** | **`worker_id`** | [number](/docs/records/fields/types/number/) | The ID of the [worker](/docs/records/types/worker/) who completed the work 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `id` | number | Id
| `is_closed` | boolean | Is Closed
| `log_date` | date | Log Date
| `mins` | minutes | Time Spent
| `record_url` | text | Record Url
| `summary` | text | Summary
| `worker_` | record | [Worker](/docs/records/types/worker/)

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in time tracking [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `activity.id:` | [chooser](/docs/search/filters/choosers/) | [Activity](/docs/records/types/timetracking_activity/)
| `comments:` | [fulltext](/docs/search/filters/fulltext/) | Comment Content
| `created:` | [date](/docs/search/filters/dates/) | Log Date
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `isClosed:` | [boolean](/docs/search/filters/booleans/) | Is Closed
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `timeSpent:` | [number](/docs/search/filters/numbers/) | Time Spent
| `watchers:` | [record](/docs/search/deep-search/) | [Watchers](/docs/records/types/worker/)
| `worker:` | [record](/docs/search/deep-search/) | [Worker](/docs/records/types/worker/)
| `worker.id:` | [chooser](/docs/search/filters/choosers/) | [Worker](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on time tracking [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `tt_activity_id` | Activity
| `tt_is_closed` | Is Closed
| `tt_log_date` | Log Date
| `tt_time_actual_mins` | Time Spent
| `tt_time_actual_secs` | Time Spent
| `tt_worker_id` | Worker

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>