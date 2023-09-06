---
title: Classifier Classification Records
permalink: /docs/records/types/classifier_class/
toc:
  title: Classifier Classification
  expand: Records
jumbotron:
  title: Classifier Classification
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
| **Name (singular):** | Classification
| **Name (plural):** | Classifications
| **Alias (uri):** | classifier_class
| **Identifier (ID):** | cerberusweb.contexts.classifier.class

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`classifier_id`** | [number](/docs/records/fields/types/number/) | The ID of the parent [classifier](/docs/records/types/classifier/) 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this classification 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `classifier_` | record | [Classifier](/docs/records/types/classifier/)
| `classifier_owner_` | record | Classifier Owner
| `id` | number | Id
| `name` | text | Name
| `record_url` | text | Record Url
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in classifier classification [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `classifier:` | [record](/docs/search/#deep-search) | [Classifier](/docs/records/types/classifier/)
| `classifier.id:` | [chooser](/docs/search/#choosers) | [Classifier](/docs/records/types/classifier/)
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `updated:` | [date](/docs/search/#dates) | Updated
	
### Worklist Columns

These columns are available on classifier classification [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_classifier_id` | Classifier
| `c_dictionary_size` | Dictionary Size
| `c_id` | Id
| `c_name` | Name
| `c_training_count` | Examples
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