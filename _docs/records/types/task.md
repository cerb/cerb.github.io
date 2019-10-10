---
title: Task Records
permalink: /docs/records/types/task/
toc:
  title: Task
  expand: Records
jumbotron:
  title: Task
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
| **Name (singular):** | Task
| **Name (plural):** | Tasks
| **Alias (uri):** | task
| **Identifier (ID):** | cerberusweb.contexts.task

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `completed` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time this task was completed 
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `due` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time of this task's deadline 
|   | `fieldsets` | fieldsets | An array or comma-separated list of [custom fieldset](/docs/records/types/custom_fieldset/) IDs 
|   | `importance` | [number](/docs/records/fields/types/number/) | A number from `0` (least) to `100` (most) 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `owner_id` | [number](/docs/records/fields/types/number/) | The ID of the [worker](/docs/records/types/worker/) responsible for this task 
|   | `reopen` | [timestamp](/docs/records/fields/types/timestamp/) | If the status is `waiting`, the date/time to automatically change the status back to `open` 
|   | `status` | [text](/docs/records/fields/types/text/) | `o` (open), `w` (waiting), `c` (closed); alternative to `status_id` 
|   | `status_id` | [number](/docs/records/fields/types/number/) | `0` (open), `1` (closed), `2` (waiting); alternative to `status` 
| **x** | **`title`** | [text](/docs/records/fields/types/text/) | The name of this task 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `completed` | date | Completed Date
| `created` | date | Created
| `due` | date | Due Date
| `id` | number | Id
| `importance` | number | Importance
| `owner_` | record | [Owner](/docs/records/types/worker/)
| `record_url` | text | Record Url
| `reopen` | date | Reopen At
| `status` | text | Status
| `title` | text | Title
| `updated` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
| `watchers` | watchers | Watchers
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in task [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `comments:` | [fulltext](/docs/search/filters/fulltext/) | Comment Content
| `completed:` | [date](/docs/search/filters/dates/) | Completed Date
| `created:` | [date](/docs/search/filters/dates/) | Created
| `due:` | [date](/docs/search/filters/dates/) | Due Date
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `importance:` | [number](/docs/search/filters/numbers/) | Importance
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `owner:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `owner.id:` | [chooser](/docs/search/filters/choosers/) | [Owner](/docs/records/types/worker/)
| `reopen:` | [date](/docs/search/filters/dates/) | Reopen At
| `status:` | virtual | Status
| `title:` | [text](/docs/search/filters/text/) | Title
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
	
### Worklist Columns

These columns are available on task [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `t_completed_date` | Completed Date
| `t_created_at` | Created
| `t_due_date` | Due Date
| `t_importance` | Importance
| `t_owner_id` | Owner
| `t_reopen_at` | Reopen At
| `t_status_id` | Status
| `t_title` | Title
| `t_updated_date` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>