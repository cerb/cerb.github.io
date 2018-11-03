* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.controller&quot;&gt;
			&lt;id&gt;core.controller.ui&lt;/id&gt;
			&lt;name&gt;UI Controller&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/ui.php&lt;/file&gt;
				&lt;name&gt;Controller_UI&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;uri&quot; value=&quot;ui&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends DevblocksControllerExtension {
	public function handleRequest(DevblocksHttpRequest $request) {
	}

	public function writeResponse(DevblocksHttpResponse $response) {
	}
}
{% endraw %}
</code>
</pre>

