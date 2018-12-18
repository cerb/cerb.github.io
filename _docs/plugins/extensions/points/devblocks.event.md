---
title: "Extension Point: Bot Event"
permalink: /docs/plugins/extensions/points/devblocks.event/
toc:
  title: "Bot Event"
  expand: Plugins
jumbotron:
  title: "Bot Event"
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
  -
    label: Extension Points &raquo;
    url: /docs/plugins/extensions/
---

|---
|-|-
| **Name:** | Bot Event
| **Identifier (ID):** | devblocks.event

{% include docs/plugins/points/devblocks.event.md %}

# Extensions

| After message sent from group member | `event.mail.after.sent.group`
| After message sent from worker | `event.mail.after.sent`
| After ticket profile viewed by a worker | `event.ticket.viewed.worker`
| Before message sent from group member | `event.mail.sent.group`
| Before message sent from worker | `event.mail.before.sent`
| Before new incoming message is accepted | `event.mail.received.app`
| Conversation assigned in group | `event.mail.assigned.group`
| Conversation closed in group | `event.mail.closed.group`
| Conversation get interactions for worker | `event.interactions.get.worker`
| Conversation handle interaction with portal visitor | `event.interaction.chat.portal`
| Conversation handle interaction with worker | `event.interaction.chat.worker`
| Conversation moved in group | `event.mail.moved.group`
| Conversation with portal visitor | `event.message.chat.portal`
| Conversation with worker | `event.message.chat.worker`
| Custom API request | `event.api.custom_request`
| Custom behavior on JIRA issue | `event.macro.jira_issue`
| Custom behavior on JIRA project | `event.macro.jira_project`
| Custom behavior on bot | `event.macro.bot`
| Custom behavior on calendar event | `event.macro.calendar_event`
| Custom behavior on calendar | `event.macro.calendar`
| Custom behavior on call | `event.macro.call`
| Custom behavior on contact | `event.macro.contact`
| Custom behavior on domain | `event.macro.domain`
| Custom behavior on email address | `event.macro.address`
| Custom behavior on feed item | `event.macro.feeditem`
| Custom behavior on group | `event.macro.group`
| Custom behavior on knowledgebase article | `event.macro.kb_article`
| Custom behavior on message | `event.macro.message`
| Custom behavior on notification | `event.macro.notification`
| Custom behavior on opportunity | `event.macro.crm.opportunity`
| Custom behavior on organization | `event.macro.org`
| Custom behavior on reminder | `event.macro.reminder`
| Custom behavior on sensor | `event.macro.sensor`
| Custom behavior on server | `event.macro.server`
| Custom behavior on task | `event.macro.task`
| Custom behavior on ticket | `event.macro.ticket`
| Custom behavior on time tracking entry | `event.macro.timetracking`
| Custom behavior on worker | `event.macro.worker`
| Dashboard get metric for widget | `event.dashboard.widget.get_metric`
| Dashboard render widget | `event.dashboard.widget.render`
| Data Query Datasource | `event.data.query.datasource`
| New JIRA issue | `wgmjira.event.issue.created`
| New comment on JIRA issue | `wgmjira.event.issue.commented`
| New comment on conversation in group | `event.comment.ticket.group`
| New contact registered in Support Center | `event.contact.registered.sc`
| New message added to ticket in this group | `event.mail.received.group`
| New message added to ticket | `event.mail.received`
| New message on a watched ticket | `event.mail.received.watcher`
| New notification for me | `event.notification.received.worker`
| New status on JIRA issue | `wgmjira.event.issue.status.changed`
| New task created | `event.task.created.worker`
| Record changed | `event.record.changed`
| Record commented on | `event.comment.created.worker`
| Recurrent behavior | `event.behavior.recurrent`
| Webhook received | `event.webhook.received`
| [DEPRECATED] [UI] During a message reply | `event.mail.reply.during.ui.worker`
| [UI] Before composing a message reply | `event.mail.reply.pre.ui.worker`
| [UI] Before composing a new message | `event.mail.compose.pre.ui.worker`
| [UI] Render record worklist | `event.ui.worklist.render.worker`
| [UI] Respond to Ajax HTTP request | `event.ajax.request`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>