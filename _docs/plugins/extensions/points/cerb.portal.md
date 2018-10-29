---
title: "Extension Point: Community Portal Type"
permalink: /docs/plugins/extensions/points/cerb.portal/
toc:
  title: "Community Portal Type"
  expand: Plugins
jumbotron:
  title: "Community Portal Type"
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
| **Name:** | Community Portal Type
| **Identifier (ID):** | cerb.portal

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.portal&quot;&gt;
			&lt;id&gt;cerb.bots.portal&lt;/id&gt;
			&lt;name&gt;Conversational Bot&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;Portal_ConvoBotWidget&lt;/name&gt;
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
class ExampleExtension extends Extension_CommunityPortal {
	/**
	 * @param Model_CommunityTool $instance
	 */
	public function configure(Model_CommunityTool $instance)

	/**
	 * @param DevblocksHttpRequest
	 * @return DevblocksHttpResponse
	 */
	public function handleRequest(DevblocksHttpRequest $request) {
	}

	public function saveConfiguration(Model_CommunityTool $instance) {
	}

	public function writeResponse(DevblocksHttpResponse $response) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| [**Community Portal**](/docs/plugins/extensions/cerb.community.portal/) | `cerb.community.portal`
| [**Conversational Bot**](/docs/plugins/extensions/cerb.bots.portal/) | `cerb.bots.portal`
| [**Support Center**](/docs/plugins/extensions/sc.tool/) | `sc.tool`
| [**Webhook Portal**](/docs/plugins/extensions/webhooks.portal/) | `webhooks.portal`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>