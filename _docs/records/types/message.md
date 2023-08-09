---
title: Message Records
permalink: /docs/records/types/message/
toc:
  title: Message
  expand: Records
jumbotron:
  title: Message
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
| **Name (singular):** | Message
| **Name (plural):** | Messages
| **Alias (uri):** | message
| **Identifier (ID):** | cerberusweb.contexts.message

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`content`** | [text](/docs/records/fields/types/text/) | Message content 
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `hash_header_message_id` | [text](/docs/records/fields/types/text/) | A SHA-1 hash of the `Message-Id:` header; used for message threading 
| **x** | **`headers`** | [text](/docs/records/fields/types/text/) | Message headers 
|   | `html_attachment_id` | [number](/docs/records/fields/types/number/) | The [attachment](/docs/records/types/attachment/) ID containing the HTML message content 
|   | `is_broadcast` | [boolean](/docs/records/fields/types/boolean/) | Was this message sent using the broadcast feature? 
|   | `is_not_sent` | [boolean](/docs/records/fields/types/boolean/) | Was this message saved without sending? 
|   | `is_outgoing` | [boolean](/docs/records/fields/types/boolean/) | Was this an outgoing reply from a worker? 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `response_time` | [number](/docs/records/fields/types/number/) | Response time in seconds 
|   | `sender` | [text](/docs/records/fields/types/text/) | The [email address](/docs/records/types/address/) of the sender; alternative to `sender_id` 
| **x** | **`sender_id`** | [number](/docs/records/fields/types/number/) | The ID of the sender's [email address](/docs/records/types/address/) record 
|   | `storage_size` | [number](/docs/records/fields/types/number/) | Size of the message in bytes 
| **x** | **`ticket_id`** | [number](/docs/records/fields/types/number/) | The ID of the message's [ticket](/docs/records/types/ticket/) record 
|   | `ticket_mask` | [text](/docs/records/fields/types/text/) | The parent [ticket](/docs/records/types/ticket/) mask; alternative to `ticket_id` 
|   | `token` | [text](/docs/records/fields/types/text/) | A random unique identifier for the message (synchronized with draft) 
|   | `was_encrypted` | [boolean](/docs/records/fields/types/boolean/) | Was the message sent encrypted? 
|   | `worker` | [text](/docs/records/fields/types/text/) | The [worker](/docs/records/types/worker/) who sent the message (if any); alternative to `worker_id` 
|   | `worker_id` | [number](/docs/records/fields/types/number/) | If outgoing, the ID of the [worker](/docs/records/types/worker/) who sent the message 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/guide/developers/dictionaries/) for [automations](/docs/automations/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `created` | date | Created
| `html_attachment_id` | number | Html Attachment Id
| `id` | number | Id
| `is_broadcast` | boolean | Is Broadcast
| `is_not_sent` | boolean | Is Not Sent
| `is_outgoing` | boolean | Is Outgoing
| `record_url` | text | Record Url
| `response_time` | seconds | Response Time
| `sender_` | record | [Sender](/docs/records/types/address/)
| `signed_at` | date | Signed At
| `signed_key_fingerprint` | text | Signed By
| `storage_size` | number | Size (Bytes)
| `ticket_` | record | [Ticket](/docs/records/types/ticket/)
| `token` | text | Token
| `was_encrypted` | boolean | Is Encrypted
| `worker_` | record | [Sender Worker](/docs/records/types/worker/)

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/guide/developers/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `attachments` | attachments | [Attachments](/docs/guide/developers/dictionaries/#key-expansion)
| `comments` | comments | [Comments](/docs/guide/developers/dictionaries/#key-expansion)
| `content` | text | Content
| `content_html` | text | Content (Html)
| `custom_<id>` | mixed | [Custom Fields](/docs/guide/developers/dictionaries/#key-expansion)
| `headers` | hashmap | Headers
| `links` | links | [Links](/docs/guide/developers/dictionaries/#key-expansion)
| `reply_cc` | text | `Cc:` recipients (comma-separated)
| `reply_to` | text | `To:` recipients (comma-separated)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in message [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `attachments:` | [record](/docs/search/#deep-search) | [Attachments](/docs/records/types/attachment/)
| `content:` | [fulltext](/docs/search/#fulltext) | Content
| `created:` | [date](/docs/search/#dates) | Created
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `header.cc:` | [text](/docs/search/#text) | Cc
| `header.deliveredTo:` | [text](/docs/search/#text) | Delivered-To
| `header.from:` | [text](/docs/search/#text) | From
| `header.messageId:` | [text](/docs/search/#text) | Message-Id Header
| `header.to:` | [text](/docs/search/#text) | To
| `id:` | context | Id
| `isBroadcast:` | [boolean](/docs/search/#booleans) | Is Broadcast
| `isEncrypted:` | [boolean](/docs/search/#booleans) | Is Encrypted
| `isNotSent:` | [boolean](/docs/search/#booleans) | Is Not Sent
| `isOutgoing:` | [boolean](/docs/search/#booleans) | Is Outgoing
| `links:` | [links](/docs/search/#links) | Record Links
| `notes:` | [record](/docs/search/#deep-search) | [Notes](/docs/records/types/comment/)
| `responseTime:` | [number](/docs/search/#numbers) | Response Time
| `sender:` | [record](/docs/search/#deep-search) | [Sender](/docs/records/types/address/)
| `sender.id:` | [chooser](/docs/search/#choosers) | [Sender](/docs/records/types/address/)
| `signed.at:` | [date](/docs/search/#dates) | Signed At
| `signed.fingerprint:` | [text](/docs/search/#text) | Signed By
| `size:` | [number](/docs/search/#numbers) | Size
| `ticket:` | [record](/docs/search/#deep-search) | [Ticket](/docs/records/types/ticket/)
| `ticket.bucket.id:` | [chooser](/docs/search/#choosers) | [Bucket](/docs/records/types/bucket/)
| `ticket.bucket.name:` | [chooser](/docs/search/#choosers) | [Bucket](/docs/records/types/bucket/)
| `ticket.group.id:` | [chooser](/docs/search/#choosers) | [Group](/docs/records/types/group/)
| `ticket.group.name:` | [chooser](/docs/search/#choosers) | [Bucket](/docs/records/types/group/)
| `ticket.id:` | [chooser](/docs/search/#choosers) | [Ticket Id](/docs/records/types/ticket/)
| `token:` | [text](/docs/search/#text) | Token
| `worker:` | [record](/docs/search/#deep-search) | [Worker](/docs/records/types/worker/)
| `worker.id:` | [chooser](/docs/search/#choosers) | [Worker](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on message [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_has_fieldset` | Fieldset
| `a_email` | Email
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `m_address_id` | Sender
| `m_created_date` | Created
| `m_is_broadcast` | Is Broadcast
| `m_is_not_sent` | Is Not Sent
| `m_is_outgoing` | Is Outgoing
| `m_response_time` | Response Time
| `m_signed_at` | Signed At
| `m_signed_key_fingerprint` | Signed By
| `m_ticket_id` | Ticket Id
| `m_token` | Token
| `m_was_encrypted` | Is Encrypted
| `m_worker_id` | Worker
| `t_bucket_id` | Bucket
| `t_group_id` | Group
| `t_mask` | Mask
| `t_subject` | Subject

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>