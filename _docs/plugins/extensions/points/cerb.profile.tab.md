---
title: "Extension Point: Profile Tab Type"
permalink: /docs/plugins/extensions/points/cerb.profile.tab/
toc:
  title: "Profile Tab Type"
  expand: Plugins
jumbotron:
  title: "Profile Tab Type"
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
| **Name:** | Profile Tab Type
| **Identifier (ID):** | cerb.profile.tab

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.profile.tab&quot;&gt;
			&lt;id&gt;cerb.profile.tab.dashboard&lt;/id&gt;
			&lt;name&gt;Dashboard&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/profiles.php&lt;/file&gt;
				&lt;name&gt;ProfileTab_Dashboard&lt;/name&gt;
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
class ExampleExtension extends Extension_ProfileTab {
	public function renderConfig(Model_ProfileTab $model) {
	}

	public function saveConfig(Model_ProfileTab $model) {
	}

	public function showTab(Model_ProfileTab $model, $context, $context_id) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| [**Dashboard**](/docs/plugins/extensions/cerb.profile.tab.dashboard/) | `cerb.profile.tab.dashboard`
| [**Portal Configure**](/docs/plugins/extensions/cerb.profile.tab.portal.config/) | `cerb.profile.tab.portal.config`
| [**Portal Deploy**](/docs/plugins/extensions/cerb.profile.tab.portal.deploy/) | `cerb.profile.tab.portal.deploy`
| [**Worker Settings**](/docs/plugins/extensions/cerb.profile.tab.worker.settings/) | `cerb.profile.tab.worker.settings`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>