---
title: Email Template Records
permalink: /docs/records/types/html_template/
toc:
  title: Email Template
  expand: Records
jumbotron:
  title: Email Template
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
| **Name (singular):** | Email Template
| **Name (plural):** | Email Templates
| **Alias (uri):** | html_template
| **Identifier (ID):** | cerberusweb.contexts.mail.html_template

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `content` | [text](/docs/records/fields/types/text/) | The content of the template 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this email template 
| **x** | **`owner__context`** | [context](/docs/records/fields/types/context/) | The [record type](/docs/records/types/) of this email template's owner: `app`, `role`, `group`, or `worker` 
| **x** | **`owner_id`** | [number](/docs/records/fields/types/number/) | The ID of this email template's owner 
|   | `signature_id` | [number](/docs/records/fields/types/number/) | The optional [email signature](/docs/records/types/email_signature/) of this template 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `content` | text | Content
| `id` | number | Id
| `name` | text | Name
| `record_url` | text | Record Url
| `signature_` | record | [Signature](/docs/records/types/email_signature/)
| `signature_owner_` | record | Signature Owner
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

These [filters](/docs/search/#filters) are available in email template [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `comments:` | [fulltext](/docs/search/#fulltext) | Comment Content
| `content:` | [text](/docs/search/#text) | Content
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `name:` | [text](/docs/search/#text) | Name
| `signature.id:` | [number](/docs/search/#numbers) | Signature
| `updated:` | [date](/docs/search/#dates) | Updated
	
### Worklist Columns

These columns are available on email template [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `m_content` | Content
| `m_id` | Id
| `m_name` | Name
| `m_signature_id` | Signature
| `m_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>