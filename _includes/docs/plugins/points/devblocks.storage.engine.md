* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.storage.engine&quot;&gt;
			&lt;id&gt;devblocks.storage.engine.disk&lt;/id&gt;
			&lt;name&gt;Disk&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/services/storage.php&lt;/file&gt;
				&lt;name&gt;DevblocksStorageEngineDisk&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
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
</code>
</pre>

