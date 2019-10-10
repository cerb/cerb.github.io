---
title: Calendar Records
permalink: /docs/records/types/calendar/
toc:
  title: Calendar
  expand: Records
jumbotron:
  title: Calendar
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
| **Name (singular):** | Calendar
| **Name (plural):** | Calendars
| **Alias (uri):** | calendar
| **Identifier (ID):** | cerberusweb.contexts.calendar

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this calendar 
| **x** | **`owner__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of this calendar's owner: `app`, `role`, `group`, or `worker` 
| **x** | **`owner_id`** | [number](/docs/records/fields/types/number/) | The ID of this calendar's owner 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `id` | number | Id
| `name` | text | Name
| `owner_` | record | Owner
| `record_url` | text | Record Url
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `events` |  | Events
| `events_occluded` |  | Events (Occluded)
| `links` | links | Links
| `scope` |  | Scope
| `watchers` | watchers | Watchers
| `weeks` |  | Weeks
| `weeks_events` |  | Weeks Events
| `weeks_events_occluded` |  | Weeks Events (Occluded)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in calendar [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `owner:` | virtual | Owner
| `owner.app:` | virtual | Owner
| `owner.bot:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/bot/)
| `owner.group:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/group/)
| `owner.role:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/role/)
| `owner.worker:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
	
### Worklist Columns

These columns are available on calendar [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_owner` | Owner
| `c_id` | Id
| `c_name` | Name
| `c_updated_at` | Updated
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>