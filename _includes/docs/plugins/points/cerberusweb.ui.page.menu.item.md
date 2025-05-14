* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="cerberusweb.ui.page.menu.item">
			<id>wgmclickatell.setup.menu.plugins.clickatell</id>
			<name>Clickatell</name>
			<class>
				<file>api/App.php</file>
				<name>WgmClickatell_SetupPluginsMenuItem</name>
			</class>
			<params>
				<param key="page_id" value="core.page.configuration"/>
				<param key="menu_id" value="core.setup.menu.services"/>
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

