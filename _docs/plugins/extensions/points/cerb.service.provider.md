---
title: "Extension Point: Connected Account Service Provider"
permalink: /docs/plugins/extensions/points/cerb.service.provider/
toc:
  title: "Connected Account Service Provider"
  expand: Plugins
jumbotron:
  title: "Connected Account Service Provider"
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
| **Name:** | Connected Account Service Provider
| **Identifier (ID):** | cerb.service.provider

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerb.service.provider&quot;&gt;
			&lt;id&gt;wgm.aws.service.provider&lt;/id&gt;
			&lt;name&gt;Amazon Web Services&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;ServiceProvider_Aws&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;contexts&quot;&gt;
					&lt;value&gt;
						&lt;data key=&quot;cerberusweb.contexts.app&quot;/&gt;
						&lt;data key=&quot;cerberusweb.contexts.group&quot;/&gt;
						&lt;data key=&quot;cerberusweb.contexts.role&quot;/&gt;
						&lt;data key=&quot;cerberusweb.contexts.worker&quot;/&gt;
					&lt;/value&gt;
				&lt;/param&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_ServiceProvider {
	public function renderConfigForm(Model_ConnectedAccount $account) {
	}

	public function saveConfigForm(Model_ConnectedAccount $account, array $params) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| [**Amazon Web Services**](/docs/plugins/extensions/wgm.aws.service.provider/) | `wgm.aws.service.provider`
| [**Api.ai**](/docs/plugins/extensions/wgm.apiai.service.provider/) | `wgm.apiai.service.provider`
| [**Cerb**](/docs/plugins/extensions/core.service.provider.cerb/) | `core.service.provider.cerb`
| [**Dropbox**](/docs/plugins/extensions/wgm.dropbox.service.provider/) | `wgm.dropbox.service.provider`
| [**Facebook Pages**](/docs/plugins/extensions/wgm.facebook.pages.service.provider/) | `wgm.facebook.pages.service.provider`
| [**Facebook**](/docs/plugins/extensions/wgm.facebook.service.provider/) | `wgm.facebook.service.provider`
| [**Freshbooks**](/docs/plugins/extensions/wgm.freshbooks.service.provider/) | `wgm.freshbooks.service.provider`
| [**GitHub**](/docs/plugins/extensions/wgm.github.service.provider/) | `wgm.github.service.provider`
| [**GitLab**](/docs/plugins/extensions/wgm.gitlab.service.provider/) | `wgm.gitlab.service.provider`
| [**Google**](/docs/plugins/extensions/wgm.google.service.provider/) | `wgm.google.service.provider`
| [**JIRA**](/docs/plugins/extensions/wgm.jira.service.provider/) | `wgm.jira.service.provider`
| [**LDAP**](/docs/plugins/extensions/wgm.ldap.service.provider/) | `wgm.ldap.service.provider`
| [**LinkedIn**](/docs/plugins/extensions/wgm.linkedin.service.provider/) | `wgm.linkedin.service.provider`
| [**Nest**](/docs/plugins/extensions/wgm.nest.service.provider/) | `wgm.nest.service.provider`
| [**OAuth2 (Generic)**](/docs/plugins/extensions/core.service.provider.oauth2.generic/) | `core.service.provider.oauth2.generic`
| [**Salesforce**](/docs/plugins/extensions/wgm.salesforce.service.provider/) | `wgm.salesforce.service.provider`
| [**Slack**](/docs/plugins/extensions/wgm.slack.service.provider/) | `wgm.slack.service.provider`
| [**Spotify**](/docs/plugins/extensions/wgm.spotify.service.provider/) | `wgm.spotify.service.provider`
| [**Stripe**](/docs/plugins/extensions/wgm.stripe.service.provider/) | `wgm.stripe.service.provider`
| [**Twilio**](/docs/plugins/extensions/wgm.twilio.service.provider/) | `wgm.twilio.service.provider`
| [**Twitter**](/docs/plugins/extensions/wgm.twitter.service.provider/) | `wgm.twitter.service.provider`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>