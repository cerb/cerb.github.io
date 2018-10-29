---
title: "Extension Point: Workspace Page Type"
permalink: /docs/plugins/extensions/points/cerberusweb.ui.workspace.page/
toc:
  title: "Workspace Page Type"
  expand: Plugins
jumbotron:
  title: "Workspace Page Type"
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
| **Name:** | Workspace Page Type
| **Identifier (ID):** | cerberusweb.ui.workspace.page

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.ui.workspace.page&quot;&gt;
			&lt;id&gt;core.workspace.page.workspace&lt;/id&gt;
			&lt;name&gt;Workspace&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/internal/workspaces.php&lt;/file&gt;
				&lt;name&gt;WorkspacePage_Workspace&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;label&quot; value=&quot;common.workspace&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_WorkspacePage {
	public function renderPage(Model_WorkspacePage $page) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| [**Workspace**](/docs/plugins/extensions/core.workspace.page.workspace/) | `core.workspace.page.workspace`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>