---
title: "Extension Point: Cache Engine"
permalink: /docs/plugins/extensions/points/devblocks.cache.engine/
toc:
  title: "Cache Engine"
  expand: Plugins
jumbotron:
  title: "Cache Engine"
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
| **Name:** | Cache Engine
| **Identifier (ID):** | devblocks.cache.engine

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.cache.engine&quot;&gt;
			&lt;id&gt;devblocks.cache.engine.disk&lt;/id&gt;
			&lt;name&gt;Filesystem&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/services/cache.php&lt;/file&gt;
				&lt;name&gt;DevblocksCacheEngine_Disk&lt;/name&gt;
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
class ExampleExtension extends Extension_DevblocksCacheEngine {
	public function clean() {
	}

	public function isVolatile() {
	}

	public function load($key) {
	}

	public function remove($key) {
	}

	public function renderConfig() {
	}

	public function renderStatus() {
	}

	public function save($data, $key, $tags, $lifetime) {
	}

	public function setConfig(array $config) {
	}

	public function testConfig(array $config) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| [**Filesystem**](/docs/plugins/extensions/devblocks.cache.engine.disk/) | `devblocks.cache.engine.disk`
| [**Memcached**](/docs/plugins/extensions/devblocks.cache.engine.memcache/) | `devblocks.cache.engine.memcache`
| [**Redis**](/docs/plugins/extensions/devblocks.cache.engine.redis/) | `devblocks.cache.engine.redis`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>