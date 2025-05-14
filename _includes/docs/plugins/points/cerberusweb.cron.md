* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="cerberusweb.cron">
			<id>cron.mailbox</id>
			<name>Mailbox Checker and Email Downloader</name>
			<class>
				<file>api/cron.classes.php</file>
				<name>MailboxCron</name>
			</class>
			<params/>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends CerberusCronPageExtension {
	public function configure($instance) {
	}

	public function saveConfigurationAction() {
	}
}
{% endraw %}
{% endhighlight %}

