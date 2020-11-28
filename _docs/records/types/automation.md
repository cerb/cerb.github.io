---
title: Automation Records
permalink: /docs/records/types/automation/
toc:
  title: Automation
  expand: Records
jumbotron:
  title: Automation
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
| **Name (singular):** | Automation
| **Name (plural):** | Automations
| **Alias (uri):** | automation
| **Identifier (ID):** | cerb.contexts.automation

* TOC
{:toc}

### Records API

These fields are available in the [Records API](/docs/api/endpoints/records/) and [packages](/docs/packages/):

|---
| Req'd | Field | Type | Notes
|:-:|-|-|-
|   | `context` | [text](/docs/records/fields/types/text/) |  
|   | `context_id` | [number](/docs/records/fields/types/number/) |  
|   | `created_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was created 
|   | `links` | [links](/docs/records/fields/types/links/) | An array of record `type:id` tuples to link to. Prefix with `-` to unlink. 
|   | `script` | [text](/docs/records/fields/types/text/) |  
| **x** | **`trigger_name`** | [text](/docs/records/fields/types/text/) |  
|   | `updated_at` | [timestamp](/docs/records/fields/types/timestamp/) | The date/time when this record was last modified 

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in [dictionaries](/docs/bots/behaviors/dictionaries/) for [bot behaviors](/docs/bots/behaviors/), [snippets](/docs/snippets/), and [API](/docs/api/) responses:

|---
| Field | Type | Description
|-|-|-
| `_label` | text | Label
| `created_at` | date | Created
| `id` | number | Id
| `record_url` | text | Record Url
| `trigger_name` | text | Trigger
| `updated_at` | date | Updated

These optional placeholders are also available with **key expansion** in [dictionaries](/docs/bots/behaviors/dictionaries/key-expansion/) and the [API](/docs/api/responses/#expanding-keys-in-api-requests):

|---
| Field | Type | Description
|-|-|-
| `comments` | comments | [Comments](/docs/bots/behaviors/dictionaries/key-expansion/#comments)
| `custom_<id>` | mixed | [Custom Fields](/docs/bots/behaviors/dictionaries/key-expansion/#custom-fields)
| `links` | links | [Links](/docs/bots/behaviors/dictionaries/key-expansion/#links)
| `watchers` | watchers | [Watchers](/docs/bots/behaviors/dictionaries/key-expansion/#watchers)
	
### Search Query Fields

These [filters](/docs/search/filters/) are available in automation [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `context:` | [text](/docs/search/filters/text/) | Record Type
| `context.id:` | [text](/docs/search/filters/text/) | Record Id
| `created:` | [date](/docs/search/filters/dates/) | Created
| `fieldset:` | [record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [number](/docs/search/filters/numbers/) | Id
| `links:` | [links](/docs/search/filters/links/) | Record Links
| `on:` | virtual | On
| `on.activity_log:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/activity_log/)
| `on.address:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/address/)
| `on.attachment:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/attachment/)
| `on.automation:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/automation/)
| `on.behavior:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/behavior/)
| `on.bot:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/bot/)
| `on.bucket:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/bucket/)
| `on.calendar:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/calendar/)
| `on.calendar_event:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/calendar_event/)
| `on.calendar_recurring_event:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/calendar_recurring_event/)
| `on.call:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/call/)
| `on.card_widget:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/card_widget/)
| `on.cerb_license:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/cerb_license/)
| `on.classifier:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/classifier/)
| `on.classifier_class:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/classifier_class/)
| `on.classifier_entity:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/classifier_entity/)
| `on.classifier_example:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/classifier_example/)
| `on.comment:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/comment/)
| `on.community_portal:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/community_portal/)
| `on.connected_account:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/connected_account/)
| `on.connected_service:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/connected_service/)
| `on.contact:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/contact/)
| `on.currency:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/currency/)
| `on.custom_field:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/custom_field/)
| `on.custom_fieldset:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/custom_fieldset/)
| `on.custom_record:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/custom_record/)
| `on.domain:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/domain/)
| `on.draft:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/draft/)
| `on.email_signature:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/email_signature/)
| `on.feed:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/feed/)
| `on.feed_item:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/feed_item/)
| `on.file_bundle:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/file_bundle/)
| `on.gpg_public_key:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/gpg_public_key/)
| `on.group:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/group/)
| `on.html_template:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/html_template/)
| `on.identity:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/identity/)
| `on.identity_pool:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/identity_pool/)
| `on.jira_issue:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/jira_issue/)
| `on.jira_project:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/jira_project/)
| `on.kb_article:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/kb_article/)
| `on.kb_category:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/kb_category/)
| `on.mail_transport:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/mail_transport/)
| `on.mailbox:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/mailbox/)
| `on.message:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/message/)
| `on.notification:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/notification/)
| `on.oauth_app:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/oauth_app/)
| `on.opportunity:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/opportunity/)
| `on.org:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/org/)
| `on.package:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/package/)
| `on.portal_page:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/portal_page/)
| `on.portal_widget:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/portal_widget/)
| `on.profile_tab:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/profile_tab/)
| `on.profile_widget:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/profile_widget/)
| `on.project_board:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/project_board/)
| `on.project_board_column:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/project_board_column/)
| `on.reminder:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/reminder/)
| `on.role:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/role/)
| `on.saved_search:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/saved_search/)
| `on.scheduled_behavior:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/scheduled_behavior/)
| `on.server:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/server/)
| `on.snippet:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/snippet/)
| `on.task:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/task/)
| `on.ticket:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/ticket/)
| `on.time_entry:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/time_entry/)
| `on.timetracking_activity:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/timetracking_activity/)
| `on.twitter_message:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/twitter_message/)
| `on.webapi_credentials:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/webapi_credentials/)
| `on.webhook_listener:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/webhook_listener/)
| `on.worker:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/worker/)
| `on.workspace_list:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/workspace_list/)
| `on.workspace_page:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/workspace_page/)
| `on.workspace_tab:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/workspace_tab/)
| `on.workspace_widget:` | [record](/docs/search/deep-search/) | [On](/docs/records/types/workspace_widget/)
| `trigger:` | [text](/docs/search/filters/text/) | Trigger
| `updated:` | [date](/docs/search/filters/dates/) | Updated
| `watchers:` | [watchers](/docs/search/filters/watchers/) | Watchers
	
### Worklist Columns

These columns are available on automation [worklists](/docs/worklists/):

|---
| Column | Description
|-|-
| `*_on` | On
| `a_context` | Record Type
| `a_context_id` | Record Id
| `a_created_at` | Created
| `a_id` | Id
| `a_trigger_name` | Trigger
| `a_updated_at` | Updated
| `cf_<id>` | [Custom Field](/docs/records/types/custom_field/)

<div class="section-nav">
	<div class="left">
		<a href="/docs/records/types/" class="prev">&lt; Record Types</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>