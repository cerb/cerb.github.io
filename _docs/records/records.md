---
title: Records
permalink: /docs/records/
jumbotron:
  title: Records
  tagline: Remember anything about everything
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
---

<div class="cerb-screenshot">
<img src="/assets/images/guides/records/custom-records/custom-records.png" class="screenshot">
</div>

A **record** is a distinctly identifiable entity.

At the core of Cerb is a record management system for organizing your team's data.

Two pieces of information are needed to refer to any record:

1. The **record type** (e.g. contact, organization, worker).

1. The unique numeric identifier ("**ID**") within that particular record type. IDs are automatically assigned when a new record is created.

# Fields

Each record type has a set of **fields** to describe its attributes. Your `first name` and `age` would be two fields that describe you.

**Fields types** determine what type of data is stored in a field.

|---
| Field Type | Description
|-|-
| [Boolean](/docs/records/fields/types/boolean/) | A *true* or *false* value, represented by `1` or `0` respectively 
| [Context](/docs/records/fields/types/context/) | A [record type](/docs/records/#record-types)
| [Extension](/docs/records/fields/types/extension/) | A [plugin](/docs/plugins/) extension
| [Float](/docs/records/fields/types/float/) | A floating point number
| [Image](/docs/records/fields/types/images/) | A Base64-encoded images
| [Links](/docs/records/fields/types/links/) | A list of `context:id` pairs representing linked records
| [Number](/docs/records/fields/types/number/) | An integer (whole number)
| [Object](/docs/records/fields/types/object/) | A collection of _keys_ and their associated _values_
| [Text](/docs/records/fields/types/text/) | Free-form text
| [Timestamp](/docs/records/fields/types/timestamp/) | A 32-bit Unix timestamp integer, representing the number of elapsed seconds since January 1, 1970 00:00:00 GMT
| [URL](/docs/records/fields/types/URL/) | A web page URL

Here's what the fields for a basic [worker record](/docs/records/types/worker/) might look like for someone on your team:

|---
| Field | Type | Value
|-|-|-
| ID | Number | `1`
| First name | Text | `Kina`
| Last name | Text | `Halpue`
| Job title | Text | `Support Manager`
| Photo | File | <img src="/assets/images/common/avatars/person2.png" class="screenshot">
| Administrator | Boolean | `yes`
| Email address | Record | `kina@cerb.example`
| Mobile number | Phone | `+1-555-123-4567`
| Location | Text | `Los Angeles, California, USA`
| Gender | Text | `female`
| Created at | Date | `2002-01-09 04:27:01 UTC`
| Updated at | Date | `2018-08-30 10:32:00 UTC`

# Record Types

### Built-in record types:

|---
| Alias | Record
|-|-
| `activity_log` | [Activity Logs](/docs/records/types/activity_log/)
| `address` | [Email Addresses](/docs/records/types/address/)
| `attachment` | [Attachments](/docs/records/types/attachment/)
| `behavior` | [Behaviors](/docs/records/types/behavior/)
| `bot` | [Bots](/docs/records/types/bot/)
| `bucket` | [Buckets](/docs/records/types/bucket/)
| `calendar_event` | [Calendar Events](/docs/records/types/calendar_event/)
| `calendar_recurring_event` | [Calendar Recurring Events](/docs/records/types/calendar_recurring_event/)
| `calendar` | [Calendars](/docs/records/types/calendar/)
| `classifier_class` | [Classifications](/docs/records/types/classifier_class/)
| `classifier_entity` | [Classifier Entities](/docs/records/types/classifier_entity/)
| `classifier_example` | [Classifier Examples](/docs/records/types/classifier_example/)
| `classifier` | [Classifiers](/docs/records/types/classifier/)
| `comment` | [Comments](/docs/records/types/comment/)
| `community_portal` | [Community Portals](/docs/records/types/community_portal/)
| `connected_account` | [Connected Accounts](/docs/records/types/connected_account/)
| `contact` | [Contacts](/docs/records/types/contact/)
| `currency` | [Currencies](/docs/records/types/currency/)
| `custom_field` | [Custom Fields](/docs/records/types/custom_field/)
| `custom_fieldset` | [Custom Fieldsets](/docs/records/types/custom_fieldset/)
| `custom_record` | [Custom Records](/docs/records/types/custom_record/)
| `draft` | [Drafts](/docs/records/types/draft/)
| `email_signature` | [Email Signatures](/docs/records/types/email_signature/)
| `file_bundle` | [File Bundles](/docs/records/types/file_bundle/)
| `gpg_public_key` | [Public Keys](/docs/records/types/gpg_public_key/)
| `group` | [Groups](/docs/records/types/group/)
| `html_template` | [Email Templates](/docs/records/types/html_template/)
| `mail_transport` | [Email Transports](/docs/records/types/mail_transport/)
| `mailbox` | [Email Mailboxes](/docs/records/types/mailbox/)
| `message` | [Email Messages](/docs/records/types/message/)
| `notification` | [Notifications](/docs/records/types/notification/)
| `org` | [Organizations](/docs/records/types/org/)
| `profile_tab` | [Profile Tabs](/docs/records/types/profile_tab/)
| `profile_widget` | [Profile Widgets](/docs/records/types/profile_widget/)
| `reminder` | [Reminders](/docs/records/types/reminder/)
| `role` | [Roles](/docs/records/types/role/)
| `saved_search` | [Saved Searches](/docs/records/types/saved_search/)
| `scheduled_behavior` | [Scheduled Behaviors](/docs/records/types/scheduled_behavior/)
| `skill` | [Skills](/docs/records/types/skill/)
| `skillset` | [Skillsets](/docs/records/types/skillset/)
| `snippet` | [Snippets](/docs/records/types/snippet/)
| `task` | [Tasks](/docs/records/types/task/)
| `ticket` | [Tickets](/docs/records/types/ticket/)
| `worker` | [Workers](/docs/records/types/worker/)
| `workspace_list` | [Workspace Worklists](/docs/records/types/workspace_list/)
| `workspace_page` | [Workspace Pages](/docs/records/types/workspace_page/)
| `workspace_tab` | [Workspace Tabs](/docs/records/types/workspace_tab/)
| `workspace_widget` | [Workspace Widgets](/docs/records/types/workspace_widget/)

### Plugin-provided record types:

|---
| Alias | Record
|-|-
| `asset` | [Assets](/docs/records/types/asset/)
| `call` | [Calls](/docs/records/types/call/)
| `domain` | [Domains](/docs/records/types/domain/)
| `feed_item` | [Feed Items](/docs/records/types/feed_item/)
| `feed` | [Feeds](/docs/records/types/feed/)
| `feedback` | [Feedback](/docs/records/types/feedback/)
| `kb_article` | [Knowledgebase Articles](/docs/records/types/kb_article/)
| `kb_category` | [Knowledgebase Categories](/docs/records/types/kb_category/)
| `opportunity` | [Opportunities](/docs/records/types/opportunity/)
| `project_board_column` | [Project Board Columns](/docs/records/types/project_board_column/)
| `project_board` | [Project Boards](/docs/records/types/project_board/)
| `sensor` | [Sensors](/docs/records/types/sensor/)
| `server` | [Servers](/docs/records/types/server/)
| `time_entry` | [Time Tracking Entries](/docs/records/types/time_entry/)
| `timetracking_activity` | [Time Tracking Activities](/docs/records/types/timetracking_activity/)
| `twitter_message` | [Twitter Messages](/docs/records/types/twitter_message/)
| `webapi_credentials` | [Web API Keys](/docs/records/types/webapi_credentials/)
| `webhook_listener` | [Webhooks](/docs/records/types/webhook_listener/)

