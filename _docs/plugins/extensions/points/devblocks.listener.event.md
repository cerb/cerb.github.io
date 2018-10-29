---
title: "Extension Point: Event Listener"
permalink: /docs/plugins/extensions/points/devblocks.listener.event/
toc:
  title: "Event Listener"
  expand: Plugins
jumbotron:
  title: "Event Listener"
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
| **Name:** | Event Listener
| **Identifier (ID):** | devblocks.listener.event

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.listener.event&quot;&gt;
			&lt;id&gt;calls.listener&lt;/id&gt;
			&lt;name&gt;Event Listener&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;CallsEventListener&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;events&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;cron.maint&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends DevblocksEventListenerExtension {
	/**
	 * @param Model_DevblocksEvent $event
	 */
	public function handleEvent(Model_DevblocksEvent $event) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| CRM Listener | `crm.listeners.core`
| Cerb Event Listener | `cerberusweb.listeners.event`
| Event Listener | `calls.listener`
| Event Listener | `cerberusweb.datacenter.domains.listener`
| Event Listener | `cerberusweb.datacenter.listener`
| Event Listener | `cerberusweb.feed_reader.listener`
| Event Listener | `kb.listener`
| Freshbooks Event Listener | `wgm.freshbooks.listener`
| Support Center Event Listener | `sc.listeners.core`
| Time Tracking Listener | `timetracking.listener.core`
| Triggers Manager | `cerberusweb.listeners.triggers`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>