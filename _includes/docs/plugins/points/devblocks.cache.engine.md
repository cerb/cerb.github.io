* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.cache.engine&quot;&gt;
			&lt;id&gt;devblocks.cache.engine.disk&lt;/id&gt;
			&lt;name&gt;Filesystem&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/services/cache.php&lt;/file&gt;
				&lt;name&gt;DevblocksCacheEngine_Disk&lt;/name&gt;
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
</code>
</pre>

