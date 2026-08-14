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
    url: /docs/plugins/#extensions
---

|---
|-|-
| **Name:** | Bot Event
| **Identifier (ID):** | devblocks.event

{% include docs/plugins/points/devblocks.event.md %}

# Extensions

| After message sent from group member (Legacy) | `event.mail.after.sent.group`
| After message sent from worker (Legacy) | `event.mail.after.sent`
| [DEPRECATED] Before composing a message reply | `event.mail.reply.pre.ui.worker`
| [DEPRECATED] Before composing a new message | `event.mail.compose.pre.ui.worker`
| Before message sent by group member (Legacy) | `event.mail.sent.group`
| Before message sent by worker (Legacy) | `event.mail.before.sent`
| Chat with portal visitor (Legacy) | `event.message.chat.portal`
| Chat with worker (Legacy) | `event.message.chat.worker`
| Custom API request (Legacy) | `event.api.custom_request`
| Dashboard get metric for widget (Legacy) | `event.dashboard.widget.get_metric`
| Dashboard render widget (Legacy) | `event.dashboard.widget.render`
| Data query datasource (Legacy) | `event.data.query.datasource`
| Filter new incoming message (Legacy) | `event.mail.received.app`
| Form interaction (Legacy) | `event.form.interaction.worker`
| Get chat interactions for worker (Legacy) | `event.interactions.get.worker`
| Handle chat interaction with portal visitor (Legacy) | `event.interaction.chat.portal`
| Handle chat interaction with worker (Legacy) | `event.interaction.chat.worker`
| New JIRA issue (Legacy) | `wgmjira.event.issue.created`
| New comment on JIRA issue (Legacy) | `wgmjira.event.issue.commented`
| New comment on ticket in group (Legacy) | `event.comment.ticket.group`
| New contact registered in Support Center (Legacy) | `event.contact.registered.sc`
| New message added to ticket in group (Legacy) | `event.mail.received.group`
| New message added to ticket (Legacy) | `event.mail.received`
| New message on a watched ticket (Legacy) | `event.mail.received.watcher`
| New notification for me (Legacy) | `event.notification.received.worker`
| New status on JIRA issue (Legacy) | `wgmjira.event.issue.status.changed`
| New task created (Legacy) | `event.task.created.worker`
| Record changed (Legacy) | `event.record.changed`
| Record commented on (Legacy) | `event.comment.created.worker`
| Record custom behavior on JIRA issue (Legacy) | `event.macro.jira_issue`
| Record custom behavior on JIRA project (Legacy) | `event.macro.jira_project`
| Record custom behavior on bot (Legacy) | `event.macro.bot`
| Record custom behavior on calendar event (Legacy) | `event.macro.calendar_event`
| Record custom behavior on calendar (Legacy) | `event.macro.calendar`
| Record custom behavior on call (Legacy) | `event.macro.call`
| Record custom behavior on contact (Legacy) | `event.macro.contact`
| Record custom behavior on domain (Legacy) | `event.macro.domain`
| Record custom behavior on email address (Legacy) | `event.macro.address`
| Record custom behavior on feed item (Legacy) | `event.macro.feeditem`
| Record custom behavior on group (Legacy) | `event.macro.group`
| Record custom behavior on knowledgebase article (Legacy) | `event.macro.kb_article`
| Record custom behavior on message (Legacy) | `event.macro.message`
| Record custom behavior on notification (Legacy) | `event.macro.notification`
| Record custom behavior on opportunity (Legacy) | `event.macro.crm.opportunity`
| Record custom behavior on organization (Legacy) | `event.macro.org`
| Record custom behavior on reminder (Legacy) | `event.macro.reminder`
| Record custom behavior on server (Legacy) | `event.macro.server`
| Record custom behavior on task (Legacy) | `event.macro.task`
| Record custom behavior on ticket (Legacy) | `event.macro.ticket`
| Record custom behavior on time tracking entry (Legacy) | `event.macro.timetracking`
| Record custom behavior on worker (Legacy) | `event.macro.worker`
| Record worklist rendered (Legacy) | `event.ui.worklist.render.worker`
| Recurrent behavior (Legacy) | `event.behavior.recurrent`
| Respond to Ajax HTTP request | `event.ajax.request`
| Ticket assigned in group (Legacy) | `event.mail.assigned.group`
| Ticket closed in group (Legacy) | `event.mail.closed.group`
| Ticket moved in group (Legacy) | `event.mail.moved.group`
| Ticket profile viewed by a worker (Legacy) | `event.ticket.viewed.worker`
| Webhook received (Legacy) | `event.webhook.received`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>