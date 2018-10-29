---
title: "Extension Point: Support Center RSS Feed"
permalink: /docs/plugins/extensions/points/usermeet.sc.rss.controller/
toc:
  title: "Support Center RSS Feed"
  expand: Plugins
jumbotron:
  title: "Support Center RSS Feed"
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
| **Name:** | Support Center RSS Feed
| **Identifier (ID):** | usermeet.sc.rss.controller

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;usermeet.sc.rss.controller&quot;&gt;
			&lt;id&gt;cerberusweb.kb.sc.rss.controller&lt;/id&gt;
			&lt;name&gt;Knowledgebase RSS&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/sc/rss/kb.php&lt;/file&gt;
				&lt;name&gt;UmScKbRssController&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;uri&quot; value=&quot;kb&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_UmScRssController {
	public function handleRequest(DevblocksHttpRequest $request) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Knowledgebase RSS | `cerberusweb.kb.sc.rss.controller`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>