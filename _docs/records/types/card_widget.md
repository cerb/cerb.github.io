---
title: Card Widget Records
permalink: /docs/records/types/card_widget/
toc:
  title: Card Widget
  expand: Records
jumbotron:
  title: Card Widget
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
| **Name (singular):** | Card Widget
| **Name (plural):** | Card Widgets
| **Alias (uri):** | card_widget
| **Identifier (ID):** | cerb.contexts.card.widget

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`extension_id`** | [text](/docs/records/fields/types/text/) | [Card Widget Type](/docs/plugins/extensions/points/cerb.card.widget/) 
|   | `extension_params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this card widget 
|   | `pos` | [number](/docs/records/fields/types/number/) | The order of the widget on the card; `0` is first (top-left) proceeding in rows then columns 
| **x** | **`record_type`** | [context](/docs/records/fields/types/context/) | The record type of the card containing this widget 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
|   | `width_units` | [number](/docs/records/fields/types/number/) | `1` (25%), `2` (50%), `3` (75%), `4` (100%) 
|   | `zone` | [text](/docs/records/fields/types/text/) | The name of the dashboard zone containing the widget; this varies by layout; generally `sidebar` and `content` 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `id` | number | Id
| `name` | text | Name
| `record_url` | text | Record Url
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in card widget [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/filters/dates/) | Created
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `pos:` | [number](/docs/search/filters/numbers/) | Order
| `type:` | [text](/docs/search/filters/text/) | Name
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `width:` | [number](/docs/search/filters/numbers/) | Width
| `zone:` | [text](/docs/search/filters/text/) | Zone
	
### Worklist Columns

These columns are available on card widget [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_created_at` | Created
| `c_extension_id` | Type
| `c_id` | Id
| `c_name` | Name
| `c_pos` | Order
| `c_record_type` | Record Type
| `c_updated_at` | Updated
| `c_width_units` | Width
| `c_zone` | Zone
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>