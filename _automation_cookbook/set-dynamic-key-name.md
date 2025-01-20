---
title: Set a dynamic key name
excerpt: Use var.set to make a key with a dynamic name
summary: "This page demonstrates how to set dynamic key names using Cerb's `var.set` command, which 
  allows for flexible and non-standard key names that are not valid in KATA scripting. It 
  provides examples of setting random key names, using special characters like `@`, and changing 
  the delimiter from the standard `:` if needed."
layout: integration
jumbotron:
  title: Set a dynamic key name
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---
You can't use scripting in a KATA key, but if you want to set a dynamic key name, you can do so with `var.set`:

<pre>
<code class="language-cerb">
{% raw %}
start:
  var.set/random:
    inputs:
      key: random_{{random_string(6)}}
      value: {{random_string(6)}}
{% endraw %}
</code>
</pre>

This can also be used if you want a key name that isn't valid in KATA, such as a ```:``` or `@`.

<pre>
<code class="language-cerb">
{% raw %}
start:
  var.set/atmark:
    inputs:
      key@text: customer@cerb.example
      value: allow
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
{% raw %}
start:
  var.set/colon:
    inputs:
      key@text: og:image
      delimiter: ::
      value: allow
{% endraw %}
</code>
</pre>

You can also use the `delimiter` field to change the delimiter from the standard `:` if necessary.