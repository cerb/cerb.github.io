* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;cerberusweb.mail.transport&quot;>
			<id>core.mail.transport.null</id>
			<name>Null</name>
			<class>
				<file>api/plugin.classes.php</file>
				<name>CerbMailTransport_Null</name>
			</class>
			<params>
			</params>
		</extension>
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

