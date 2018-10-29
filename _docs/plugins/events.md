---
title: Plugin Events
permalink: /docs/plugins/events/
toc:
  title: Events
jumbotron:
  title: Events
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

Plugins can add new **events** to Cerb based on the contributed functionality. The [activity log](/docs/activity-log/) will record the new events on [records](/docs/records/), [bot behaviors](/docs/bots/) can listen for them, etc.

<pre style="max-height:29.5em;">
<code class="language-xml">
{% raw %}
&lt;event_points&gt;
	&lt;event id="example.event"&gt;
		&lt;name&gt;Example Event&lt;/name&gt;
		&lt;param key="field_name" /&gt;
	&lt;/event&gt;
&lt;/event_points&gt;
{% endraw %}
</code>
</pre>

* **`<event id="...">`** specifies the ID of the event.

* **`<name>`** is the human-friendly name of the event.

* **`<param key="...">`** is a list of available parameters on the event.

<div class="cerb-box note">
<p>If you create a <a href="/docs/plugins/extensions/points/devblocks.event/">Bot Event</a> extension you do not need to add a separate event here.</p>
</div>