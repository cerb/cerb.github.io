---
title: Ticket Records
permalink: /docs/records/types/ticket/
toc:
  title: Ticket
  expand: Records
jumbotron:
  title: Ticket
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
| **Name (singular):** | Ticket
| **Name (plural):** | Tickets
| **Alias (uri):** | ticket
| **Identifier (ID):** | cerberusweb.contexts.ticket

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `bucket_id` | [number](/docs/records/fields/types/number/) | The ID of the [bucket](/docs/records/types/bucket/) containing this ticket 
|   | `closed` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time this ticket was first set to status `closed` 
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
| **x** | **`group_id`** | [number](/docs/records/fields/types/number/) | The ID of the [group](/docs/records/types/group/) containing this ticket 
|   | `importance` | [number](/docs/records/fields/types/number/) | A number from `0` (least) to `100` (most) 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
|   | `mask` | [text](/docs/records/fields/types/text/) | The randomized reference number for this ticket; auto-generated if blank 
|   | `org` | [text](/docs/records/fields/types/text/) | The exact name of the [organization](/docs/records/types/org/) linked to this ticket; alternative to `org_id` 
|   | `org_id` | [number](/docs/records/fields/types/number/) | The ID of the [organization](/docs/records/types/org/) linked to this ticket; alternative to `org` 
|   | `owner_id` | [number](/docs/records/fields/types/number/) | The ID of the [worker](/docs/records/types/worker/) responsible for this ticket 
|   | `participants` | [text](/docs/records/fields/types/text/) | A comma-separated list of email addresses to add as participants 
|   | `reopen_date` | [timestamp](/docs/records/fields/types/timestamp/) | If status `waiting`, the date/time to automatically change the status back to `open` 
|   | `spam_score` | [float](/docs/records/fields/types/float/) | `0.0001` (not spam) to `0.9999` (spam); automatically generated 
|   | `spam_training` | [text](/docs/records/fields/types/text/) | `S` (spam), `N` (not spam); blank for non-trained 
|   | `status` | [text](/docs/records/fields/types/text/) | `o` (open), `w` (waiting), `c` (closed), `d` (deleted); alternative to `status_id` 
|   | `status_id` | [number](/docs/records/fields/types/number/) | `0` (open), `1` (waiting), `2` (closed), `3` (deleted); alternative to `status` 
| **x** | **`subject`** | [text](/docs/records/fields/types/text/) | The subject of the ticket 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `bucket_` | record | [Bucket](/docs/records/types/bucket/)
| `closed` | date | Closed
| `created` | date | Created
| `elapsed_resolution_first` | seconds | First Resolution
| `elapsed_response_first` | seconds | First Response
| `group_` | record | [Group](/docs/records/types/group/)
| `id` | number | Id
| `importance` | number | Importance
| `initial_message_` | record | [Initial Message](/docs/records/types/message/)
| `initial_response_message_` | record | [Initial Response Message](/docs/records/types/message/)
| `latest_message_` | record | [Latest Message](/docs/records/types/message/)
| `mask` | text | Mask
| `num_messages` | number | # Messages
| `org_` | record | [Org](/docs/records/types/org/)
| `owner_` | record | [Owner](/docs/records/types/worker/)
| `reopen_date` | date | Reopen At
| `spam_score` | percent | Spam Score
| `spam_training` | text | Spam Training
| `status` | text | Status
| `subject` | text | Subject
| `updated` | date | Updated
| `url` | text | Url

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `_messages` | records | Messages
| `custom_<id>` | mixed | Custom Fields
| `latest_incoming_activity` | date | Latest Incoming Activity
| `latest_outgoing_activity` | date | Latest Outgoing Activity
| `links` | links | Links
| `requester_emails` | text | Requester Emails (Comma-Separated)
| `requesters` | hashmap | Requesters
| `signature` | text | Signature
| `watchers` | watchers | Watchers
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in ticket [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `bucket:` | [record](/docs/search/deep-search/) | [Bucket](/docs/records/types/bucket/)
| `bucket.id:` | [chooser](/docs/search/filters/choosers/) | [Bucket](/docs/records/types/bucket/)
| `closed:` | [date](/docs/search/filters/dates/) | Closed
| `comments:` | [record](/docs/search/deep-search/) | [Comments](/docs/records/types/comment/)
| `created:` | [date](/docs/search/filters/dates/) | Created
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `group:` | [record](/docs/search/deep-search/) | [Group](/docs/records/types/group/)
| `group.id:` | [chooser](/docs/search/filters/choosers/) | [Group](/docs/records/types/group/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `importance:` | [number](/docs/search/filters/numbers/) | Importance
| `inGroupsOf:` | virtual | In Groups Of Worker
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `mask:` | [text](/docs/search/filters/text/) | Mask
| `messages:` | [record](/docs/search/deep-search/) | [Messages](/docs/records/types/message/)
| `messages.count:` | [number](/docs/search/filters/numbers/) | # Messages
| `messages.first:` | [record](/docs/search/deep-search/) | [Messages First](/docs/records/types/message/)
| `messages.last:` | [record](/docs/search/deep-search/) | [Messages Last](/docs/records/types/message/)
| `org:` | [record](/docs/search/deep-search/) | [Org](/docs/records/types/org/)
| `org.id:` | [chooser](/docs/search/filters/choosers/) | [Organization](/docs/records/types/org/)
| `owner:` | [record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `owner.id:` | [chooser](/docs/search/filters/choosers/) | [Owner](/docs/records/types/worker/)
| `participant:` | [record](/docs/search/deep-search/) | [Participant](/docs/records/types/address/)
| `participant.id:` | [chooser](/docs/search/filters/choosers/) | [Participant Id](/docs/records/types/address/)
| `reopen:` | [date](/docs/search/filters/dates/) | Reopen At
| `resolution.first:` | [number](/docs/search/filters/numbers/) | First Resolution
| `response.first:` | [number](/docs/search/filters/numbers/) | First Response
| `responsibility:` | [number](/docs/search/filters/numbers/) | Responsibility
| `spam.score:` | [number](/docs/search/filters/numbers/) | Spam Score
| `spam.training:` | virtual | Spam Training
| `status:` | virtual | Status
| `subject:` | [text](/docs/search/filters/text/) | Subject
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
| `worker.commented:` | virtual | Worker Commented
| `worker.replied:` | virtual | Worker Replied
	
### Workist Columns

These columns are available on ticket [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_status` | Status
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)
| `t_bucket_id` | Bucket
| `t_closed_at` | Closed
| `t_created_date` | Created
| `t_elapsed_resolution_first` | First Resolution
| `t_elapsed_response_first` | First Response
| `t_first_wrote_address_id` | First Wrote
| `t_group_id` | Group
| `t_id` | Id
| `t_importance` | Importance
| `t_last_wrote_address_id` | Last Wrote
| `t_mask` | Mask
| `t_num_messages` | # Messages
| `t_org_id` | Organization
| `t_owner_id` | Owner
| `t_reopen_at` | Reopen At
| `t_spam_score` | Spam Score
| `t_spam_training` | Spam Training
| `t_subject` | Subject
| `t_updated_date` | Updated
| `wtb_responsibility` | Responsibility

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>