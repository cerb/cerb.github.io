* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="devblocks.listener.event">
			<id>calls.listener</id>
			<name>Event Listener</name>
			<class>
				<file>api/App.php</file>
				<name>CallsEventListener</name>
			</class>
			<params>
				<param key="events">
					<value>
						<data key="cron.maint"/>
					</value>
				</param>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends DevblocksEventListenerExtension {
	/**
	 * @param Model_DevblocksEvent $event
	 */
	public function handleEvent(Model_DevblocksEvent $event) {
	}
}
{% endraw %}
{% endhighlight %}

