---
title: "Extension Point: Plugin Setup"
permalink: /docs/plugins/extensions/points/cerberusweb.plugin.setup/
toc:
  title: "Plugin Setup"
  expand: Plugins
jumbotron:
  title: "Plugin Setup"
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
| **Name:** | Plugin Setup
| **Identifier (ID):** | cerberusweb.plugin.setup

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.plugin.setup&quot;&gt;
			&lt;id&gt;wgmcampfire.setup&lt;/id&gt;
			&lt;name&gt;Setup&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;WgmCampfire_Setup&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;tab_label&quot; value=&quot;Campfire Credentials&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_PluginSetup {
	public static function getByPlugin($plugin_id, $as_instances) {
	}

	public function render() {
	}

	public function save($errors) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Setup | `wgmcampfire.setup`
| Setup | `wgmhipchat.setup`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>