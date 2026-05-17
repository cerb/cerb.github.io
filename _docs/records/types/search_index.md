---
title: Search Index Records
excerpt: This page provides detailed information about Search Index records in Cerb,
  including their structure and usage within the system.
summary: A search index manages a custom search filter on any record type. Each
  index is backed by a search extension (e.g. local full-text, TF-IDF, BM25, vector
  embeddings, Elasticsearch, Qdrant, Pinecone). This page documents the Records
  API fields, dictionary placeholders, search filters, and worklist columns
  available on search index records, introduced in Cerb 11.2.
permalink: /docs/records/types/search_index/
toc:
  title: Search Index
  expand: Records
jumbotron:
  title: Search Index
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Records &raquo;
    url: /docs/records/
  - label: Types &raquo;
    url: /docs/records/types/
---

|---
|-|-
| **Name (singular):** | Search Index
| **Name (plural):** | Search Indexes
| **Alias (uri):** | search_index
| **Identifier (ID):** | cerb.contexts.search.index

* TOC
{:toc}

Search indexes provide configurable, plugin-driven [search](/docs/search/) on any [record type](/docs/records/types/). Each search index manages a linked custom filter, exposed as a `filter:` keyword on the record type's worklists.

A search index has:

* A **type** (an extension that provides the indexing strategy -- local full-text, vector embeddings, Elasticsearch, etc.)
* A **record type** the index applies to
* A **filter query** that constrains which records are included (e.g. "open tickets updated in the last year")
* A **content template** that formats the indexable text per record (e.g. `{% raw %}{{title}} {{content}}{% endraw %}`)
* A **priority** that controls autocompletion order; setting priority to `0` makes the index act as the default search filter when no explicit `filter:` is provided

Search indexes were introduced in [11.2](/releases/11.2/). New index types can be implemented via [plugins](/docs/plugins/).

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
| **x** | **`extension_id`** | [text](/docs/records/fields/types/text/) | The ID of the [search index extension](/docs/plugins/) (e.g. `cerb.search.engine.fulltext`)
|   | `extension_params_json` | [text](/docs/records/fields/types/text/) | Extension parameters serialized as JSON (e.g. content template, boosting weights)
|   | `id` | [number](/docs/records/fields/types/number/) | The ID of this search index
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this search index
|   | `priority` | [number](/docs/records/fields/types/number/) | Sort order in `filter:` autocompletion; `0` makes this the default filter when no `filter:` is specified
| **x** | **`record_filter`** | [text](/docs/records/fields/types/text/) | A search query that constrains which records are indexed
| **x** | **`record_type`** | [text](/docs/records/fields/types/text/) | The [record type](/docs/records/types/) alias this index applies to
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`uri`** | [text](/docs/records/fields/types/text/) | A short identifier used as the `filter:` keyword (e.g. `filter:by_title`)

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `created_at` | date | Created
| `extension_id` | text | Type
| `id` | number | Id
| `name` | text | Name
| `priority` | number | Priority
| `record_filter` | text | Filter query
| `record_type` | text | Record type
| `record_url` | text | Record URL
| `updated_at` | date | Updated
| `uri` | text | Filter URI

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
| `watchers` | watchers | [Watchers](/docs/guide/developers/dictionaries/#key-expansion)

### Search Query Fields

These [filters](/docs/search/#filters) are available in search index [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/#dates) | Created
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `priority:` | [number](/docs/search/#numbers) | Priority
| `record_filter:` | [text](/docs/search/#text) | Filter query
| `record_type:` | [text](/docs/search/#text) | Record type alias
| `type:` | [text](/docs/search/#text) | Extension ID
| `updated:` | [date](/docs/search/#dates) | Updated
| `uri:` | [text](/docs/search/#text) | Filter URI
| `watchers:` | [record](/docs/search/#deep-search) | [Watchers](/docs/records/types/worker/)

### Worklist Columns

These columns are available on search index [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `r_created_at` | Created
| `r_extension_id` | Type
| `r_id` | Id
| `r_name` | Name
| `r_priority` | Priority
| `r_record_filter` | Filter query
| `r_record_type` | Record type
| `r_updated_at` | Updated
| `r_uri` | Filter URI

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>
