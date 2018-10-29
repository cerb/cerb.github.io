---
title: "Extension Point: Mail Transport Type"
permalink: /docs/plugins/extensions/points/cerberusweb.mail.transport/
toc:
  title: "Mail Transport Type"
  expand: Plugins
jumbotron:
  title: "Mail Transport Type"
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
| **Name:** | Mail Transport Type
| **Identifier (ID):** | cerberusweb.mail.transport

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.mail.transport&quot;&gt;
			&lt;id&gt;core.mail.transport.null&lt;/id&gt;
			&lt;name&gt;Null&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/plugin.classes.php&lt;/file&gt;
				&lt;name&gt;CerbMailTransport_Null&lt;/name&gt;
			&lt;/class&gt;
			&lt;params&gt;
			&lt;/params&gt;
		&lt;/extension&gt;
</code>
</pre>

# Code

<pre>
<code class="language-php">
{% raw %}
class ExampleExtension extends Extension_MailTransport {
	public function getLastError() {
	}

	public function renderConfig(Model_MailTransport $model) {
	}

	public function send(Swift_Message $message, Model_MailTransport $model) {
	}

	public function testConfig(array $params, $error) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| [**Null**](/docs/plugins/extensions/core.mail.transport.null/) | `core.mail.transport.null`
| [**SMTP**](/docs/plugins/extensions/core.mail.transport.smtp/) | `core.mail.transport.smtp`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>