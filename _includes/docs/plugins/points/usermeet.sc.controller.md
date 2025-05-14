* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="usermeet.sc.controller">
			<id>cerberusweb.kb.sc.controller</id>
			<name>Knowledgebase</name>
			<class>
				<file>api/sc/kb.php</file>
				<name>UmScKbController</name>
			</class>
			<params>
				<param key="uri" value="kb"/>
				<param key="menu_title" value="common.knowledgebase"/>
				<param key="options">
					<value>
						<data key="configurable"/>
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

