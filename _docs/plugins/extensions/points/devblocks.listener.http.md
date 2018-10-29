---
title: "Extension Point: Http Request Listener"
permalink: /docs/plugins/extensions/points/devblocks.listener.http/
toc:
  title: "Http Request Listener"
  expand: Plugins
jumbotron:
  title: "Http Request Listener"
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
| **Name:** | Http Request Listener
| **Identifier (ID):** | devblocks.listener.http

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.listener.http&quot;&gt;
			&lt;id&gt;core.listeners.tour&lt;/id&gt;
			&lt;name&gt;Core Helpdesk Tour&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/listeners.classes.php&lt;/file&gt;
				&lt;name&gt;ChCoreTour&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends DevblocksHttpResponseListenerExtension {
	public function run(DevblocksHttpResponse $request, Smarty $tpl) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Core Helpdesk Tour | `core.listeners.tour`
| Simulator Tour | `simulator.listeners.tour`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>