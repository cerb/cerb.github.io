---
title: Feed Item Records
permalink: /docs/records/types/feed_item/
toc:
  title: Feed Item
  expand: Records
jumbotron:
  title: Feed Item
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
| **Name (singular):** | Feed Item
| **Name (plural):** | Feed Items
| **Alias (uri):** | feed_item
| **Identifier (ID):** | cerberusweb.contexts.feed.item

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
| **x** | **`feed_id`** | [number](/docs/records/fields/types/number/) | The ID of the [feed](/docs/records/types/feed/) containing this item 
|   | `guid` | [text](/docs/records/fields/types/text/) | The globally unique ID of this item in the feed 
|   | `is_closed` | [boolean](/docs/records/fields/types/boolean/) | Is this item viewed/resolved? 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`title`** | [text](/docs/records/fields/types/text/) | The title of this feed item 
| **x** | **`url`** | [text](/docs/records/fields/types/text/) | The URL of this feed item 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `created_at` | date | Created
| `feed_` | record | [Feed](/docs/records/types/feed/)
| `guid` | text | Guid
| `id` | number | Id
| `is_closed` | boolean | Is Closed
| `record_url` | text | Record Url
| `title` | text | Title
| `url` | text | Url

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in feed item [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `comments:` | [fulltext](/docs/search/#fulltext) | Comment Content
| `created:` | [date](/docs/search/#dates) | Created
| `feed:` | [record](/docs/search/#deep-search) | [Feed](/docs/records/types/feed/)
| `feed.id:` | [chooser](/docs/search/#choosers) | [Feed](/docs/records/types/feed/)
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `isClosed:` | [boolean](/docs/search/#booleans) | Is Closed
| `links:` | [links](/docs/search/#links) | Record Links
| `title:` | [text](/docs/search/#text) | Title
| `url:` | [text](/docs/search/#text) | Url
| `watchers:` | [watchers](/docs/search/#watchers) | Watchers
	
### Worklist Columns

These columns are available on feed item [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `fi_created_date` | Created
| `fi_feed_id` | Feed
| `fi_is_closed` | Is Closed
| `fi_title` | Title
| `fi_url` | Url

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>