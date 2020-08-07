---
title: Bucket Records
permalink: /docs/records/types/bucket/
toc:
  title: Bucket
  expand: Records
jumbotron:
  title: Bucket
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
| **Name (singular):** | Bucket
| **Name (plural):** | Buckets
| **Alias (uri):** | bucket
| **Identifier (ID):** | cerberusweb.contexts.bucket

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
| **x** | **`group_id`** | [number](/docs/records/fields/types/number/) | The ID of the parent [group](/docs/records/types/group/) containing this bucket 
|   | `is_default` | [boolean](/docs/records/fields/types/boolean/) | Is this the default (inbox) bucket of the group? 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this bucket 
|   | `reply_address_id` | [number](/docs/records/fields/types/number/) | The ID of the [email address](/docs/records/types/address/) used when sending replies from this bucket 
|   | `reply_html_template_id` | [number](/docs/records/fields/types/number/) | The ID of the default [mail template](/docs/records/types/html_template/) used when sending HTML mail from this bucket 
|   | `reply_personal` | [text](/docs/records/fields/types/text/) | The default personal name in the `From:` of replies 
|   | `reply_signature_id` | [number](/docs/records/fields/types/number/) | The ID of the default [signature](/docs/records/types/email_signature/) used when sending replies from this bucket 
|   | `reply_signing_key_id` | [number](/docs/records/fields/types/number/) | The [private key](/docs/records/types/gpg_private_key/) used when signing outgoing mail from this bucket 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `group_` | record | [Group](/docs/records/types/group/)
| `id` | number | Id
| `is_default` | boolean | Default
| `name` | text | Name
| `record_url` | text | Record Url
| `reply_html_template_` | record | [Email Template](/docs/records/types/html_template/)
| `reply_personal` | text | Send As
| `reply_signature_` | record | [Signature](/docs/records/types/email_signature/)
| `reply_signature_owner_` | record | Signature Owner
| `reply_signing_key_` | record | [Signing Key](/docs/records/types/gpg_private_key/)
| `replyto_` | record | [Send From](/docs/records/types/address/)
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in bucket [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `group:` | [record](/docs/search/deep-search/) | [Group](/docs/records/types/group/)
| `group.id:` | [chooser](/docs/search/filters/choosers/) | [Group](/docs/records/types/group/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `send.as:` | [text](/docs/search/filters/text/) | Send As
| `send.from.id:` | [chooser](/docs/search/filters/choosers/) | [Send From](/docs/records/types/address/)
| `signature.id:` | [chooser](/docs/search/filters/choosers/) | [Signature](/docs/records/types/email_signature/)
| `signing.key.id:` | [chooser](/docs/search/filters/choosers/) | [Signing Key](/docs/records/types/gpg_private_key/)
| `template.id:` | [chooser](/docs/search/filters/choosers/) | [Email Template](/docs/records/types/html_template/)
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Worklist Columns

These columns are available on bucket [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `b_group_id` | Group
| `b_id` | Id
| `b_is_default` | Default
| `b_name` | Name
| `b_reply_address_id` | Send From
| `b_reply_html_template_id` | Email Template
| `b_reply_personal` | Send As
| `b_reply_signature_id` | Signature
| `b_reply_signing_key_id` | Signing Key
| `b_updated_at` | Updated
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>