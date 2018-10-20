---
title: Group Records
permalink: /docs/records/types/group/
toc:
  title: Group
  expand: Records
jumbotron:
  title: Group
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
| **Name (singular):** | Group
| **Name (plural):** | Groups
| **Alias:** | group

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in group [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `default:` | [Boolean](/docs/search/filters/booleans/) | Default
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `member:` | [Record](/docs/search/deep-search/) | [Member](/docs/records/types/worker/)
| `name:` | [Text](/docs/search/filters/text/) | Name
| `private:` | [Boolean](/docs/search/filters/booleans/) | Private
| `send.as:` | [Text](/docs/search/filters/text/) | Send As
| `send.from.id:` | [Chooser](/docs/search/filters/choosers/) | [Send From](/docs/records/types/address/)
| `signature.id:` | [Chooser](/docs/search/filters/choosers/) | [Signature](/docs/records/types/email_signature/)
| `template.id:` | [Chooser](/docs/search/filters/choosers/) | [Email Template](/docs/records/types/html_template/)
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in group [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `created` | Date | Created
| `is_default` | Boolean | Default
| `reply_html_template_` | Record | [Email Template](/docs/records/types/group/)
| `id` | Number | Id
| `name` | Text | Name
| `is_private` | Boolean | Private
| `record_url` | Text | Record Url
| `reply_personal` | Text | Send As
| `replyto_` | Record | [Send From](/docs/records/types/group/)
| `reply_signature_` | Record | [Signature](/docs/records/types/group/)
| `reply_signature_owner_` | Record | Signature Owner
| `updated` | Date | Updated
