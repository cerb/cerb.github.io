---
title: Call Records
permalink: /docs/records/types/call/
toc:
  title: Call
  expand: Records
jumbotron:
  title: Call
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
| **Name (singular):** | Call
| **Name (plural):** | Calls
| **Alias (uri):** | call
| **Identifier (ID):** | cerberusweb.contexts.call

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `is_closed` | [boolean](/docs/records/fields/types/boolean/) | Is this call resolved? 
|   | `is_outgoing` | [boolean](/docs/records/fields/types/boolean/) | `0` (incoming), `1` (outgoing) 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `phone` | [text](/docs/records/fields/types/text/) | The phone number of the caller or target 
| **x** | **`subject`** | [text](/docs/records/fields/types/text/) | A brief summary of the call 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `created` | date | Created
| `id` | number | Id
| `is_closed` | boolean | Is Closed
| `is_outgoing` | boolean | Is Outgoing
| `phone` | text | Phone
| `record_url` | text | Record Url
| `subject` | text | Subject
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

These [filters](/docs/search/#filters) are available in call [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `comments:` | [fulltext](/docs/search/filters/fulltext/) | Comment Content
| `created:` | [date](/docs/search/filters/dates/) | Created
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `isClosed:` | [boolean](/docs/search/filters/booleans/) | Is Closed
| `isOutgoing:` | [boolean](/docs/search/filters/booleans/) | Is Outgoing
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `phone:` | [text](/docs/search/filters/text/) | Phone
| `subject:` | [text](/docs/search/filters/text/) | Subject
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
	
### Worklist Columns

These columns are available on call [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_created_date` | Created
| `c_is_closed` | Is Closed
| `c_is_outgoing` | Is Outgoing
| `c_phone` | Phone
| `c_subject` | Subject
| `c_updated_date` | Updated
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>