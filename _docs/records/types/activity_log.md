---
title: Activity Log Records
permalink: /docs/records/types/activity_log/
toc:
  title: Activity Log
  expand: Records
jumbotron:
  title: Activity Log
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
| **Name (singular):** | Activity Log
| **Name (plural):** | Activity Logs
| **Alias:** | activity_log

* TOC
{:toc}

### Search Query Fields

These [filters](/docs/search/filters/) are available in activity log [search queries](/docs/search/):

|---
| Field | Type | Description
|-|-|-
| `activity:` | [Text](/docs/search/filters/text/) | Activity
| `actor:` | Virtual | Actor
| `actor.activity_log:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/activity_log/)
| `actor.address:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/address/)
| `actor.asset:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/asset/)
| `actor.assignment:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/assignment/)
| `actor.attachment:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/attachment/)
| `actor.automobile:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/automobile/)
| `actor.behavior:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/behavior/)
| `actor.bot:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/bot/)
| `actor.broadcast_campaign:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/broadcast_campaign/)
| `actor.broadcast_list:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/broadcast_list/)
| `actor.broadcast_list_member:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/broadcast_list_member/)
| `actor.broadcast_message:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/broadcast_message/)
| `actor.bucket:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/bucket/)
| `actor.calendar:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/calendar/)
| `actor.calendar_event:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/calendar_event/)
| `actor.calendar_recurring_event:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/calendar_recurring_event/)
| `actor.call:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/call/)
| `actor.camera:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/camera/)
| `actor.cerb_cloud_portal:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/cerb_cloud_portal/)
| `actor.cerb_license:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/cerb_license/)
| `actor.cerb_plugin:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/cerb_plugin/)
| `actor.changeset:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/changeset/)
| `actor.classifier:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/classifier/)
| `actor.classifier_class:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/classifier_class/)
| `actor.classifier_entity:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/classifier_entity/)
| `actor.classifier_example:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/classifier_example/)
| `actor.comment:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/comment/)
| `actor.community_portal:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/community_portal/)
| `actor.connected_account:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/connected_account/)
| `actor.contact:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/contact/)
| `actor.course:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/course/)
| `actor.currency:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/currency/)
| `actor.custom_field:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/custom_field/)
| `actor.custom_fieldset:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/custom_fieldset/)
| `actor.custom_record:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/custom_record/)
| `actor.dkim_record:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/dkim_record/)
| `actor.domain:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/domain/)
| `actor.draft:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/draft/)
| `actor.email_signature:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/email_signature/)
| `actor.feed:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/feed/)
| `actor.feed_item:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/feed_item/)
| `actor.feedback:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/feedback/)
| `actor.file_bundle:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/file_bundle/)
| `actor.freshbooks_client:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/freshbooks_client/)
| `actor.freshbooks_invoice:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/freshbooks_invoice/)
| `actor.github_issue:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/github_issue/)
| `actor.gpg_public_key:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/gpg_public_key/)
| `actor.group:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/group/)
| `actor.html_template:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/html_template/)
| `actor.instructor:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/instructor/)
| `actor.jira_issue:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/jira_issue/)
| `actor.jira_project:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/jira_project/)
| `actor.kb_article:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/kb_article/)
| `actor.kb_category:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/kb_category/)
| `actor.mail_transport:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/mail_transport/)
| `actor.mailbox:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/mailbox/)
| `actor.message:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/message/)
| `actor.notification:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/notification/)
| `actor.opportunity:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/opportunity/)
| `actor.org:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/org/)
| `actor.profile_tab:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/profile_tab/)
| `actor.profile_widget:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/profile_widget/)
| `actor.project_board:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/project_board/)
| `actor.project_board_column:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/project_board_column/)
| `actor.property:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/property/)
| `actor.reminder:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/reminder/)
| `actor.role:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/role/)
| `actor.room:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/room/)
| `actor.saved_search:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/saved_search/)
| `actor.scheduled_behavior:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/scheduled_behavior/)
| `actor.sensor:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/sensor/)
| `actor.server:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/server/)
| `actor.sip_endpoint:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/sip_endpoint/)
| `actor.sms:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/sms/)
| `actor.snippet:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/snippet/)
| `actor.task:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/task/)
| `actor.ticket:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/ticket/)
| `actor.time_entry:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/time_entry/)
| `actor.timetracking_activity:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/timetracking_activity/)
| `actor.trade_secret:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/trade_secret/)
| `actor.twitter_message:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/twitter_message/)
| `actor.webapi_credentials:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/webapi_credentials/)
| `actor.webhook_listener:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/webhook_listener/)
| `actor.worker:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/worker/)
| `actor.workspace_list:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/workspace_list/)
| `actor.workspace_page:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/workspace_page/)
| `actor.workspace_tab:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/workspace_tab/)
| `actor.workspace_widget:` | [Record](/docs/search/deep-search/) | [Actor](/docs/records/types/workspace_widget/)
| `created:` | [Date](/docs/search/filters/dates/) | Created
| `id:` | [Number](/docs/search/filters/numbers/) | Id
| `target:` | Virtual | Target
| `target.activity_log:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/activity_log/)
| `target.address:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/address/)
| `target.asset:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/asset/)
| `target.assignment:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/assignment/)
| `target.attachment:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/attachment/)
| `target.automobile:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/automobile/)
| `target.behavior:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/behavior/)
| `target.bot:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/bot/)
| `target.broadcast_campaign:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/broadcast_campaign/)
| `target.broadcast_list:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/broadcast_list/)
| `target.broadcast_list_member:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/broadcast_list_member/)
| `target.broadcast_message:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/broadcast_message/)
| `target.bucket:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/bucket/)
| `target.calendar:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/calendar/)
| `target.calendar_event:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/calendar_event/)
| `target.calendar_recurring_event:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/calendar_recurring_event/)
| `target.call:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/call/)
| `target.camera:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/camera/)
| `target.cerb_cloud_portal:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/cerb_cloud_portal/)
| `target.cerb_license:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/cerb_license/)
| `target.cerb_plugin:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/cerb_plugin/)
| `target.changeset:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/changeset/)
| `target.classifier:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/classifier/)
| `target.classifier_class:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/classifier_class/)
| `target.classifier_entity:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/classifier_entity/)
| `target.classifier_example:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/classifier_example/)
| `target.comment:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/comment/)
| `target.community_portal:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/community_portal/)
| `target.connected_account:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/connected_account/)
| `target.contact:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/contact/)
| `target.course:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/course/)
| `target.currency:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/currency/)
| `target.custom_field:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/custom_field/)
| `target.custom_fieldset:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/custom_fieldset/)
| `target.custom_record:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/custom_record/)
| `target.dkim_record:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/dkim_record/)
| `target.domain:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/domain/)
| `target.draft:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/draft/)
| `target.email_signature:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/email_signature/)
| `target.feed:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/feed/)
| `target.feed_item:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/feed_item/)
| `target.feedback:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/feedback/)
| `target.file_bundle:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/file_bundle/)
| `target.freshbooks_client:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/freshbooks_client/)
| `target.freshbooks_invoice:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/freshbooks_invoice/)
| `target.github_issue:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/github_issue/)
| `target.gpg_public_key:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/gpg_public_key/)
| `target.group:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/group/)
| `target.html_template:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/html_template/)
| `target.instructor:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/instructor/)
| `target.jira_issue:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/jira_issue/)
| `target.jira_project:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/jira_project/)
| `target.kb_article:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/kb_article/)
| `target.kb_category:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/kb_category/)
| `target.mail_transport:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/mail_transport/)
| `target.mailbox:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/mailbox/)
| `target.message:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/message/)
| `target.notification:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/notification/)
| `target.opportunity:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/opportunity/)
| `target.org:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/org/)
| `target.profile_tab:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/profile_tab/)
| `target.profile_widget:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/profile_widget/)
| `target.project_board:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/project_board/)
| `target.project_board_column:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/project_board_column/)
| `target.property:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/property/)
| `target.reminder:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/reminder/)
| `target.role:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/role/)
| `target.room:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/room/)
| `target.saved_search:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/saved_search/)
| `target.scheduled_behavior:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/scheduled_behavior/)
| `target.sensor:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/sensor/)
| `target.server:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/server/)
| `target.sip_endpoint:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/sip_endpoint/)
| `target.sms:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/sms/)
| `target.snippet:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/snippet/)
| `target.task:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/task/)
| `target.ticket:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/ticket/)
| `target.time_entry:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/time_entry/)
| `target.timetracking_activity:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/timetracking_activity/)
| `target.trade_secret:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/trade_secret/)
| `target.twitter_message:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/twitter_message/)
| `target.webapi_credentials:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/webapi_credentials/)
| `target.webhook_listener:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/webhook_listener/)
| `target.worker:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/worker/)
| `target.workspace_list:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/workspace_list/)
| `target.workspace_page:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/workspace_page/)
| `target.workspace_tab:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/workspace_tab/)
| `target.workspace_widget:` | [Record](/docs/search/deep-search/) | [Target](/docs/records/types/workspace_widget/)

### Dictionary Placeholders

These [placeholders](/docs/bots/scripting/placeholders/) are available in activity log [dictionaries](/docs/bots/behaviors/dictionaries/):

|---
| Field | Type | Description
|-|-|-
| `_label` | Text | Label
| `actor_` | Record | Actor
| `created` | Date | Created
| `event` | Text | Event
| `activity_point` | Text | Event Id
| `id` | Number | Id
| `target_` | Record | Target
