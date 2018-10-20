---
title: Worker Records
permalink: /docs/records/types/worker/
toc:
  title: Worker
  expand: Records
jumbotron:
  title: Worker
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
| **Name (singular):** | Worker
| **Name (plural):** | Workers
| **Alias:** | worker

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in worker [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `alias:` | Virtual | Aliases
| `email:` | [Chooser](/docs/search/filters/choosers/) | [Email](/docs/records/types/address/)
| `email.id:` | [Chooser](/docs/search/filters/choosers/) | [Email](/docs/records/types/address/)
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `firstName:` | [Text](/docs/search/filters/text/) | First Name
| `gender:` | [Text](/docs/search/filters/text/) | Gender
| `group:` | [Record](/docs/search/deep-search/) | [Groups](/docs/records/types/group/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `isAdmin:` | [Boolean](/docs/search/filters/booleans/) | Administrator
| `isAvailable:` | Virtual | Calendar Availability
| `isBusy:` | Virtual | Calendar Availability
| `isDisabled:` | [Boolean](/docs/search/filters/booleans/) | Disabled
| `language:` | [Text](/docs/search/filters/text/) | Language
| `lastActivity:` | [Date](/docs/search/filters/dates/) | Last Activity
| `lastName:` | [Text](/docs/search/filters/text/) | Last Name
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `location:` | [Text](/docs/search/filters/text/) | Location
| `mentionName:` | [Text](/docs/search/filters/text/) | @mention
| `mobile:` | [Text](/docs/search/filters/text/) | Mobile
| `phone:` | [Text](/docs/search/filters/text/) | Phone
| `role:` | [Record](/docs/search/deep-search/) | [Role](/docs/records/types/role/)
| `timezone:` | [Text](/docs/search/filters/text/) | Timezone
| `title:` | [Text](/docs/search/filters/text/) | Title
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in worker [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `at_mention_name` | Text | @mention
| `is_superuser` | Boolean | Administrator
| `calendar_` | Record | [Calendar](/docs/records/types/worker/)
| `calendar_owner_` | Record | Calendar Owner
| `dob` | Text | Date Of Birth
| `is_disabled` | Boolean | Disabled
| `address_` | Record | [Email](/docs/records/types/worker/)
| `first_name` | Text | First Name
| `full_name` | Text | Full Name
| `gender` | Text | Gender
| `id` | Worker | Id
| `language` | Text | Language
| `last_name` | Text | Last Name
| `location` | Text | Location
| `mobile` | Phone | Mobile
| `phone` | Phone | Phone
| `record_url` | Text | Record Url
| `time_format` | Text | Time Format
| `timezone` | Text | Timezone
| `title` | Text | Title
| `updated` | Date | Updated
