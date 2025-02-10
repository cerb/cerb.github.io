* TOC
{:toc}

# Manifest

{% highlight xml %}
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

