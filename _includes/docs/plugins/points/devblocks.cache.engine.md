* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;devblocks.cache.engine&quot;>
			<id>devblocks.cache.engine.disk</id>
			<name>Filesystem</name>
			<class>
				<file>api/services/cache.php</file>
				<name>DevblocksCacheEngine_Disk</name>
			</class>
			<params>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_DevblocksCacheEngine {
	public function clean() {
	}

	public function isVolatile() {
	}

	public function load($key) {
	}

	public function remove($key) {
	}

	public function renderConfig() {
	}

	public function renderStatus() {
	}

	public function save($data, $key, $tags, $lifetime) {
	}

	public function setConfig(array $config) {
	}

	public function testConfig(array $config) {
	}
}
{% endraw %}
{% endhighlight %}

