* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="cerberusweb.ui.workspace.page">
			<id>core.workspace.page.workspace</id>
			<name>Workspace</name>
			<class>
				<file>api/uri/internal/workspaces.php</file>
				<name>WorkspacePage_Workspace</name>
			</class>
			<params>
				<param key="label" value="common.workspace"/>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_WorkspacePage {
	public function renderPage(Model_WorkspacePage $page) {
	}
}
{% endraw %}
{% endhighlight %}

