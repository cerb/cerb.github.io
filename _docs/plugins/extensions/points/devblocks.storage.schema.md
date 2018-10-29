---
title: "Extension Point: Storage Schema"
permalink: /docs/plugins/extensions/points/devblocks.storage.schema/
toc:
  title: "Storage Schema"
  expand: Plugins
jumbotron:
  title: "Storage Schema"
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
  -
    label: Extension Points &raquo;
    url: /docs/plugins/extensions/
---

|---
|-|-
| **Name:** | Storage Schema
| **Identifier (ID):** | devblocks.storage.schema

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.storage.schema&quot;&gt;
			&lt;id&gt;cerberusweb.storage.schema.attachments&lt;/id&gt;
			&lt;name&gt;Attachments&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/dao/attachment.php&lt;/file&gt;
				&lt;name&gt;Storage_Attachments&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;active_storage_profile&quot; value=&quot;devblocks.storage.engine.disk&quot;/&gt;
				&lt;param key=&quot;archive_storage_profile&quot; value=&quot;devblocks.storage.engine.disk&quot;/&gt;
				&lt;param key=&quot;archive_after_days&quot; value=&quot;7&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
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
</code>
</pre>

# Extensions

| Attachments | `cerberusweb.storage.schema.attachments`
| Avatars | `cerberusweb.storage.schema.context_avatar`
| Message Content | `cerberusweb.storage.schema.message_content`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>