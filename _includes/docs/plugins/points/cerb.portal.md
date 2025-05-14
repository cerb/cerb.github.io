* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="cerb.portal">
			<id>cerb.bots.portal</id>
			<name>Conversational Bot</name>
			<class>
				<file>api/App.php</file>
				<name>Portal_ConvoBotWidget</name>
			</class>
			<params>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_CommunityPortal {
	/**
	 * @param Model_CommunityTool $instance
	 */
	public function configure(Model_CommunityTool $instance) {
	}

	public function saveConfiguration(Model_CommunityTool $instance) {
	}

	/**
	 * @param DevblocksHttpRequest
	 * @return DevblocksHttpResponse
	 */
	public function handleRequest(DevblocksHttpRequest $request) {
	}

	public function writeResponse(DevblocksHttpResponse $response) {
	}
}
{% endraw %}
{% endhighlight %}

