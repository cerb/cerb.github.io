---
title: Currency Records
permalink: /docs/records/types/currency/
toc:
  title: Currency
  expand: Records
jumbotron:
  title: Currency
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
| **Name (singular):** | Currency
| **Name (plural):** | Currencies
| **Alias (uri):** | currency
| **Identifier (ID):** | cerberusweb.contexts.currency

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `code` | [text](/docs/records/fields/types/text/) | Currency code; e.g. `USD` 
|   | `decimal_at` | [number](/docs/records/fields/types/number/) | The number of significant decimal places (0-16); e.g. `2` for `0.00` 
|   | `is_default` | [boolean](/docs/records/fields/types/boolean/) | Is this the default currency? 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
|   | `name` | [text](/docs/records/fields/types/text/) | The singular name of this currency; `Dollar` 
|   | `name_plural` | [text](/docs/records/fields/types/text/) | The plural name of this currency; `Dollars` 
|   | `symbol` | [text](/docs/records/fields/types/text/) | Symbol; `$`, `£`, `€` 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `code` | text | Code
| `decimal_at` | number | Decimal Places
| `id` | number | Id
| `is_default` | boolean | Default
| `name` | text | Name
| `name_plural` | text | Plural
| `record_url` | text | Record Url
| `symbol` | text | Symbol
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
| `watchers` | watchers | Watchers
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in currency [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `code:` | [text](/docs/search/filters/text/) | Code
| `decimalPlaces:` | [number](/docs/search/filters/numbers/) | Decimal Places
| `default:` | [boolean](/docs/search/filters/booleans/) | Default
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `symbol:` | [text](/docs/search/filters/text/) | Symbol
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
	
### Worklist Columns

These columns are available on currency [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_code` | Code
| `c_decimal_at` | Decimal Places
| `c_id` | Id
| `c_is_default` | Default
| `c_name` | Name
| `c_name_plural` | Plural
| `c_symbol` | Symbol
| `c_updated_at` | Updated
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>