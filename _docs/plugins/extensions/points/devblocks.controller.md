---
title: "Extension Point: Controller"
permalink: /docs/plugins/extensions/points/devblocks.controller/
toc:
  title: "Controller"
  expand: Plugins
jumbotron:
  title: "Controller"
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
| **Name:** | Controller
| **Identifier (ID):** | devblocks.controller

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;devblocks.controller&quot;&gt;
			&lt;id&gt;core.controller.ui&lt;/id&gt;
			&lt;name&gt;UI Controller&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/ui.php&lt;/file&gt;
				&lt;name&gt;Controller_UI&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;uri&quot; value=&quot;ui&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends DevblocksControllerExtension {
	public function handleRequest(DevblocksHttpRequest $request) {
	}

	public function writeResponse(DevblocksHttpResponse $response) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Avatars Controller | `core.controller.avatars`
| Cerb Controller | `core.controller.page`
| Debug Controller | `core.controller.debug`
| Download ZIP Controller | `cerb.legacy.profile.attachments.zip.controller`
| Explorer Controller | `core.controller.explorer`
| Feedback Controller | `feedback.controller`
| Files Controller | `core.controller.files`
| Freshbooks Controller | `wgm.freshbooks.controller`
| Internal Controller | `core.controller.internal`
| KB Ajax Controller | `cerberusweb.kb.controller.ajax`
| OAuth Controller | `core.controller.oauth`
| Portal Controller | `core.controller.portal`
| Print Controller | `cerb.legacy.print.controller`
| REST Controller | `rest.controller`
| Resource Controller | `core.controller.resource`
| Scheduled Tasks (Cron) Controller | `core.controller.cron`
| UI Controller | `core.controller.ui`
| Webhooks Controller | `webhooks.controller`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>