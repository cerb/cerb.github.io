---
title: Calendar Recurring Event Records
permalink: /docs/records/types/calendar_recurring_event/
toc:
  title: Calendar Recurring Event
  expand: Records
jumbotron:
  title: Calendar Recurring Event
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
| **Name (singular):** | Calendar Recurring Event
| **Name (plural):** | Calendar Recurring Events
| **Alias (uri):** | calendar_recurring_event
| **Identifier (ID):** | cerberusweb.contexts.calendar_event.recurring

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`calendar_id`** | [number](/docs/records/fields/types/number/) | The parent [calendar](/docs/records/types/calendar/) of this event 
|   | `event_end` | [text](/docs/records/fields/types/text/) | The end date/time of the event 
|   | `event_start` | [text](/docs/records/fields/types/text/) | The start date/time of the event 
|   | `is_available` | [boolean](/docs/records/fields/types/boolean/) | `true` for available; `false` for busy 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of the event 
| **x** | **`patterns`** | [text](/docs/records/fields/types/text/) | One pattern per line 
|   | `recur_end` | [timestamp](/docs/records/fields/types/timestamp/) | The end date/time of the recurring range 
|   | `recur_start` | [timestamp](/docs/records/fields/types/timestamp/) | The start date/time of the recurring range 
|   | `tz` | [text](/docs/records/fields/types/text/) | The timezone of the recurring event (e.g. `America/Los_Angeles`) 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `calendar_` | record | [Calendar](/docs/records/types/calendar/)
| `calendar_owner_` | record | Calendar Owner
| `event_end` | text | End
| `event_start` | text | Start
| `id` | number | Id
| `is_available` | boolean | Is Available
| `name` | text | Name
| `patterns` | text | Patterns
| `record_url` | text | Record Url
| `recur_end` | text | Recur End
| `recur_start` | text | Recur Start
| `tz` | text | Timezone

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
| `watchers` | watchers | Watchers
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in calendar recurring event [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `calendar:` | [record](/docs/search/deep-search/) | [Calendar](/docs/records/types/calendar/)
| `calendar.id:` | [chooser](/docs/search/filters/choosers/) | [Calendar](/docs/records/types/calendar/)
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Event Name
| `status:` | [boolean](/docs/search/filters/booleans/) | Is Available
| `timezone:` | [text](/docs/search/filters/text/) | Timezone
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
	
### Worklist Columns

These columns are available on calendar recurring event [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_calendar_id` | Calendar
| `c_event_end` | End
| `c_event_name` | Event Name
| `c_event_start` | Start
| `c_id` | Id
| `c_is_available` | Is Available
| `c_patterns` | Patterns
| `c_recur_end` | Recur End
| `c_recur_start` | Recur Start
| `c_tz` | Timezone
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>