---
title: Plugin Classloader
permalink: /docs/plugins/classloader/
toc:
  title: Classloader
jumbotron:
  title: Classloader
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

The **class loader** is a map of source code classes and their filesystem paths. This enables Cerb to efficiently only load the files necessary to serve a specific request.

If your plugin introduces classes that will be referenced by code outside of the plugin, you should register them here. Class loader entries are automatically created for any [extensions](/docs/plugins/extensions/) you register.

<pre style="max-height:29.5em;">
<code class="language-xml">
{% raw %}
&lt;class_loader&gt;
	&lt;file path="api/dao/example.php"&gt;
		&lt;class name="Context_Example" /&gt;
		&lt;class name="DAO_Example" /&gt;
		&lt;class name="Model_Example" /&gt;
		&lt;class name="Plugin_Example" /&gt;
		&lt;class name="SearchFields_Example" /&gt;
		&lt;class name="View_Example" /&gt;
	&lt;/file&gt;
&lt;/class_loader&gt;
{% endraw %}
</code>
</pre>
