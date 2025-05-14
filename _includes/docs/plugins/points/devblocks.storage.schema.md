* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="devblocks.storage.schema">
			<id>cerberusweb.storage.schema.attachments</id>
			<name>Attachments</name>
			<class>
				<file>api/dao/attachment.php</file>
				<name>Storage_Attachments</name>
			</class>
			<params>
				<param key="active_storage_profile" value="devblocks.storage.engine.disk"/>
				<param key="archive_storage_profile" value="devblocks.storage.engine.disk"/>
				<param key="archive_after_days" value="7"/>
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

