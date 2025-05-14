* TOC
{:toc}

# Manifest

{% highlight xml %}
		<extension point="usermeet.login.authenticator">
			<id>sc.login.auth.ldap</id>
			<name>LDAP</name>
			<class>
				<file>api/App.php</file>
				<name>ScLdapLoginAuthenticator</name>
			</class>
			<params>
				<param key="switcher_icon" value="images/fugue/address-book.png"/>
				<param key="switcher_label" value="Log in with LDAP"/>
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

