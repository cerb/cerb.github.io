---
title: Behavior Records
permalink: /docs/records/types/behavior/
toc:
  title: Behavior
  expand: Records
jumbotron:
  title: Behavior
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
| **Name (singular):** | Behavior
| **Name (plural):** | Behaviors
| **Alias (uri):** | behavior
| **Identifier (ID):** | cerberusweb.contexts.behavior

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`bot_id`** | [number](/docs/records/fields/types/number/) | [Bot](/docs/records/types/bot/) 
| **x** | **`event_point`** | [text](/docs/records/fields/types/text/) | The event of the behavior 
|   | `is_disabled` | [boolean](/docs/records/fields/types/boolean/) | Is this behavior disabled? 
|   | `is_private` | [boolean](/docs/records/fields/types/boolean/) | Is this behavior only visible to the parent bot? 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The behavior's name 
|   | `priority` | [number](/docs/records/fields/types/number/) | Any positive number; `0` is highest priority 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
|   | `uri` | [text](/docs/records/fields/types/text/) |  

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `bot_` | record | [Bot](/docs/records/types/bot/)
| `bot_owner_` | record | Bot Owner
| `event_point` | text | Event
| `event_point_name` | text | Event
| `id` | number | Id
| `is_disabled` | boolean | Is Disabled
| `is_private` | boolean | Is Private
| `name` | text | Name
| `priority` | number | Priority
| `record_url` | text | Record Url
| `updated_at` | date | Updated
| `uri` | text | Uri

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in behavior [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `bot:` | [record](/docs/search/deep-search/) | [Bot](/docs/records/types/bot/)
| `bot.id:` | [chooser](/docs/search/filters/choosers/) | [Bot](/docs/records/types/bot/)
| `disabled:` | [boolean](/docs/search/filters/booleans/) | Is Disabled
| `event:` | [text](/docs/search/filters/text/) | Event
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `name:` | [text](/docs/search/filters/text/) | Title
| `priority:` | [number](/docs/search/filters/numbers/) | Priority
| `private:` | [boolean](/docs/search/filters/booleans/) | Is Private
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `uri:` | [text](/docs/search/filters/text/) | Uri
| `usableBy.bot:` | [chooser](/docs/search/filters/choosers/) | [Usableby Bot](/docs/records/types/bot/)
	
### Worklist Columns

These columns are available on behavior [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_has_fieldset` | Fieldset
| `*_workers` | Watchers
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `t_bot_id` | Bot
| `t_event_point` | Event
| `t_id` | Id
| `t_is_disabled` | Is Disabled
| `t_is_private` | Is Private
| `t_priority` | Priority
| `t_title` | Title
| `t_updated_at` | Updated
| `t_uri` | Uri

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>