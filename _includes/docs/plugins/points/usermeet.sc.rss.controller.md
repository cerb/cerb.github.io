* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="usermeet.sc.rss.controller">
			<id>cerberusweb.kb.sc.rss.controller</id>
			<name>Knowledgebase RSS</name>
			<class>
				<file>api/sc/rss/kb.php</file>
				<name>UmScKbRssController</name>
			</class>
			<params>
				<param key="uri" value="kb"/>
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

