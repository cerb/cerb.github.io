---
title: "Extension Point: Login Authenticator"
permalink: /docs/plugins/extensions/points/cerberusweb.login/
toc:
  title: "Login Authenticator"
  expand: Plugins
jumbotron:
  title: "Login Authenticator"
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
  -
    label: Extension Points &raquo;
    url: /docs/plugins/extensions/
---

|---
|-|-
| **Name:** | Login Authenticator
| **Identifier (ID):** | cerberusweb.login

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
	public function authenticate() {
	}

	public static function get($extension_id, $as_instance) {
	}

	public static function getAll($as_instances) {
	}

	public static function getByUri($uri, $as_instance) {
	}

	/**
	 * draws HTML form of controls needed for login information
	 */
	public function render() {
	}

	public function renderWorkerPrefs($worker) {
	}

	public function resetCredentials($worker) {
	}

	public function saveWorkerPrefs($worker) {
	}

	/**
	 * release any resources tied up by the authenticate process, if necessary
	 */
	public function signoff() {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| LDAP | `login.ldap`
| OpenID | `login.openid`
| Password + Two-Factor Auth | `login.password.google_auth`
| Password | `login.password`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>