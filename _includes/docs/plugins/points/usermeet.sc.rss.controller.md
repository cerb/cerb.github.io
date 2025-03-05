* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;usermeet.sc.rss.controller&quot;>
			<id>cerberusweb.kb.sc.rss.controller</id>
			<name>Knowledgebase RSS</name>
			<class>
				<file>api/sc/rss/kb.php</file>
				<name>UmScKbRssController</name>
			</class>
			<params>
				<param key=&quot;uri&quot; value=&quot;kb&quot;/>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_UmScRssController {
	public function handleRequest(DevblocksHttpRequest $request) {
	}
}
{% endraw %}
{% endhighlight %}

