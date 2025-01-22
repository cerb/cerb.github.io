---
title: Optional conditional keys
excerpt: Use the `@optional` annotation to omit keys based on conditional values.
summary: "This page demonstrates how to use the `@optional` annotation to conditionally include or omit dictionary keys based on their values. When a key with the `@optional` annotation evaluates to null, it is removed from the output."
layout: integration
jumbotron:
  title: Optional conditional keys
  breadcrumbs:
    -
      label: Resources &raquo;
      url: /resources/
    -
      label: Automation Cookbook &raquo;
      url: /resources/automation-cookbook/
---

{% comment %}
* Optional key handling
* Conditional value evaluation
* Dictionary output formatting
{% endcomment %}

Here is an example of using the [@optional](https://cerb.ai/docs/automations/#annotations) annotation to conditionally include dictionary keys based on their values. The gdpr key will be removed when the region is not EU.

## Conditionally include record.region

<pre>
<code class="language-cerb">
{% raw %}
start:
  set:
    record:
      name: Kina Halpue
      email: kina@cerb.example
      region: US
  return:
    output:
      name: {{record.name}}
      email: {{record.email}}
      gdpr@optional,bool: {{'EU' == record.region ? true}}
{% endraw %}
</code>
</pre>

## Output

<pre>
<code class="language-cerb">
{% raw %}
__return:
  output:
    name: Kina Halpue
    email: kina@cerb.example
{% endraw %}
</code>
</pre>
