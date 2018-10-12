---
title: Bot Scripting Conditional Logic
excerpt: 
permalink: /docs/bots/scripting/conditional-logic/
toc:
  title: Conditional Logic
jumbotron:
  title: Conditional Logic
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

Conditional logic can display different content based on the result of any number of **expressions**:

<pre>
<code class="language-twig">
{% raw %}
{% set sla_expiration = '+2 weeks'|date('U') %}
{% if sla_expiration >= 'now'|date('U') %}
Your SLA coverage is active.
{% else %}
Your SLA coverage has expired.
{% endif %}
{% endraw %}
</code>
</pre>

```
Your SLA coverage is active.
```

{% comment %}
AND/OR
{% endcomment %}