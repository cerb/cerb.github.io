---
title: Twitter Message Records
permalink: /docs/records/types/twitter_message/
toc:
  title: Twitter Message
  expand: Records
jumbotron:
  title: Twitter Message
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
| **Name (singular):** | Twitter Message
| **Name (plural):** | Twitter Messages
| **Alias:** | twitter_message

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in twitter message [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `account:` | Virtual | Connected Account
| `account.id:` | [Chooser](/docs/search/filters/choosers/) | [Connected Account](/docs/records/types/connected_account/)
| `content:` | [Text](/docs/search/filters/text/) | Content
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `followers:` | [Number](/docs/search/filters/numbers/) | # Followers
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `isClosed:` | [Boolean](/docs/search/filters/booleans/) | Is Closed
| `screenName:` | [Text](/docs/search/filters/text/) | Username
| `userName:` | [Text](/docs/search/filters/text/) | Name

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in twitter message [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `user_followers_count` | Number | # Followers
| `content` | Text | Content
| `created` | Date | Created
| `id` | Number | Id
| `is_closed` | Boolean | Is Closed
| `user_name` | Text | Name
| `user_profile_image_url` | Text | Profile Image
| `twitter_id` | Number | Twitter Id
| `twitter_url` | Text | Twitter Url
| `user_screen_name` | Text | Username
