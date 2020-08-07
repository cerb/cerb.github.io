---
title: Mailbox Account Records
permalink: /docs/records/types/mailbox/
toc:
  title: Mailbox Account
  expand: Records
jumbotron:
  title: Mailbox Account
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
| **Name (singular):** | Email Mailbox
| **Name (plural):** | Email Mailboxes
| **Alias (uri):** | mailbox
| **Identifier (ID):** | cerberusweb.contexts.mailbox

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `checked_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time this mailbox was last checked for new messages 
|   | `connected_account_id` | [number](/docs/records/fields/types/number/) | The optional connected account to use for XOAUTH2 
| **x** | **`host`** | [text](/docs/records/fields/types/text/) | The mail server hostname 
|   | `is_enabled` | [boolean](/docs/records/fields/types/boolean/) | Is this mailbox enabled? `1` for true and `0` for false 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `max_msg_size_kb` | [number](/docs/records/fields/types/number/) | The maximum message size to download (in kilobytes); `0` to disable limits 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this email mailbox 
|   | `num_fails` | [number](/docs/records/fields/types/number/) | The number of consecutive failures 
|   | `password` | [text](/docs/records/fields/types/text/) | The mailbox password 
|   | `port` | [number](/docs/records/fields/types/number/) | The port to connect to; e.g. `587` 
|   | `protocol` | [text](/docs/records/fields/types/text/) | The protocol to use: `pop3`, `pop3-ssl`, `imap`, `imap-ssl` 
|   | `timeout_secs` | [number](/docs/records/fields/types/number/) | The socket timeout in seconds when downloading mail 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`username`** | [text](/docs/records/fields/types/text/) | The mailbox username 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `checked_at` | date | Checked At
| `connected_account_id` | number | Connected Account
| `host` | text | Host
| `id` | number | Id
| `is_enabled` | boolean | Enabled
| `max_msg_size_kb` | number | Max Msg Size
| `name` | text | Name
| `num_fails` | number | Num Fails
| `port` | number | Port
| `protocol` | text | Protocol
| `record_url` | text | Record Url
| `timeout_secs` | number | Timeout Secs
| `updated_at` | date | Updated
| `username` | text | Username

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in mailbox account [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `checkedAt:` | [date](/docs/search/filters/dates/) | Checked At
| `enabled:` | [boolean](/docs/search/filters/booleans/) | Enabled
| `fail.count:` | [number](/docs/search/filters/numbers/) | Num Fails
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `host:` | [text](/docs/search/filters/text/) | Host
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `name:` | [text](/docs/search/filters/text/) | Name
| `protocol:` | [text](/docs/search/filters/text/) | Protocol
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
	
### Worklist Columns

These columns are available on mailbox account [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `p_checked_at` | Checked At
| `p_connected_account_id` | Connected Account
| `p_delay_until` | Delay Until
| `p_enabled` | Enabled
| `p_host` | Host
| `p_id` | Id
| `p_max_msg_size_kb` | Max Msg Size
| `p_name` | Name
| `p_num_fails` | Num Fails
| `p_port` | Port
| `p_protocol` | Protocol
| `p_timeout_secs` | Timeout Secs
| `p_updated_at` | Updated
| `p_username` | User

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>