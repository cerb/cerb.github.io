* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.cron&quot;&gt;
			&lt;id&gt;cron.mailbox&lt;/id&gt;
			&lt;name&gt;Mailbox Checker and Email Downloader&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/cron.classes.php&lt;/file&gt;
				&lt;name&gt;MailboxCron&lt;/name&gt;
			&lt;/class&gt;
			&lt;params/&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends CerberusCronPageExtension {
	public function configure($instance) {
	}

	public function saveConfigurationAction() {
	}
}
{% endraw %}
</code>
</pre>

