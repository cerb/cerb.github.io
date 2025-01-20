---
title: Escape placeholders
excerpt: Escape placeholders in a value using the @raw annotation
summary: 
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