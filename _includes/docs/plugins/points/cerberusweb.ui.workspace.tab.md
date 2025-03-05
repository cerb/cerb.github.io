* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;cerberusweb.ui.workspace.tab&quot;>
			<id>core.workspace.tab.dashboard</id>
			<name>Dashboard</name>
			<class>
				<file>api/uri/internal/dashboards.php</file>
				<name>WorkspaceTab_Dashboards</name>
			</class>
			<params>
				<param key=&quot;label&quot; value=&quot;dashboard&quot;/>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
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
{% endhighlight %}

