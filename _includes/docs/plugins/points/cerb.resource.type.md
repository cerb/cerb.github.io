# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.resource.type&quot;&gt;
			&lt;id&gt;cerb.resource.dataset.csv&lt;/id&gt;
			&lt;name&gt;Dataset (.csv)&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/resources/types/cerb.resource.dataset.csv.php&lt;/file&gt;
				&lt;name&gt;ResourceType_DatasetCsv&lt;/name&gt;
			&lt;/class&gt;
			&lt;params/&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
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
</code>
</pre>

