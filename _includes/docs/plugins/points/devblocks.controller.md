* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="devblocks.controller">
			<id>core.controller.ui</id>
			<name>UI Controller</name>
			<class>
				<file>api/uri/ui.php</file>
				<name>Controller_UI</name>
			</class>
			<params>
				<param key="uri" value="ui"/>
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

