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
    url: /docs/records/#record-types
---

|---
|-|-
| **Name (singular):** | Worker
| **Name (plural):** | Workers
| **Alias (uri):** | worker
| **Identifier (ID):** | cerberusweb.contexts.worker

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `at_mention_name` | [text](/docs/records/fields/types/text/) | The nickname used for `@mention` notifications in comments 
| **x** | **`auth_extension_id`** | [text](/docs/records/fields/types/text/) | The [plugin](/docs/plugins/) extension used for login authentication; default is `login.password` 
|   | `calendar_id` | [number](/docs/records/fields/types/number/) | The ID of the [calendar](/docs/records/types/calendar/) used to compute worker availability 
|   | `dob` | [text](/docs/records/fields/types/text/) | Date of birth in `YYYY-MM-DD` format 
|   | `email` | [text](/docs/records/fields/types/text/) | The primary email address of the worker; alternative to `email_id` 
| **x** | **`email_id`** | [number](/docs/records/fields/types/number/) | The ID of the primary [email address](/docs/records/types/address/); alternative to `email` 
|   | `email_ids` | [text](/docs/records/fields/types/text/) | A comma-separated list of IDs for alternative [email addresses](/docs/records/types/address/) 
| **x** | **`first_name`** | [text](/docs/records/fields/types/text/) | Given name 
|   | `gender` | [text](/docs/records/fields/types/text/) | `F` (female), `M` (male), or blank or unknown 
|   | `image` | [image](/docs/records/fields/types/image/) | The worker's profile picture in PNG format 
|   | `is_disabled` | [boolean](/docs/records/fields/types/boolean/) | Is this worker deactivated and prevented from logging in? 
|   | `is_superuser` | [boolean](/docs/records/fields/types/boolean/) | Is this worker an administrator with full privileges? 
| **x** | **`language`** | [text](/docs/records/fields/types/text/) | ISO-639 language code and ISO-3166 country code; e.g. `en_US` 
|   | `last_name` | [text](/docs/records/fields/types/text/) | Surname 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to 
|   | `location` | [text](/docs/records/fields/types/text/) | Location description; `Los Angeles, CA, USA` 
|   | `mobile` | [text](/docs/records/fields/types/text/) | Mobile number 
|   | `password` | [text](/docs/records/fields/types/text/) | The worker's password, if applicable; stored security; will be automatically generated if blank 
|   | `phone` | [text](/docs/records/fields/types/text/) |  
|   | `time_format` | [text](/docs/records/fields/types/text/) | Preference for displaying timestamps, `strftime()` syntax 
| **x** | **`timezone`** | [text](/docs/records/fields/types/text/) | IANA tz/zoneinfo timezone; `America/Los_Angeles` 
|   | `title` | [text](/docs/records/fields/types/text/) | Job title / Position 
|   | `updated` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `address_` | record | [Email](/docs/records/types/address/)
| `at_mention_name` | text | @mention
| `calendar_` | record | [Calendar](/docs/records/types/calendar/)
| `calendar_owner_` | record | Calendar Owner
| `dob` | text | Date Of Birth
| `first_name` | text | First Name
| `full_name` | text | Full Name
| `gender` | text | Gender
| `id` | worker | Id
| `is_disabled` | boolean | Disabled
| `is_superuser` | boolean | Administrator
| `language` | text | Language
| `last_name` | text | Last Name
| `location` | text | Location
| `mobile` | phone | Mobile
| `phone` | phone | Phone
| `record_url` | text | Record Url
| `time_format` | text | Time Format
| `timezone` | text | Timezone
| `title` | text | Title
| `updated` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in worker [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `alias:` | virtual | Aliases
| `email:` | [chooser](/docs/search/filters/choosers/) | [Email](/docs/records/types/address/)
| `email.id:` | [chooser](/docs/search/filters/choosers/) | [Email](/docs/records/types/address/)
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `firstName:` | [text](/docs/search/filters/text/) | First Name
| `gender:` | [text](/docs/search/filters/text/) | Gender
| `group:` | [record](/docs/search/deep-search/) | [Groups](/docs/records/types/group/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `isAdmin:` | [boolean](/docs/search/filters/booleans/) | Administrator
| `isAvailable:` | virtual | Calendar Availability
| `isBusy:` | virtual | Calendar Availability
| `isDisabled:` | [boolean](/docs/search/filters/booleans/) | Disabled
| `language:` | [text](/docs/search/filters/text/) | Language
| `lastActivity:` | [date](/docs/search/filters/dates/) | Last Activity
| `lastName:` | [text](/docs/search/filters/text/) | Last Name
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `location:` | [text](/docs/search/filters/text/) | Location
| `mentionName:` | [text](/docs/search/filters/text/) | @mention
| `mobile:` | [text](/docs/search/filters/text/) | Mobile
| `phone:` | [text](/docs/search/filters/text/) | Phone
| `role:` | [record](/docs/search/deep-search/) | [Role](/docs/records/types/role/)
| `timezone:` | [text](/docs/search/filters/text/) | Timezone
| `title:` | [text](/docs/search/filters/text/) | Title
| `updated:` | [date](/docs/search/filters/dates/) | Updated
	
### Workist Columns

These columns are available on worker [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_calendar_availability` | Calendar Availability
| `a_address_email` | Email Address
| `cf_<id>` | [Custom Field](/docs/records/types/custom_Field/)
| `w_at_mention_name` | @mention
| `w_auth_extension_id` | Authentication
| `w_calendar_id` | Calendar
| `w_dob` | D.o.b.
| `w_first_name` | First Name
| `w_gender` | Gender
| `w_id` | Id
| `w_is_disabled` | Disabled
| `w_is_superuser` | Administrator
| `w_language` | Language
| `w_last_name` | Last Name
| `w_location` | Location
| `w_mobile` | Mobile
| `w_phone` | Phone
| `w_time_format` | Time Format
| `w_timezone` | Timezone
| `w_title` | Title
| `w_updated` | Updated

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/#record-types" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>