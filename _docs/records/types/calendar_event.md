---
title: Calendar Event Records
permalink: /docs/records/types/calendar_event/
toc:
  title: Calendar Event
  expand: Records
jumbotron:
  title: Calendar Event
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
| **Name (singular):** | Calendar Event
| **Name (plural):** | Calendar Events
| **Alias (uri):** | calendar_event
| **Identifier (ID):** | cerberusweb.contexts.calendar_event

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`calendar_id`** | [number](/docs/records/fields/types/number/) | The parent [calendar](/docs/records/types/calendar/) of this event 
|   | `date_end` | [timestamp](/docs/records/fields/types/timestamp/) | The end date/time of the event 
| **x** | **`date_start`** | [timestamp](/docs/records/fields/types/timestamp/) | The start date/time of the event 
|   | `is_available` | [boolean](/docs/records/fields/types/boolean/) | `true` for available; `false` for busy 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of the event 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `calendar_` | record | [Calendar](/docs/records/types/calendar/)
| `calendar_owner_` | record | Calendar Owner
| `date_end` | date | End Date
| `date_start` | date | Start Date
| `id` | number | Id
| `is_available` | boolean | Is Available
| `name` | text | Name
| `record_url` | text | Record Url

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
| `watchers` | watchers | Watchers
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in calendar event [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `calendar:` | [record](/docs/search/deep-search/) | [Calendar](/docs/records/types/calendar/)
| `calendar.id:` | [chooser](/docs/search/filters/choosers/) | [Calendar](/docs/records/types/calendar/)
| `endDate:` | [date](/docs/search/filters/dates/) | End Date
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `startDate:` | [date](/docs/search/filters/dates/) | Start Date
| `status:` | [boolean](/docs/search/filters/booleans/) | Is Available
	
### Worklist Columns

These columns are available on calendar event [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_has_fieldset` | Fieldset
| `c_calendar_id` | Calendar
| `c_date_end` | End Date
| `c_date_start` | Start Date
| `c_is_available` | Is Available
| `c_name` | Name
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>