---
title: "Extension Point: Workspace Widget Datasource"
permalink: /docs/plugins/extensions/points/cerberusweb.ui.workspace.widget.datasource/
toc:
  title: "Workspace Widget Datasource"
  expand: Plugins
jumbotron:
  title: "Workspace Widget Datasource"
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
| **Name:** | Workspace Widget Datasource
| **Identifier (ID):** | cerberusweb.ui.workspace.widget.datasource

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.ui.workspace.widget.datasource&quot;&gt;
			&lt;id&gt;core.workspace.widget.datasource.manual&lt;/id&gt;
			&lt;name&gt;Manual Input&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/internal/dashboards/widget_datasources.php&lt;/file&gt;
				&lt;name&gt;WorkspaceWidgetDatasource_Manual&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;widgets&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;core.workspace.widget.counter&quot;/&gt;
						&lt;data key=&quot;core.workspace.widget.gauge&quot;/&gt;
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
class ExampleExtension extends Extension_WorkspaceWidgetDatasource {
	public function getData(Model_WorkspaceWidget $widget, array $params, $params_prefix) {
	}

	public function renderConfig(Model_WorkspaceWidget $widget, $params, $params_prefix) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| [**Bot Behavior**](/docs/plugins/extensions/core.workspace.widget.datasource.bot/) | `core.workspace.widget.datasource.bot`
| [**Data Query**](/docs/plugins/extensions/cerb.workspace.widget.datasource.data_query/) | `cerb.workspace.widget.datasource.data_query`
| [**Manual Input**](/docs/plugins/extensions/core.workspace.widget.datasource.manual/) | `core.workspace.widget.datasource.manual`
| [**Sensor**](/docs/plugins/extensions/cerberusweb.datacenter.sensor.widget.datasource/) | `cerberusweb.datacenter.sensor.widget.datasource`
| [**URL**](/docs/plugins/extensions/core.workspace.widget.datasource.url/) | `core.workspace.widget.datasource.url`
| [**Worklist (Metric)**](/docs/plugins/extensions/core.workspace.widget.datasource.worklist.metric/) | `core.workspace.widget.datasource.worklist.metric`
| [**Worklist (Series)**](/docs/plugins/extensions/core.workspace.widget.datasource.worklist.series/) | `core.workspace.widget.datasource.worklist.series`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>