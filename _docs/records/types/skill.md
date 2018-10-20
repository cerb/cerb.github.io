---
title: Skill Records
permalink: /docs/records/types/skill/
toc:
  title: Skill
  expand: Records
jumbotron:
  title: Skill
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
| **Name (singular):** | Skill
| **Name (plural):** | Skills
| **Alias:** | skill

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in skill [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `name:` | [Text](/docs/search/filters/text/) | Name
| `skillset:` | [Record](/docs/search/deep-search/) | [Skillset](/docs/records/types/skillset/)
| `skillset.id:` | [Chooser](/docs/search/filters/choosers/) | [Skillset](/docs/records/types/skillset/)
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in skill [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `id` | Number | Id
| `name` | Text | Name
| `record_url` | Text | Record Url
| `skillset_` | Record | [Skillset](/docs/records/types/skill/)
| `updated_at` | Date | Updated
