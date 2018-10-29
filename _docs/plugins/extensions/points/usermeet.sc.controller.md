---
title: "Extension Point: Support Center Controller"
permalink: /docs/plugins/extensions/points/usermeet.sc.controller/
toc:
  title: "Support Center Controller"
  expand: Plugins
jumbotron:
  title: "Support Center Controller"
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
| **Name:** | Support Center Controller
| **Identifier (ID):** | usermeet.sc.controller

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;usermeet.sc.controller&quot;&gt;
			&lt;id&gt;cerberusweb.kb.sc.controller&lt;/id&gt;
			&lt;name&gt;Knowledgebase&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/sc/kb.php&lt;/file&gt;
				&lt;name&gt;UmScKbController&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;uri&quot; value=&quot;kb&quot;/&gt;
				&lt;param key=&quot;menu_title&quot; value=&quot;common.knowledgebase&quot;/&gt;
				&lt;param key=&quot;options&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;configurable&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_UmScController {
	public function configure(Model_CommunityTool $instance)

	/**
	 * @param DevblocksHttpRequest
	 * @return DevblocksHttpResponse
	 */
	public function handleRequest(DevblocksHttpRequest $request) {
	}

	public function isVisible() {
	}

	public function renderSidebar(DevblocksHttpResponse $response) {
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

| Ajax | `sc.controller.ajax`
| Announcements | `sc.controller.announcements`
| Avatar | `sc.controller.avatar`
| Contact Us | `sc.controller.contact`
| Home | `sc.controller.home`
| Knowledgebase | `cerberusweb.kb.sc.controller`
| Login | `sc.controller.login`
| My Account | `sc.controller.account`
| Ticket History | `sc.controller.history`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>