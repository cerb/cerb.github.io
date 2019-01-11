---
title: Opportunity Records
permalink: /docs/records/types/opportunity/
toc:
  title: Opportunity
  expand: Records
jumbotron:
  title: Opportunity
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
| **Name (singular):** | Opportunity
| **Name (plural):** | Opportunities
| **Alias (uri):** | opportunity
| **Identifier (ID):** | cerberusweb.contexts.opportunity

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `amount` | [float](/docs/records/fields/types/float/) | The amount of the opportunity in the given currency 
|   | `amount_currency_id` | [number](/docs/records/fields/types/number/) | The ID of the [currency](/docs/records/types/currency/) 
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
|   | `status` | [text](/docs/records/fields/types/text/) | `open`, `closed_won`, `closed_lost`; alternative to `status_id` 
|   | `status_id` | [number](/docs/records/fields/types/number/) | `0` (open), `1` (closed/won), `2` (closed/lost); alternaitve to `status` 
| **x** | **`title`** | [text](/docs/records/fields/types/text/) | The name of the opportunity 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `amount` | currency | Amount
| `amount_` | record | Amount Label
| `amount_currency_` | record | [Currency](/docs/records/types/currency/)
| `created` | date | Created
| `id` | number | Id
| `record_url` | text | Record Url
| `status` | text | Status
| `title` | text | Title
| `updated` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
| `watchers` | watchers | Watchers
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in opportunity [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `amount:` | [number](/docs/search/filters/numbers/) | Amount
| `closedDate:` | [date](/docs/search/filters/dates/) | Closed Date
| `comments:` | [fulltext](/docs/search/filters/fulltext/) | Comment Content
| `created:` | [date](/docs/search/filters/dates/) | Created
| `currency.id:` | [chooser](/docs/search/filters/choosers/) | [Currency](/docs/records/types/currency/)
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Title
| `status:` | [number](/docs/search/filters/numbers/) | Status
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
	
### Worklist Columns

These columns are available on opportunity [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)
| `o_closed_date` | Closed Date
| `o_created_date` | Created
| `o_currency_amount` | Amount
| `o_currency_id` | Currency
| `o_id` | Id
| `o_name` | Title
| `o_status_id` | Status
| `o_updated_date` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>