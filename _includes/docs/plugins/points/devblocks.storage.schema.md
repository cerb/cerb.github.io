* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;devblocks.storage.schema&quot;>
			<id>cerberusweb.storage.schema.attachments</id>
			<name>Attachments</name>
			<class>
				<file>api/dao/attachment.php</file>
				<name>Storage_Attachments</name>
			</class>
			<params>
				<param key=&quot;active_storage_profile&quot; value=&quot;devblocks.storage.engine.disk&quot;/>
				<param key=&quot;archive_storage_profile&quot; value=&quot;devblocks.storage.engine.disk&quot;/>
				<param key=&quot;archive_after_days&quot; value=&quot;7&quot;/>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_DevblocksStorageSchema {
	public static function archive($stop_time) {
	}

	public static function delete($ids) {
	}

	public static function get($object, $fp) {
	}

	public static function getActiveStorageProfile() {
	}

	public static function put($id, $contents, $profile) {
	}

	public function render() {
	}

	public function renderConfig() {
	}

	public function saveConfig() {
	}

	public static function unarchive($stop_time) {
	}
}
{% endraw %}
{% endhighlight %}

