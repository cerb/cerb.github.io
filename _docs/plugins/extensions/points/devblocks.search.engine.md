---
title: "Extension Point: Search Engine"
permalink: /docs/plugins/extensions/points/devblocks.search.engine/
toc:
  title: "Search Engine"
  expand: Plugins
jumbotron:
  title: "Search Engine"
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
| **Name:** | Search Engine
| **Identifier (ID):** | devblocks.search.engine

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.search.engine&quot;&gt;
			&lt;id&gt;devblocks.search.engine.elasticsearch&lt;/id&gt;
			&lt;name&gt;Elasticsearch&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/services/search.php&lt;/file&gt;
				&lt;name&gt;DevblocksSearchEngineElasticSearch&lt;/name&gt;
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
class ExampleExtension extends Extension_DevblocksSearchEngine {
}
{% endraw %}
</code>
</pre>

# Extensions

| Elasticsearch | `devblocks.search.engine.elasticsearch`
| MySQL Fulltext | `devblocks.search.engine.mysql_fulltext`
| Sphinx | `devblocks.search.engine.sphinx`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>