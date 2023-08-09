---
title: Twitter Message Records
permalink: /docs/records/types/twitter_message/
toc:
  title: Twitter Message
  expand: Records
jumbotron:
  title: Twitter Message
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
| **Name (singular):** | Twitter Message
| **Name (plural):** | Twitter Messages
| **Alias (uri):** | twitter_message
| **Identifier (ID):** | cerberusweb.contexts.twitter.message

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `content` | [text](/docs/records/fields/types/text/) | The content of the tweet 
|   | `created` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `is_closed` | [boolean](/docs/records/fields/types/boolean/) | Is the tweet resolved? 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `twitter_id` | [text](/docs/records/fields/types/text/) | The ID of the Twitter [connected account](/docs/records/types/connected_account/) 
|   | `user_followers_count` | [number](/docs/records/fields/types/number/) | The user's follower count 
|   | `user_name` | [text](/docs/records/fields/types/text/) | The user's name 
|   | `user_profile_image_url` | [text](/docs/records/fields/types/text/) | URL to the user's profile image 
|   | `user_screen_name` | [text](/docs/records/fields/types/text/) | The user's screen name 

### Dictionary Placeholders

These [placeholders](/docs/scripting/variables/#placeholders) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_context` | text | [Record type](/docs/records/types/) extension ID
| `_label` | text | Label
| `_type` | text | [Record type](/docs/records/types/) alias
| `content` | text | Content
| `created` | date | Created
| `id` | number | Id
| `is_closed` | boolean | Is Closed
| `twitter_id` | number | Twitter Id
| `twitter_url` | text | Twitter Url
| `user_followers_count` | number | # Followers
| `user_name` | text | Name
| `user_profile_image_url` | text | Profile Image
| `user_screen_name` | text | Username

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
	
### Search Query Fields

These [filters](/docs/search/#filters) are available in twitter message [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `account:` | virtual | Connected Account
| `account.id:` | [chooser](/docs/search/#choosers) | [Connected Account](/docs/records/types/connected_account/)
| `content:` | [text](/docs/search/#text) | Content
| `created:` | [date](/docs/search/#dates) | Created
| `fieldset:` | [record](/docs/search/#deep-search) | [Fieldset](/docs/records/types/custom_fieldset/)
| `followers:` | [number](/docs/search/#numbers) | # Followers
| `id:` | [number](/docs/search/#numbers) | Id
| `isClosed:` | [boolean](/docs/search/#booleans) | Is Closed
| `screenName:` | [text](/docs/search/#text) | Username
| `userName:` | [text](/docs/search/#text) | Name
	
### Worklist Columns

These columns are available on twitter message [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)
| `t_connected_account_id` | Connected Account
| `t_content` | Content
| `t_created_date` | Created
| `t_is_closed` | Is Closed
| `t_user_followers_count` | # Followers
| `t_user_name` | Name
| `t_user_profile_image_url` | Profile Image
| `t_user_screen_name` | Username

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>