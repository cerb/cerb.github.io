---
title: Plugin Manifests
permalink: /docs/plugins/manifests/
toc:
  title: Manifests
jumbotron:
  title: Manifests
  tagline: Add new functionality to Cerb
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

Each plugin must have a **manifest** file named `plugin.xml` that describes its contents. This tells Cerb what kinds of new functionality the plugin is contributing.

Here's a minimal manifest:

<pre>
<code class="language-xml">
{% raw %}
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;plugin xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.devblocks.com/schema/plugin.xsd"&gt;
	&lt;id&gt;example.plugin&lt;/id&gt;
	&lt;name&gt;Plugin Name&lt;/name&gt;
	&lt;description&gt;This explains what your plugin does.&lt;/description&gt;
	&lt;author&gt;Webgroup Media, LLC.&lt;/author&gt;
	&lt;version&gt;0.0.0&lt;/version&gt;
	&lt;link&gt;https://cerb.example/path/to/docs&lt;/link&gt;
	&lt;image&gt;plugin.png&lt;/image&gt;

	&lt;requires&gt;
		&lt;app_version min="9.3" max="9.3.99" /&gt;
		&lt;!--&lt;php_extension name="curl" /&gt;--&gt;
	&lt;/requires&gt;

	&lt;dependencies&gt;
		&lt;require plugin_id="cerberusweb.core" version="9.3.0" /&gt;
	&lt;/dependencies&gt;

	&lt;patches/&gt;
	&lt;class_loader/&gt;
	&lt;event_points/&gt;
	&lt;acl/&gt;
	&lt;activity_points/&gt;
	&lt;extensions/&gt;
&lt;/plugin&gt;
{% endraw %}
</code>
</pre>

### Plugin metadata

* **`<id>`** is the globally unique [ID](/docs/plugins/#ids) of the plugin, prefixed with the author's namespace. This should only contain lowercase letters (`a-z`), numbers (`0-9`), underscore (`_`), and dots (`.`).

* **`<name>`** is the human-friendly name of the plugin.

* **`<description>`** is a brief description of the purpose and contributions of the plugin.

* **`<author>`** is the name used for attribution of the plugin's author.

* **`<version>`** is the semantic version of the plugin in `<generation>.<major>.<minor>` format. This should start with `0.0.0` and be incremented for each update.

* **`<link>`** is a URL to the plugin's documentation page.

* **`<image>`** is a path to the plugin's icon. This is relative to the plugin's `resources/` directory.

### Requirements

The **`<requires>`** block specifies the requirements for installing and enabling this plugin.

This block must contain one **`<app_version>`** element specifying the minimum and maximum version of Cerb that are verified compatible with this build of the plugin.

The block may contain any number of **`<php_extension>`** elements if specific PHP extensions are required for the plugin to operate (e.g. `ldap`, `oauth`, `zip`).

### Dependencies

The optional **`<dependencies>`** block specifies if this plugin depends on another plugin.

This block may contain any number of **`<require>`** elements specifying a required `plugin_id` and its minimum compatible `version`.

### Everything else

The other elements will be covered in more detail in the subsequent sections:

* [**`<extensions>`**](/docs/plugins/extensions/)
* [**`<event_points>`**](/docs/plugins/events/)
* [**`<patches>`**](/docs/plugins/patches/)
* [**`<class_loader>`**](/docs/plugins/classloader/)
* [**`<acl>`**](/docs/plugins/permissions/)
