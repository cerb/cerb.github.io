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
    url: /docs/records/types/
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
|   | `is_markdown` | [boolean](/docs/records/fields/types/boolean/) | `0`=plaintext, `1`=Markdown 
|   | `is_pinned` | [boolean](/docs/records/fields/types/boolean/) | `0`=not pinned, `1`=pinned 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`target__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/#record-type) of the target record 
| **x** | **`target_id`** | [number](/docs/records/fields/types/number/) | The ID of the target record 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `author_` | record | Author
| `comment` | text | Content
| `created` | date | Created
| `id` | number | Id
| `target_` | record | Target

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `attachments` | attachments | [Attachments](/docs/bots/behaviors/dictionaries/key-expansion/#attachments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in comment [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `attachments:` | [record](/docs/search/#deep-search) | [Attachments](/docs/records/types/attachment/)
| `author:` | [text](/docs/search/#text) | Actor
| `author.<type>:` | [record](/docs/search/#deep-search) | Actor
| `comment:` | [fulltext](/docs/search/#fulltext) | Comment Content
| `created:` | [date](/docs/search/#dates) | Created
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `isMarkdown:` | [boolean](/docs/search/#booleans) | Markdown
| `isPinned:` | [boolean](/docs/search/#booleans) | Is Pinned
| `links:` | [links](/docs/search/#links) | Record Links
| `on:` | [text](/docs/search/#text) | On Type
| `on.<type>:` | [record](/docs/search/#deep-search) | Target
	
### Worklist Columns

These columns are available on comment [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_target` | Target
| `c_created` | Created
| `c_id` | Id
| `c_is_markdown` | Markdown
| `c_is_pinned` | Is Pinned
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>