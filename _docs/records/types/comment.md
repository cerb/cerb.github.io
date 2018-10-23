---
title: Comment Records
permalink: /docs/records/types/comment/
toc:
  title: Comment
  expand: Records
jumbotron:
  title: Comment
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
    url: /docs/records/#record-types
---

|---
|-|-
| **Name (singular):** | Comment
| **Name (plural):** | Comments
| **Alias (uri):** | comment
| **Identifier (ID):** | cerberusweb.contexts.comment

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`author__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/#record-type) of the comment's author 
| **x** | **`author_id`** | [number](/docs/records/fields/types/number/) | The ID of the comment's author 
| **x** | **`comment`** | [text](/docs/records/fields/types/text/) | The text of the comment 
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
| **x** | **`target__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/#record-type) of the target record 
| **x** | **`target_id`** | [number](/docs/records/fields/types/number/) | The ID of the target record 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `author_` | record | Author
| `comment` | text | Content
| `created` | date | Created
| `id` | number | Id
| `target_` | record | Target

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `attachments` | hashmap | Attachments
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in comment [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `attachments:` | [record](/docs/search/deep-search/) | [Attachments](/docs/records/types/attachment/)
| `author:` | [text](/docs/search/filters/text/) | Actor
| `author.<type>:` | [record](/docs/search/deep-search/) | Actor
| `comment:` | [fulltext](/docs/search/filters/fulltext/) | Comment Content
| `created:` | [date](/docs/search/filters/dates/) | Created
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `on:` | [text](/docs/search/filters/text/) | On Type
| `on.<type>:` | [record](/docs/search/deep-search/) | Target
	
### Workist Columns

These columns are available on comment [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_target` | Target
| `c_created` | Created
| `c_id` | Id
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>