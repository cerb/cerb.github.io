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
    url: /docs/records/#record-types
---

|---
|-|-
| **Name (singular):** | Group
| **Name (plural):** | Groups
| **Alias (uri):** | group
| **Identifier (ID):** | cerberusweb.contexts.group

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `image` | [image](/docs/records/fields/types/image/) | Base64-encoded PNG image 
|   | `is_default` | [boolean](/docs/records/fields/types/boolean/) | [Tickets](/docs/tickets/) are assigned to the default group when no other routing rules match 
|   | `is_private` | [boolean](/docs/records/fields/types/boolean/) | The content in public (`0`) groups is visible to everyone; in private (`1`) groups content is only visible to members 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
|   | `members` | [text](/docs/records/fields/types/text/) | JSON-encoded array of [worker](/docs/records/types/worker/) IDs; `[1,2,3]` 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this group 
|   | `reply_address_id` | [number](/docs/records/fields/types/number/) | The ID of the [email address](/docs/records/types/address/) used when sending replies from this group 
|   | `reply_html_template_id` | [number](/docs/records/fields/types/number/) | The ID of the default [mail template](/docs/records/types/html_template/) used when sending HTML mail from this group 
|   | `reply_personal` | [text](/docs/records/fields/types/text/) | The default personal name in the `From:` of replies 
|   | `reply_signature_id` | [number](/docs/records/fields/types/number/) | The ID of the default [signature](/docs/records/types/email_signature/) used when sending replies from this group 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `created` | date | Created
| `id` | number | Id
| `is_default` | boolean | Default
| `is_private` | boolean | Private
| `name` | text | Name
| `record_url` | text | Record Url
| `reply_html_template_` | record | [Email Template](/docs/records/types/html_template/)
| `reply_personal` | text | Send As
| `reply_signature_` | record | [Signature](/docs/records/types/email_signature/)
| `reply_signature_owner_` | record | Signature Owner
| `replyto_` | record | [Send From](/docs/records/types/address/)
| `updated` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `buckets` | records | Buckets
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
| `members` | records | Members
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in group [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `created:` | [date](/docs/search/filters/dates/) | Created
| `default:` | [boolean](/docs/search/filters/booleans/) | Default
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `member:` | [record](/docs/search/deep-search/) | [Member](/docs/records/types/worker/)
| `name:` | [text](/docs/search/filters/text/) | Name
| `private:` | [boolean](/docs/search/filters/booleans/) | Private
| `send.as:` | [text](/docs/search/filters/text/) | Send As
| `send.from.id:` | [chooser](/docs/search/filters/choosers/) | [Send From](/docs/records/types/address/)
| `signature.id:` | [chooser](/docs/search/filters/choosers/) | [Signature](/docs/records/types/email_signature/)
| `template.id:` | [chooser](/docs/search/filters/choosers/) | [Email Template](/docs/records/types/html_template/)
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Worklist Columns

These columns are available on group [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)
| `g_created` | Created
| `g_id` | Id
| `g_is_default` | Default
| `g_is_private` | Private
| `g_name` | Name
| `g_reply_address_id` | Send From
| `g_reply_html_template_id` | Email Template
| `g_reply_personal` | Send As
| `g_reply_signature_id` | Signature
| `g_updated` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>