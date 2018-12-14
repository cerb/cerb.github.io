* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.login&quot;&gt;
			&lt;id&gt;login.password&lt;/id&gt;
			&lt;name&gt;Password&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/login.classes.php&lt;/file&gt;
				&lt;name&gt;DefaultLoginModule&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;uri&quot; value=&quot;password&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_LoginAuthenticator {
	/**
	 * pull auth info out of $_POST, check it, return user_id or false
	 *
	 * @return boolean whether login succeeded
	 */
	function authenticate() {
	}

	/**
	 * draws HTML form of controls needed for login information
	 */
	function render() {
	}
	
	function renderWorkerConfig(Model_Worker $worker=null) {
	}
	
	function saveWorkerConfig($worker_id, array $params, &$error=null) {
		return true;
	}

	function renderWorkerPrefs($worker) {
	}

	function saveWorkerPrefs($worker) {
	}

	function resetCredentials($worker) {
	}

	/**
	 * release any resources tied up by the authenticate process, if necessary
	 */
	function signoff() {
	}
}
{% endraw %}
</code>
</pre>

