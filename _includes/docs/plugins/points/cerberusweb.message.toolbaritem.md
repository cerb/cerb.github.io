* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.message.toolbaritem&quot;&gt;
			&lt;id&gt;feedback.message.toolbaritem.feedback&lt;/id&gt;
			&lt;name&gt;Ticket Message Toolbar Feedback Item&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;ChFeedbackMessageToolbarFeedback&lt;/name&gt;
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
class ExampleExtension extends Extension_MessageToolbarItem {
	public function render(Model_Message $message) {
	}
}
{% endraw %}
</code>
</pre>

