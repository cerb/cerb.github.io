---
title: Contact Records
permalink: /docs/records/types/contact/
toc:
  title: Contact
  expand: Records
jumbotron:
  title: Contact
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
| **Name (singular):** | Contact
| **Name (plural):** | Contacts
| **Alias:** | contact

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in contact [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `alias:` | Virtual | Aliases
| `comments:` | [Fulltext](/docs/search/filters/fulltext/) | Comment Content
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `email:` | [Record](/docs/search/deep-search/) | [Email](/docs/records/types/address/)
| `email.id:` | [Chooser](/docs/search/filters/choosers/) | [Email](/docs/records/types/address/)
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `firstName:` | [Text](/docs/search/filters/text/) | First Name
| `gender:` | [Text](/docs/search/filters/text/) | Gender
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `lang:` | [Text](/docs/search/filters/text/) | Language
| `lastLogin:` | [Date](/docs/search/filters/dates/) | Last Login
| `lastName:` | [Text](/docs/search/filters/text/) | Last Name
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `org:` | [Record](/docs/search/deep-search/) | [Org](/docs/records/types/org/)
| `org.id:` | [Chooser](/docs/search/filters/choosers/) | [Organization](/docs/records/types/org/)
| `timezone:` | [Text](/docs/search/filters/text/) | Timezone
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in contact [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `dob` | Text | Date Of Birth
| `email_` | Record | [Email](/docs/records/types/contact/)
| `first_name` | Text | First Name
| `gender` | Text | Gender
| `id` | Number | Id
| `language` | Text | Language
| `last_login_at` | Date | Last Login
| `last_name` | Text | Last Name
| `location` | Text | Location
| `mobile` | Text | Mobile
| `name` | Text | Name
| `org_` | Record | [Org](/docs/records/types/contact/)
| `phone` | Text | Phone
| `record_url` | Text | Record Url
| `timezone` | Text | Timezone
| `title` | Text | Title
| `updated_at` | Date | Updated
| `username` | Text | Username
