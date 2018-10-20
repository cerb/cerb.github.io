---
title: Email Address Records
permalink: /docs/records/types/address/
toc:
  title: Email Address
  expand: Records
jumbotron:
  title: Email Address
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
| **Name (singular):** | Email Address
| **Name (plural):** | Email Addresses
| **Alias:** | address

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in email address [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `comments:` | [Fulltext](/docs/search/filters/fulltext/) | Comment Content
| `contact:` | [Record](/docs/search/deep-search/) | [Contact](/docs/records/types/contact/)
| `contact.id:` | [Chooser](/docs/search/filters/choosers/) | [Contact](/docs/records/types/contact/)
| `email:` | [Text](/docs/search/filters/text/) | Email
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `host:` | [Text](/docs/search/filters/text/) | Host
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `isBanned:` | [Boolean](/docs/search/filters/booleans/) | Is Banned
| `isDefunct:` | [Boolean](/docs/search/filters/booleans/) | Is Defunct
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `mailTransport.id:` | [Chooser](/docs/search/filters/choosers/) | [Email Transport](/docs/records/types/mail_transport/)
| `nonspam:` | [Number](/docs/search/filters/numbers/) | # Nonspam
| `org:` | [Record](/docs/search/deep-search/) | [Org](/docs/records/types/org/)
| `org.id:` | [Chooser](/docs/search/filters/choosers/) | [Organization Id](/docs/records/types/org/)
| `spam:` | [Number](/docs/search/filters/numbers/) | # Spam
| `ticket:` | [Record](/docs/search/deep-search/) | [Ticket](/docs/records/types/ticket/)
| `ticket.id:` | [Chooser](/docs/search/filters/choosers/) | [Ticket](/docs/records/types/ticket/)
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers
| `worker.id:` | [Chooser](/docs/search/filters/choosers/) | [Worker](/docs/records/types/worker/)

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in email address [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `num_nonspam` | Number | # Nonspam
| `num_spam` | Number | # Spam
| `address` | Text | Address
| `contact_` | Record | [Contact](/docs/records/types/address/)
| `full_name` | Text | Full Name
| `id` | Number | Id
| `is_banned` | Boolean | Is Banned
| `is_contact` | Boolean | Is Contact
| `is_defunct` | Boolean | Is Defunct
| `mail_transport_` | Record | [Mail Transport](/docs/records/types/address/)
| `org_` | Record | [Org](/docs/records/types/address/)
| `record_url` | Text | Record Url
| `updated` | Date | Updated
| `worker_` | Record | [Worker](/docs/records/types/address/)
