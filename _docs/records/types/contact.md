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
| **Alias (uri):** | contact
| **Identifier (ID):** | cerberusweb.contexts.contact

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `dob` | [text](/docs/records/fields/types/text/) | Date of birth: `YYYY-MM-DD` 
|   | `email` | [text](/docs/records/fields/types/text/) | Email address (e.g. `customer@example.com`); alternative to `email_id` 
|   | `email_id` | [number](/docs/records/fields/types/number/) | ID of this contact's primary [email address](/docs/records/types/address/) 
| **x** | **`first_name`** | [text](/docs/records/fields/types/text/) | Given name 
|   | `gender` | [text](/docs/records/fields/types/text/) | Gender: `F` (female), `M` (male), or blank 
|   | `image` | [image](/docs/records/fields/types/image/) | The profile image, base64-encoded in [data URI format](https://en.wikipedia.org/wiki/Data_URI_scheme) 
|   | `language` | [text](/docs/records/fields/types/text/) | Language: `en_US` 
|   | `last_login_at` | [timestamp](/docs/records/fields/types/timestamp/) | Date of their last [community portal](/docs/portals/) login 
|   | `last_name` | [text](/docs/records/fields/types/text/) | Surname 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `location` | [text](/docs/records/fields/types/text/) | Location (e.g. `Los Angeles, California, USA`) 
|   | `mobile` | [text](/docs/records/fields/types/text/) | Mobile number 
|   | `org` | [text](/docs/records/fields/types/text/) | Organization (e.g. `Fiaflux Software`); alternative to `org_id` 
|   | `org_id` | [number](/docs/records/fields/types/number/) | ID of this contact's [organization](/docs/records/types/org/) 
|   | `phone` | [text](/docs/records/fields/types/text/) | Phone number 
|   | `timezone` | [text](/docs/records/fields/types/text/) | Timezone (e.g. `America/Los_Angeles`) 
|   | `title` | [text](/docs/records/fields/types/text/) | Job title / Position 
|   | `username` | [text](/docs/records/fields/types/text/) | Username for public display 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `dob` | text | Date Of Birth
| `email_` | record | [Email](/docs/records/types/address/)
| `first_name` | text | First Name
| `gender` | text | Gender
| `id` | number | Id
| `language` | text | Language
| `last_login_at` | date | Last Login
| `last_name` | text | Last Name
| `location` | text | Location
| `mobile` | text | Mobile
| `name` | text | Name
| `org_` | record | [Org](/docs/records/types/org/)
| `phone` | text | Phone
| `record_url` | text | Record Url
| `timezone` | text | Timezone
| `title` | text | Title
| `updated_at` | date | Updated
| `username` | text | Username

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `emails` | records | Email Addresses
| `last_recipient_message` | record | Latest [Message](/docs/records/types/message/) Received
| `last_sender_message` | record | Latest [Message](/docs/records/types/message/) Sent
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in contact [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `alias:` | virtual | Aliases
| `comments:` | [fulltext](/docs/search/#fulltext) | Comment Content
| `created:` | [date](/docs/search/#dates) | Created
| `email:` | [record](/docs/search/#deep-search) | [Email](/docs/records/types/address/)
| `email.id:` | [chooser](/docs/search/#choosers) | [Email](/docs/records/types/address/)
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `firstName:` | [text](/docs/search/#text) | First Name
| `gender:` | [text](/docs/search/#text) | Gender
| `id:` | [number](/docs/search/#numbers) | Id
| `lang:` | [text](/docs/search/#text) | Language
| `lastLogin:` | [date](/docs/search/#dates) | Last Login
| `lastName:` | [text](/docs/search/#text) | Last Name
| `links:` | [links](/docs/search/#links) | Record Links
| `org:` | [record](/docs/search/#deep-search) | [Org](/docs/records/types/org/)
| `org.id:` | [chooser](/docs/search/#choosers) | [Organization](/docs/records/types/org/)
| `timezone:` | [text](/docs/search/#text) | Timezone
| `title:` | [text](/docs/search/#text) | Title
| `updated:` | [date](/docs/search/#dates) | Updated
| `watchers:` | [record](/docs/search/#deep-search) | [Watchers](/docs/records/types/worker/)
	
### Worklist Columns

These columns are available on contact [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `c_created_at` | Created
| `c_dob` | D.o.b.
| `c_first_name` | First Name
| `c_gender` | Gender
| `c_id` | Id
| `c_language` | Language
| `c_last_login_at` | Last Login
| `c_last_name` | Last Name
| `c_location` | Location
| `c_mobile` | Mobile
| `c_org_id` | Organization
| `c_phone` | Phone
| `c_primary_email_id` | Email
| `c_timezone` | Timezone
| `c_title` | Title
| `c_updated_at` | Updated
| `c_username` | Username
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>