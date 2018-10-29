---
title: "Extension Point: Profile Script"
permalink: /docs/plugins/extensions/points/cerberusweb.ui.context.profile.script/
toc:
  title: "Profile Script"
  expand: Plugins
jumbotron:
  title: "Profile Script"
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
| **Name:** | Profile Script
| **Identifier (ID):** | cerberusweb.ui.context.profile.script

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.ui.context.profile.script&quot;&gt;
			&lt;id&gt;cerb.legacy.print.profile.ticket.script&lt;/id&gt;
			&lt;name&gt;Ticket Profile Print Script&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;ProfileScript_TicketPrint&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;contexts&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;cerberusweb.contexts.ticket&quot;/&gt;
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
class ExampleExtension extends Extension_ContextProfileScript {
	public function renderScript($context, $context_id) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Profile Attachments Download Script | `cerb.legacy.profile.attachments.zip.script`
| Ticket Profile Move To Script | `cerb.profile.ticket.moveto.script`
| Ticket Profile Print Script | `cerb.legacy.print.profile.ticket.script`
| Time Tracking Profile Script | `timetracking.profile_script.timer`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>