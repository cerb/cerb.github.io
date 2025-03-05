# Manifest

{% highlight xml %}
		<extension point=&quot;cerb.resource.type&quot;>
			<id>cerb.resource.dataset.csv</id>
			<name>Dataset (.csv)</name>
			<class>
				<file>api/resources/types/cerb.resource.dataset.csv.php</file>
				<name>ResourceType_DatasetCsv</name>
			</class>
			<params/>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
class ExampleExtension extends Extension_ResourceType {
	/**
	 * @param Model_Resource $resource
	 * @return Model_Resource_ContentData
	 */
	public function getContentData($resource)

	/**
	 * @param Model_Resource $resource
	 * @param Model_Resource_ContentData $content_data
	 * @return bool
	 */
	public function getContentResource($resource, $content_data)

	public function validateContentData($fp, $extension_params, $error)

}
{% endhighlight %}

