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
    url: /docs/plugins/extensions/
---

|---
|-|-
| **Name:** | Scheduled Job
| **Identifier (ID):** | cerberusweb.cron

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.cron&quot;&gt;
			&lt;id&gt;cron.mailbox&lt;/id&gt;
			&lt;name&gt;Mailbox Checker and Email Downloader&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/cron.classes.php&lt;/file&gt;
				&lt;name&gt;MailboxCron&lt;/name&gt;
			&lt;/class&gt;
			&lt;params/&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends CerberusCronPageExtension {
	public function configure($instance) {
	}

	public function saveConfigurationAction() {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Bot Scheduled Behavior | `cron.bot.scheduled_behavior`
| Feeds Cron | `feeds.cron`
| Freshbooks Synchronize Cron | `wgm.freshbooks.cron.sync`
| Heartbeat | `cron.heartbeat`
| Inbound Email Message Processor | `cron.parser`
| JIRA Synchronization | `wgmjira.cron`
| Mail Queue Processor | `cron.mail_queue`
| Mailbox Checker and Email Downloader | `cron.mailbox`
| Maintenance | `cron.maint`
| Network and service monitoring | `cerberusweb.datacenter.sensors.cron`
| Notifications Emailer | `wgm.notifications.emailer.cron`
| Reminders | `cron.reminders`
| Search Indexer | `cron.search`
| Storage Manager | `cron.storage`
| Twitter Checker | `wgmtwitter.cron`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>