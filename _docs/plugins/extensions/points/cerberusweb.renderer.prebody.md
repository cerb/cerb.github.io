---
title: "Extension Point: Prebody Renderer"
permalink: /docs/plugins/extensions/points/cerberusweb.renderer.prebody/
toc:
  title: "Prebody Renderer"
  expand: Plugins
jumbotron:
  title: "Prebody Renderer"
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
| **Name:** | Prebody Renderer
| **Identifier (ID):** | cerberusweb.renderer.prebody

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.renderer.prebody&quot;&gt;
			&lt;id&gt;timetracking.renderer.prebody&lt;/id&gt;
			&lt;name&gt;Time Tracking Pre-body Renderer&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;ChTimeTrackingPreBodyRenderer&lt;/name&gt;
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
class ExampleExtension extends Extension_AppPreBodyRenderer {
	public function render() {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Time Tracking Pre-body Renderer | `timetracking.renderer.prebody`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>