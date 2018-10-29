---
title: Plugin Templates
permalink: /docs/plugins/templates/
toc:
  title: Templates
jumbotron:
  title: Templates
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

Cerb plugins use the [Smarty](https://smarty.net/) template engine.

Templates are stored in the plugin's `templates/` directory.

They are referenced from plugin code like:

<pre>
<code class="language-php">
{% raw %}
$tpl = DevblocksPlatform::services()->template();
$tpl->assign('name', 'Kina Halpue');
$tpl->display('devblocks:example.plugin::path/to/template.tpl');
{% endraw %}
</code>
</pre>

In `->display()`, `example.plugin` should be your plugin's [ID](/docs/plugins/#ids). The `path/to/` is relative to the plugin's `templates/` directory.

Here's an example template:

<pre>
<code class="language-smarty">
{% raw %}
&lt;div&gt;
	Hello, &lt;b&gt;{$name}&lt;/b&gt;!
&lt;/div&gt;
{% endraw %}
</code>
</pre>

