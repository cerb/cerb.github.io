---
title: "Extension Point: Search Schema"
permalink: /docs/plugins/extensions/points/devblocks.search.schema/
toc:
  title: "Search Schema"
  expand: Plugins
jumbotron:
  title: "Search Schema"
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
| **Name:** | Search Schema
| **Identifier (ID):** | devblocks.search.schema

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.search.schema&quot;&gt;
			&lt;id&gt;cerb.search.schema.address&lt;/id&gt;
			&lt;name&gt;Email Addresses&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/dao/address.php&lt;/file&gt;
				&lt;name&gt;Search_Address&lt;/name&gt;
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
class ExampleExtension extends Extension_DevblocksSearchSchema {
	public function delete($ids) {
	}

	public function getAttributes() {
	}

	public function getNamespace() {
	}

	public function index($stop_time) {
	}

	public function query($query, $attributes, $limit) {
	}

	public function reindex() {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Comment Content | `cerberusweb.search.schema.comment_content`
| Contacts | `cerb.search.schema.contact`
| Email Addresses | `cerb.search.schema.address`
| Jira Issues | `jira.search.schema.jira_issue`
| Knowledgebase Articles | `cerberusweb.search.schema.kb_article`
| Message Content | `cerberusweb.search.schema.message_content`
| Organizations | `cerb.search.schema.org`
| Plugin Library | `cerb.search.schema.plugin_library`
| Snippets | `cerb.search.schema.snippet`
| Workers | `cerb.search.schema.worker`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>