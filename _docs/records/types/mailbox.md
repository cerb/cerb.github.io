---
title: Mailbox Account Records
permalink: /docs/records/types/mailbox/
toc:
  title: Mailbox Account
  expand: Records
jumbotron:
  title: Mailbox Account
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
| **Name (singular):** | Email Mailbox
| **Name (plural):** | Email Mailboxes
| **Alias:** | mailbox

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in mailbox account [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `checkedAt:` | [Date](/docs/search/filters/dates/) | Checked At
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `host:` | [Text](/docs/search/filters/text/) | Host
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `protocol:` | [Text](/docs/search/filters/text/) | Protocol
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in mailbox account [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `checked_at` | Date | Checked At
| `auth_disable_plain` | Boolean | Disable Plain Auth
| `is_enabled` | Boolean | Enabled
| `host` | Text | Host
| `id` | Number | Id
| `max_msg_size_kb` | Number | Max Msg Size
| `name` | Text | Name
| `num_fails` | Number | Num Fails
| `port` | Number | Port
| `protocol` | Text | Protocol
| `record_url` | Text | Record Url
| `ssl_ignore_validation` | Boolean | Ssl Ignore Validation
| `timeout_secs` | Number | Timeout Secs
| `updated_at` | Date | Updated
| `username` | Text | Username
