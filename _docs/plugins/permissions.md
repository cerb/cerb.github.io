---
title: Plugin Permissions
permalink: /docs/plugins/permissions/
toc:
  title: Permissions
jumbotron:
  title: Permissions
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

Plugins can introduce new privileges into [roles](/docs/roles/).

<pre style="max-height:29.5em;">
<code class="language-xml">
{% raw %}
&lt;acl&gt;
	&lt;priv id="example.permission" label="acl.example.permission" /&gt;
&lt;/acl&gt;
{% endraw %}
</code>
</pre>

* **`id="..."`** is the ID of the new privilege. This uses dot-notation like plugins and extensions. It should also use your plugin ID as a namespace prefix.

* **`label="..."`** is the [translation](/docs/plugins/translations/) ID of the human-readable label for the privilege.