* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.ui.context.profile.script&quot;&gt;
			&lt;id&gt;cerb.legacy.print.profile.ticket.script&lt;/id&gt;
			&lt;name&gt;Ticket Profile Print Script&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;ProfileScript_TicketPrint&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;contexts&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;cerberusweb.contexts.ticket&quot;/&gt;
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
class ExampleExtension extends Extension_ContextProfileScript {
	public function renderScript($context, $context_id) {
	}
}
{% endraw %}
</code>
</pre>

