* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.context&quot;&gt;
			&lt;id&gt;cerberusweb.contexts.asset&lt;/id&gt;
			&lt;name&gt;Asset&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/dao/asset.php&lt;/file&gt;
				&lt;name&gt;Context_Asset&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;names&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;asset&quot; value=&quot;singular&quot;/&gt;
						&lt;data key=&quot;assets&quot; value=&quot;plural&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
				&lt;param key=&quot;alias&quot; value=&quot;asset&quot;/&gt;
				&lt;param key=&quot;dao_class&quot; value=&quot;DAO_Asset&quot;/&gt;
				&lt;param key=&quot;view_class&quot; value=&quot;View_Asset&quot;/&gt;
				&lt;param key=&quot;options&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;cards&quot;/&gt;
						&lt;data key=&quot;custom_fields&quot;/&gt;
						&lt;data key=&quot;links&quot;/&gt;
						&lt;data key=&quot;records&quot;/&gt;
						&lt;data key=&quot;search&quot;/&gt;
						&lt;data key=&quot;snippets&quot;/&gt;
						&lt;data key=&quot;va_variable&quot;/&gt;
						&lt;data key=&quot;watchers&quot;/&gt;
						&lt;data key=&quot;workspace&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
				&lt;param key=&quot;acl&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;comment&quot;/&gt;
						&lt;data key=&quot;create&quot;/&gt;
						&lt;data key=&quot;delete&quot;/&gt;
						&lt;data key=&quot;export&quot;/&gt;
						&lt;data key=&quot;import&quot;/&gt;
						&lt;data key=&quot;merge&quot;/&gt;
						&lt;data key=&quot;update&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_DevblocksContext {
	/**
	 * 
	 * @param string $view_id
	 * @return C4_AbstractView
	 */
	public function getChooserView($view_id) {
	}

	public function getContext($object, $token_labels, $token_values, $prefix) {
	}

	public function getDaoClass() {
	}
	
	public function getDaoFieldsFromKeyAndValue($key, $value, $out_fields, $error) {
	}

	public function getDaoFieldsFromKeysAndValues($data, $out_fields, $out_custom_fields, $error) {
	}

	public function getDefaultProperties() {
	}

	public function getKeyMeta() {
	}

	public function getKeyToDaoFieldMap() {
	}

	public function getMeta($context_id) {
	}

	public function getRandom() {
	}

	public function getSearchClass() {
	}

	public function getView($context, $context_id, $options, $view_id) {
	}

	public function getViewClass() {
	}

	public function lazyLoadContextValues($token, $dictionary) {
	}

	public function lazyLoadGetKeys() {
	}
}
{% endraw %}
</code>
</pre>

