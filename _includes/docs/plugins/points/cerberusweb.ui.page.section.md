* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;cerberusweb.ui.page.section&quot;>
			<id>assets.page.profiles.asset</id>
			<name>Asset Section</name>
			<class>
				<file>api/profiles/asset.php</file>
				<name>PageSection_ProfilesAsset</name>
			</class>
			<params>
				<param key=&quot;page_id&quot; value=&quot;core.page.profiles&quot;/>
				<param key=&quot;uri&quot; value=&quot;asset&quot;/>
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

