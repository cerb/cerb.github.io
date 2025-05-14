* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="devblocks.context">
			<id>cerberusweb.contexts.asset</id>
			<name>Asset</name>
			<class>
				<file>api/dao/asset.php</file>
				<name>Context_Asset</name>
			</class>
			<params>
				<param key="names">
					<value>
						<data key="asset" value="singular"/>
						<data key="assets" value="plural"/>
					</value>
				</param>
				<param key="alias" value="asset"/>
				<param key="dao_class" value="DAO_Asset"/>
				<param key="view_class" value="View_Asset"/>
				<param key="options">
					<value>
						<data key="cards"/>
						<data key="custom_fields"/>
						<data key="links"/>
						<data key="records"/>
						<data key="search"/>
						<data key="snippets"/>
						<data key="va_variable"/>
						<data key="watchers"/>
						<data key="workspace"/>
					</value>
				</param>
				<param key="acl">
					<value>
						<data key="comment"/>
						<data key="create"/>
						<data key="delete"/>
						<data key="export"/>
						<data key="import"/>
						<data key="merge"/>
						<data key="update"/>
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

