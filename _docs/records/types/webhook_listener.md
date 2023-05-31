---
title: Webhook Listener Records
permalink: /docs/records/types/webhook_listener/
toc:
  title: Webhook Listener
  expand: Records
jumbotron:
  title: Webhook Listener
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
| **Name (singular):** | Webhook
| **Name (plural):** | Webhooks
| **Alias (uri):** | webhook_listener
| **Identifier (ID):** | cerberusweb.contexts.webhook_listener

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `automations_kata` | [object](/docs/records/fields/types/object/) | KATA object 
| **x** | **`guid`** | [text](/docs/records/fields/types/text/) | The random unique alias of the webhook used in its URL; automatically generated if blank 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this webhook 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `automations_kata` | text | Automations
| `guid` | text | Guid
| `id` | number | Id
| `name` | text | Name
| `record_url` | text | Record Url
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

These [filters](/docs/search/#filters) are available in webhook listener [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `guid:` | [text](/docs/search/#text) | Url
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `updated:` | [date](/docs/search/#dates) | Updated
| `watchers:` | [record](/docs/search/#deep-search) | [Watchers](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on webhook listener [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `w_guid` | Url
| `w_id` | Id
| `w_name` | Name
| `w_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>