---
title: "Extension Point: Page Menu Item"
permalink: /docs/plugins/extensions/points/cerberusweb.ui.page.menu.item/
toc:
  title: "Page Menu Item"
  expand: Plugins
jumbotron:
  title: "Page Menu Item"
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
| **Name:** | Page Menu Item
| **Identifier (ID):** | cerberusweb.ui.page.menu.item

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.ui.page.menu.item&quot;&gt;
			&lt;id&gt;wgmclickatell.setup.menu.plugins.clickatell&lt;/id&gt;
			&lt;name&gt;Clickatell&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;WgmClickatell_SetupPluginsMenuItem&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;page_id&quot; value=&quot;core.page.configuration&quot;/&gt;
				&lt;param key=&quot;menu_id&quot; value=&quot;core.setup.menu.services&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_ContextProfileScript {
	public function renderScript($context, $context_id) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Clickatell | `wgmclickatell.setup.menu.plugins.clickatell`
| Dropbox | `wgmdropbox.setup.menu.plugins.dropbox`
| Facebook | `wgmfacebook.setup.menu.plugins.facebook`
| Freshbooks | `wgm.freshbooks.setup.menu.plugins.freshbooks`
| GitHub | `wgmgithub.setup.menu.plugins.github`
| GitLab | `wgmgitlab.setup.menu.plugins.gitlab`
| Google | `wgm.google.setup.menu`
| JIRA | `wgm.jira.setup.menu.plugins`
| LDAP | `ldap.setup.menu.plugins.ldap`
| LinkedIn | `wgm.linkedin.setup.menu`
| Nest | `wgm.nest.setup.menu.item`
| Salesforce | `wgmsalesforce.setup.menu.plugins.salesforce`
| ShiftPlanning | `wgmshiftplanning.setup.menu.plugins.shiftplanning`
| Simulator | `simulator.setup.menu.mail.simulator`
| Slack | `wgm.slack.setup.menu`
| Spotify | `wgm.spotify.setup.menu`
| Translation Editor | `translators.setup.menu.mail.translations`
| Twitter | `wgmtwitter.setup.menu.plugins.twitter`
| Webhooks | `webhooks.setup.menu.plugins`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>