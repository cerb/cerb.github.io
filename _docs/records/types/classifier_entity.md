---
title: Classifier Entity Records
permalink: /docs/records/types/classifier_entity/
toc:
  title: Classifier Entity
  expand: Records
jumbotron:
  title: Classifier Entity
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
| **Name (singular):** | Classifier Entity
| **Name (plural):** | Classifier Entities
| **Alias (uri):** | classifier_entity
| **Identifier (ID):** | cerberusweb.contexts.classifier.entity

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `description` | [text](/docs/records/fields/types/text/) | A description of this entity 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this classifier entity 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
| **x** | **`type`** | [text](/docs/records/fields/types/text/) | The type of this entity: `list`, `regexp`, or `text` 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `description` | text | Description
| `id` | number | Id
| `name` | text | Name
| `params` |  | Params
| `record_url` | text | Record Url
| `type` | text | Type
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in classifier entity [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `description:` | [text](/docs/search/filters/text/) | Description
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Worklist Columns

These columns are available on classifier entity [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_description` | Description
| `c_id` | Id
| `c_name` | Name
| `c_type` | Type
| `c_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>