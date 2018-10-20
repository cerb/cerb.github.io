---
title: Organization Records
permalink: /docs/records/types/org/
toc:
  title: Organization
  expand: Records
jumbotron:
  title: Organization
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
| **Name (singular):** | Organization
| **Name (plural):** | Organizations
| **Alias:** | org

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in organization [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `alias:` | Virtual | Aliases
| `city:` | [Text](/docs/search/filters/text/) | City
| `comments:` | [Fulltext](/docs/search/filters/fulltext/) | Comment Content
| `country:` | [Text](/docs/search/filters/text/) | Country
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `email:` | [Record](/docs/search/deep-search/) | [Email](/docs/records/types/address/)
| `email.id:` | [Chooser](/docs/search/filters/choosers/) | [Email](/docs/records/types/address/)
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `phone:` | [Text](/docs/search/filters/text/) | Phone
| `postal:` | [Text](/docs/search/filters/text/) | Postal
| `state:` | [Text](/docs/search/filters/text/) | State/prov
| `street:` | [Text](/docs/search/filters/text/) | Street
| `updated:` | [Date](/docs/search/filters/dates/) | Updated
| `watchers:` | [Watchers](/docs/search/filters/watchers/) | Watchers
| `website:` | [Text](/docs/search/filters/text/) | Website

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in organization [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `city` | Text | City
| `country` | Text | Country
| `created` | Date | Created
| `email_` | Record | [Email](/docs/records/types/org/)
| `id` | Number | Id
| `name` | Text | Name
| `phone` | Phone | Phone
| `postal` | Text | Postal
| `record_url` | Text | Record Url
| `province` | Text | State/prov
| `street` | Text | Street
| `updated` | Date | Updated
| `website` | Text | Website
