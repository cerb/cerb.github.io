---
title: Draft Records
permalink: /docs/records/types/draft/
toc:
  title: Draft
  expand: Records
jumbotron:
  title: Draft
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
| **Name (singular):** | Draft
| **Name (plural):** | Drafts
| **Alias (uri):** | draft
| **Identifier (ID):** | cerberusweb.contexts.mail.draft

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `is_queued` | [boolean](/docs/records/fields/types/boolean/) |  
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `name` | [text](/docs/records/fields/types/text/) | The subject line of the draft message 
|   | `params` | [object](/docs/records/fields/types/object/) | JSON-encoded key/value object 
|   | `queue_delivery_date` | [number](/docs/records/fields/types/number/) | (0-4294967296) 
|   | `queue_fails` | [number](/docs/records/fields/types/number/) | (0-4294967296) 
|   | `ticket_id` | [number](/docs/records/fields/types/number/) |  
|   | `to` | [text](/docs/records/fields/types/text/) | The `To:` line of the draft message 
| **x** | **`type`** | [text](/docs/records/fields/types/text/) | The type of draft: `mail.compose`, `ticket.reply`, or `ticket.forward` 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`worker_id`** | [number](/docs/records/fields/types/number/) | The ID of the [worker](/docs/records/types/worker/) who owns the draft 

#### params (mail.compose)

|---
| Key | Value
|-|-
| `bcc` | The `Bcc:` recipients
| `bucket_id` | The [bucket](/docs/records/types/bucket/) ID to move the ticket to
| `cc` | The `Cc:` recipients
| `content` | The message content
| `custom_fields` | An object with custom field IDs as keys and their values
| `format` | `parsedown` (Markdown), or blank for plaintext
| `file_ids` | An array of [attachment](/docs/records/types/attachment/) IDs
| `group_id` | The [group](/docs/records/types/group/) ID to move the ticket to
| `org_id` | The [org](/docs/records/types/org/) ID to assign
| `org_name` | The [org](/docs/records/types/org/) name to assign
| `owner_id` | The [worker](/docs/records/types/worker/) ID to assign
| `send_at` | The optional timestamp to deliver the message at
| `status_id` | `0` (open), `1` (waiting), `2` (closed)
| `subject` | The message `Subject:`
| `ticket_reopen` | When the status is waiting or closed, the timestamp to reopen at
| `to` | The `To:` recipients

#### params (ticket.reply / ticket.forward)

|---
| Key | Value
|-|-
| `bcc` | The `Bcc:` recipients
| `bucket_id` | The [bucket](/docs/records/types/bucket/) ID to move the ticket to
| `cc` | The `Cc:` recipients
| `content` | The message content
| `custom_fields` | An object with custom field IDs as keys and their values
| `file_ids` | An array of [attachment](/docs/records/types/attachment/) IDs
| `format` | `parsedown` (Markdown), or blank for plaintext
| `group_id` | The [group](/docs/records/types/group/) ID to move the ticket to
| `in_reply_message_id` | The [message](/docs/records/types/message/) ID being responded to
| `owner_id` | The [worker](/docs/records/types/worker/) ID to assign
| `send_at` | The optional timestamp to deliver the message at
| `status_id` | `0` (open), `1` (waiting), `2` (closed)
| `subject` | The message `Subject:`
| `ticket_reopen` | When the status is waiting or closed, the timestamp to reopen at
| `to` | The `To:` recipients

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `content` | text | Content
| `id` | number | Id
| `name` | text | Name
| `to` | text | To
| `updated` | date | Updated
| `worker_` | record | [Worker](/docs/records/types/worker/)

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in draft [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `is.queued:` | [boolean](/docs/search/filters/booleans/) | Is Queued
| `name:` | [text](/docs/search/filters/text/) | Name
| `queue.deliverAt:` | [date](/docs/search/filters/dates/) | Delivery Date
| `queue.fails:` | [number](/docs/search/filters/numbers/) | # Fails
| `to:` | [text](/docs/search/filters/text/) | To
| `type:` | [text](/docs/search/filters/text/) | Message Type
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `worker:` | [record](/docs/search/deep-search/) | [Worker](/docs/records/types/worker/)
| `worker.id:` | [chooser](/docs/search/filters/choosers/) | [Worker](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on draft [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `m_hint_to` | To
| `m_id` | Id
| `m_is_queued` | Is Queued
| `m_name` | Name
| `m_queue_delivery_date` | Delivery Date
| `m_queue_fails` | # Fails
| `m_type` | Message Type
| `m_updated` | Updated
| `m_worker_id` | Worker

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>