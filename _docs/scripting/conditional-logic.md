---
title: "Scripting Reference: Conditional Logic"
excerpt: 
permalink: /docs/scripting/conditional-logic/
toc:
  title: Conditional Logic
  expand: Developer Guide
jumbotron:
  title: Conditional Logic
  tagline: 
  breadcrumbs:
  -
    label: Docs &raquo;
    url: /docs/home/
  -
    label: Developer Guide &raquo;
  -
    label: Scripting &raquo;
    url: /docs/scripting/
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

<div class="section-nav">
	<div class="left">
		<a href="/docs/scripting/dates/" class="prev">&lt; Dates</a>
	</div>
	<div class="right align-right">
		<a href="/docs/scripting/operators/" class="prev">Operators &gt;</a>
	</div>
</div>
<div class="clear"></div>