---
title: Filter array values
excerpt: Use the `|filter` modifier with arrow functions to match specific array values.
summary: This page demonstrates how to use the filter modifier with arrow functions in automation scripting to filter array values based on conditions. It shows how to use lambda expressions to create flexible filtering rules for lists of data.
layout: integration
jumbotron:
  title: Filter array values
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Array filtering techniques
* Arrow function usage
* Mathematical operations
* List processing
* Conditional filtering
{% endcomment %}

Here is an example of using the [\|filter](https://cerb.ai/docs/scripting/filters#filter) modifier with arrow functions to filter array values based on conditions in automation scripting.

## Finding multiples of 5

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    numbers@csv: {{range(1, 100)|join(',')}}
  return:
    multiples5@csv: {{numbers|filter((n,k) => 0 == n % 5)|join(',')}}
{% endraw %}
</code>
</pre>

## Output

<pre>
<code class="language-cerb">
{% raw %}
__return:
  multiples5:
  - "5"
  - "10"
  - "15"
  - "20"
  - "25"
  - "30"
  - "35"
  - "40"
  - "45"
  - "50"
  - "55"
  - "60"
  - "65"
  - "70"
  - "75"
  - "80"
  - "85"
  - "90"
  - "95"
  - "100"
{% endraw %}
</code>
</pre>
