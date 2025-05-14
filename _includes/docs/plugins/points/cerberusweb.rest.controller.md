* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="cerberusweb.rest.controller">
			<id>cerberusweb.datacenter.domains.rest</id>
			<name>Domains</name>
			<class>
				<file>api/rest/domains.php</file>
				<name>ChRest_Domains</name>
			</class>
			<params>
				<param key="uri" value="domains"/>
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

