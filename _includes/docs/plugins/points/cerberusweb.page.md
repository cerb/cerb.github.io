* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;cerberusweb.page&quot;>
			<id>core.page.welcome</id>
			<name>Welcome Page</name>
			<class>
				<file>api/uri/welcome.php</file>
				<name>ChWelcomePage</name>
			</class>
			<params>
				<param key=&quot;uri&quot; value=&quot;welcome&quot;/>
				<param key=&quot;menutitle&quot; value=&quot;&quot;/>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends CerberusPageExtension {
	public function isVisible() {
	}

	public function render() {
	}
}
{% endraw %}
{% endhighlight %}

