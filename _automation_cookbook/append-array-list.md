---
title: Appending to Arrays and Lists
excerpt: Learn different methods for appending values to arrays and lists in Cerb automations.
summary: "This page demonstrates various techniques for appending values to arrays and lists in Cerb automations, including using var.push, var.set, merge filters, and CSV concatenation. Each method offers different benefits depending on your use case."
layout: integration
jumbotron:
  title: Appending to Arrays and Lists
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Uses var.push for direct array manipulation
* Uses var.set for indexed appending
* Supports merge filter for array combining
* Handles CSV string concatenation
{% endcomment %}

Here are examples of different methods for appending values to arrays and lists in automation scripting.

## Using var.push:

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    emails@csv: boss@cerb.example, customer@cerb.example, accounting@cerb.example
  var.push:
    inputs:
      key: emails
      value: marketing@cerb.example
{% endraw %}
</code>
</pre>

## Using var.set:

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    emails@csv: boss@cerb.example, customer@cerb.example, accounting@cerb.example
  var.set:
    inputs:
      key: emails:{{emails|length}}
      value: marketing@cerb.example
{% endraw %}
</code>
</pre>

## Using |merge:

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    emails@csv: boss@cerb.example, customer@cerb.example, accounting@cerb.example
  set/append:
    emails@json: {{emails|merge(['marketing@cerb.example'])|json_encode}}
{% endraw %}
</code>
</pre>

## Using |csv and string concatenation:

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    emails@csv: boss@cerb.example, customer@cerb.example, accounting@cerb.example
  set/append:
    emails@csv: {{emails|join(',')}}, marketing@cerb.example
{% endraw %}
</code>
</pre>
