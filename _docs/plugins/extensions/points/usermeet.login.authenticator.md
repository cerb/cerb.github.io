---
title: "Extension Point: Support Center Login Authenticator"
permalink: /docs/plugins/extensions/points/usermeet.login.authenticator/
toc:
  title: "Support Center Login Authenticator"
  expand: Plugins
jumbotron:
  title: "Support Center Login Authenticator"
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
| **Name:** | Support Center Login Authenticator
| **Identifier (ID):** | usermeet.login.authenticator

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

# Extensions

| Cerb (Default) | `sc.login.auth.default`
| LDAP | `sc.login.auth.ldap`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>