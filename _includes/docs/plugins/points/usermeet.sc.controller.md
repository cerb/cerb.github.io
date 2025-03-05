* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;usermeet.sc.controller&quot;>
			<id>cerberusweb.kb.sc.controller</id>
			<name>Knowledgebase</name>
			<class>
				<file>api/sc/kb.php</file>
				<name>UmScKbController</name>
			</class>
			<params>
				<param key=&quot;uri&quot; value=&quot;kb&quot;/>
				<param key=&quot;menu_title&quot; value=&quot;common.knowledgebase&quot;/>
				<param key=&quot;options&quot;>
					<value>
						<data key=&quot;configurable&quot;/>
					</value>
				</param>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_UmScController {
	public function configure(Model_CommunityTool $instance)

	/**
	 * @param DevblocksHttpRequest
	 * @return DevblocksHttpResponse
	 */
	public function handleRequest(DevblocksHttpRequest $request) {
	}

	public function isVisible() {
	}

	public function renderSidebar(DevblocksHttpResponse $response) {
	}

	public function saveConfiguration(Model_CommunityTool $instance) {
	}

	public function writeResponse(DevblocksHttpResponse $response) {
	}
}
{% endraw %}
{% endhighlight %}

