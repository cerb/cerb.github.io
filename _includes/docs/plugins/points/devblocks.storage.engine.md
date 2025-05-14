* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="devblocks.storage.engine">
			<id>devblocks.storage.engine.disk</id>
			<name>Disk</name>
			<class>
				<file>api/services/storage.php</file>
				<name>DevblocksStorageEngineDisk</name>
			</class>
			<params>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_DevblocksStorageEngine {
	public function batchDelete($namespace, $keys) {
	}

	public function delete($namespace, $key) {
	}

	public function exists($namespace, $key) {
	}

	public function get($namespace, $key, $fp) {
	}

	public function put($namespace, $id, $data) {
	}

	public function renderConfig(Model_DevblocksStorageProfile $profile) {
	}

	public function saveConfig(Model_DevblocksStorageProfile $profile) {
	}

	public function testConfig(Model_DevblocksStorageProfile $profile) {
	}
}
{% endraw %}
{% endhighlight %}

