---
title: Feedback Records
permalink: /docs/records/types/feedback/
toc:
  title: Feedback
  expand: Records
jumbotron:
  title: Feedback
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
| **Name (singular):** | Feedback
| **Name (plural):** | Feedback
| **Alias (uri):** | feedback
| **Identifier (ID):** | cerberusweb.contexts.feedback

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `author_id` | [number](/docs/records/fields/types/number/) | The ID of the [email address](/docs/records/types/address/) of the feedback author 
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`quote_mood_id`** | [number](/docs/records/fields/types/number/) | `0` (neutral), `1` (praise), `2` (criticism) 
| **x** | **`quote_text`** | [text](/docs/records/fields/types/text/) | The feedback content 
|   | `url` | [url](/docs/records/fields/types/url/) | (optional) The URL where the feedback was received 
|   | `worker_id` | [number](/docs/records/fields/types/number/) | The ID of the [worker](/docs/records/types/worker/) who captured the feedback 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `author_` | record | [Author](/docs/records/types/address/)
| `created` | date | Log Date
| `id` | number | Id
| `quote_mood` | text | Mood
| `quote_text` | text | Quote
| `url` | text | Link
| `worker_` | record | [Worker](/docs/records/types/worker/)

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
| `watchers` | watchers | [Watchers](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in feedback [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/#dates) | Log Date
| `email:` | [record](/docs/search/#deep-search) | [Email](/docs/records/types/address/)
| `email.id:` | [chooser](/docs/search/#choosers) | [Author Email](/docs/records/types/address/)
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `mood:` | [text](/docs/search/#text) | Mood
| `quote:` | [text](/docs/search/#text) | Quote
| `watchers:` | [watchers](/docs/search/#watchers) | Watchers
| `worker:` | [record](/docs/search/#deep-search) | [Worker](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on feedback [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `f_log_date` | Log Date
| `f_quote_mood` | Mood
| `f_quote_text` | Quote
| `f_source_url` | Link
| `f_worker_id` | Created By

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>