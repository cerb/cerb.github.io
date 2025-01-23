---
title: Create an array of random numbers
excerpt: Generate an array filled with random numeric values.
summary: "This page demonstrates how to create an array of random numbers using range mapping and the random function in Cerb. It provides a step-by-step example, including using `range()` for array size, applying `map()` for random value generation, and JSON encoding for output format, resulting in an array filled with unique random numbers."
layout: integration
jumbotron:
  title: Create an array of random numbers
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Uses range() for array size
* Applies map() for random value generation
* JSON encoding for output format
{% endcomment %}

Here is an example of generating an array filled with random numbers.

## Generate random numbers

<pre>
<code class="language-cerb">
{% raw %}
start:
  return:
    values@json: {{range(1, 10)|map((v) => random(0, 100))|json_encode}}
{% endraw %}
</code>
</pre>

## Output

<pre>
<code class="language-cerb">
{% raw %}
__return:
  values:
  - 30
  - 18
  - 50
  - 39
  - 89
  - 73
  - 98
  - 90
  - 72
  - 37
{% endraw %}
</code>
</pre>
