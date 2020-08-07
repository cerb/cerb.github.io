---
title: >-
  Filter new incoming message
permalink: /docs/bots/events/event.mail.received.app/
toc:
  title: "Filter new incoming message"
  expand: Bots
jumbotron:
  title: "Filter new incoming message"
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Events &raquo;
    url: /docs/bots/events/
---

|---
|-|-
| **Name:** | Filter new incoming message
| **Identifier (ID):** | event.mail.received.app
| **Class:** | Event_MailReceivedByApp
| **File:** | features/cerberusweb.core/api/events/app/mail_received_by_app.php

### Event Actions

|---
| Action | ID
|-|-
| [**Append text to message content**](/docs/bots/events/event.mail.received.app/actions/append_to_content/) | `append_to_content`
| [**Prepend text to message content**](/docs/bots/events/event.mail.received.app/actions/prepend_to_content/) | `prepend_to_content`
| [**Redirect delivery to another email address**](/docs/bots/events/event.mail.received.app/actions/redirect_email/) | `redirect_email`
| [**Reject delivery of message**](/docs/bots/events/event.mail.received.app/actions/reject/) | `reject`
| [**Remove attachments by filename**](/docs/bots/events/event.mail.received.app/actions/remove_attachments/) | `remove_attachments`
| [**Replace text in message content**](/docs/bots/events/event.mail.received.app/actions/replace_content/) | `replace_content`
| [**Reply to sender**](/docs/bots/events/event.mail.received.app/actions/send_email_sender/) | `send_email_sender`
| [**Set message header**](/docs/bots/events/event.mail.received.app/actions/set_header/) | `set_header`

### Global Actions

|---
| Action | ID
|-|-
| [**Add watchers**](/docs/bots/events/actions/add_watchers/) | `add_watchers`
| [**Behavior call subroutine**](/docs/bots/events/actions/_run_subroutine/) | `_run_subroutine`
| [**Behavior exit**](/docs/bots/events/actions/_exit/) | `_exit`
| [**Behavior run**](/docs/bots/events/actions/_run_behavior/) | `_run_behavior`
| [**Behavior schedule**](/docs/bots/events/actions/_schedule_behavior/) | `_schedule_behavior`
| [**Behavior unschedule**](/docs/bots/events/actions/_unschedule_behavior/) | `_unschedule_behavior`
| [**Execute classifier prediction**](/docs/bots/events/actions/core.va.action.classifier_prediction/) | `core.va.action.classifier_prediction`
| [**Execute data query**](/docs/bots/events/actions/core.bot.action.data_query/) | `core.bot.action.data_query`
| [**Execute email parser**](/docs/bots/events/actions/core.bot.action.email_parser/) | `core.bot.action.email_parser`
| [**Execute HTTP request**](/docs/bots/events/actions/core.va.action.http_request/) | `core.va.action.http_request`
| [**Execute PGP encrypt**](/docs/bots/events/actions/core.bot.action.pgp.encrypt/) | `core.bot.action.pgp.encrypt`
| [**Get links**](/docs/bots/events/actions/_get_links/) | `_get_links`
| [**Get persistent key**](/docs/bots/events/actions/_get_key/) | `_get_key`
| [**Get time elapsed using calendar availability**](/docs/bots/events/actions/core.bot.action.calculate_time_elapsed/) | `core.bot.action.calculate_time_elapsed`
| [**Package import**](/docs/bots/events/actions/core.bot.action.package.import/) | `core.bot.action.package.import`
| [**Record create**](/docs/bots/events/actions/core.bot.action.record.create/) | `core.bot.action.record.create`
| [**Record delete**](/docs/bots/events/actions/core.bot.action.record.delete/) | `core.bot.action.record.delete`
| [**Record retrieve**](/docs/bots/events/actions/core.bot.action.record.retrieve/) | `core.bot.action.record.retrieve`
| [**Record search**](/docs/bots/events/actions/core.bot.action.record.search/) | `core.bot.action.record.search`
| [**Record update**](/docs/bots/events/actions/core.bot.action.record.update/) | `core.bot.action.record.update`
| [**Record upsert**](/docs/bots/events/actions/core.bot.action.record.upsert/) | `core.bot.action.record.upsert`
| [**Schedule proactive interaction**](/docs/bots/events/actions/core.bot.action.interaction_proactive.schedule/) | `core.bot.action.interaction_proactive.schedule`
| [**Send email**](/docs/bots/events/actions/send_email/) | `send_email`
| [**Service AWS Get Pre-signed URL**](/docs/bots/events/actions/wgm.aws.bot.action.get_presigned_url/) | `wgm.aws.bot.action.get_presigned_url`
| [**Set custom placeholder**](/docs/bots/events/actions/_set_custom_var/) | `_set_custom_var`
| [**Set links**](/docs/bots/events/actions/set_links/) | `set_links`
| [**Set persistent key**](/docs/bots/events/actions/_set_key/) | `_set_key`
| [**Set snippet placeholder**](/docs/bots/events/actions/_set_custom_var_snippet/) | `_set_custom_var_snippet`
