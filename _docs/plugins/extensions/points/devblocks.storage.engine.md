---
title: "Extension Point: Storage Engine"
permalink: /docs/plugins/extensions/points/devblocks.storage.engine/
toc:
  title: "Storage Engine"
  expand: Plugins
jumbotron:
  title: "Storage Engine"
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
| **Name:** | Storage Engine
| **Identifier (ID):** | devblocks.storage.engine

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.storage.engine&quot;&gt;
			&lt;id&gt;devblocks.storage.engine.disk&lt;/id&gt;
			&lt;name&gt;Disk&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/services/storage.php&lt;/file&gt;
				&lt;name&gt;DevblocksStorageEngineDisk&lt;/name&gt;
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
class ExampleExtension extends Extension_DevblocksStorageEngine {
	public function batchDelete($namespace, $keys) {
	}

	public function delete($namespace, $key) {
	}

	public function exists($namespace, $key) {
	}

	public function get($namespace, $key, $fp) {
	}

	public function put($namespace, $id, $data) {
	}

	public function renderConfig(Model_DevblocksStorageProfile $profile) {
	}

	public function saveConfig(Model_DevblocksStorageProfile $profile) {
	}

	public function testConfig(Model_DevblocksStorageProfile $profile) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Amazon S3 | `devblocks.storage.engine.s3`
| Database | `devblocks.storage.engine.database`
| Disk | `devblocks.storage.engine.disk`
| S3 Gatekeeper | `devblocks.storage.engine.gatekeeper`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>