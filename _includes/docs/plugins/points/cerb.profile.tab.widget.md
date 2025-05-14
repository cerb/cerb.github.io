* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="cerb.profile.tab.widget">
			<id>cerb.profile.tab.widget.behavior.tree</id>
			<name>Behavior Tree</name>
			<class>
				<file>api/uri/profiles.php</file>
				<name>ProfileWidget_BehaviorTree</name>
			</class>
			<params>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_ProfileWidget {
	public function render(Model_ProfileWidget $model, $context, $context_id, $refresh_options) {
	}

	public function renderConfig(Model_ProfileWidget $model) {
	}

	public function saveConfig(array $fields, $id, $error) {
	}
}
{% endraw %}
{% endhighlight %}

