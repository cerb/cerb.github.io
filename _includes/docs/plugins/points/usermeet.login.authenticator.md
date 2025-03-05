* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point=&quot;usermeet.login.authenticator&quot;>
			<id>sc.login.auth.ldap</id>
			<name>LDAP</name>
			<class>
				<file>api/App.php</file>
				<name>ScLdapLoginAuthenticator</name>
			</class>
			<params>
				<param key=&quot;switcher_icon&quot; value=&quot;images/fugue/address-book.png&quot;/>
				<param key=&quot;switcher_label&quot; value=&quot;Log in with LDAP&quot;/>
			</params>
		</extension>
{% endhighlight %}

# Code

{% highlight php %}
{% raw %}
class ExampleExtension extends Extension_ScLoginAuthenticator {
	/**
	 * draws html form for adding necessary settings (host, port, etc) to be stored in the db
	 */
	public function renderConfigForm(Model_CommunityTool $instance) {
	}

	/**
	 * Receives posted config form, saves to manifest
	 */
	public function saveConfiguration(Model_CommunityTool $instance) {
	}

	/**
	 * release any resources tied up by the authenticate process, if necessary
	 */
	public function signoff() {
	}

	public function writeResponse(DevblocksHttpResponse $response) {
	}
}
{% endraw %}
{% endhighlight %}

