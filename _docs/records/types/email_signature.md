---
title: Email Signature Records
permalink: /docs/records/types/email_signature/
toc:
  title: Email Signature
  expand: Records
jumbotron:
  title: Email Signature
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
| **Name (singular):** | Email Signature
| **Name (plural):** | Email Signatures
| **Alias (uri):** | email_signature
| **Identifier (ID):** | cerberusweb.contexts.email.signature

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `is_default` | [boolean](/docs/records/fields/types/boolean/) | Is this the default signature? 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this email signature 
| **x** | **`owner__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/#record-types) of this email signature's owner: `app`, `role`, `group`, or `worker` 
|   | `owner_id` | [number](/docs/records/fields/types/number/) | The ID of this email signature's owner 
| **x** | **`signature`** | [text](/docs/records/fields/types/text/) | The [template](/docs/bots/scripting/) of the signature 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `id` | number | Id
| `is_default` | boolean | Is Default
| `name` | text | Name
| `owner_` | record | Owner
| `record_url` | text | Record Url
| `signature` | text | Signature
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in email signature [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `isDefault:` | [boolean](/docs/search/filters/booleans/) | Default
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `owner:` | virtual | Owner
| `signature:` | [text](/docs/search/filters/text/) | Signature
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Workist Columns

These columns are available on email signature [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_owner` | Owner
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)
| `e_id` | Id
| `e_is_default` | Default
| `e_name` | Name
| `e_signature` | Signature
| `e_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>