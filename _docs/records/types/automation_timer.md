---
title: Automation Timer Records
permalink: /docs/records/types/automation_timer/
toc:
  title: Automation Timer
  expand: Records
jumbotron:
  title: Automation Timer
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
| **Name (singular):** | Automation Timer
| **Name (plural):** | Automation Timers
| **Alias (uri):** | automation_timer
| **Identifier (ID):** | cerb.contexts.automation.timer

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `automations_kata` | [text](/docs/records/fields/types/text/) |  
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `is_disabled` | [boolean](/docs/records/fields/types/boolean/) |  
|   | `is_recurring` | [boolean](/docs/records/fields/types/boolean/) |  
|   | `last_ran_at` | [timestamp](/docs/records/fields/types/timestamp/) |  
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this automation timer 
|   | `next_run_at` | [timestamp](/docs/records/fields/types/timestamp/) |  
|   | `recurring_patterns` | [text](/docs/records/fields/types/text/) |  
|   | `recurring_timezone` | [text](/docs/records/fields/types/text/) |  
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `created_at` | date | Created
| `id` | number | Id
| `is_disabled` | boolean | Disabled
| `is_recurring` | boolean | Is Recurring
| `last_ran_at` | date | Last Ran At
| `name` | text | Name
| `next_run_at` | date | Next Run At
| `record_url` | text | Record Url
| `recurring_patterns` | text | Recurring Patterns
| `recurring_timezone` | text | Timezone
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in automation timer [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/#dates) | Created
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `isRecurring:` | [boolean](/docs/search/#booleans) | Is Recurring
| `lastRanAt:` | [date](/docs/search/#dates) | Last Ran At
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `nextRunAt:` | [date](/docs/search/#dates) | Next Run At
| `updated:` | [date](/docs/search/#dates) | Updated
| `watchers:` | [record](/docs/search/#deep-search) | [Watchers](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on automation timer [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `a_created_at` | Created
| `a_id` | Id
| `a_is_disabled` | Disabled
| `a_is_recurring` | Is Recurring
| `a_last_ran_at` | Last Ran At
| `a_name` | Name
| `a_next_run_at` | Next Run At
| `a_recurring_patterns` | Recurring Patterns
| `a_recurring_timezone` | Timezone
| `a_updated_at` | Updated
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>