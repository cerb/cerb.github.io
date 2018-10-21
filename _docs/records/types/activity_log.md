---
title: Activity Log Records
permalink: /docs/records/types/activity_log/
toc:
  title: Activity Log
  expand: Records
jumbotron:
  title: Activity Log
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
    url: /docs/records/#record-types
---

|---
|-|-
| **Name (singular):** | Activity Log
| **Name (plural):** | Activity Logs
| **Alias (uri):** | activity_log
| **Identifier (ID):** | cerberusweb.contexts.activity_log

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`activity_point`** | [text](/docs/records/fields/types/text/) | The event that occurred 
| **x** | **`actor__context`** | [context](/docs/records/fields/types/context/) | The actor's record type 
| **x** | **`actor_id`** | [number](/docs/records/fields/types/number/) | The actor's record ID 
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
| **x** | **`target__context`** | [context](/docs/records/fields/types/context/) | The target's record type 
| **x** | **`target_id`** | [number](/docs/records/fields/types/number/) | The target's record ID 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `actor_` | record | Actor
| `created` | date | Created
| `event` | text | Event
| `activity_point` | text | Event Id
| `id` | number | Id
| `target_` | record | Target
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in activity log [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `activity:` | [text](/docs/search/filters/text/) | Activity
| `actor:` | [text](/docs/search/filters/text/) | Actor Type
| `actor.<type>:` | [record](/docs/search/deep-search/) | Actor
| `created:` | [date](/docs/search/filters/dates/) | Created
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `target:` | [text](/docs/search/filters/text/) | Target Type
| `target.<type>:` | [record](/docs/search/deep-search/) | Target
	
### Workist Columns

These columns are available on activity log [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_actor` | Actor
| `*_target` | Target
| `c_activity_point` | Activity
| `c_actor_context` | Actor Context
| `c_created` | Created
| `c_entry_json` | Entry
| `c_target_context` | Target Context

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>