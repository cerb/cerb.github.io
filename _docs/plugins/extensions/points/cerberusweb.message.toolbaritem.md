---
title: "Extension Point: Message Toolbar Item"
permalink: /docs/plugins/extensions/points/cerberusweb.message.toolbaritem/
toc:
  title: "Message Toolbar Item"
  expand: Plugins
jumbotron:
  title: "Message Toolbar Item"
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
| **Name:** | Message Toolbar Item
| **Identifier (ID):** | cerberusweb.message.toolbaritem

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.message.toolbaritem&quot;&gt;
			&lt;id&gt;feedback.message.toolbaritem.feedback&lt;/id&gt;
			&lt;name&gt;Ticket Message Toolbar Feedback Item&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;ChFeedbackMessageToolbarFeedback&lt;/name&gt;
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
class ExampleExtension extends Extension_MessageToolbarItem {
	public function render(Model_Message $message) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| Ticket Message Toolbar Feedback Item | `feedback.message.toolbaritem.feedback`
| Ticket Message Toolbar Print Item | `cerb.legacy.print.toolbaritem.print`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>