* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.reply.toolbaritem&quot;&gt;
			&lt;id&gt;cerberusweb.kb.reply.toolbaritem.kb&lt;/id&gt;
			&lt;name&gt;KB Reply Toolbar&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;ChKbReplyToolbarButton&lt;/name&gt;
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
class ExampleExtension extends Extension_ReplyToolbarItem {
	public function render(Model_Message $message) {
	}
}
{% endraw %}
</code>
</pre>

