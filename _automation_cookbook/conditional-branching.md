---
title: Conditional branching statements
excerpt: Use decision blocks and conditional logic for branching.
summary: This page demonstrates different approaches to conditional branching, including using decision blocks with multiple outcomes and simplified dictionary-based value selection. It provides examples of both command-based branching and value-based conditional selection.
layout: integration
jumbotron:
  title: Conditional branching statements
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Decision block usage for command execution
* Multiple outcome handling
* Simplified dictionary-based conditionals
* Value selection patterns
{% endcomment %}

Here are examples of different approaches to conditional branching, demonstrating if/else-if statements with decision blocks and switch statements using dictionaries.

## Using if/else-if with decision blocks

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    option: 2

  decision:
    outcome/option1:
      if@bool: {{1 == option}}
      then:
        return:
          output: You picked option 1.
    outcome/option2:
      if@bool: {{2 == option}}
      then:
        return:
          output: You picked option 2.
    outcome/option3:
      if@bool: {{3 == option}}
      then:
        return:
          output: You picked option 3.          
{% endraw %}
</code>
</pre>

## Output

<pre>
<code class="language-cerb">
{% raw %}
__return:
  output: You picked option 2.
{% endraw %}
</code>
</pre>

## Using switch with dictionaries

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    option: 3
    options:
      1: You picked option 1
      2: You picked option 2
      3: You picked option 3

  return:
    output: {{options[option]}}
{% endraw %}
</code>
</pre>

## Output

<pre>
<code class="language-cerb">
{% raw %}
__return:
  output: You picked option 3
{% endraw %}
</code>
</pre>
