---
title: "Extension Point: Webhook Listener Type"
permalink: /docs/plugins/extensions/points/cerb.webhooks.listener.engine/
toc:
  title: "Webhook Listener Type"
  expand: Plugins
jumbotron:
  title: "Webhook Listener Type"
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
| **Name:** | Webhook Listener Type
| **Identifier (ID):** | cerb.webhooks.listener.engine

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.webhooks.listener.engine&quot;&gt;
			&lt;id&gt;cerb.webhooks.listener.engine.va&lt;/id&gt;
			&lt;name&gt;Bot Behavior&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;WebhookListenerEngine_BotBehavior&lt;/name&gt;
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
class ExampleExtension extends Extension_WebhookListenerEngine {
	public function getConfig() {
	}

	public function handleWebhookRequest(Model_WebhookListener $webhook) {
	}

	public function renderConfig(Model_WebhookListener $model) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| [**Bot Behavior**](/docs/plugins/extensions/cerb.webhooks.listener.engine.va/) | `cerb.webhooks.listener.engine.va`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>