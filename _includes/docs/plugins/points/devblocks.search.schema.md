* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.search.schema&quot;&gt;
			&lt;id&gt;cerb.search.schema.address&lt;/id&gt;
			&lt;name&gt;Email Addresses&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/dao/address.php&lt;/file&gt;
				&lt;name&gt;Search_Address&lt;/name&gt;
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
</code>
</pre>

