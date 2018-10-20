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
    url: /docs/records/types/
---

|---
|-|-
| **Name (singular):** | Ticket
| **Name (plural):** | Tickets
| **Alias:** | ticket

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in ticket [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `bucket:` | [Record](/docs/search/deep-search/) | [Bucket](/docs/records/types/bucket/)
| `bucket.id:` | [Chooser](/docs/search/filters/choosers/) | [Bucket](/docs/records/types/bucket/)
| `closed:` | [Date](/docs/search/filters/dates/) | Closed
| `comments:` | [Record](/docs/search/deep-search/) | [Comments](/docs/records/types/comment/)
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `group:` | [Record](/docs/search/deep-search/) | [Group](/docs/records/types/group/)
| `group.id:` | [Chooser](/docs/search/filters/choosers/) | [Group](/docs/records/types/group/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `importance:` | [Number](/docs/search/filters/numbers/) | Importance
| `inGroupsOf:` | Virtual | In Groups Of Worker
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `mask:` | [Text](/docs/search/filters/text/) | Mask
| `messages:` | [Record](/docs/search/deep-search/) | [Messages](/docs/records/types/message/)
| `messages.count:` | [Number](/docs/search/filters/numbers/) | # Messages
| `messages.first:` | [Record](/docs/search/deep-search/) | [Messages First](/docs/records/types/message/)
| `messages.last:` | [Record](/docs/search/deep-search/) | [Messages Last](/docs/records/types/message/)
| `org:` | [Record](/docs/search/deep-search/) | [Org](/docs/records/types/org/)
| `org.id:` | [Chooser](/docs/search/filters/choosers/) | [Organization](/docs/records/types/org/)
| `owner:` | [Record](/docs/search/deep-search/) | [Owner](/docs/records/types/worker/)
| `owner.id:` | [Chooser](/docs/search/filters/choosers/) | [Owner](/docs/records/types/worker/)
| `participant:` | [Record](/docs/search/deep-search/) | [Participant](/docs/records/types/address/)
| `participant.id:` | [Chooser](/docs/search/filters/choosers/) | [Participant Id](/docs/records/types/address/)
| `reopen:` | [Date](/docs/search/filters/dates/) | Reopen At
| `resolution.first:` | [Number](/docs/search/filters/numbers/) | First Resolution
| `response.first:` | [Number](/docs/search/filters/numbers/) | First Response
| `responsibility:` | [Number](/docs/search/filters/numbers/) | Responsibility
| `spam.score:` | [Number](/docs/search/filters/numbers/) | Spam Score
| `spam.training:` | Virtual | Spam Training
| `status:` | Virtual | Status
| `subject:` | [Text](/docs/search/filters/text/) | Subject
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers
| `worker.commented:` | Virtual | Worker Commented
| `worker.replied:` | Virtual | Worker Replied

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in ticket [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `num_messages` | Number | # Messages
| `bucket_` | Record | [Bucket](/docs/records/types/ticket/)
| `closed` | Date | Closed
| `created` | Date | Created
| `elapsed_resolution_first` | Seconds | First Resolution
| `elapsed_response_first` | Seconds | First Response
| `group_` | Record | [Group](/docs/records/types/ticket/)
| `id` | Number | Id
| `importance` | Number | Importance
| `initial_message_` | Record | [Initial Message](/docs/records/types/ticket/)
| `initial_response_message_` | Record | [Initial Response Message](/docs/records/types/ticket/)
| `latest_message_` | Record | [Latest Message](/docs/records/types/ticket/)
| `mask` | Text | Mask
| `org_` | Record | [Org](/docs/records/types/ticket/)
| `owner_` | Record | [Owner](/docs/records/types/ticket/)
| `reopen_date` | Date | Reopen At
| `spam_score` | Percent | Spam Score
| `spam_training` | Text | Spam Training
| `status` | Text | Status
| `subject` | Text | Subject
| `updated` | Date | Updated
| `url` | Text | Url
