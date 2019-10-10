---
title: Bot Behavior Events
permalink: /docs/bots/events/
toc:
  title: Events
jumbotron:
  title: Events
  #tagline: Powerful automated behaviors built from your web browser
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
---

Each bot [behavior](/docs/bots/behaviors/) is triggered in response to a specific **event**. There are dozens of built-in events, and plugins or [webhooks](/docs/webhooks) can introduce new events for nearly anything.

Events can be grouped into two categories:

- **Autonomous** events occur automatically in response to normal activity within Cerb, even if nobody is logged in: a new message is received, a comment is made, a particular set of fields change on a record, etc.

- **Interactive** events are initiated by an actor (worker, bot, webhook) with an exchange of information between the bot and the actor. This includes conversational behaviors, as well as behaviors that serve as shortcuts for repeating a sequence of actions when directly instructed.

# API

* [**Custom API request**](/docs/bots/events/event.api.custom_request/)

# Chat Interactions

### Portal

* [**Conversation handle interaction with portal visitor**](/docs/bots/events/event.interaction.chat.portal/)
* [**Conversation with portal visitor**](/docs/bots/events/event.message.chat.portal/)

### Worker

* [**Conversation get interactions for worker**](/docs/bots/events/event.interactions.get.worker/)
* [**Conversation handle interaction with worker**](/docs/bots/events/event.interaction.chat.worker/)
* [**Conversation with worker**](/docs/bots/events/event.message.chat.worker/)

# Dashboards

* [**Dashboard get metric for widget**](/docs/bots/events/event.dashboard.widget.get_metric/)
* [**Dashboard render widget**](/docs/bots/events/event.dashboard.widget.render/)

# Data Queries

* [**Data Query Datasource**](/docs/bots/events/event.data.query.datasource/)

# Form Interactions

* [**Form interaction**](/docs/bots/events/event.form.interaction.worker/)

# Mail

### Messages

* [**After message sent from group member**](/docs/bots/events/event.mail.after.sent.group/)
* [**After message sent from worker**](/docs/bots/events/event.mail.after.sent/)
* [**Before composing a message reply**](/docs/bots/events/event.mail.reply.pre.ui.worker/)
* [**Before composing a new message**](/docs/bots/events/event.mail.compose.pre.ui.worker/)
* [**Before message sent from group member**](/docs/bots/events/event.mail.sent.group/)
* [**Before message sent from worker**](/docs/bots/events/event.mail.before.sent/)
* [**Before new incoming message is accepted**](/docs/bots/events/event.mail.received.app/)

### Tickets

* [**After ticket profile viewed by a worker**](/docs/bots/events/event.ticket.viewed.worker/)
* [**Conversation assigned in group**](/docs/bots/events/event.mail.assigned.group/)
* [**Conversation closed in group**](/docs/bots/events/event.mail.closed.group/)
* [**Conversation moved in group**](/docs/bots/events/event.mail.moved.group/)
* [**New message added to ticket in this group**](/docs/bots/events/event.mail.received.group/)
* [**New message added to ticket**](/docs/bots/events/event.mail.received/)
* [**New message on a watched ticket**](/docs/bots/events/event.mail.received.watcher/)
* [**New comment on conversation in group**](/docs/bots/events/event.comment.ticket.group/)

# Notifications

* [**New notification for me**](/docs/bots/events/event.notification.received.worker/)

# Portals

### Support Center

* [**New contact registered in Support Center**](/docs/bots/events/event.contact.registered.sc/)

# Records

### Record events

* [**Record changed**](/docs/bots/events/event.record.changed/)
* [**Record commented on**](/docs/bots/events/event.comment.created.worker/)
* [**Record editor opened**](/docs/bots/events/event.ui.card.editor.opened.worker/)
* [**Render record worklist**](/docs/bots/events/event.ui.worklist.render.worker/)

### Custom behavior

* [**Bot**](/docs/bots/events/event.macro.bot/)
* [**Calendar event**](/docs/bots/events/event.macro.calendar_event/)
* [**Calendar**](/docs/bots/events/event.macro.calendar/)
* [**Call**](/docs/bots/events/event.macro.call/)
* [**Contact**](/docs/bots/events/event.macro.contact/)
* [**Domain**](/docs/bots/events/event.macro.domain/)
* [**Email address**](/docs/bots/events/event.macro.address/)
* [**Feed item**](/docs/bots/events/event.macro.feeditem/)
* [**Group**](/docs/bots/events/event.macro.group/)
* [**Knowledgebase article**](/docs/bots/events/event.macro.kb_article/)
* [**Message**](/docs/bots/events/event.macro.message/)
* [**Notification**](/docs/bots/events/event.macro.notification/)
* [**Opportunity**](/docs/bots/events/event.macro.crm.opportunity/)
* [**Organization**](/docs/bots/events/event.macro.org/)
* [**Reminder**](/docs/bots/events/event.macro.reminder/)
* [**Sensor**](/docs/bots/events/event.macro.sensor/)
* [**Server**](/docs/bots/events/event.macro.server/)
* [**Task**](/docs/bots/events/event.macro.task/)
* [**Ticket**](/docs/bots/events/event.macro.ticket/)
* [**Time tracking entry**](/docs/bots/events/event.macro.timetracking/)
* [**Worker**](/docs/bots/events/event.macro.worker/)

# Schedule

* [**Recurrent behavior**](/docs/bots/events/event.behavior.recurrent/)

# UI

* [**Respond to Ajax HTTP request**](/docs/bots/events/event.ajax.request/)

# Webhooks

* [**Webhook received**](/docs/bots/events/event.webhook.received/)
