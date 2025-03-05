* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;cerberusweb.ui.page.menu.item&quot;>
			<id>wgmclickatell.setup.menu.plugins.clickatell</id>
			<name>Clickatell</name>
			<class>
				<file>api/App.php</file>
				<name>WgmClickatell_SetupPluginsMenuItem</name>
			</class>
			<params>
				<param key=&quot;page_id&quot; value=&quot;core.page.configuration&quot;/>
				<param key=&quot;menu_id&quot; value=&quot;core.setup.menu.services&quot;/>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_ContextProfileScript {
	public function renderScript($context, $context_id) {
	}
}
{% endraw %}
{% endhighlight %}

