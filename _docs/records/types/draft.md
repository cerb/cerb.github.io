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
|   | `content` | [text](/docs/records/fields/types/text/) | The body content of the draft message 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
|   | `subject` | [text](/docs/records/fields/types/text/) | The subject line of the draft message 
|   | `to` | [text](/docs/records/fields/types/text/) | The `To:` line of the draft message 
| **x** | **`type`** | [text](/docs/records/fields/types/text/) | The type of draft: `mail.compose` or `ticket.reply` 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`worker_id`** | [number](/docs/records/fields/types/number/) | The ID of the [worker](/docs/records/types/worker/) who owns the draft 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `content` | text | Content
| `id` | number | Id
| `subject` | text | Subject
| `to` | text | To
| `updated` | date | Updated
| `worker_` | record | [Worker](/docs/records/types/worker/)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in draft [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `subject:` | [text](/docs/search/filters/text/) | Subject
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
| `m_hint_to` | To
| `m_id` | Id
| `m_is_queued` | Is Queued
| `m_queue_delivery_date` | Delivery Date
| `m_queue_fails` | # Fails
| `m_subject` | Subject
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