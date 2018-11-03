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

