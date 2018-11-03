* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;usermeet.sc.controller&quot;&gt;
			&lt;id&gt;cerberusweb.kb.sc.controller&lt;/id&gt;
			&lt;name&gt;Knowledgebase&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/sc/kb.php&lt;/file&gt;
				&lt;name&gt;UmScKbController&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;uri&quot; value=&quot;kb&quot;/&gt;
				&lt;param key=&quot;menu_title&quot; value=&quot;common.knowledgebase&quot;/&gt;
				&lt;param key=&quot;options&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;configurable&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
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
</code>
</pre>

