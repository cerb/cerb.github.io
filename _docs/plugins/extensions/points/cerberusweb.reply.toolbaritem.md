---
title: "Extension Point: Reply Toolbar Item"
permalink: /docs/plugins/extensions/points/cerberusweb.reply.toolbaritem/
toc:
  title: "Reply Toolbar Item"
  expand: Plugins
jumbotron:
  title: "Reply Toolbar Item"
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
| **Name:** | Reply Toolbar Item
| **Identifier (ID):** | cerberusweb.reply.toolbaritem

* TOC
{:toc}

# Manifest

<pre>
<code class="language-xml">
		&lt;extension point=&quot;cerberusweb.reply.toolbaritem&quot;&gt;
			&lt;id&gt;cerberusweb.kb.reply.toolbaritem.kb&lt;/id&gt;
			&lt;name&gt;KB Reply Toolbar&lt;/name&gt;
			&lt;class&gt;
				&lt;file&gt;api/App.php&lt;/file&gt;
				&lt;name&gt;ChKbReplyToolbarButton&lt;/name&gt;
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
class ExampleExtension extends Extension_ReplyToolbarItem {
	public function render(Model_Message $message) {
	}
}
{% endraw %}
</code>
</pre>

# Extensions

| KB Reply Toolbar | `cerberusweb.kb.reply.toolbaritem.kb`
| Time Tracking Reply Toolbar Timer | `timetracking.reply.toolbaritem.timer`

<div class="section-nav">
	<div class="left">
		<a href="/docs/plugins/extensions/#extension-points" class="prev">&lt; Extension Points</a>
	</div>
	<div class="right align-right">
	</div>
</div>
<div class="clear"></div>