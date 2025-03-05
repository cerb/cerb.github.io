* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;devblocks.listener.http&quot;>
			<id>core.listeners.tour</id>
			<name>Core Helpdesk Tour</name>
			<class>
				<file>api/listeners.classes.php</file>
				<name>ChCoreTour</name>
			</class>
			<params>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends DevblocksHttpResponseListenerExtension {
	public function run(DevblocksHttpResponse $request, Smarty $tpl) {
	}
}
{% endraw %}
{% endhighlight %}

