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
    url: /docs/records/types/
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
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this email signature 
| **x** | **`owner__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of this email signature's owner: `app`, `role`, `group`, or `worker` 
|   | `owner_id` | [number](/docs/records/fields/types/number/) | The ID of this email signature's owner 
| **x** | **`signature`** | [text](/docs/records/fields/types/text/) | The [template](/docs/scripting/) of the signature 
|   | `signature_html` | [text](/docs/records/fields/types/text/) | The HTML [template](/docs/scripting/) of the signature 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `id` | number | Id
| `name` | text | Name
| `owner_` | record | Owner
| `record_url` | text | Record Url
| `signature` | text | Signature
| `signature_html` | text | Signature (Html)
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `attachments` | attachments | [Attachments](/docs/guide/developers/dictionaries/#key-expansion)
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in email signature [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `owner:` | virtual | Owner
| `owner.app:` | virtual | Owner
| `owner.bot:` | [record](/docs/search/#deep-search) | [Owner](/docs/records/types/bot/)
| `owner.group:` | [record](/docs/search/#deep-search) | [Owner](/docs/records/types/group/)
| `owner.role:` | [record](/docs/search/#deep-search) | [Owner](/docs/records/types/role/)
| `owner.worker:` | [record](/docs/search/#deep-search) | [Owner](/docs/records/types/worker/)
| `signature:` | [text](/docs/search/#text) | Signature
| `updated:` | [date](/docs/search/#dates) | Updated
	
### Worklist Columns

These columns are available on email signature [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_owner` | Owner
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `e_id` | Id
| `e_name` | Name
| `e_signature` | Signature
| `e_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>