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
| **Alias (uri):** | skill
| **Identifier (ID):** | cerberusweb.contexts.skill

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this skill 
| **x** | **`skillset_id`** | [number](/docs/records/fields/types/number/) | The ID of the [skillset](/docs/records/types/skillset/) containing this skill 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `id` | number | Id
| `name` | text | Name
| `record_url` | text | Record Url
| `skillset_` | record | [Skillset](/docs/records/types/skillset/)
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in skill [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/filters/dates/) | Created
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `skillset:` | [record](/docs/search/deep-search/) | [Skillset](/docs/records/types/skillset/)
| `skillset.id:` | [chooser](/docs/search/filters/choosers/) | [Skillset](/docs/records/types/skillset/)
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Worklist Columns

These columns are available on skill [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `s_created_at` | Created
| `s_id` | Id
| `s_name` | Name
| `s_skillset_id` | Skillset
| `s_updated_at` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>