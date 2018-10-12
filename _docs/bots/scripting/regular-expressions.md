---
title: Bot Scripting Regular Expressions
excerpt: 
permalink: /docs/bots/scripting/regex/
toc:
  title: Regular Expressions
jumbotron:
  title: Regular Expressions
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Bots &raquo;
    url: /docs/bots/
  -
    label: Scripting &raquo;
    url: /docs/bots/scripting/
---

You can use regular expressions[^regexp] with the [regexp](/docs/bots/scripting/filters/#regexp) filter to match or extract patterns in text:

<pre>
<code class="language-twig">
{% raw %}
{% set text = "Your Amazon Order #Z-1234-5678-9 has shipped!" %}
{% set order_id = text|regexp("/Amazon Order #([A-Z0-9\-]+)/", 1) %}
Amazon Order #: {{order_id}}
{% endraw %}
</code>
</pre>

```
Amazon Order #: Z-1234-5678-9
```

### References

[^regexp]: Wikipedia: Regular Expression - <https://en.wikipedia.org/wiki/Regular_expression>
