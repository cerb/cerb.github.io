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
|   | `auth_disable_plain` | [boolean](/docs/records/fields/types/boolean/) | Used to bypass Microsoft Exchange authentication issues 
|   | `checked_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time this mailbox was last checked for new messages 
| **x** | **`host`** | [text](/docs/records/fields/types/text/) | The mail server hostname 
|   | `is_enabled` | [boolean](/docs/records/fields/types/boolean/) | Is this mailbox enabled? `1` for true and `0` for false 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `max_msg_size_kb` | [number](/docs/records/fields/types/number/) | The maximum message size to download (in kilobytes); `0` to disable limits 
| **x** | **`name`** | [text](/docs/records/fields/types/text/) | The name of this email mailbox 
|   | `num_fails` | [number](/docs/records/fields/types/number/) | The number of consecutive failures 
| **x** | **`password`** | [text](/docs/records/fields/types/text/) | The mailbox password 
|   | `port` | [number](/docs/records/fields/types/number/) | The port to connect to; e.g. `587` 
|   | `protocol` | [text](/docs/records/fields/types/text/) | The protocol to use: `pop3`, `pop3-ssl`, `imap`, `imap-ssl` 
|   | `ssl_ignore_validation` | [boolean](/docs/records/fields/types/boolean/) | Disabled (`0`) by default; enable (`1`) to allow self-signed certificates 
|   | `timeout_secs` | [number](/docs/records/fields/types/number/) | The socket timeout in seconds when downloading mail 
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 
| **x** | **`username`** | [text](/docs/records/fields/types/text/) | The mailbox username 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `auth_disable_plain` | boolean | Disable Plain Auth
| `checked_at` | date | Checked At
| `host` | text | Host
| `id` | number | Id
| `is_enabled` | boolean | Enabled
| `max_msg_size_kb` | number | Max Msg Size
| `name` | text | Name
| `num_fails` | number | Num Fails
| `port` | number | Port
| `protocol` | text | Protocol
| `record_url` | text | Record Url
| `ssl_ignore_validation` | boolean | Ssl Ignore Validation
| `timeout_secs` | number | Timeout Secs
| `updated_at` | date | Updated
| `username` | text | Username

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/#key-expansion) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `custom_<id>` | mixed | Custom Fields
| `links` | links | Links
| `watchers` | watchers | Watchers
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in mailbox account [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `checkedAt:` | [date](/docs/search/filters/dates/) | Checked At
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
| `p_auth_disable_plain` | Disable Plain Auth
| `p_checked_at` | Checked At
| `p_delay_until` | Delay Until
| `p_enabled` | Enabled
| `p_host` | Host
| `p_id` | Id
| `p_max_msg_size_kb` | Max Msg Size
| `p_name` | Name
| `p_num_fails` | Num Fails
| `p_port` | Port
| `p_protocol` | Protocol
| `p_ssl_ignore_validation` | Ssl Ignore Validation
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