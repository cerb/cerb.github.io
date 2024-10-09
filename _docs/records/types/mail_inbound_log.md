---
title: Email Inbound Log Records
permalink: /docs/records/types/mail_inbound_log/
toc:
  title: Email Inbound Log
  expand: Records
jumbotron:
  title: Email Inbound Log
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
| **Name (singular):** | Email Inbound Log
| **Name (plural):** | Email Inbound Logs
| **Alias (uri):** | mail_inbound_log
| **Identifier (ID):** | cerb.contexts.mail.inbound.log

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `events_log_json` | [text](/docs/records/fields/types/text/) |  
|   | `from_id` | [number](/docs/records/fields/types/number/) |  
|   | `header_message_id` | [text](/docs/records/fields/types/text/) |  
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `mailbox_id` | [number](/docs/records/fields/types/number/) |  
|   | `message_id` | [number](/docs/records/fields/types/number/) |  
|   | `parse_time_ms` | [number](/docs/records/fields/types/number/) | (0-4294967296) 
|   | `status_id` | [number](/docs/records/fields/types/number/) | (0-2) 
|   | `status_message` | [text](/docs/records/fields/types/text/) |  
|   | `subject` | [text](/docs/records/fields/types/text/) |  
|   | `ticket_id` | [number](/docs/records/fields/types/number/) |  
|   | `to` | [text](/docs/records/fields/types/text/) |  

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
| `parse_time_ms` | number | Parse Time (Ms)
| `record_url` | text | Record Url
| `status_id` | number | Status
| `status_message` | text | Status Message
| `subject` | text | Subject
| `to` | text | To

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comment_count` | number | [Comment](/docs/records/types/comments/) count on the record
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `events_log` | object[] | Events Log
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in email inbound log [search queries](/docs/search/):

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
| `mailbox:` | [record](/docs/search/#deep-search) | [Mailbox](/docs/records/types/mailbox/)
| `mailbox.id:` | [chooser](/docs/search/#choosers) | [Mailbox](/docs/records/types/mailbox/)
| `message:` | [record](/docs/search/#deep-search) | [Message](/docs/records/types/message/)
| `message.id:` | [chooser](/docs/search/#choosers) | [Message](/docs/records/types/message/)
| `parseTime.ms:` | [number](/docs/search/#numbers) | Parse Time (Ms)
| `status:` | virtual | Status
| `status.message:` | [text](/docs/search/#text) | Status Message
| `subject:` | [text](/docs/search/#text) | Subject
| `ticket:` | [record](/docs/search/#deep-search) | [Ticket](/docs/records/types/ticket/)
| `ticket.id:` | [chooser](/docs/search/#choosers) | [Ticket](/docs/records/types/ticket/)
| `to:` | [text](/docs/search/#text) | To
	
### Worklist Columns

These columns are available on email inbound log [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `m_created_at` | Created
| `m_from_id` | From
| `m_header_message_id` | Header Message-Id
| `m_id` | Id
| `m_mailbox_id` | Mailbox
| `m_message_id` | Message
| `m_parse_time_ms` | Parse Time (Ms)
| `m_status_id` | Status
| `m_status_message` | Status Message
| `m_subject` | Subject
| `m_ticket_id` | Ticket
| `m_to` | To

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>