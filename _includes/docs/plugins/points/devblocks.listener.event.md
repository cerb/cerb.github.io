* TOC
{:toc}

# Manifest

{% highlight xml %}
		&lt;extension point=&quot;devblocks.listener.event&quot;&gt;
			&lt;id&gt;calls.listener&lt;/id&gt;
			&lt;name&gt;Event Listener&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;CallsEventListener&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;events&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;cron.maint&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
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

