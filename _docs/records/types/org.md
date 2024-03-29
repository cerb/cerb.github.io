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
| **Alias (uri):** | org
| **Identifier (ID):** | cerberusweb.contexts.org

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `city` | [text](/docs/records/fields/types/text/) | City 
|   | `country` | [text](/docs/records/fields/types/text/) | Country 
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `email_id` | [number](/docs/records/fields/types/number/) | Primary [email address](/docs/records/types/address/) 
|   | `image` | [image](/docs/records/fields/types/image/) | The profile image, base64-encoded in [data URI format](https://en.wikipedia.org/wiki/Data_URI_scheme) 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this organization 
|   | `phone` | [text](/docs/records/fields/types/text/) | Phone 
|   | `postal` | [text](/docs/records/fields/types/text/) | Postal code / ZIP 
|   | `province` | [text](/docs/records/fields/types/text/) | State / Province 
|   | `street` | [text](/docs/records/fields/types/text/) | Street address 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
|   | `website` | [url](/docs/records/fields/types/url/) | Website 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `city` | text | City
| `country` | text | Country
| `created` | date | Created
| `email_` | record | [Email](/docs/records/types/address/)
| `id` | number | Id
| `name` | text | Name
| `phone` | text | Phone
| `postal` | text | Postal
| `province` | text | State/Prov
| `record_url` | text | Record Url
| `street` | text | Street
| `updated` | date | Updated
| `website` | text | Website

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `last_recipient_message` | record | Latest [Message](/docs/records/types/message/) Received
| `last_sender_message` | record | Latest [Message](/docs/records/types/message/) Sent
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in organization [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `alias:` | virtual | Aliases
| `city:` | [text](/docs/search/filters/text/) | City
| `comments:` | [fulltext](/docs/search/filters/fulltext/) | Comment Content
| `contacts:` | [record](/docs/search/#deep-search) | [Contacts](/docs/records/types/contact/)
| `country:` | [text](/docs/search/filters/text/) | Country
| `created:` | [date](/docs/search/filters/dates/) | Created
| `email:` | [record](/docs/search/#deep-search) | [Email](/docs/records/types/address/)
| `email.id:` | [chooser](/docs/search/filters/choosers/) | [Email](/docs/records/types/address/)
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `phone:` | [text](/docs/search/filters/text/) | Phone
| `postal:` | [text](/docs/search/filters/text/) | Postal
| `state:` | [text](/docs/search/filters/text/) | State/Prov
| `street:` | [text](/docs/search/filters/text/) | Street
| `ticket:` | [record](/docs/search/#deep-search) | [Ticket](/docs/records/types/ticket/)
| `ticket.id:` | [chooser](/docs/search/filters/choosers/) | [Ticket](/docs/records/types/ticket/)
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [record](/docs/search/#deep-search) | [Watchers](/docs/records/types/worker/)
| `website:` | [text](/docs/search/filters/text/) | Website
	
### Worklist Columns

These columns are available on organization [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_city` | City
| `c_country` | Country
| `c_created` | Created
| `c_email_id` | Email
| `c_id` | Id
| `c_name` | Name
| `c_phone` | Phone
| `c_postal` | Postal
| `c_province` | State/Prov
| `c_street` | Street
| `c_updated` | Updated
| `c_website` | Website
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>