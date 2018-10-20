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
| **Alias:** | message

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in message [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `attachments:` | [Record](/docs/search/deep-search/) | [Attachments](/docs/records/types/attachment/)
| `content:` | [Fulltext](/docs/search/filters/fulltext/) | Content
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `header.messageId:` | [Text](/docs/search/filters/text/) | Message-Id Header
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `isBroadcast:` | [Boolean](/docs/search/filters/booleans/) | Is Broadcast
| `isEncrypted:` | [Boolean](/docs/search/filters/booleans/) | Is Encrypted
| `isNotSent:` | [Boolean](/docs/search/filters/booleans/) | Is Not Sent
| `isOutgoing:` | [Boolean](/docs/search/filters/booleans/) | Is Outgoing
| `isSigned:` | [Boolean](/docs/search/filters/booleans/) | Is Signed
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `notes:` | [Record](/docs/search/deep-search/) | [Notes](/docs/records/types/comment/)
| `responseTime:` | [Number](/docs/search/filters/numbers/) | Response Time
| `sender:` | [Record](/docs/search/deep-search/) | [Sender](/docs/records/types/address/)
| `sender.id:` | [Chooser](/docs/search/filters/choosers/) | [Sender](/docs/records/types/address/)
| `ticket:` | [Record](/docs/search/deep-search/) | [Ticket](/docs/records/types/ticket/)
| `ticket.id:` | [Chooser](/docs/search/filters/choosers/) | [Ticket Id](/docs/records/types/ticket/)
| `worker:` | [Record](/docs/search/deep-search/) | [Worker](/docs/records/types/worker/)
| `worker.id:` | [Chooser](/docs/search/filters/choosers/) | [Worker](/docs/records/types/worker/)

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in message [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `content` | Text | Content
| `content_html` | Text | Content Html
| `created` | Date | Created
| `headers` |  | Headers
| `html_attachment_id` | Number | Html Attachment Id
| `id` | Number | Id
| `is_broadcast` | Boolean | Is Broadcast
| `was_encrypted` | Boolean | Is Encrypted
| `is_not_sent` | Boolean | Is Not Sent
| `is_outgoing` | Boolean | Is Outgoing
| `was_signed` | Boolean | Is Signed
| `record_url` | Text | Record Url
| `reply_cc` | Text | Reply Cc
| `reply_to` | Text | Reply To
| `response_time` | Seconds | Response Time
| `sender_` | Record | [Sender](/docs/records/types/message/)
| `worker_` | Record | [Sender Worker](/docs/records/types/message/)
| `storage_size` | Size_Bytes | Size
| `ticket_` | Record | [Ticket](/docs/records/types/message/)
