---
title: Set dictionary values
excerpt: Use dictionary structures to set and expand dynamic values.
summary: This page demonstrates how to use dictionary structures to set and expand dynamic values. It shows how to define nested attributes and conditionally display values based on dictionary properties.
layout: integration
jumbotron:
  title: Set dictionary values
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Uses dictionary structures for dynamic values
* Supports nested attributes
* Enables conditional output formatting
* Demonstrates key iteration
{% endcomment %}

When a value (like a model ID selected from a [sheet](https://cerb.ai/docs/sheets/)) needs to be expanded, a dictionary structure can associate multiple attributes with that key. This enables dynamic lookups and conditional formatting based on those attributes in subsequent logic.

## Setting dictionary values

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    models:
      llama3.3:
        tools@bool: yes
        params: 70b
      phi4:
        tools@bool: no
        params: 14b
      mistral:
        tools@bool: yes
        params: 7b
  
  return:
    output@text:
      {% for model in models|keys %}
      {{model}} has {{models[model].params}} parameters{{models[model].tools ? ' and supports tools'}}.
      {% endfor %}
{% endraw %}
</code>
</pre>

## Output

<pre>
<code class="language-cerb">
{% raw %}
output: |
  llama3.3 has 70b parameters and supports tools.
  phi4 has 14b parameters.
  mistral has 7b parameters and supports tools.
{% endraw %}
</code>
</pre>
