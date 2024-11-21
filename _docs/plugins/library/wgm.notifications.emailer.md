---
title: 'Plugin: Notifications Emailer'
excerpt: This page provides information about the "Notifications Emailer" plugin for
  Cerb, developed by Webgroup Media, LLC.
summary: This page provides information about the "Notifications Emailer" plugin for
  Cerb, developed by Webgroup Media, LLC. The plugin is designed to automatically
  send email notifications to workers when they receive new notifications, consolidating
  multiple notifications into a single digest email. It includes a scheduled job extension
  identified as `wgm.notifications.emailer.cron`, which manages the timing and delivery
  of these email digests. The plugin is stored in the specified path within the Cerb
  system.
permalink: /docs/plugins/wgm.notifications.emailer/
toc:
  title: Notifications Emailer
  expand: Plugins
jumbotron:
  title: Notifications Emailer
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Plugins &raquo;
    url: /docs/plugins/
---

|---
|-|-
| **Name:** | Notifications Emailer
| **Identifier (ID):** | wgm.notifications.emailer
| **Author:** | Webgroup Media, LLC.
| **Path:** | storage/plugins/wgm.notifications.emailer/
| **Image:** | <img src="/assets/images/plugins/wgm.notifications.emailer.png" class="screenshot">

This plugin automatically sends an email to workers if they have received new notifications.  It sends digests, so if you receive 100 new assignments you'll only receive a single email about them.

* TOC
{:toc}

# Extensions

### Scheduled Job

| Notifications Emailer | `wgm.notifications.emailer.cron`


<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/#plugins" class="prev">&lt; Plugins</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>