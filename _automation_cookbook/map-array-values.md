---
title: Map array values
excerpt: Use the `|map` modifier with arrow functions to transform array values.
summary: This page demonstrates how to use the map modifier with arrow functions in automation scripting to transform array values. It shows how to use lambda expressions to apply mathematical operations and transformations to lists of numbers.
layout: integration
jumbotron:
  title: Map array values
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Array mapping techniques
* Arrow function usage
* Mathematical operations
* List processing
* Value transformation
{% endcomment %}

Here is an example of using the [\|map](/docs/scripting/filters/#map) modifier with arrow functions to transform array values.

## Calculating squares and cubes

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    numbers@csv: {{range(1, 10)|join(',')}}
  return:
    squares@json: {{numbers|map((n,k) => n ** 2)|json_encode}}
    cubes@json: {{numbers|map((n,k) => n ** 3)|json_encode}}
{% endraw %}
</code>
</pre>

## Output

<pre>
<code class="language-cerb">
{% raw %}
__return:
  squares:
  - 1
  - 4
  - 9
  - 16
  - 25
  - 36
  - 49
  - 64
  - 81
  - 100
  cubes:
  - 1
  - 8
  - 27
  - 64
  - 125
  - 216
  - 343
  - 512
  - 729
  - 1000
{% endraw %}
</code>
</pre>
