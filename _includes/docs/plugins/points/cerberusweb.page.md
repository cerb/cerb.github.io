* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="cerberusweb.page">
			<id>core.page.welcome</id>
			<name>Welcome Page</name>
			<class>
				<file>api/uri/welcome.php</file>
				<name>ChWelcomePage</name>
			</class>
			<params>
				<param key="uri" value="welcome"/>
				<param key="menutitle" value=""/>
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

