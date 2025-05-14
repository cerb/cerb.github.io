* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="cerberusweb.ui.workspace.widget.datasource">
			<id>core.workspace.widget.datasource.manual</id>
			<name>Manual Input</name>
			<class>
				<file>api/uri/internal/dashboards/widget_datasources.php</file>
				<name>WorkspaceWidgetDatasource_Manual</name>
			</class>
			<params>
				<param key="widgets">
					<value>
						<data key="core.workspace.widget.counter"/>
						<data key="core.workspace.widget.gauge"/>
					</value>
				</param>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_WorkspaceWidgetDatasource {
	public function getData(Model_WorkspaceWidget $widget, array $params, $params_prefix) {
	}

	public function renderConfig(Model_WorkspaceWidget $widget, $params, $params_prefix) {
	}
}
{% endraw %}
{% endhighlight %}

