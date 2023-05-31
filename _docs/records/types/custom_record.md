---
title: Custom Record Records
permalink: /docs/records/types/custom_record/
toc:
  title: Custom Record
  expand: Records
jumbotron:
  title: Custom Record
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
| **Name (singular):** | Custom Record
| **Name (plural):** | Custom Records
| **Alias (uri):** | custom_record
| **Identifier (ID):** | cerberusweb.contexts.custom_record

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The singular name of the record; `Issue` 
| **x** | **`name_plural`** | [text](/docs/records/fields/types/text/) | The plural name of the record; `Issues` 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`uri`** | [text](/docs/records/fields/types/text/) | The alias of the record (e.g. `issue`); used in URLs, API, etc. 

#### params

|---
| Key | Value
|-|-
| `owners[contexts]` | An optional array with one or more of: `cerberusweb.contexts.app`, `cerberusweb.contexts.group`, `cerberusweb.contexts.role`, `cerberusweb.contexts.worker`
| `options` | An optional array with one or more of: `hide_search`, `avatars`, `attachments`, `comments`

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `id` | number | Id
| `name` | text | Name
| `name_plural` | text | Plural
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

These [filters](/docs/search/#filters) are available in custom record [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `name.plural:` | [text](/docs/search/#text) | Plural
| `updated:` | [date](/docs/search/#dates) | Updated
| `uri:` | [text](/docs/search/#text) | Uri
	
### Worklist Columns

These columns are available on custom record [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_id` | Id
| `c_name` | Name
| `c_name_plural` | Plural
| `c_updated_at` | Updated
| `c_uri` | Uri
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>