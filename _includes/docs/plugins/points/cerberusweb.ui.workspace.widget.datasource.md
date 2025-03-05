* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;cerberusweb.ui.workspace.widget.datasource&quot;>
			<id>core.workspace.widget.datasource.manual</id>
			<name>Manual Input</name>
			<class>
				<file>api/uri/internal/dashboards/widget_datasources.php</file>
				<name>WorkspaceWidgetDatasource_Manual</name>
			</class>
			<params>
				<param key=&quot;widgets&quot;>
					<value>
						<data key=&quot;core.workspace.widget.counter&quot;/>
						<data key=&quot;core.workspace.widget.gauge&quot;/>
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

