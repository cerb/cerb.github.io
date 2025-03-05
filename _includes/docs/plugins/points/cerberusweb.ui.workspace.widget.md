* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;cerberusweb.ui.workspace.widget&quot;>
			<id>core.workspace.widget.bot</id>
			<name>Bot Custom Widget</name>
			<class>
				<file>api/uri/internal/dashboards.php</file>
				<name>WorkspaceWidget_BotBehavior</name>
			</class>
			<params>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_WorkspaceWidget {
	public function render(Model_WorkspaceWidget $widget, $refresh_options) {
	}

	public function renderConfig(Model_WorkspaceWidget $widget) {
	}

	public function saveConfig(Model_WorkspaceWidget $widget) {
	}
}
{% endraw %}
{% endhighlight %}

