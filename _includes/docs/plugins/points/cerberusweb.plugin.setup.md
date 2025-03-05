* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;cerberusweb.plugin.setup&quot;>
			<id>wgmcampfire.setup</id>
			<name>Setup</name>
			<class>
				<file>api/App.php</file>
				<name>WgmCampfire_Setup</name>
			</class>
			<params>
				<param key=&quot;tab_label&quot; value=&quot;Campfire Credentials&quot;/>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_PluginSetup {
	public static function getByPlugin($plugin_id, $as_instances) {
	}

	public function render() {
	}

	public function save($errors) {
	}
}
{% endraw %}
{% endhighlight %}

