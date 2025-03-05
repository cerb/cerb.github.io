* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;cerberusweb.renderer.prebody&quot;>
			<id>timetracking.renderer.prebody</id>
			<name>Time Tracking Pre-body Renderer</name>
			<class>
				<file>api/App.php</file>
				<name>ChTimeTrackingPreBodyRenderer</name>
			</class>
			<params>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_AppPreBodyRenderer {
	public function render() {
	}
}
{% endraw %}
{% endhighlight %}

