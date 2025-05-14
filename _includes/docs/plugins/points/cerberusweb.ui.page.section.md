* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="cerberusweb.ui.page.section">
			<id>assets.page.profiles.asset</id>
			<name>Asset Section</name>
			<class>
				<file>api/profiles/asset.php</file>
				<name>PageSection_ProfilesAsset</name>
			</class>
			<params>
				<param key="page_id" value="core.page.profiles"/>
				<param key="uri" value="asset"/>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_PageSection {
	public function render() {
	}
}
{% endraw %}
{% endhighlight %}

