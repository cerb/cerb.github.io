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

