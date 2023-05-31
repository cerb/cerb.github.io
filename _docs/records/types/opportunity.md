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
    url: /docs/records/types/
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
|   | `closed_at` | [timestamp](/docs/records/fields/types/timestamp/) |  
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `status` | [text](/docs/records/fields/types/text/) | `open`, `closed_won`, `closed_lost`; alternative to `status_id` 
|   | `status_id` | [number](/docs/records/fields/types/number/) | `0` (open), `1` (closed/won), `2` (closed/lost); alternaitve to `status` 
| **x** | **`title`** | [text](/docs/records/fields/types/text/) | The name of the opportunity 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `amount` | currency | Amount
| `amount_` | record | Amount Label
| `amount_currency_` | record | [Currency](/docs/records/types/currency/)
| `closed_at` | date | Closed At
| `created` | date | Created
| `id` | number | Id
| `record_url` | text | Record Url
| `status` | text | Status
| `title` | text | Title
| `updated` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in opportunity [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `amount:` | [number](/docs/search/#numbers) | Amount
| `closedDate:` | [date](/docs/search/#dates) | Closed Date
| `comments:` | [fulltext](/docs/search/#fulltext) | Comment Content
| `created:` | [date](/docs/search/#dates) | Created
| `currency.id:` | [chooser](/docs/search/#choosers) | [Currency](/docs/records/types/currency/)
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Title
| `status:` | [number](/docs/search/#numbers) | Status
| `updated:` | [date](/docs/search/#dates) | Updated
| `watchers:` | [record](/docs/search/#deep-search) | [Watchers](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on opportunity [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
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
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>