---
title: Plugin Patches
permalink: /docs/plugins/patches/
toc:
  title: Patches
jumbotron:
  title: Patches
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

Plugins that need to maintain a _schema_ in the database can do so with **patches**. A patch is a collection of changes used to migrate data between versions during an upgrade.

When you skip several versions of a plugin to upgrade to the latest version, Cerb will automatically handle the migration of your data through the intervening versions.  This is the same thing that happens when you upgrade Cerb itself.

<pre style="max-height:29.5em;">
<code class="language-xml">
{% raw %}
&lt;patches&gt;
	&lt;patch version="9.0.0" revision="1" file="patches/9.0.0.php" /&gt;
&lt;/patches&gt;
{% endraw %}
</code>
</pre>