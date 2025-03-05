* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;devblocks.search.schema&quot;>
			<id>cerb.search.schema.address</id>
			<name>Email Addresses</name>
			<class>
				<file>api/dao/address.php</file>
				<name>Search_Address</name>
			</class>
			<params>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_DevblocksSearchSchema {
	public function delete($ids) {
	}

	public function getAttributes() {
	}

	public function getNamespace() {
	}

	public function index($stop_time) {
	}

	public function query($query, $attributes, $limit) {
	}

	public function reindex() {
	}
}
{% endraw %}
{% endhighlight %}

