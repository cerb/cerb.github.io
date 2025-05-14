* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="cerb.profile.tab">
			<id>cerb.profile.tab.dashboard</id>
			<name>Dashboard</name>
			<class>
				<file>api/uri/profiles.php</file>
				<name>ProfileTab_Dashboard</name>
			</class>
			<params>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_ProfileTab {
	public function renderConfig(Model_ProfileTab $model) {
	}

	public function saveConfig(Model_ProfileTab $model) {
	}

	public function showTab(Model_ProfileTab $model, $context, $context_id) {
	}

	public function invoke(string $action, Model_ProfileTab $model) {
	}
}
{% endraw %}
{% endhighlight %}

