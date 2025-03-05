* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;devblocks.context&quot;>
			<id>cerberusweb.contexts.asset</id>
			<name>Asset</name>
			<class>
				<file>api/dao/asset.php</file>
				<name>Context_Asset</name>
			</class>
			<params>
				<param key=&quot;names&quot;>
					<value>
						<data key=&quot;asset&quot; value=&quot;singular&quot;/>
						<data key=&quot;assets&quot; value=&quot;plural&quot;/>
					</value>
				</param>
				<param key=&quot;alias&quot; value=&quot;asset&quot;/>
				<param key=&quot;dao_class&quot; value=&quot;DAO_Asset&quot;/>
				<param key=&quot;view_class&quot; value=&quot;View_Asset&quot;/>
				<param key=&quot;options&quot;>
					<value>
						<data key=&quot;cards&quot;/>
						<data key=&quot;custom_fields&quot;/>
						<data key=&quot;links&quot;/>
						<data key=&quot;records&quot;/>
						<data key=&quot;search&quot;/>
						<data key=&quot;snippets&quot;/>
						<data key=&quot;va_variable&quot;/>
						<data key=&quot;watchers&quot;/>
						<data key=&quot;workspace&quot;/>
					</value>
				</param>
				<param key=&quot;acl&quot;>
					<value>
						<data key=&quot;comment&quot;/>
						<data key=&quot;create&quot;/>
						<data key=&quot;delete&quot;/>
						<data key=&quot;export&quot;/>
						<data key=&quot;import&quot;/>
						<data key=&quot;merge&quot;/>
						<data key=&quot;update&quot;/>
					</value>
				</param>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
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
{% endhighlight %}

