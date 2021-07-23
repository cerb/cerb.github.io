---
title: Bot Records
permalink: /docs/records/types/bot/
toc:
  title: Bot
  expand: Records
jumbotron:
  title: Bot
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
| **Name (singular):** | Bot
| **Name (plural):** | Bots
| **Alias (uri):** | bot
| **Identifier (ID):** | cerberusweb.contexts.bot

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `image` | [image](/docs/records/fields/types/image/) | The profile image, base64-encoded in [data URI format](https://en.wikipedia.org/wiki/Data_URI_scheme) 
|   | `is_disabled` | [boolean](/docs/records/fields/types/boolean/) | Is this bot disabled? 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `mention_name` | [text](/docs/records/fields/types/text/) | (deprecated) 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this bot 
| **x** | **`owner__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of this bot's owner: `app`, `role`, `group`, or `worker` 
| **x** | **`owner_id`** | [number](/docs/records/fields/types/number/) | The ID of this bot's owner 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `config` | object | Configuration
| `created_at` | date | Created
| `id` | number | Id
| `is_disabled` | boolean | Disabled
| `mention_name` | text | @Mention
| `name` | text | Name
| `owner_` | record | Owner
| `record_url` | text | Record Url
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `behaviors` | records | Behaviors
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in bot [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/filters/dates/) | Created
| `disabled:` | [boolean](/docs/search/filters/booleans/) | Disabled
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `mentionName:` | [text](/docs/search/filters/text/) | @Mention
| `name:` | [text](/docs/search/filters/text/) | Name
| `owner:` | [text](/docs/search/filters/text/) | Owner Type
| `owner.<type>:` | [record](/docs/search/deep-search/) | Owner
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [record](/docs/search/deep-search/) | [Watchers](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on bot [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_owner` | Owner
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `v_at_mention_name` | @Mention
| `v_created_at` | Created
| `v_id` | Id
| `v_is_disabled` | Disabled
| `v_name` | Name
| `v_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>