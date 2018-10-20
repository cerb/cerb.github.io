---
title: Attachment Records
permalink: /docs/records/types/attachment/
toc:
  title: Attachment
  expand: Records
jumbotron:
  title: Attachment
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
| **Name (singular):** | Attachment
| **Name (plural):** | Attachments
| **Alias:** | attachment

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in attachment [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `bundle:` | [Record](/docs/search/deep-search/) | [Bundle](/docs/records/types/file_bundle/)
| `fieldset:` | [Record](/docs/search/deep-search/) | [Fieldset](/docs/records/types/custom_fieldset/)
| `id:` | [Number](/docs/search/filters/numbers/) | Attachment Id
| `links:` | [Links](/docs/search/filters/links/) | Record Links
| `mimetype:` | [Text](/docs/search/filters/text/) | Mime Type
| `name:` | [Text](/docs/search/filters/text/) | Name
| `on:` | Virtual | On
| `on.activity_log:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/activity_log/)
| `on.address:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/address/)
| `on.asset:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/asset/)
| `on.assignment:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/assignment/)
| `on.attachment:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/attachment/)
| `on.automobile:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/automobile/)
| `on.behavior:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/behavior/)
| `on.bot:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/bot/)
| `on.broadcast_campaign:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/broadcast_campaign/)
| `on.broadcast_list:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/broadcast_list/)
| `on.broadcast_list_member:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/broadcast_list_member/)
| `on.broadcast_message:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/broadcast_message/)
| `on.bucket:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/bucket/)
| `on.calendar:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/calendar/)
| `on.calendar_event:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/calendar_event/)
| `on.calendar_recurring_event:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/calendar_recurring_event/)
| `on.call:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/call/)
| `on.camera:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/camera/)
| `on.cerb_cloud_portal:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/cerb_cloud_portal/)
| `on.cerb_license:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/cerb_license/)
| `on.cerb_plugin:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/cerb_plugin/)
| `on.changeset:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/changeset/)
| `on.classifier:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/classifier/)
| `on.classifier_class:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/classifier_class/)
| `on.classifier_entity:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/classifier_entity/)
| `on.classifier_example:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/classifier_example/)
| `on.comment:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/comment/)
| `on.community_portal:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/community_portal/)
| `on.connected_account:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/connected_account/)
| `on.contact:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/contact/)
| `on.course:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/course/)
| `on.currency:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/currency/)
| `on.custom_field:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/custom_field/)
| `on.custom_fieldset:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/custom_fieldset/)
| `on.custom_record:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/custom_record/)
| `on.dkim_record:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/dkim_record/)
| `on.domain:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/domain/)
| `on.draft:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/draft/)
| `on.email_signature:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/email_signature/)
| `on.feed:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/feed/)
| `on.feed_item:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/feed_item/)
| `on.feedback:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/feedback/)
| `on.file_bundle:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/file_bundle/)
| `on.freshbooks_client:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/freshbooks_client/)
| `on.freshbooks_invoice:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/freshbooks_invoice/)
| `on.github_issue:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/github_issue/)
| `on.gpg_public_key:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/gpg_public_key/)
| `on.group:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/group/)
| `on.html_template:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/html_template/)
| `on.instructor:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/instructor/)
| `on.jira_issue:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/jira_issue/)
| `on.jira_project:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/jira_project/)
| `on.kb_article:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/kb_article/)
| `on.kb_category:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/kb_category/)
| `on.mail_transport:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/mail_transport/)
| `on.mailbox:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/mailbox/)
| `on.message:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/message/)
| `on.notification:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/notification/)
| `on.opportunity:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/opportunity/)
| `on.org:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/org/)
| `on.profile_tab:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/profile_tab/)
| `on.profile_widget:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/profile_widget/)
| `on.project_board:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/project_board/)
| `on.project_board_column:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/project_board_column/)
| `on.property:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/property/)
| `on.reminder:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/reminder/)
| `on.role:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/role/)
| `on.room:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/room/)
| `on.saved_search:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/saved_search/)
| `on.scheduled_behavior:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/scheduled_behavior/)
| `on.sensor:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/sensor/)
| `on.server:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/server/)
| `on.sip_endpoint:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/sip_endpoint/)
| `on.sms:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/sms/)
| `on.snippet:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/snippet/)
| `on.task:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/task/)
| `on.ticket:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/ticket/)
| `on.time_entry:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/time_entry/)
| `on.timetracking_activity:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/timetracking_activity/)
| `on.trade_secret:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/trade_secret/)
| `on.twitter_message:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/twitter_message/)
| `on.webapi_credentials:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/webapi_credentials/)
| `on.webhook_listener:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/webhook_listener/)
| `on.worker:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/worker/)
| `on.workspace_list:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/workspace_list/)
| `on.workspace_page:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/workspace_page/)
| `on.workspace_tab:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/workspace_tab/)
| `on.workspace_widget:` | [Record](/docs/search/deep-search/) | [On](/docs/records/types/workspace_widget/)
| `size:` | [Number](/docs/search/filters/numbers/) | Size
| `storage.extension:` | [Text](/docs/search/filters/text/) | Storage Extension
| `updated:` | [Date](/docs/search/filters/dates/) | Updated

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in attachment [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `id` | Number | Id
| `mime_type` | Text | Mime Type
| `name` | Text | Name
| `storage_sha1hash` | Text | Sha-1 Hash
| `size` | Size_Bytes | Size
| `storage_extension` | Text | Storage Extension
| `storage_key` | Text | Storage Key
| `updated` | Date | Updated
