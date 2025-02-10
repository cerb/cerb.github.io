---
title: 'Scripting Reference: Conditional Logic'
excerpt: This page provides a scripting reference for implementing conditional logic
  in Cerb.
summary: This page provides a scripting reference for implementing conditional logic
  in Cerb. It explains how to use expressions to display different content based on
  conditions, such as checking if a service level agreement (SLA) is active or expired.
  The example given demonstrates setting a date for SLA expiration and using an if-else
  statement to determine and display the appropriate message. The page also mentions
  the use of operators in handling dates within these expressions.
permalink: /docs/scripting/conditional-logic/
toc:
  title: Conditional Logic
  expand: Developer Guide
jumbotron:
  title: Conditional Logic
  tagline: ~
  breadcrumbs:
  - label: Docs &raquo;
    url: /docs/home/
  - label: Developer Guide &raquo;
  - label: Scripting &raquo;
    url: /docs/scripting/
---

Conditional logic can display different content based on the result of any number of **expressions**:

{% highlight twig %}
{% raw %}
{% set sla_expiration = '+2 weeks'|date('U') %}
{% if sla_expiration >= 'now'|date('U') %}
Your SLA coverage is active.
{% else %}
Your SLA coverage has expired.
{% endif %}
{% endraw %}
{% endhighlight %}

{% highlight text %}
Your SLA coverage is active.
{% endhighlight %}

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