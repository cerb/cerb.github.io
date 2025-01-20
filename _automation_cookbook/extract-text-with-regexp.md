---
title: Extract text using regular expressions
excerpt: Use regular expression patterns to extract matching text within automation scripting.
summary: This page provides examples of using regular expressions in automation scripting to extract matching text. It demonstrates how to use a single capture group to extract an order ID from a string and how to use multiple capture groups to extract numerical values from a formatted string. The examples illustrate the syntax and methods for defining patterns and capturing specific parts of text using regular expressions in a scripting context.
layout: integration
redirect_from:
  - /tips/regex-in-automations/
jumbotron:
  title: Extract text using regular expressions
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

Here are examples of using regular expressions to extract matching text in automation scripting.

## Using a single capture group

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    text: Your Amazon Order #Z-1234-5678-9 has shipped!
    pattern: /Amazon Order #([A-Z0-9\-]+)/
  return:
    order_id: {{text|regexp(pattern, 1)}}
{% endraw %}
</code>
</pre>

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    mask@text:
      {% set text = "The ticket mask that I am looking for is: KRN-69622-357 something else" %}
      {% set pattern %}/[A-Z]{3}-\d{5}-\d{3}/{% endset %}
      {{text|regexp(pattern)}}
  
  outcome/hasMask:
    if@bool: {{mask}}
    then:
      return:
        output: The ticket mask is #: {{mask}}
{% endraw %}
</code>
</pre>

## Using multiple capture groups

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    text: (123,456)
    pattern: /^\((\d+),(\d+)\)$/
  return:
    x@int: {{text|regexp(pattern, 1)}}
    y@int: {{text|regexp(pattern, 2)}}
{% endraw %}
</code>
</pre>
