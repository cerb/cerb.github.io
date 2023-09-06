---
title: Classifier Example Records
permalink: /docs/records/types/classifier_example/
toc:
  title: Classifier Example
  expand: Records
jumbotron:
  title: Classifier Example
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
| **Name (singular):** | Classifier Example
| **Name (plural):** | Classifier Examples
| **Alias (uri):** | classifier_example
| **Identifier (ID):** | cerberusweb.contexts.classifier.example

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `class_id` | [number](/docs/records/fields/types/number/) | The ID of the [classification](/docs/records/types/classifier_class/) this example trains 
| **x** | **`classifier_id`** | [number](/docs/records/fields/types/number/) | The ID of the [classifier](/docs/records/types/classifier/) this example belongs to 
| **x** | **`expression`** | [text](/docs/records/fields/types/text/) | The expression used for training the classifier 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `class_` | record | [Classification](/docs/records/types/classifier_class/)
| `classifier_` | record | [Classifier](/docs/records/types/classifier/)
| `classifier_owner_` | record | Classifier Owner
| `expression` | text | Expression
| `id` | number | Id
| `record_url` | text | Record Url
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in classifier example [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `class:` | [record](/docs/search/#deep-search) | [Class](/docs/records/types/classifier_class/)
| `class.id:` | [chooser](/docs/search/#choosers) | [Classification](/docs/records/types/classifier_class/)
| `classifier:` | [record](/docs/search/#deep-search) | [Classifier](/docs/records/types/classifier/)
| `classifier.id:` | [chooser](/docs/search/#choosers) | [Classifier](/docs/records/types/classifier/)
| `expression:` | [text](/docs/search/#text) | Expression
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `updated:` | [date](/docs/search/#dates) | Updated
	
### Worklist Columns

These columns are available on classifier example [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_class_id` | Classification
| `c_classifier_id` | Classifier
| `c_expression` | Expression
| `c_id` | Id
| `c_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>