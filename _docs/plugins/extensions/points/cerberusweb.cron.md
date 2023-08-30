---
title: "Extension Point: Scheduled Job"
permalink: /docs/plugins/extensions/points/cerberusweb.cron/
toc:
  title: "Scheduled Job"
  expand: Plugins
jumbotron:
  title: "Scheduled Job"
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
| **Name:** | Scheduled Job
| **Identifier (ID):** | cerberusweb.cron

{% include docs/plugins/points/cerberusweb.cron.md %}

# Extensions

| Bot Scheduled Behavior | `cron.bot.scheduled_behavior`
| Feeds Cron | `feeds.cron`
| Heartbeat | `cron.heartbeat`
| Inbound Email Message Processor | `cron.parser`
| JIRA Synchronization | `wgmjira.cron`
| Mail Queue Processor | `cron.mail_queue`
| Mailbox Checker and Email Downloader | `cron.mailbox`
| Maintenance | `cron.maint`
| Network and service monitoring | `cerberusweb.datacenter.sensors.cron`
| Notifications Emailer | `wgm.notifications.emailer.cron`
| Packages Importer | `cron.packages`
| Reminders | `cron.reminders`
| Search Indexer | `cron.search`
| Storage Manager | `cron.storage`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>