* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;devblocks.controller&quot;>
			<id>core.controller.ui</id>
			<name>UI Controller</name>
			<class>
				<file>api/uri/ui.php</file>
				<name>Controller_UI</name>
			</class>
			<params>
				<param key=&quot;uri&quot; value=&quot;ui&quot;/>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends DevblocksControllerExtension {
	public function handleRequest(DevblocksHttpRequest $request) {
	}

	public function writeResponse(DevblocksHttpResponse $response) {
	}
}
{% endraw %}
{% endhighlight %}

