---
title: Escape placeholders
excerpt: Escape placeholders in a value using the @raw annotation
summary: "This page explains how to escape placeholders in a value using the `@raw` annotation in Cerb. 
  It shows an example of how this annotation can be used to preserve plain text values, 
  particularly when working with sheets. The output demonstrates that using `@raw`, placeholders are treated
  as literal text, rather than being evaluated or replaced. This allows for more control over the formatting
  and appearance of values in a sheet, making it easier to work with complex data."
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
Sometimes you don't want a placeholder to be evaluated and want to preserve the straight text.= in a value. You can do this with the [@raw](https://cerb.ai/docs/automations/#annotations) annotation. This is particularly useful in [sheets](https://cerb.ai/docs/sheets/).

<pre>
<code class="language-cerb">
{% raw %}
start:
start:
  return:
    unescaped: You escape {{placeholders}} with the `@raw` annotation
    escaped@raw: You escape {{placeholders}} with the `@raw` annotation
{% endraw %}
</code>
</pre>

Gives this output:

<pre>
<code class="language-cerb">
{% raw %}
start:
  __return:
  unescaped: You escape  with the `@raw` annotation
  escaped: You escape {{placeholders}} with the `@raw` annotation
{% endraw %}
</code>
</pre>