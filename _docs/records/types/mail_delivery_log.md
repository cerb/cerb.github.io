---
title: Email Delivery Log Records
permalink: /docs/records/types/mail_delivery_log/
toc:
  title: Email Delivery Log
  expand: Records
jumbotron:
  title: Email Delivery Log
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
| **Name (singular):** | Email Delivery Log
| **Name (plural):** | Email Delivery Logs
| **Alias (uri):** | mail_delivery_log
| **Identifier (ID):** | cerb.contexts.mail.delivery.log

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `from_id` | [number](/docs/records/fields/types/number/) |  
|   | `header_message_id` | [text](/docs/records/fields/types/text/) |  
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `mail_transport_id` | [number](/docs/records/fields/types/number/) |  
|   | `status_id` | [number](/docs/records/fields/types/number/) | (0-2) 
|   | `status_message` | [text](/docs/records/fields/types/text/) |  
|   | `subject` | [text](/docs/records/fields/types/text/) |  
|   | `to` | [text](/docs/records/fields/types/text/) |  
|   | `type` | [text](/docs/records/fields/types/text/) |  

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `created_at` | date | Created
| `header_message_id` | text | Header Message-Id
| `id` | number | Id
| `record_url` | text | Record Url
| `status_id` | number | Status
| `status_message` | text | Status Message
| `subject` | text | Subject
| `to` | text | To
| `type` | text | Type

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
| `properties` | object | Properties
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in email delivery log [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/#dates) | Created
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `from:` | [record](/docs/search/#deep-search) | [From](/docs/records/types/address/)
| `from.id:` | [chooser](/docs/search/#choosers) | [From](/docs/records/types/address/)
| `header.messageId:` | [text](/docs/search/#text) | Header Message-Id
| `id:` | [number](/docs/search/#numbers) | Id
| `links:` | [links](/docs/search/#links) | Record Links
| `mailTransport:` | [record](/docs/search/#deep-search) | [Mailtransport](/docs/records/types/mail_transport/)
| `mailTransport.id:` | [chooser](/docs/search/#choosers) | [Email Transport](/docs/records/types/mail_transport/)
| `status:` | virtual | Status
| `status.id:` | [number](/docs/search/#numbers) | Status
| `subject:` | [text](/docs/search/#text) | Subject
| `to:` | [text](/docs/search/#text) | To
| `type:` | [text](/docs/search/#text) | Type
	
### Worklist Columns

These columns are available on email delivery log [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `m_created_at` | Created
| `m_from_id` | From
| `m_header_message_id` | Header Message-Id
| `m_id` | Id
| `m_mail_transport_id` | Email Transport
| `m_status_id` | Status
| `m_status_message` | Status Message
| `m_subject` | Subject
| `m_to` | To
| `m_type` | Type

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>