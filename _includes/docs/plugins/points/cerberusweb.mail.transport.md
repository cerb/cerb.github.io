* TOC
{:toc}

# Manifest

{% highlight xml %}
		&lt;extension point=&quot;cerberusweb.mail.transport&quot;&gt;
			&lt;id&gt;core.mail.transport.null&lt;/id&gt;
			&lt;name&gt;Null&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/plugin.classes.php&lt;/file&gt;
				&lt;name&gt;CerbMailTransport_Null&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_MailTransport {
	public function getLastError() {
	}

	public function renderConfig(Model_MailTransport $model) {
	}

	public function send(Swift_Message $message, Model_MailTransport $model) {
	}

	public function testConfig(array $params, $error) {
	}
}
{% endraw %}
{% endhighlight %}

