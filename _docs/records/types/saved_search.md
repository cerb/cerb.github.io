---
title: Saved Search Records
permalink: /docs/records/types/saved_search/
toc:
  title: Saved Search
  expand: Records
jumbotron:
  title: Saved Search
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
| **Name (singular):** | Saved Search
| **Name (plural):** | Saved Searches
| **Alias (uri):** | saved_search
| **Identifier (ID):** | cerberusweb.contexts.context.saved.search

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of this search query; e.g. `ticket` 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this saved search 
| **x** | **`owner__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of this saved search's owner: `app`, `role`, `group`, or `worker` 
|   | `owner_id` | [number](/docs/records/fields/types/number/) | The ID of this saved search's owner 
| **x** | **`query`** | [text](/docs/records/fields/types/text/) | The [search query](/docs/search/); e.g. `status:o` 
|   | `tag` | [text](/docs/records/fields/types/text/) | A human-friendly nickname for this search (e.g. `open_tickets`) 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `context` | text | Type
| `id` | number | Id
| `name` | text | Name
| `owner_` | record | Owner
| `query` | text | Query
| `record_url` | text | Record Url
| `tag` | text | Tag
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in saved search [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `context:` | [text](/docs/search/#text) | Record Type
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `name:` | [text](/docs/search/#text) | Name
| `query:` | [text](/docs/search/#text) | Query
| `tag:` | [text](/docs/search/#text) | Tag
| `updated:` | [date](/docs/search/#dates) | Updated
	
### Worklist Columns

These columns are available on saved search [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_context` | Record Type
| `c_id` | Id
| `c_name` | Name
| `c_query` | Query
| `c_tag` | Tag
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