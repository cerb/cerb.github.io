---
title: Knowledgebase Article Records
permalink: /docs/records/types/kb_article/
toc:
  title: Knowledgebase Article
  expand: Records
jumbotron:
  title: Knowledgebase Article
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
| **Name (singular):** | Knowledgebase Article
| **Name (plural):** | Knowledgebase Articles
| **Alias (uri):** | kb_article
| **Identifier (ID):** | cerberusweb.contexts.kb_article

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `categories` | [text](/docs/records/fields/types/text/) | A comma-separated list of IDs of [categories](/docs/records/types/kb_category/) to assign this article to 
|   | `content` | [text](/docs/records/fields/types/text/) | The content of the article 
|   | `format` | [text](/docs/records/fields/types/text/) | `text`, `markdown`, or `html` 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`title`** | [text](/docs/records/fields/types/text/) | The title of the article 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
|   | `views` | [number](/docs/records/fields/types/number/) | The number of times the article has been viewed in a [community portal](/docs/portals/) 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `content` | text | Content
| `format` | text | Format
| `id` | number | Id
| `record_url` | text | Record Url
| `title` | text | Title
| `updated` | date | Updated
| `views` | number | Views

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `attachments` | attachments | [Attachments](/docs/bots/behaviors/dictionaries/key-expansion/#attachments)
| `categories` | hashmap | Categories
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in knowledgebase article [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `category.id:` | [chooser](/docs/search/filters/choosers/) | [Category](/docs/records/types/kb_category/)
| `content:` | [fulltext](/docs/search/filters/fulltext/) | Content
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `format:` | [text](/docs/search/filters/text/) | Format
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `title:` | [text](/docs/search/filters/text/) | Title
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `views:` | [number](/docs/search/filters/numbers/) | Views
| `watchers:` | [record](/docs/search/#deep-search) | [Watchers](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on knowledgebase article [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `kb_format` | Format
| `kb_id` | Id
| `kb_title` | Title
| `kb_updated` | Updated
| `kb_views` | Views

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>