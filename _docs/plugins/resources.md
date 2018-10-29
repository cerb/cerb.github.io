---
title: Plugin Resources
permalink: /docs/plugins/resources/
toc:
  title: Resources
jumbotron:
  title: Resources
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Plugins &raquo;
    url: /docs/plugins/
---

Plugins can add new sharable resources like:

* Images

* Scripts (Javascript)

* Stylesheets

These must be stored in the `resources/` directory within the plugin.

Resources can then be accessed by URL with the format:

`/resource/`**`<plugin-id>`**`/path/to/resource/file.ext`

In [templates](/docs/plugins/templates/):

<pre>
<code class="language-smarty">
{% raw %}
{devblocks_url}c=resource&plugin=example.plugin&f=path/to/resource/file.ext{/devblocks_url}
{% endraw %}
</code>
</pre>

From [bot scripting](/docs/bots/scripting/):

<pre>
<code class="language-twig">
{% raw %}
{{cerb_url('c=resource&plugin=example.plugin&f=path/to/resource/file.ext')}}
{% endraw %}
</code>
</pre>

<div class="cerb-box note">
<p>All plugin resources are public (world readable) and do not require a valid session to access. Do not store private content in this directory.</p>
</div>