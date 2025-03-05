* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;cerberusweb.rest.controller&quot;>
			<id>cerberusweb.datacenter.domains.rest</id>
			<name>Domains</name>
			<class>
				<file>api/rest/domains.php</file>
				<name>ChRest_Domains</name>
			</class>
			<params>
				<param key=&quot;uri&quot; value=&quot;domains&quot;/>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_RestController {
	public function deleteAction($stack) {
	}

	public function getAction($stack) {
	}

	public function patchAction($stack) {
	}

	public function postAction($stack) {
	}

	public function putAction($stack) {
	}
}
{% endraw %}
{% endhighlight %}

