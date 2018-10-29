---
title: "Extension Point: Workspace Tab Type"
permalink: /docs/plugins/extensions/points/cerberusweb.ui.workspace.tab/
toc:
  title: "Workspace Tab Type"
  expand: Plugins
jumbotron:
  title: "Workspace Tab Type"
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
| **Name:** | Workspace Tab Type
| **Identifier (ID):** | cerberusweb.ui.workspace.tab

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.ui.workspace.tab&quot;&gt;
			&lt;id&gt;core.workspace.tab.dashboard&lt;/id&gt;
			&lt;name&gt;Dashboard&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/internal/dashboards.php&lt;/file&gt;
				&lt;name&gt;WorkspaceTab_Dashboards&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;label&quot; value=&quot;dashboard&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_WorkspaceTab {
	public function exportTabConfigJson(Model_WorkspacePage $page, Model_WorkspaceTab $tab) {
	}

	public function importTabConfigJson($import_json, Model_WorkspaceTab $tab) {
	}

	public function renderTab(Model_WorkspacePage $page, Model_WorkspaceTab $tab) {
	}

	public function renderTabConfig(Model_WorkspacePage $page, Model_WorkspaceTab $tab) {
	}

	public function saveTabConfig(Model_WorkspacePage $page, Model_WorkspaceTab $tab) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| [**Dashboard**](/docs/plugins/extensions/core.workspace.tab.dashboard/) | `core.workspace.tab.dashboard`
| [**Worklists**](/docs/plugins/extensions/core.workspace.tab.worklists/) | `core.workspace.tab.worklists`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>