---
title: "Extension Point: Page Type"
permalink: /docs/plugins/extensions/points/cerberusweb.page/
toc:
  title: "Page Type"
  expand: Plugins
jumbotron:
  title: "Page Type"
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
| **Name:** | Page Type
| **Identifier (ID):** | cerberusweb.page

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.page&quot;&gt;
			&lt;id&gt;core.page.welcome&lt;/id&gt;
			&lt;name&gt;Welcome Page&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/uri/welcome.php&lt;/file&gt;
				&lt;name&gt;ChWelcomePage&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
				&lt;param key=&quot;uri&quot; value=&quot;welcome&quot;/&gt;
				&lt;param key=&quot;menutitle&quot; value=&quot;&quot;/&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends CerberusPageExtension {
	public function isVisible() {
	}

	public function render() {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Contacts Page | `core.page.contacts`
| Custom Pages | `core.page.pages`
| Datacenter Page | `cerberusweb.datacenter.page`
| Display Ticket Page | `core.page.display`
| Domains Page | `cerberusweb.datacenter.domains.page`
| Knowledgebase | `core.page.kb`
| Profiles Pages | `core.page.profiles`
| Search Page | `core.page.search`
| Sensors Page | `cerberusweb.datacenter.sensors.page`
| Setup Page | `core.page.configuration`
| Signin Page | `core.page.signin`
| Tickets Page | `core.page.tickets`
| Time Tracking Page | `timetracking.page`
| Welcome Page | `core.page.welcome`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>