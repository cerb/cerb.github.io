* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;usermeet.login.authenticator&quot;&gt;
			&lt;id&gt;sc.login.auth.ldap&lt;/id&gt;
			&lt;name&gt;LDAP&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;ScLdapLoginAuthenticator&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;switcher_icon&quot; value=&quot;images/fugue/address-book.png&quot;/&gt;
				&lt;param key=&quot;switcher_label&quot; value=&quot;Log in with LDAP&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
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
</code>
</pre>

